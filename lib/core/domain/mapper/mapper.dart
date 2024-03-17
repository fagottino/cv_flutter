abstract class Mapper<Input, Output> {
  Output apply(Input data);
}

abstract class Mapper2Ways<Dto, Model> {
  Model toModel(Dto dto);

  Dto toDto(Model model);
}
