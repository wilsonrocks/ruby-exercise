def order_jobs (job_hash)

  if job_hash == '' then
    return []
  end

  output = []

  job_hash.each do |job, depends_on|

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
