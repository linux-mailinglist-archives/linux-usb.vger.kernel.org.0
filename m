Return-Path: <linux-usb+bounces-7802-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C61877D74
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 10:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86EE31C20D47
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 09:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891F81CD1C;
	Mon, 11 Mar 2024 09:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="ji05csUY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0117577
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710151105; cv=none; b=JuqjYKRC6edoyVZImC2e3AJ9WoayFLgxbANyN+BtcFiJIssJ4oE7jFtTYNx6KDnE9gIywirKKDTiDH2uojJriwBTD8/JjNTwuwZmvsWA7UtKVr5cBkp8lzQZb3zUo87XaYC4HaVOeumu07YUkCJKKIneKNpa4AZ3VkUOadVCyFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710151105; c=relaxed/simple;
	bh=WzOuexDXNHJfVLpDsLi/j5carQxZ7Ator1iXUkcUXVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Um/M3PFTijbC1vaavhqoZpJpgOD0E2Fd8AoQKvBtVnAC2S7nHcmd0rOPg2caMAI9V08gPJYbYIJoYI+rCACU9pdX4iIxA5GondjdXGYDBgoJjIR6IZhIKOblHFEyJz15ivd6B+Guc+XIT3Lxq67OlqSMLCEoDMfqraR8tOvnyNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=ji05csUY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a45606c8444so491599666b.3
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1710151100; x=1710755900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+4G+RFqm6TAKRoasVo5QUl7d7n7sQEAw3Vx1YsE9jgQ=;
        b=ji05csUYFAfI3qXvJv3mXBxAEzR+0L1dlHmdIf3vOuvt2e+C49WWAQEmFeFps0iM2a
         6jQ4z3m0THHyDVUl27J/LP4ER28vNaC3cYFlHN1XYlDk7YqsXETSnhPhbGpUQz9saf5z
         fFRW5tBEdWsLDRGDsx49gQ25VZJuMbmHjGnvsrJV4Mykj/BkbXnb4JV2o67tt6IDAT13
         8JG8wanEmLbbsv+BbkPMrpCSl2G6kGi1ws7locNWerb6T5/x5gjKvg057rZwzMVmRfFo
         GB7nSyQH8xpVD/RwhE4tUjCLF5H4w1r8SwjreRm0rFu5jCWWym3IhPSE0L69cQld7uhD
         ucSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710151100; x=1710755900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4G+RFqm6TAKRoasVo5QUl7d7n7sQEAw3Vx1YsE9jgQ=;
        b=JsgvES6foLTda2+grppY8ulKr4qbh9IExeZLC+O/04AliCG7jGbD6//vzFT4fwKCvX
         2SWeZfmwmx2qCaxzKwQXFx1qKzkkoTUFkP2jHs84lQIGzhxJi8IkR7t9ABBkxEGkXQry
         396a8JRTbJuP66CRow4Mx4G5aQ4zDZFL51GK4JVJexE0d1V5TGOM1/4rRr67zLnduUj0
         s0qqR+ZyCDdktONX8yGzL8XYTJYahru/c4eVkk/xoWY9uaaoFYK2qKk/iUTn0sZJ5LdJ
         29OhvBm8uMuifsbVq4sbNO7xewvwix5CBOsHuSXHeEnshjliSQk71OSU3N2GCom8Ww2N
         35CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUKgEP1SGlkDSHPQ6/69LK0L+0m2McI2owwfo7p0KvCOASM8bn2SMup8k+3RL43bahlPlUa0p9h8jYuaYYlRY/HCvd1WHp57FA
X-Gm-Message-State: AOJu0YySWf7ZpDDTA6RQ8cGXjjeUQSaSqyuDGLOGcqASzO9TdEVi75Dq
	epe1TpWW2eCe4dawfDAK3/lNJuH7dHbQJjk8ihb/9mhqksa5Q7+z6YeuizsgOOQ=
X-Google-Smtp-Source: AGHT+IEWFd0Lni3H4a6DBK8eJOmQ7Sv16rcrNe3OaaWJJMOGHqjkeAixGqq3+/h7HWx0N8qfprWWkA==
X-Received: by 2002:a17:907:c706:b0:a3e:cdae:7aa2 with SMTP id ty6-20020a170907c70600b00a3ecdae7aa2mr3802782ejc.35.1710151099987;
        Mon, 11 Mar 2024 02:58:19 -0700 (PDT)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id ae1-20020a17090725c100b00a45ffe583acsm2590321ejc.187.2024.03.11.02.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:58:19 -0700 (PDT)
Message-ID: <4c2a410b-2997-4a7a-8fd6-2bec819a1c4f@sairon.cz>
Date: Mon, 11 Mar 2024 10:58:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH 0/3] USB: core: Don't overwrite device
 descriptor during reinitialization
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Khazhy Kumykov <khazhy@google.com>,
 USB mailing list <linux-usb@vger.kernel.org>, regressions@lists.linux.dev
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <1e954652-dfb3-4248-beea-b8a449128ff0@sairon.cz>
 <4c3ab861-0274-409b-aad3-7cfb53dc2308@rowland.harvard.edu>
 <00f0786b-a9f2-4f73-8d23-3b1fa4c8b77e@sairon.cz>
 <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <60def275-5237-48df-b37b-ab886f4ee017@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07. 03. 24 20:34, Alan Stern wrote:
> Another thing the traces showed is that the device doesn't like the
> "new" initialization scheme; it wants the "old" one.  You can test
> this by setting the old_scheme_first module parameter for usbcore
> before plugging in the device:
> 
> 	echo 1 >/sys/module/usbcore/parameters/old_scheme_first
> 

You are right, this indeed works and probing is successful after the 
power-cycling attempt.

> Also, you can try the patch below (without the module parameter set).
> I suspect it should be applied in any case, but it would be nice to
> know if it makes any difference in your case.
> 
> Index: usb-devel/drivers/usb/core/hub.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/hub.c
> +++ usb-devel/drivers/usb/core/hub.c
> @@ -5481,6 +5481,7 @@ loop:
>   			msleep(2 * hub_power_on_good_delay(hub));
>   			usb_hub_set_port_power(hdev, hub, port1, true);
>   			msleep(hub_power_on_good_delay(hub));
> +			hub_port_debounce_be_stable(hub, port1);
>   		}
>   	}
>   	if (hub->hdev->parent ||

Unfortunately, this doesn't fix it. It changes the log output a bit but 
still does not enumerate:

[  199.295695] usb 1-1.2: new full-speed USB device number 25 using ehci-pci
[  199.360684] usb 1-1.2: device descriptor read/64, error -32
[  199.534678] usb 1-1.2: device descriptor read/64, error -32
[  199.708671] usb 1-1.2: new full-speed USB device number 26 using ehci-pci
[  199.773666] usb 1-1.2: device descriptor read/64, error -32
[  199.941602] usb 1-1.2: device descriptor read/64, error -32
[  200.044871] usb 1-1-port2: attempt power cycle
[  200.528631] usb 1-1.2: new full-speed USB device number 27 using ehci-pci
[  200.940603] usb 1-1.2: device not accepting address 27, error -32
[  201.208592] usb 1-1.2: new full-speed USB device number 28 using ehci-pci
[  201.223783] usb 1-1.2: device descriptor read/8, error -32
[  201.345772] usb 1-1.2: device descriptor read/8, error -32
[  201.452899] usb 1-1-port2: unable to enumerate USB device

I'm attaching usbmon traces with this patch.

Regards,
Jan

####################################################


ffff94ff414f8a80 199261119 C Ii:1:002:1 0:2048 1 = 04
ffff94ff414f8a80 199261158 S Ii:1:002:1 -115:2048 1 <
ffff94ff882bd840 199261199 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199261378 C Ci:1:002:0 0 4 = 01010100
ffff94ff882bd840 199261383 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff94ff882bd840 199261635 C Co:1:002:0 0 0
ffff94ff882bd840 199261661 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199261902 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199288109 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199288463 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199315108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199315374 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199342113 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199342504 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199369107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199369447 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 199369498 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd840 199369903 C Co:1:002:0 0 0
ffff94ff882bd840 199381106 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199381375 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd840 199381410 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd840 199381633 C Co:1:002:0 0 0
ffff94ff882bd840 199433148 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199433339 C Ci:1:000:0 -32 0
ffff94ff882bd840 199433360 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199433971 C Ci:1:000:0 -32 0
ffff94ff882bd840 199433988 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199434342 C Ci:1:000:0 -32 0
ffff94ff882bd840 199434363 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd840 199434609 C Co:1:002:0 0 0
ffff94ff882bd840 199446107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199446423 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd840 199446448 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd840 199446679 C Co:1:002:0 0 0
ffff94ff882bd840 199606111 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199606348 C Ci:1:000:0 -32 0
ffff94ff882bd840 199606372 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199607003 C Ci:1:000:0 -32 0
ffff94ff882bd840 199607090 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd840 199607593 C Ci:1:000:0 -32 0
ffff94ff882bd840 199607623 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd840 199608123 C Co:1:002:0 0 0
ffff94ff882bd840 199620108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 199620506 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd840 199620531 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd840 199620770 C Co:1:002:0 0 0
ffff94ff882bd840 199782114 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd840 199782380 C Co:1:002:0 0 0
ffff94ff882bd900 199782433 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 199782639 C Co:1:002:0 0 0
ffff94ff882bd900 199794109 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 199794511 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd900 199794536 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd900 199794769 C Co:1:002:0 0 0
ffff94ff882bd900 199846142 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 199846554 C Ci:1:000:0 -32 0
ffff94ff882bd900 199846574 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 199846828 C Ci:1:000:0 -32 0
ffff94ff882bd900 199846842 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 199847170 C Ci:1:000:0 -32 0
ffff94ff882bd900 199847236 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 199847490 C Co:1:002:0 0 0
ffff94ff882bd900 199859108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 199859470 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd900 199859496 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd900 199859726 C Co:1:002:0 0 0
ffff94ff882bd900 200014111 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 200014492 C Ci:1:000:0 -32 0
ffff94ff882bd900 200014516 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 200014828 C Ci:1:000:0 -32 0
ffff94ff882bd900 200014854 S Ci:1:000:0 s 80 06 0100 0000 0040 64 <
ffff94ff882bd900 200015180 C Ci:1:000:0 -32 0
ffff94ff882bd900 200015251 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 200015502 C Co:1:002:0 0 0
ffff94ff882bd900 200027108 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 200027318 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd900 200027345 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd900 200027579 C Co:1:002:0 0 0
ffff94ff882bd900 200182109 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd900 200182296 C Co:1:002:0 0 0
ffff94ff882bd840 200182354 S Co:1:002:0 s 23 01 0008 0002 0000 0
ffff94ff882bd840 200182551 C Co:1:002:0 0 0
ffff94ff882bd840 200390109 S Co:1:002:0 s 23 03 0008 0002 0000 0
ffff94ff882bd840 200390345 C Co:1:002:0 0 0
ffff94ff882bd840 200494114 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200494318 C Ci:1:002:0 0 4 = 01010100
ffff94ff882bd840 200494345 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff94ff882bd840 200494571 C Co:1:002:0 0 0
ffff94ff882bd840 200521107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200521316 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 200548107 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200548426 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 200575100 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200575338 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 200602100 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200602260 C Ci:1:002:0 0 4 = 01010000
ffff94ff882bd840 200602311 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd840 200602714 C Co:1:002:0 0 0
ffff94ff882bd840 200614101 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd840 200614389 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd840 200614416 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd840 200614842 C Co:1:002:0 0 0
ffff94ff882bd840 200666141 S Co:1:000:0 s 00 05 001b 0000 0000 0
ffff94ff882bd840 200666529 C Co:1:000:0 -32 0
ffff94ff414f8a80 200797181 C Ii:1:002:1 0:2048 1 = 04
ffff94ff414f8a80 200797212 S Ii:1:002:1 -115:2048 1 <
ffff94ff882bd840 200870110 S Co:1:000:0 s 00 05 001b 0000 0000 0
ffff94ff882bd840 200870423 C Co:1:000:0 -32 0
ffff94ff414f8a80 201053174 C Ii:1:002:1 0:2048 1 = 04
ffff94ff414f8a80 201053190 S Ii:1:002:1 -115:2048 1 <
ffff94ff882bd840 201079556 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd840 201079768 C Co:1:002:0 0 0
ffff94ff882bd900 201079814 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 201080045 C Co:1:002:0 0 0
ffff94ff882bd900 201092106 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 201092293 C Ci:1:002:0 0 4 = 03011100
ffff94ff882bd900 201092321 S Co:1:002:0 s 23 01 0010 0002 0000 0
ffff94ff882bd900 201092559 C Co:1:002:0 0 0
ffff94ff882bd900 201092596 S Co:1:002:0 s 23 03 0004 0002 0000 0
ffff94ff882bd900 201092819 C Co:1:002:0 0 0
ffff94ff882bd900 201294110 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 201294319 C Ci:1:002:0 0 4 = 03011000
ffff94ff882bd900 201294346 S Co:1:002:0 s 23 01 0014 0002 0000 0
ffff94ff882bd900 201294575 C Co:1:002:0 0 0
ffff94ff882bd900 201346134 S Co:1:000:0 s 00 05 001c 0000 0000 0
ffff94ff882bd900 201346293 C Co:1:000:0 0 0
ffff94ff882bd840 201360112 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201360521 C Ci:1:028:0 -32 0
ffff94ff882bd840 201360558 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201360922 C Ci:1:028:0 -32 0
ffff94ff882bd840 201360938 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201361276 C Ci:1:028:0 -32 0
ffff94ff882bd840 201482107 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201482304 C Ci:1:028:0 -32 0
ffff94ff882bd840 201482330 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201482934 C Ci:1:028:0 -32 0
ffff94ff882bd840 201482954 S Ci:1:028:0 s 80 06 0100 0000 0008 8 <
ffff94ff882bd840 201483278 C Ci:1:028:0 -32 0
ffff94ff882bd840 201590112 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd840 201590387 C Co:1:002:0 0 0
ffff94ff882bd900 201591835 S Co:1:002:0 s 23 01 0001 0002 0000 0
ffff94ff882bd900 201592045 C Co:1:002:0 0 0
ffff94ff882bd900 201592073 S Ci:1:002:0 s a3 00 0000 0002 0004 4 <
ffff94ff882bd900 201592497 C Ci:1:002:0 0 4 = 01010000

