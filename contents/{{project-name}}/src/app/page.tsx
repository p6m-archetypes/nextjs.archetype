import { Button } from "@/components/ui/button";

export default function Index() {
  return (
    <div>
      <div className="max-w-2xl mx-auto">
        <div className="container">
          <div id="welcome">
            <h1 className="text-2xl font-bold">
              Welcome {{package-name}} 👋
            </h1>
            <Button>Click me</Button>
          </div>
        </div>
      </div>
    </div>
  );
}
