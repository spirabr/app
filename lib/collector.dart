class Collector {
  String name;
  String hospital;

  Collector(this.name, this.hospital);

  @override
  String toString() {
    return '${this.name} (${this.hospital.toUpperCase()})';
  }
}
