let banner = `
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
██▀▄▄▀█▀▄▄▀█░▄▀▄░███░▄▄█░▄▄▀█▀▄▄▀█░▄▄▀█▄░▄████░▄▄█░▄▄▀█░▄▀██
██░▀▀░█░▀▀██░█▄█░███░▄██░▀▀▄█░██░█░██░██░██▄▄█░▄▄█░██░█░█░██
██░████▄▀▀▄█▄███▄███▄███▄█▄▄██▄▄██▄██▄██▄█████▄▄▄█▄██▄█▄▄███
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
`;
display(banner);

let context = #{};

if switch_enabled("debug-answers") || switch_enabled("debug-all") {
    display("NextJS Answers:");
    display(as_yaml(ANSWERS));
}

context += render(Archetype("org-prompts"), ANSWERS);

context += prompt("Root directory: ", "project-name", #{
    defaults_with: "nextjs-app",
    cases: [
        CasedIdentityCasedValue(PROGRAMMING_CASES),
    ],
});
context += prompt("Artifactory Host:", "artifactory-host", #{
    defaults_with: "p6m.jfrog.io",
});
context += set("root-directory", render("{{ project-name }}", context));
context += set("package-name", render("{{ root-directory }}", context));
context += set("org-prefix", render("{{ org-name }}", context));
context += set("org-suffix", render("{{ solution-name }}", context));
context += set("prj-prefix", "front-end");
context += set("prj-suffix", "apps");
context += set("prj-suffix", "apps");
context += set("organization-name", render("{{ org-name }}-{{ solution-name }}", context), #{
    cases: [
        CasedIdentityCasedValue(PROGRAMMING_CASES),
    ],
});

context += prompt("Should we run 'pnpm install' for you?", "pnpm_install", #{
    type: Bool,
    help: "y/n",
    defaults_with: true
});

if switch_enabled("debug-context") || switch_enabled("debug-all") {
    display("Front-End Codebase Context:");
    display(as_yaml(context));
}

render(Directory("contents"), context);

display("\n✔ Rendered successfully!\n");

if context.pnpm_install == true {
    display("Installing dependencies...");
    execute("pnpm", #{
        args: [
           "install",
           "--silent"
        ],
        directory: context["root-directory"],
      });
    display("✔ Successfully installed dependencies!\n");  
}

display("\nNEXT STEPS:\n");
display(`  cd ${context["root-directory"]}`);

if context.pnpm_intall == false {
    display("  pnpm install");
}

display(`  pnpm dev`);
