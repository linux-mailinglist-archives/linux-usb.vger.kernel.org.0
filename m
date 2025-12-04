Return-Path: <linux-usb+bounces-31138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 875E7CA2120
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 01:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10346302A978
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 00:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415B61E8836;
	Thu,  4 Dec 2025 00:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlJ1RxOS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AFC1E5718
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 00:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764809534; cv=none; b=HaubfgGEthtBBvGOEEGJKOIyD5RwCoBiA8fNtXmUON1/hR8k5eiDIJGv0QcV2n6t+Xgr3lYcYF+4+Qh0oCkKElnmT5ao+LuWneBU4qXTbT2XgPCgYSQrwnf40wbuQjiukXMSkeIcXQZvFUXMc5jCeaE5cnfO86kTqVFH1KjJ88k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764809534; c=relaxed/simple;
	bh=kEcCUKZDlgMs1iuz9lbnwuEeJ9PXjzHfOWYGEi87I0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjdlUHOYUse+vmvZoVl/bpkti3aBsSVCU4t1o6LFI8fSzn/v5OMLm2kH38xTkpisH+AlgCOYg8UVPpFljSUe0G5uFPYc5K9VQCvLQB4tnvN3aaT3Ag5TBFbkPivR6x8H0vEhLEBnEW57TnnxiOBB+TiNv0EZSVQQlppILfat9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlJ1RxOS; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b155c9ab2so121095e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Dec 2025 16:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764809532; x=1765414332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3atcAabCz2sjBHzquuqosDkAjLE72vWIxNsqZt+hnrU=;
        b=KlJ1RxOSoV6L/mu3/pPJgvzSno7/LRU2AgPPkrOz8kfYUPkjKRMKCQT2GL6nCft7/L
         d88beO+/GoqSVO4BdwOBkGg04qmAykaN7gZMucm941Ww7lxGZtQ3IlUSOq+4sz9JRGTw
         wejV909FlRiiIBCX3yqv9i3/NkK+ULKdXovRYXUbTllMgmRpaEGDXdogjMzZNnMJh6lm
         HDTjnTMGx1rD7o8v7uK1G5NtTwlPgz1o67zF0bTZ/37kmLdkjWvLo+0JUNzQ67ZRDQBB
         UThsp+2848mr62loR+4iQharqY/cJQ/zwrIF+TCXNsdZugBHzGunyErKH9Jxm43Lm/DS
         uL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764809532; x=1765414332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3atcAabCz2sjBHzquuqosDkAjLE72vWIxNsqZt+hnrU=;
        b=aPN58DBsBAWCbFs6g1HRGU7qWn2i+XiZj5HP9hFNjw9n1kIoylF+DfajWpnyUSU0EG
         0rgEXGjHuOq2xhaG0IKv4YESaAYMU7n7D98S9BYO3YS7nxbZHLv2iwU4gN58luin2agz
         Q4OOcSHXPAz9Ney9LznQUoTssG7zg3AVowv6ezKsIdMbEQa9IXAdyG3uVi9nyc6Nekv3
         +u1NAD1L5fbdqIFYzNEZsyriQHhgwg8Z1NmfM115YupKG/7Itw9D+ZBIBFvbhKJERj4/
         agakcXO6VcRtcA7sBJG2p5q55vFHbZ0buqewNosNTYYHdBSOB2DjlXcAtlW+dNGfWRVz
         m7cg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Cy0EoahRrBd8jwvDWWgs0DjTRDOM/pPd7/xxLgoEhw6FONCUvq0HfiUH6xzy7cLKHjlEH0MaU7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1FlGVAyerikYl9wZpq/1RJkHtOONYBUwOrW7sOFTOMpeGE3g
	UXMfH8i2elQbIoVb4t/dKT/7FuMdPJSjkuYM94ccj2GPjCqlRCGABR3X
X-Gm-Gg: ASbGnctbjwvn+d8F9q+Oi3cAHcwHc4P9eD5+csy3sFtp1CaZofA+aW66yGGO5ugz4gx
	ZQ65NogmolnfrW5YO0gAhXYqucF1Skc4XXIzyYhhykuHGd4c/utPeozCGwMePRECvbppl/UFKaL
	K1Nxudgm8rpSiI3pcRVDwyQKHjKvJwhtnxsaI0BJvpq0dcIDTlmdeRKPHDif28I9e6TWTVMqPs6
	c+oIzernpsyS+kqxrD72U9UR0RTkGQLrta1xwWAR/ZJS52wExgBlzLQRJ5QNFYCTtoL75XlCODA
	K7FwfzxY+wCFY+wHetA6qq8x0a6GYL83+ZerwGHbq4UpTjXbpUPEIJgs1zuEz2ZijSya5bgQIiq
	DpQL1JPTPlo0JNdTBimqXD3OxKxgWua8PI/ojaXCgS39mrMRvYdVUjJkVZUGO2cRnQQdoAcasFB
	VSiJyxPFAEIWqtDsPIHuMNdRwlHSkeH+WdzREmOR8=
X-Google-Smtp-Source: AGHT+IEMpcuJ1gIWyXFsLaW+WfiWQoJCvzkx4F9QSwvAIrW2J9InZ7o7A7DWxduc3pOViRobrHz0JQ==
X-Received: by 2002:a05:6122:45a7:b0:55e:4bcb:6bca with SMTP id 71dfb90a1353d-55e5bf4e28dmr1544588e0c.10.1764809532071;
        Wed, 03 Dec 2025 16:52:12 -0800 (PST)
Received: from [172.16.226.146] ([98.254.184.207])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c938d9bsm58015e0c.14.2025.12.03.16.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:52:11 -0800 (PST)
Message-ID: <a953d014-40da-4618-af71-492f84626d94@gmail.com>
Date: Wed, 3 Dec 2025 19:52:09 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, khalid@kernel.org
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
 <2025120200-backslid-endocrine-e64d@gregkh>
 <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/2/25 10:53, Alan Stern wrote:
> On Tue, Dec 02, 2025 at 06:27:46AM +0100, Greg KH wrote:
>> On Tue, Dec 02, 2025 at 02:07:09AM +0530, Clint George wrote:
>>> As part of my LKMP mentorship i have to complete 5 patches as a criteria
>>> for graduation and thus have focused on working on such
>>> beginner-friendly patches so that not only do i get the required number
>>> of patches but also get familiar with the process of kernel
>>> developement.
>>
>> The LKMP internship should be done in drivers/staging/ as generally
>> coding style cleanups are NOT accepted in other parts of the kernel,
>> unless you get approval from the maintainer ahead of time.
>>
>> Does the maintainer of this driver want this to be used for the intern
>> project?
> 
> In fact, Clint's changes are small and inoffensive enough, I wouldn't 
> mind having them applied to dummy-hcd.
> 
> However, Greg is perfectly right that this kind of stylistic update is 
> not something that should be submitted for most parts of the kernel.  It 
> just bulks up the Git history with essentially meaningless cruft, making 
> it all that much harder to see the changes that really matter.  That's 
> part of the reason for the suggestion that interns and beginners should 
> confine their efforts to drivers/staging.
> 
> Also, remember that trivial changes like this are fine for learning the 
> procedure of submitting kernel patches, but the effects they have on the 
> kernel itself are minimal.  A patch that actually fixes a bug or adds a 
> functional enhancement would be a different story.
> 
> Alan Stern


Understood.

David Hunter

