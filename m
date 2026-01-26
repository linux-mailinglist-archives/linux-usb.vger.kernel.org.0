Return-Path: <linux-usb+bounces-32727-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEYPM3Fxd2m8gAEAu9opvQ
	(envelope-from <linux-usb+bounces-32727-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:51:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB45891A4
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E8A7301C920
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 13:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1713633AD91;
	Mon, 26 Jan 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNITiiM/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDCA33A9C1
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435492; cv=none; b=H2mDD5xcniTcgJIvwfAi4acfLmGwz/Rh1EYeWuHd2mD5BoKwxapOMrL7hvqFY9YY8oep9tZlV+mgqkceZzsCRIwv2NN3/1n26Tw7/aNg7Kv7+6Hlt/peO6hxe8BkrMEYHnYEhOIQYPvCKFIgRhho4Cai0FlyMaNzgI/jv9RHGOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435492; c=relaxed/simple;
	bh=tgOUVefbY1NaweMNMgrdBc6Oy3vMy3/oPKtbIqwkA20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgF4Fn+sz6E+HrO21gkte78IfzbjzRRaUjOrOrRaSAdINcV7HjSMDJv7N9VLrpJkgkRqhk/ktT0LHVdHSEC/cbtIz+OjGezPnzIBUS+1MFf2Muk5Svteg66L6hITvaOZXAhgORMP1NB+tkN92Tfn2c0aHjVP/0IaSkiRgEXCTOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNITiiM/; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81f42cd476eso248426b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435491; x=1770040291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G18aNb5G1BfpTzLJA/gXuSRUPPR96Y4IT4X76araThA=;
        b=FNITiiM/RHdsYL4tv3bVff0q/FahinPo8ogPrsCTaeMB8nyFzeAS9pSZK1YHqaSnOI
         +KmJlnnqDxqI6dB6FqakfBcc2pWRLopStwqIWI9H6D5tUeJxf4XN8Q+QbAF6mqyQzMum
         MbafGmn+N0r+IGOZCZqflDu1x5Qna1Mu1cM9OoK4zADt1giQbuK7je8XRscBTm0FmN8K
         HXdm/lDL2pVN/DJvKnmd14z8LlgCc0Wxj7qjEmwec6OIXUFzJ1gUMdX17Ic3X3DISFKs
         FdLAyeFfeMUE61S8Uy46AnTwg3p8Kg1DVXZHKW7Vj52fav7ST2x2xhnatM5P+yMleElJ
         OstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435491; x=1770040291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G18aNb5G1BfpTzLJA/gXuSRUPPR96Y4IT4X76araThA=;
        b=oXY+2wcru5Tc4nGjE5e3mhtYzwMJdXipPawwwlyYkRAuZ31OiyweD3M/NlY2iW34bA
         4B8GnLKPstiyM0fKaSyAmJ5Qh1AyyUBxWmjlZGIzATegdW4Y8X2qQvLf0zUjgaC1JX1c
         s0iPacg41Y1VbKIbWPYpXNnpB9cKg42CoARFg7FU03Oelx3H8YLAAE/xsCXeA1Sf9xQY
         S6FCChFpElgZIRHdmOGHC5Q/oakjslU75rRewlLLdUGNt2AwisnUTozLTmgSWKPkMS+e
         VRkA7myJE7LY1OXC39PGT4WwLHoMr9MXDVIGlRSaYCdlbM0cn/51nvX+7RNKtT5qPIfC
         +xWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc1VSD/PuApDMyNIBRTBZbTuXuEumcuVqSTvZzuoHBKgm9RKWKryfr7sUDaXbgMZmJtGpPudS2oAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm2szNB5ePz0FSAgFq9CGF5Bg14hiyz1EzZYlSBkMWq9o73PRt
	6tz/X9Q2Qh6KfDEY39LLv4MthVAf/aGtyRKIfzRfWqGI2w4Q5HYIKdXA
X-Gm-Gg: AZuq6aJSpR+02NHWYYaFoC+MTNHguHnnX/LjxPBMc7DyLJl9OJgLwEX4p1uoHj0bVkG
	yTrYC3ZzHyhljnso9q8LTI7ueNZjLmSFl+lRLDIPXWzvnOFw6s/G+x07LBcQgWQG0JULhuiPK0Q
	vMaQD7hgTzeC61E/TJEWxz/C3cAVQo25jiVy9YL9cvbyTQtu5udotdJGI6WfDxaOnato2TPE+VB
	UePZgt4yrWRgzCRhrjpf3xIgIk37NF9hGU/svvkElq5WNbZzvFF+OBCBeyCAXQAEHvYQmXtWFgN
	3BAZ4clLW+pULZKIc8G4PrEcdy3IvF/xr4g1Fsa1/HYtPJQuyYJK8bIRwZTG3mTb3MTVjKFHmJW
	1y1UsB5lGFkctUBORcCYSs+YV6e1WsrPMEvFu9oOaOvdX4TX62MJkbIuI1N6rqfbJmnx2sUJfMu
	a/ZRZkRtoC2zX1gsav6+Vb
X-Received: by 2002:a17:90b:5546:b0:352:d19c:684f with SMTP id 98e67ed59e1d1-353c41bb581mr3280300a91.8.1769435490724;
        Mon, 26 Jan 2026 05:51:30 -0800 (PST)
Received: from [192.168.1.7] ([159.192.80.104])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c635a142b5csm8685831a12.10.2026.01.26.05.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 05:51:30 -0800 (PST)
Message-ID: <8a7ed9d1-c667-418a-a72a-d8d24ed0f9f8@gmail.com>
Date: Mon, 26 Jan 2026 20:51:25 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] usb: csc-acm: add Infineon/Comneon modem support
 (1519:0020)
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260122151746.7745-1-clamor95@gmail.com>
 <20260122151746.7745-2-clamor95@gmail.com>
 <fa42a103-3b71-4151-b44d-573452847f6e@gmail.com>
 <CAPVz0n2xcnvus_u4dYDGL0VcgkWfVOJF7=hKuMPrjsE4UZTNLQ@mail.gmail.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <CAPVz0n2xcnvus_u4dYDGL0VcgkWfVOJF7=hKuMPrjsE4UZTNLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32727-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larsm17@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DB45891A4
X-Rspamd-Action: no action

On 2026-01-22 23:17, Svyatoslav Ryhel wrote:
> чт, 22 січ. 2026 р. о 17:58 Lars Melin <larsm17@gmail.com> пише:
>>
>> On 2026-01-22 22:17, Svyatoslav Ryhel wrote:
>>> Add support for Infineon/Comneon XMM626X modem that used in many Tegra30
>>> devices with GSM capablities like LG Optimus 4X (P880) and Vu (P895).
>>>
>>> The Vendor Id is 0x1519
>>> The Product ID is 0x0020
>>>
>>> Output of lsusb:
>>> Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
>>>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>
>> Hi,
>> please include a full lsusb output, ie lsusb -vd 1519:0020 so we can
>> verify that union descriptors are missing.
>> (I have seen a full lsusb output where they are included.)
>>
> Hello there! Sure, here is what I get if I use lsusb -vd 1519:0020
> 
> lg-p895:~$ lsusb
> Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Controller
> Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> lg-p895:~$ lsusb -vd 1519:0020
> Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Controller
> Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> lg-p895:~$ lsusb -vd 1519:0020
> Bus 001 Device 001: ID 1d6b:0002 Linux 6.16.0+ ehci_hcd EHCI Host Controller
> Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> 
> regular lsusb is added for reference.


You are using a stripped down version of lsusb which doesn't give a 
verbose output, please install the full version and try again.
If you don't have the full lsusb, how do you then know that your
device has a faulty union descriptor?
The full lsusb listing that I have for 1519:0020 has a correct
union descriptor so doesn't need a quirk.

thanks
Lars

