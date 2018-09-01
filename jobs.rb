def order_jobs (job_hash)

  if job_hash == '' then
    return []
  end
  
  return job_hash.keys

end
