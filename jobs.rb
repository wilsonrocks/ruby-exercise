def order_jobs (jobs)

  if jobs == '' then
    return []
  end

  output = []
  jobs.each do |job, depends_on|

    if job == depends_on then
      raise 'Jobs cannot depend on themselves!'
    end

    current_job = job
    loop do
      current_job = jobs[current_job]
      if current_job == job then raise 'Jobs cannot have circular dependencies' end
      if current_job == nil then break end
    end

    if output.include?(job)
      next
    end

    if depends_on == nil then
      output.unshift(job)
      next
    end

    if not output.include?(depends_on) then
      output.push(depends_on)
    end

    output.push(job)

  end

  return output

end
