require("pg")

class SqlRunner

  def self.run(sql, values = [])
    # nil works for values too
    db = PG.connect({
      dbname: 'music_collection',
      host: 'localhost'
      })
    db.prepare('query', sql)
    results = db.exec_prepared('query', values)

    db.close()
    return results
  end

end
