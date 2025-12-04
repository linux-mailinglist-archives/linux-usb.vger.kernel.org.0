Return-Path: <linux-usb+bounces-31137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D50E8CA20E4
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 01:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA90F301F25C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 00:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD521DF246;
	Thu,  4 Dec 2025 00:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Be9HZ9My"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544DE17A31E
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 00:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764809032; cv=none; b=nEhQkyea8vYA4LHaoTBPSTfU3l1DCr1coGIAbMeU8QchdPsIwk/Gr79vd3Am3TOgslmg2epvQYk2fak2CwSqHCeVwCUSG1DdAJ5b21eRC4tMQYr7D7BUEMXY3PdsKCdzLx/+CWl8eydjpxyyFZXJHKVoFBN9KuXtiWnEEym8iv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764809032; c=relaxed/simple;
	bh=7C4m9y22CDhJly1Sa/M8ZgDQxAAaoOub7TsjprrN6mo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPkFHJfWspyKnGuzWyU+pAs4iF1TYlZNwEFsXijAhuwvmGzTlEnjt1IfOQr8SAIPqif6a8HCfPyUhKLEaRHxQH3Z7L+w+eePQwgyKu/KUIqdjWvMAaa5V79bdgCxFTzLa7Xxpm9NSEw4D3nl0/ckj9Gep/wqUvt3bQO97Bw+AqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Be9HZ9My; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-559966a86caso99279e0c.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Dec 2025 16:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764809028; x=1765413828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61Fg0qope6bIFTvBwF2PK7eB2MmgYw/t+V2Q9FitbBc=;
        b=Be9HZ9MySgglRr1HWmtn8CGu2d4yljbZQSPUKCsu1OuQw6pADH7M2WljWvuEsedf0D
         tgB7owH6xe7PokSA2280G5mGw3qRFS9ZL2boQSXHIBb9L3bsLRoJjDWYqF6y2dlHaDbA
         6epo5xUSdSNNjxcTffT+V2eThTJAyUYze7AeMyRzZSYkvZ9oXafqggq/mmNdRAuleF5B
         x9f1sucaSYLHvti4SN6/OYRd/dvA3dwjp+ltUkzfgiSbJM3773ro5CQDg/6Z01EvCzad
         CNjVrW0ppgRXCkTOlTcjQyqdJZXQce4sOU2JokH0x4yDURJS39b7FQZnrOrf6FRffYKH
         y82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764809028; x=1765413828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Fg0qope6bIFTvBwF2PK7eB2MmgYw/t+V2Q9FitbBc=;
        b=I6MScxges3j0n9LJ/7obpnd7AAv25slst4ucdekId5tfUIhauZih/SvXLMY7tMxI28
         DbN/7PV4u3CdZvOzd+l6MtSHMNTlwQwnyiw6xO1thXcT9/LGUWc1rsIcCTRfdrluCjvd
         /Tliy/gqKOGHJMIrHn1PnP8WXZJezkpwIc+QmxblbfoQ865ipUN+J1j6aU7cSXN9HrSD
         8Y/X9Ml7vdUFhw+6X1rnt01wBFUay011qUD/CKMreeqqDHtIV+h/03E5+cAh5sEXE5V3
         SHgO92rXtZFCIR6eh/tkzoFCIdYAyjJD1+5ZXcoViwKYdqf0VKmi0JJamTna9Z97NZrV
         PPbw==
X-Gm-Message-State: AOJu0YwEwJvXt7fnFYt4M2TbZKZ1BkCyYY6CLziOgAweqWx0tfB3MhA6
	ge9WhXJjlfgajCbVW+5IlY8C7OGY+Zi8JfBYqeERVX6fQfqjvG6OrM4y
X-Gm-Gg: ASbGnctJW8CPRV60knfkGX6AJYyKr1J5N4ynh1MQ+mEr/HhdmHakof46VxWlHpeSXaJ
	Yf5u9Q5q/32BSE2Yo363k4PRZU+Xelv3B8WaYtMLLG+EjIgXm/6ZFwX6JEs1akCNEmDcT04ADSi
	FsL/8qV7wcwxaIgBTb2Qkof6rMx/HsT9Yh82weVkLnL4nTkcUnWzRK4O7grawo6Gx+62lrdQVtM
	zjyBFrqLvMaAUrqFlS3zI3XDXaBHhZn/r00Z12nlarOP91yPs8tOb40zA+YkiPCrJDeVsPaEoOJ
	peMHCo8l6vAUJcewpnLJqmCJ62UrPnWXbFeI2udgWxZoe+VYbaQ2p2fX07kOgx0SsHOsN06At1z
	HQJ8bwPvJtuHC8XSgk5zPoW6DvUZ6QfIkChigk09jquZHtEpJXgytxEOWgi4isGy0xUgYmMK6pf
	ObpBeoI3+hlywvkG9Bx2UoVhbCyjBB
X-Google-Smtp-Source: AGHT+IGsuatuhKh4iVq8o2lXvbj9+Qg260ROC3Yx+Y7OG23faK6RtOzwe4m6qVvfmSN3u8YYtNXYFg==
X-Received: by 2002:a05:6122:8c7:b0:55b:aab:95e8 with SMTP id 71dfb90a1353d-55e69d8b1e4mr240706e0c.9.1764809028159;
        Wed, 03 Dec 2025 16:43:48 -0800 (PST)
Received: from [172.16.226.146] ([98.254.184.207])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c56853esm77504e0c.1.2025.12.03.16.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:43:47 -0800 (PST)
Message-ID: <fb90cdeb-3286-43df-9043-eb474bf4ba8a@gmail.com>
Date: Wed, 3 Dec 2025 19:43:44 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
To: Clint George <clintbgeorge@gmail.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 khalid@kernel.org
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/1/25 15:37, Clint George wrote:
> This patch series focuses on addressing various coding style issues in
> the dummy_hcd USB gadget driver. The changes includes adding relevant
> comments, improving readability, and ensuring consistency with kernel
> coding conventions.
> 
> Clint George (6):
>   usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with octal (0444)
>   usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
>   usb: gadget: dummy_hcd: document ISO endpoint allocation pattern
>   usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
>   usb: gadget: dummy_hcd: remove unnecessary parentheses
>   usb: gadget: dummy_hcd: move function braces
> 
>  drivers/usb/gadget/udc/dummy_hcd.c | 52 ++++++++++++------------------
>  1 file changed, 21 insertions(+), 31 deletions(-)
> 
> ---
> 
> Testing:
> - Ran compiler testing with no new warnings detected.
> - Ensured the module builds and inserts cleanly without issues.
> - Used Static Analysis tools to confirm no new issues were introduced.
> 
> Please review the changes and let me know if any modifications
> or further testing of the module is required.
> 
> As part of my LKMP mentorship i have to complete 5 patches as a criteria
> for graduation and thus have focused on working on such
> beginner-friendly patches so that not only do i get the required number
> of patches but also get familiar with the process of kernel
> developement. Thus, while this patch series doesn't address the max_stream value
> exceeding problem that triggers the BUG() API, i will take some time to
> dig deeper and truly understand the problem and fix it and not just
> paper-over the problem.
> 
> Again, i am very grateful for your feedback greg and alan to guide a
> beginner like me. 
> 
> Thanks,
> Clint
> 

Hey Clint,

In general, when submitting version 2 of a patch series, most
maintainers will prefer that you send it as a new patch series and not
as a reply. I usually recommend putting the links to the respective
previous versions in the change log.

Thanks,
David Hunter

