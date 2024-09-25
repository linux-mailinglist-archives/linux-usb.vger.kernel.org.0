Return-Path: <linux-usb+bounces-15414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2502D98515B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 05:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5201F1C2357A
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 03:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41ACE14B953;
	Wed, 25 Sep 2024 03:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2J5Nfg3W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F414A4C1
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 03:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727234208; cv=none; b=swFav3DyYiJ0VWaTGAVV7BCKUDe3aXO+Dxo0aE6UBVRB7GGZ/FaccPc3AoEUQ1s2xQaein31oxdlmnLwN2+JZ9uy0xFRelE4987MIAyB0NIg/SRy+MqrjwzSn9Kqbbnf7s24bpRp5Nq601B7l9pDFJAFrYoAnYY8bZIky+qdl28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727234208; c=relaxed/simple;
	bh=WH3f1wEHTyRTJ7AT+c2IFOfTQMxKRPyA2AXtakgC6sg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=d4jdRw0db+N9px9KcaYmyOlD592/mstDUb1XCK7gC7n5qB8mJsivtBgWM2/h/nUbZdG7zpIjJQ9f0wyKoPBYndXNFX3sze11x2qxK6KymCYyw8U4lorkgSNC2/nJh1xrtPHc1TArqavPwY97ZRu6DZN+98mrQHWemqU7hxVcKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2J5Nfg3W; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2dee9d86f4dso2543654a91.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727234206; x=1727839006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/foBZ7L1xcE0uOYfjQY3pnhprf6ad5uc1MzhfvUezU=;
        b=2J5Nfg3Wlo1FqRRtbPbdRKFX5uQo2fWSeDO4xAJquR2w+XVOg7qVHJ+CYE3aZz+6PJ
         BIj+nFRb7jMB6F1o8P6AuVGFZYUxdlnrQSPDAY47a+z31gddVHoOD9E5uoVpjpjnJyiJ
         XvppiA4diX3kWPetnU9of5v2uwOJosbyp1obhCG8xxxER7qAg+/a2ZH68tHzDocpbElm
         OxH0u8OJM/MujOmSPrCl+eWBEb8LkrVpGsjus43w1vMIFQwas5cyJeBQ1r5l7qixzQDa
         nd2Smd9uxTbqeEKQu9PBVJ+is7mlhwIcFsFgoinlqPxt6m7A4sjBkFtUilYVKOnZyJFv
         ivBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727234206; x=1727839006;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/foBZ7L1xcE0uOYfjQY3pnhprf6ad5uc1MzhfvUezU=;
        b=wLPK9KdlZEcVP/qG31XsYef7/RW/lOJcKHzcGbl3ifAPKHe1y/rGyqZbAwYs/Uu4mv
         iZ79UEc5k2NIfqlQEEotbUT7cnO/fhkLb/gjSyCUm93LwF1aNSvmecT40iJriPrhm5qT
         KXLmBre5eAf5IAYzsjGZfX7cSFECCROyc7uVZQBLjPqUxw9cHM8E1glQOkyHyfna4e/R
         d43yvITTXVkzkjwgjpeI7p61LbGCoVhaUuAmHB+HO7EzPvwp4uCP9fvTSlMzeDXSzpMk
         0EQlBcg6nbP54nEpULQbQXYMSFHH9Y/T0eTkwWz7EfdZSdGFOXKWQ3WrQrA1UHKAZVv8
         9UZA==
X-Forwarded-Encrypted: i=1; AJvYcCWS8ZNW7iR2Py2NvtI7zBx0sMrCVUWUOZniIEeoNEjYAIvqLJXa/hhbonzZooPk7F1kDHxCqJmC6As=@vger.kernel.org
X-Gm-Message-State: AOJu0YxprmVoAIjHjOMuOGDQfeHO6UK8trGNkSgs7oL/0H7Fy4hc997s
	eOg5A1KVkWzEw+UCzd/0Tzen4xNZdsj1ntdJb3BGT5GVZzG2VAiad/WI4YDCqA==
X-Google-Smtp-Source: AGHT+IHNTG/XEGwlf6r5ouS7N3mZHtb1iWq6Pcvw53rK4zJHPUQ1Ne1Ch54gGVnRgQVdpD3vSX+AvA==
X-Received: by 2002:a17:90a:17cb:b0:2e0:78a0:55c4 with SMTP id 98e67ed59e1d1-2e078a0572cmr194836a91.9.1727234206189;
        Tue, 24 Sep 2024 20:16:46 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e14:8:32ad:6c37:2d1:220a? ([2a00:79e0:2e14:8:32ad:6c37:2d1:220a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1a08fesm327560a91.5.2024.09.24.20.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 20:16:45 -0700 (PDT)
Message-ID: <66d9af81-d211-45c9-bc3e-8dec5a8f92e0@google.com>
Date: Tue, 24 Sep 2024 20:16:44 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 2/2] usb: typec: tcpm: Add support for parsing time dt
 properties
From: Amit Sunil Dhamne <amitsd@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
 badhri@google.com, kyletso@google.com, rdbabiera@google.com,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240923224059.3674414-1-amitsd@google.com>
 <20240923224059.3674414-3-amitsd@google.com>
 <ZvK2slBHR8PhzaMt@kuha.fi.intel.com>
 <d72cc89a-7f73-4294-927e-48e647e37310@google.com>
Content-Language: en-US
In-Reply-To: <d72cc89a-7f73-4294-927e-48e647e37310@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/24/24 7:44 PM, Amit Sunil Dhamne wrote:
> Hi Heikki,
>
> On 9/24/24 5:55 AM, Heikki Krogerus wrote:
>> Hi,
>>
>>> @@ -7611,10 +7650,13 @@ struct tcpm_port *tcpm_register_port(struct 
>>> device *dev, struct tcpc_dev *tcpc)
>>>       err = tcpm_fw_get_caps(port, tcpc->fwnode);
>>>       if (err < 0)
>>>           goto out_destroy_wq;
>>> +
>>
>> This extra newline is not relevant or necessary. Otherwise this LGTM:
>
> Thanks for reviewing! Please let me know if I should upload a new set 
> or this is alright at this time?


Uploaded a new patchset anyway: 
https://lore.kernel.org/all/20240925031135.1101048-3-amitsd@google.com/


Thanks!

>
> -- 
>
> Amit
>
>>
>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>>>       err = tcpm_fw_get_snk_vdos(port, tcpc->fwnode);
>>>       if (err < 0)
>>>           goto out_destroy_wq;
>>>   +    tcpm_fw_get_timings(port, tcpc->fwnode);
>>> +
>>>       port->try_role = port->typec_caps.prefer_role;
>>>         port->typec_caps.revision = 0x0120;    /* Type-C spec 
>>> release 1.2 */
>> thanks,
>>

