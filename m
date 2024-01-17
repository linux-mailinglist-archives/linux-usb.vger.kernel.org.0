Return-Path: <linux-usb+bounces-5185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB5C830B57
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 17:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76D6291BF5
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 16:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AA1224D4;
	Wed, 17 Jan 2024 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILztQ1u3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7C21A01
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 16:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705509683; cv=none; b=IBZbGHorg+5CFSDBbEDyby7misiFut9xa9CN77dmHJWc144CLs1ZZw5YtR20Kk8aJMyLgBKbIYb/JGYp2NXqHyHwvEYMzLl+koiicvSRbDriVFG3nq6lBy+KMe0QmcyMh31tXP0Nh7XrWtdov7O8zIR7MccJxW6wkx1AGkpip2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705509683; c=relaxed/simple;
	bh=uBzCBYU4HD7qbd4CGMKpqlsUxLuRN0SmEPzuV0BSDx8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:
	 To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=N+n8pCUn7Kth86C//WFeE8UOjjG596j4I12P5nUdktNFyvNPUYtj0LeSHn6WM8ok3fi3HrR1sPvINsSgOOXFvcieIh1bAFTJwKfDsWnBEJiPgtHif2tXIZjCMtdSHEpjkeKE9Q3fmBwZSq1bgHaSdGggRdvmZgTWFvou1I6rfoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILztQ1u3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d51ba18e1bso94078745ad.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 08:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705509681; x=1706114481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbmO9ICMQku4JBf+7Cs9grnT1OAYJm2tzfZY3W6IccU=;
        b=ILztQ1u379J/DrGWDCud8zOFK3Qw9hZByz0RvGzFmc2TmkLuo6vGFnTK9vaZq2rCK/
         CUbjXRsZ8a/yO34dQKpLiQZrrCKWLJfDSNEMjC6LeTlmPiFkZlOFmP2CPqP/2iRJg0es
         1hORzZMJ5ogXphXN/jbmSeog9d6j6j7MxMk4X1JvyEE+XOCsGSsN/zdFbCuR+f/KPhHb
         UFcdRNozYFMyKvrb6St96Yz+/lkUIFvTzrtdmNt+LZ7mye8cPys88msfVbQcQQbND0Ha
         oAs4JZAS/eklawxLgvoYuk5ujhGKdfvDmRui3KxVYSUrGTTTBFoBs5U8v48KjQozmDLw
         gKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705509681; x=1706114481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbmO9ICMQku4JBf+7Cs9grnT1OAYJm2tzfZY3W6IccU=;
        b=W5jNQUVV+rpwtlpVPnSsHMPe9o24u9TrQHzM/rEzshQPfw8HmONPUKkspOX3qGV/dt
         aAE1Nfan36/EaWA6L0Zkr+ASnxApPL2o9BCqX4aZv4C8uFrocrmI/Qmc7OzDKNTXbcuW
         4bMvQavLTxm2DmX6xeh71U6/B4NAYzZN2jaZyUzazHI+epwLqgws8hZEWGYMr8SXxXIQ
         eVQ8DYWPU9hnW4yK84EAR0m67vd0Afa3W1uVO+SwAWnmAYQlyE2QwN37gdRENS/iG0PX
         yOzJbNX34V9QY/2rukE8/2Fo4eWj+ehHuhCTtXNEShj5ANP8XIYpaz1t7R50vRyE/oRr
         f9LQ==
X-Gm-Message-State: AOJu0YzYR/DkIrpclkje9vvl8JLJ4iy5zgWiPnZIFFA2USt9+EoibzQC
	D7AWp7czal8iIGplonb80Pc=
X-Google-Smtp-Source: AGHT+IEE2I58BQbvsNS11+pVCj5ytblslMcGUzH2oTcMBRRkIHKEeSlmkN5bnqGxkXZyKLgqfVR3mg==
X-Received: by 2002:a17:902:e80d:b0:1d4:6732:1ab8 with SMTP id u13-20020a170902e80d00b001d467321ab8mr12091898plg.83.1705509680746;
        Wed, 17 Jan 2024 08:41:20 -0800 (PST)
Received: from [192.168.1.7] ([110.78.142.72])
        by smtp.googlemail.com with ESMTPSA id m8-20020a1709026bc800b001d60a70809bsm1976924plt.168.2024.01.17.08.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 08:41:20 -0800 (PST)
Message-ID: <f7a68087-c4b9-4dfc-b24a-df36bbffde74@gmail.com>
Date: Wed, 17 Jan 2024 23:41:15 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "SilverStone TS16" external SSD enclosing needs an UAS quirk
Content-Language: en-US
To: Bruno Haible <bruno@clisp.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>,
 linux-usb@vger.kernel.org
References: <3750407.VQhiAETyHQ@nimes>
 <2024011630-convent-slouching-ce10@gregkh>
 <fc14c873-04ee-43cd-8328-b4e5b03e0230@gmail.com> <2270283.o7ts2hSHzF@nimes>
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <2270283.o7ts2hSHzF@nimes>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-01-17 14:59, Bruno Haible wrote:
> Lars Melin wrote:
>> 0bda:9210 is a Realtek USB 3 to pcie chip used by umpteen
>> enclosure manufacturers.
> 
> SilverStone TS16 is not the only one that makes problems. There's also
>    - Sabrent NVMe M.2 enclosure (Model EC-SNVE) [1]
>    - UnionSine Dual Protocol M2 NVMe to USB 3.1 [2]
> 
>> I have got one from Orico and it works ok under both linux and MSWin but
>> it can be a bit finicky if it doesn't get enough power, it may for
>> instance work well with an earlier (slower) type of NVME SSD but not
>> with a later faster type unless you provide external power to it (usb
>> hub + power adapter).
> 
> So, the Orico one has problems as well. Do these problems disappear when,
> instead of changing the way it's connected to the computer, you add this
> quirk?

I can not check that now, the SSD that misbehaved if not connected via a 
powered USB Type C hub is not available to me now. I don't even know if 
I  would still have that particular problem now after having updated the 
firmware in the rtl9210 controller today.
It is very likely that the powered hub masked the real problem of an 
early and buggy firmware.

>> Slowing down all RTL9120 already in the market with this quirk is in my
>> humble opinion not a realistic solutio.
> 
> What else do you propose, for those of us who buy this hardware (€ 50,
> it wasn't a cheap one), connect it directly to a computer (through the
> vendor-provided cable, to an USB-C 3.2 Gen.2 connector, as in my case),
> and then experience 1-2 crashes per day under Linux?

I propose that those who have a uas problem add a local quirk in their 
system.
If you google 0bda:9210 then you will find lot of people who have 
disconnect or no connect problem with their enclosure but you will also 
find lot of people who say that their enclosure works without any 
problems. They, and I, don't want your quirk in our systems..

Another option for you is to ask your mfgr for a firmware upgrade or
to search for and find one on the net (as I did).
The release notes especially mention fixes compatibility problems withr 
Samsung 980 pro and WD Black.

/Lars


> Bruno
> 
> [1] https://ubuntuforums.org/showthread.php?t=2466059
> [2] https://forum.level1techs.com/t/nvme-to-usb-3-1-enclosure-buggy-in-linux-rtl9210b-chipset/199752
> 
> 
> 


