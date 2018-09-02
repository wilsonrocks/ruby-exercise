def order_jobs (job_hash)

  if job_hash == '' then
    return []
  end

  output = []

  job_hash.each do |job, depends_on|

    if not output.include?(job) then 

      if depends_on == nil then
        output.push(job)
      else

        if output.include?(depends_on) then
          output.push(job)
        else
          output.push(depends_on)
          output.push(job)
        end

      end

    end

  end

  return output

end
