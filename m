Return-Path: <linux-usb+bounces-3540-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3A800ABE
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 13:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C041C20C6D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 12:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E4224B4B;
	Fri,  1 Dec 2023 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elsinga.info header.i=@elsinga.info header.b="DHtDohKQ"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Dec 2023 04:18:55 PST
Received: from mailfilter06-out30.webhostingserver.nl (mailfilter06-out30.webhostingserver.nl [195.211.73.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C44CD48
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 04:18:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701433072; cv=pass;
	d=webhostingserver.nl; s=whs1;
	b=rCPv1KLVRil3TUxqRWPon/forYUMDR+WgLbwOMmXAU1v/Rcld69Jqz9lROxRrltdcsCteRFK4x9zi
	 qlsPgOQpWeadrGKNs5HWUsgKSm2Z3YSbh0m0fJoNrfWVyamhos98ZECj3bxxSwBUNk+AJNPIpQxajP
	 y3RirwoPczB3+SLx2GvM9AfsFSq98s+tSHjm084QQ/jbe+Xnub4Q2qhyJats/z0fAGJ6tB6mIGNwh8
	 gJAoV4VVTU5OInIjduxZjH2U2NDViSBOzgpO/zCo7p8j5X4foYW5Yxr8S/F75FraTHvHlL23qTbMaY
	 0aJQ/D+Rgz4aIN0lTMMeCt2sGAF6mYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
	d=webhostingserver.nl; s=whs1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:dkim-signature:from;
	bh=yxpfp6W8Fp6DLbwBF/kgwWsTWE16o4TY8bwwqfhZLqg=;
	b=HoVqjDWXY0fSIQGqSrhlxOuBppyaLCbCawfBoz20GbkYS6ywED6rjhZo5Rx9Khes9heu4SMVkiW4A
	 SooB3vo9+oIn77Kh1Vduzyqqgje8bAhlI/3ILjuezBBZbaOUya607GUI+SyXr+DoQyG5OA6Udi+6yN
	 tST4Zu9EzmcQba7LcUKHahjDsRn4/cof5yVtcLVfQxqDh6DhEyloToT/YsHMSsreGpk65ErokIPpM9
	 i5bMuan+5IVqfXb5XgPCJ065+WuJzlSmudQGEQp3dZWPbfKKh7Mcy5ZEZYfYUDdqLE46yuQ2EJtmLp
	 oGgLCc0wbCMneWaxatqzLaclmNxryRg==
ARC-Authentication-Results: i=2; mailfilter06.webhostingserver.nl;
	spf=pass smtp.mailfrom=elsinga.info smtp.remote-ip=141.138.168.154;
	dmarc=pass header.from=elsinga.info;
	arc=pass header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=elsinga.info; s=whs1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=yxpfp6W8Fp6DLbwBF/kgwWsTWE16o4TY8bwwqfhZLqg=;
	b=DHtDohKQmEY+eqynGBAOn7iNpoPS0RUk0b8s8aPaG5ZrreFKwwhvcyBNfekLs99DjIS83ITA7TDkZ
	 NnU7/E1vIrvldMtpbI8tCBEy6NG85Prk3yDxi3wMrfFo/63wcTS78MyNe/RMMYrw2phmc82Vecp8Qt
	 8Sx/uzMACH7rIhsmKbDzeVhVhdNpors6af46jwV1jeco1JNJyY1oU5z2fxphN/QWOEg0GYZOg9oYoN
	 artc//CuFuUPI9Z67EvC0g17LeedPkWuoGrHQaM09H8q+1EpdnwBxjS/lB6X5HnpJnhOnRwD49HkmQ
	 dWN2MyGFq/HrYuVlCZgnzCSS+pSIfDg==
X-Halon-ID: a4b5a065-9043-11ee-aaea-001a4a4cb958
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
	by mailfilter06.webhostingserver.nl (Halon) with ESMTPSA
	id a4b5a065-9043-11ee-aaea-001a4a4cb958;
	Fri, 01 Dec 2023 13:17:49 +0100 (CET)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=webhostingserver.nl; s=whs1; t=1701433069;
	 b=ZO1kv4yCzwZXVpW6uIo/3k9Ho99IJMKp0wU/UVGutWkyYp3zQXrp/IFH37tqJpLV66M4PgXOb2
	  1i8kqkK4bKjivojFuEjJtDiYe0tH+OuGSAxOeRbLaAR2fm+MOPpaXZnQrdfOAW8SuoBiBJ21KB
	  fg4mXgbaSiIJz4bQUO4EYoKrp3YH05kCGkJfpMtdZIWjNoWaEEk4v8ZVOOFMdfHA11oTSGFVqW
	  p+jqndO8Pln3Jqk1nDP0U4MzMMzZpQS24pitLRyn25VDCBkRhk3HCf1WJIw9sJuI6wtwvWcnMP
	  6nXtqQdTF/zhC7UzvJDVEpMO/HhRtQswG5nsQWlthCVXPA==;
ARC-Authentication-Results: i=1; webhostingserver.nl; smtp.remote-ip=178.250.146.69;
	iprev=pass (cust-178-250-146-69.breedbanddelft.nl) smtp.remote-ip=178.250.146.69;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=elsinga.info;
	dmarc=skipped header.from=elsinga.info;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=webhostingserver.nl; s=whs1; t=1701433069;
	bh=xcmaprzeJXX9JycvvDRK4GIG8vXC2u+XIWrfOky6RTk=;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	  Subject:MIME-Version:Date:Message-ID;
	b=M1YPdQCDkTu4qcv+vPrxFr3u2sIJajNHjarRWY9XArlRnWuMWSAt0rA+I5bl7q3alfkegTfBOb
	  3A/ZM04rn82H5jMt0T78RPijXiJWjASwZDgWctQC3n3p+J82liXWot/rcFmJXj71ykTP+eWVkj
	  XuXzILQ0lvlhBeFi7j3xDGUFlVdTaeiO3xwEOKCUUBFPNwDr7cFF8hVIajtKzRZedtCDAkrhiq
	  seNnCsYA5+aygQBJL9uCRRkBQkD6Chr/ZdqMTmiIaplBDKiPx30f8qGZMZS0B2wPCSOgN9cd8e
	  4CdS3ZIvoEWONSvxoF6jq3r2HXQu4JuzhoRU50zLhsy4XQ==;
Authentication-Results: webhostingserver.nl;
	iprev=pass (cust-178-250-146-69.breedbanddelft.nl) smtp.remote-ip=178.250.146.69;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=elsinga.info;
	dmarc=skipped header.from=elsinga.info;
	arc=none
Received: from cust-178-250-146-69.breedbanddelft.nl ([178.250.146.69] helo=smtp)
	by s198.webhostingserver.nl with esmtpa (Exim 4.97)
	(envelope-from <ferry.toth@elsinga.info>)
	id 1r92Sr-00000008FSj-14wA;
	Fri, 01 Dec 2023 13:17:49 +0100
Message-ID: <5425cf42-0f49-41b5-b26d-1e099d5bdcc2@elsinga.info>
Date: Fri, 1 Dec 2023 13:17:43 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in add_dma_entry()'s debugging code
To: Catalin Marinas <catalin.marinas@arm.com>, Ferry Toth <fntoth@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Christoph Hellwig <hch@lst.de>,
 Hamza Mahfooz <someguy@effective-light.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Andrew <travneff@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, iommu@lists.linux.dev,
 Kernel development list <linux-kernel@vger.kernel.org>,
 USB mailing list <linux-usb@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
References: <736e584f-7d5f-41aa-a382-2f4881ba747f@rowland.harvard.edu>
 <20231127160759.GA1668@lst.de>
 <637d6dff-de56-4815-a15a-1afccde073f0@rowland.harvard.edu>
 <20231128133702.GA9917@lst.de>
 <cb7dc5da-37cb-45ba-9846-5a085f55692e@rowland.harvard.edu>
 <ZWYnECPRKca5Dpqc@arm.com> <76e8def2-ff45-47d3-91ab-96876ea84079@gmail.com>
 <ZWm-u2kV1UP09M84@arm.com>
Content-Language: en-US, nl
From: Ferry Toth <ferry.toth@elsinga.info>
In-Reply-To: <ZWm-u2kV1UP09M84@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus

Hi

On 01-12-2023 12:08, Catalin Marinas wrote:
> On Thu, Nov 30, 2023 at 09:08:23PM +0100, Ferry Toth wrote:
>> Op 28-11-2023 om 18:44 schreef Catalin Marinas:
>>> Or just force the kmalloc() min align to cache_line_size(), something
>>> like:
>>>
>>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>>> index 4a658de44ee9..3ece20367636 100644
>>> --- a/include/linux/dma-mapping.h
>>> +++ b/include/linux/dma-mapping.h
>>> @@ -543,6 +543,8 @@ static inline int dma_get_cache_alignment(void)
>>>    #ifdef ARCH_HAS_DMA_MINALIGN
>>>    	return ARCH_DMA_MINALIGN;
>>>    #endif
>>> +	if (IS_ENABLED(CONFIG_DMA_API_DEBUG))
>>> +		return cache_line_size();
>>>    	return 1;
>>>    }
>>>    #endif
>>> diff --git a/mm/slab_common.c b/mm/slab_common.c
>>> index 8d431193c273..d0b21d6e9328 100644
>>> --- a/mm/slab_common.c
>>> +++ b/mm/slab_common.c
>>> @@ -879,7 +879,7 @@ static unsigned int __kmalloc_minalign(void)
>>>    	unsigned int minalign = dma_get_cache_alignment();
>>>    	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
>>> -	    is_swiotlb_allocated())
>>> +	    is_swiotlb_allocated() && !IS_ENABLED(CONFIG_DMA_API_DEBUG))
>>>    		minalign = ARCH_KMALLOC_MINALIGN;
>>>    	return max(minalign, arch_slab_minalign());
>> With above suggestion "force the kmalloc() min align to cache_line_size()" +
>> Alan's debug code:
>>
>> root@yuna:~# journalctl -k | grep hub
>> kernel: usbcore: registered new interface driver hub
>> kernel: hub 1-0:1.0: USB hub found
>> kernel: usb usb1: hub buffer at 71c7180, status at 71c71c0
>> kernel: hub 1-0:1.0: 1 port detected
>> kernel: hub 2-0:1.0: USB hub found
>> kernel: usb usb2: hub buffer at 71c79c0, status at 71c7a00
>> kernel: hub 2-0:1.0: 1 port detected
>> kernel: hub 1-1:1.0: USB hub found
>> kernel: usb 1-1: hub buffer at 65b36c0, status at 6639340
>> kernel: hub 1-1:1.0: 7 ports detected
>>
>> and the stack trace indeed goes away.
>>
>> IOW also the 2 root hub kmalloc() are now also aligned to the cache line
>> size, even though these never triggered the stack trace. Strange: hub status
>> is aligned far away from hub buffer, kmalloc mysteries.
> They are 64 bytes apart in most cases other than the last one which I
> guess the status had to go to a different slab page.
>
>> This still did not land for me: are we detecting a false alarm here as the 2
>> DMA operations can never happen on the same cache line on non-cache-coherent
>> platforms? If so, shouldn't we fix up the dma debug code to not detect a
>> false alarm? Instead of changing the alignment?
> It's a false alarm indeed on this hardware since the DMA is
> cache-coherent. I think Christoph mentioned earlier in this thread that
> he'd like the DMA API debug to report potential problems even if the
> hardware it is running on is safe.

I agree with Christoph. So, my question is "are we detecting a false 
alarm", not "a false alarm indeed on this hardware"?

>> Or, is this a bonafide warning (for non-cache-coherent platforms)? Then we
>> should not silence it by force aligning it, but issue a WARN (on a cache
>> coherent platform) that is more useful (i.e. here we have not an overlap but
>> a shared cache line). On a non-cache coherent platform something stronger
>> than a WARN might be appropriate?
> A non-cache coherent platform would either have the kmalloc()
> allocations aligned or it would bounce those small, unaligned buffers.
It would? Or it always has?
> So it doesn't seem right to issue a warning on x86 where kmalloc()
> minimum alignment is 8 and not getting the warning on a non-coherent
> platform which forces the kmalloc() alignment.

If *all*non-coherent platforms implement either correct alignment or 
bounce buffer, and on (coherent) x86 we get an WARN, then it is a false 
alarm right?

That is exactly my question (because I have no idea which platforms have 
non-coherent caches).

> If we consider the kmalloc() aspect already covered by bouncing or force
> alignment, the DMA API debug code can still detect other cache line
> sharing situations.

Consider? Or know?

If we know, and we can not easily prevent false WARN's on x86 it could 
be sufficient to change the message to "possible cacheline sharing 
detected" and add a line that "DMA_API_DEBUG" should be disabled on 
production systems.

And while at it, we might be able to fix the missed real cacheline 
sharing mentioned by Alan:

  "As a separate issue, active_cacheline_insert() fails to detect
overlap in situations where a mapping occupies more than one cache line.
For example, if mapping A uses lines N and N+1 and mapping B uses line
N+1, no overlap will be detected because the radix-tree keys for A and B
will be different (N vs. N+1)."

