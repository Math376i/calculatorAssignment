


abstract class Command{
  execute(State state);
  undo(List<num> registry);

}
class State{
  List<num>registry;
  List<Command> undoHistory;
  State(this.registry, this.undoHistory);
}