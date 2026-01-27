Return-Path: <linux-usb+bounces-32761-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vofKGP4QeGnyngEAu9opvQ
	(envelope-from <linux-usb+bounces-32761-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 02:12:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9EC8EA1B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 02:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 011F8300F9D9
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 01:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950AE2253EF;
	Tue, 27 Jan 2026 01:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MagFvMW2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57CB221FB6
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 01:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769476342; cv=none; b=VhWbBoGf9WIKrv6j9LM16Z0z5OsfQg7B1latOfjsFi1VWBze/bRvGUpYWzFJdOWkrkNog0zmlsfRpluqvVBZrTvP0gT/DYovf+MT6jGz/7NJiERN73vmK6/mrl8bKfVGCjGATSmtOWvQxzrRxaVRlUK6EK8lDM6byRxHehi4pmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769476342; c=relaxed/simple;
	bh=dJZYkXLww1VVjmgCTGY4U2deQ2roIk/KnWbJvfQspKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDgDdEHuX0hBdUKB3kfHGnfCrIgSqwLtVizL6Eem1c+O2+jpLaLqT+gpsgwQQJZ5FVPr3b2MwByyh2jdBKmwvKN/yxokeu9Cswdlm5Nqeg4azYHlzTphvlT9iTNx/J1kg8XzDhYM2EaaUb3kh6WgfTygP1tHObagwFieEKZCFNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MagFvMW2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a097cc08d5so12684245ad.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 17:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769476340; x=1770081140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSwU+Ks+JulPZbOfkes69hc/O2U1jcNe9cfjRlOkhrY=;
        b=MagFvMW2j1NUHhswa49J2kYKmprFaRdWmDceVMtHXzCX+c4ZLi6/AeFgFSgRYh/uL7
         nhm4FPTQjTqVXExx7jKrc1+zPGQPT615EJJISK3gfomBP2kVhORnKnpAp6QMFiuafKro
         pQJkUY7sKInmGU6UrzUlBiQGVcW52su8SIn36zzagJfO9iRJXUdcU3C0qk6pOiXfpLqV
         7pwHEUEMRLB/2Pg5WHRLrS+a8gpGi2lFNopHt2BU5Jq18H7F4NNy4uCEpqSruonUj+sc
         I2g8igWNEZeeYYBOU+Sla6Ifcq2zzkhFuwToJ01rQNKqD/98TQGVCq2lK+TeKFTPMf+5
         rPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769476340; x=1770081140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jSwU+Ks+JulPZbOfkes69hc/O2U1jcNe9cfjRlOkhrY=;
        b=f0OgECkI6wb2cOrx21pavILBs7VROUtpk1uffJR2nP6IWgZ6DHMgGUgbDe1yioe9Zj
         hYqhvK5aLBdq+dChVCiVJRhh2d7EZgylfnr+CiDhnQB8DzemUP7juZ5s77exisrxLJyt
         irEq+uBiUDSMFmlJRlMnDhciT5d4r15mI61ugd7CPxDUVx9NjCVPPJuJUWzyGf0u3kT6
         XJWYgINQ1sCbQIEWi8lLEQc8oq8xuYHocqdlO/o78d5k7GbZ1E6pRgyf0UbplxRW9IKy
         jECMm56zZ0UFONMcaCzpBVgMIN9PDmIdHftVyPpI8mhltE/Citmjt0lRoMXD/brNJY8W
         2C3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpIPO/O0Y3NVwmam8xkVDPnFiUaQ78NInqlqHf4Z+1qALmRKF924Zz6POHwOmi7WqHwUNDiOhu8TA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLQDdnoK+FXtlGYtritWwz/o9zOv/DVxUL1sJGKTWDFmrhNRy
	ByTcx+GAJt7xSaPnR9BfrRcetC38nNzkPetNE18wUHbbA1yn5oaCM9m/
X-Gm-Gg: AZuq6aLoYhixVQ2ut6fYkiULGpvGxTDDtM85GlwPfkTIBzaUnPuaXtUDPZ/aEFLQgiQ
	Dq7ut7leA4lcBcoj0Kj4hVXwnAPH6ERCvIxkS6Vq+YS5Prq7TEu6IhOC/PEgKkA/GZ5aekFINvO
	9UF+dgqH5DoxGRWJaCWJSF7ueo9saGubHNSBQa9G1Jzb8A5SJRTBTSFDHTmWuJyG1iHczyLK4jN
	XzDBfdBNLccAALG6MJfSUME0rndhbU2y4LQATqVrS8Pgc/xW6W++ka2yRl+wAgV10O2s3GW8TvQ
	PmgOEWF7mlW88spGvTqtpDlevFflazFR8yk5IgrBir/H8XihvJfu9JpD+q5SAQSWiJlIFAgrBBL
	dQUJQz4lejEmcfjB1u9u7iCX2BBN/PmdZqLM+ngIXxLkc0DZHCuk4mdE8W30m2xQ4fpkY5gVmud
	iuYiztQ8R4j1293RI/dWYo
X-Received: by 2002:a17:903:458d:b0:2a0:b7cd:d9c6 with SMTP id d9443c01a7336-2a870de2404mr229435ad.6.1769476339939;
        Mon, 26 Jan 2026 17:12:19 -0800 (PST)
Received: from [192.168.1.7] ([159.192.80.104])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a802f97ba6sm100426775ad.50.2026.01.26.17.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 17:12:19 -0800 (PST)
Message-ID: <8794178c-0522-4532-b21e-3904f90619f6@gmail.com>
Date: Tue, 27 Jan 2026 08:12:15 +0700
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
 <8a7ed9d1-c667-418a-a72a-d8d24ed0f9f8@gmail.com>
 <CAPVz0n1x9gWC0XzC0VQ=syT3LAm_5xof-_T5=8TzKapBQheVjw@mail.gmail.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <CAPVz0n1x9gWC0XzC0VQ=syT3LAm_5xof-_T5=8TzKapBQheVjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32761-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larsm17@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB9EC8EA1B
X-Rspamd-Action: no action

On 2026-01-26 21:55, Svyatoslav Ryhel wrote:
/snip
> 
> Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device
> Couldn't open device, some information will be missing
> Negotiated speed: High Speed (480Mbps)
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.00
>    bDeviceClass            2 [unknown]
>    bDeviceSubClass         0 [unknown]
>    bDeviceProtocol         0
>    bMaxPacketSize0        64
>    idVendor           0x1519 Comneon
>    idProduct          0x0020 HSIC Device
>    bcdDevice           12.74
>    iManufacturer           1 Comneon
>    iProduct                2 HSIC Device
>    iSerial                 3 0123456789
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength       0x0111
>      bNumInterfaces          8
>      bConfigurationValue     1
>      iConfiguration          0
>      bmAttributes         0xc0
>        Self Powered
>      MaxPower              100mA
>      Interface Association:
>        bLength                 8
>        bDescriptorType        11
>        bFirstInterface         0
>        bInterfaceCount         2
>        bFunctionClass          2 [unknown]
>        bFunctionSubClass       2 [unknown]
>        bFunctionProtocol       1
>        iFunction               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           1
>        bInterfaceClass         2 [unknown]
>        bInterfaceSubClass      2 [unknown]
>        bInterfaceProtocol      1
>        iInterface              4
>        CDC Header:
>          bcdCDC               1.10
>        CDC Union:
>          bMasterInterface        0
>          bSlaveInterface         1
>        CDC Call Management:
>          bmCapabilities       0x00
>          bDataInterface          1
>        CDC ACM:
>          bmCapabilities       0x07
>            sends break
>            line coding and serial state
>            get/set/clear comm features
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x85  EP 5 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               4
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        1
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass        10 [unknown]
>        bInterfaceSubClass      0 [unknown]
>        bInterfaceProtocol      0
>        iInterface              5
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x01  EP 1 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>      Interface Association:
>        bLength                 8
>        bDescriptorType        11
>        bFirstInterface         2
>        bInterfaceCount         2
>        bFunctionClass          2 [unknown]
>        bFunctionSubClass       2 [unknown]
>        bFunctionProtocol       1
>        iFunction               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        2
>        bAlternateSetting       0
>        bNumEndpoints           1
>        bInterfaceClass         2 [unknown]
>        bInterfaceSubClass      2 [unknown]
>        bInterfaceProtocol      1
>        iInterface              6
>        CDC Header:
>          bcdCDC               1.10
>        CDC Union:
>          bMasterInterface        2
>          bSlaveInterface         3
>        CDC Call Management:
>          bmCapabilities       0x00
>          bDataInterface          3
>        CDC ACM:
>          bmCapabilities       0x07
>            sends break
>            line coding and serial state
>            get/set/clear comm features
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x86  EP 6 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               4
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        3
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass        10 [unknown]
>        bInterfaceSubClass      0 [unknown]
>        bInterfaceProtocol      0
>        iInterface              7
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x82  EP 2 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x02  EP 2 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>      Interface Association:
>        bLength                 8
>        bDescriptorType        11
>        bFirstInterface         4
>        bInterfaceCount         2
>        bFunctionClass          2 [unknown]
>        bFunctionSubClass       2 [unknown]
>        bFunctionProtocol       1
>        iFunction               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        4
>        bAlternateSetting       0
>        bNumEndpoints           1
>        bInterfaceClass         2 [unknown]
>        bInterfaceSubClass      2 [unknown]
>        bInterfaceProtocol      1
>        iInterface              8
>        CDC Header:
>          bcdCDC               1.10
>        CDC Union:
>          bMasterInterface        4
>          bSlaveInterface         5
>        CDC Call Management:
>          bmCapabilities       0x00
>          bDataInterface          5
>        CDC ACM:
>          bmCapabilities       0x07
>            sends break
>            line coding and serial state
>            get/set/clear comm features
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x87  EP 7 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               4
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        5
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass        10 [unknown]
>        bInterfaceSubClass      0 [unknown]
>        bInterfaceProtocol      0
>        iInterface              9
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x83  EP 3 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x03  EP 3 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>      Interface Association:
>        bLength                 8
>        bDescriptorType        11
>        bFirstInterface         6
>        bInterfaceCount         2
>        bFunctionClass          2 [unknown]
>        bFunctionSubClass       2 [unknown]
>        bFunctionProtocol       1
>        iFunction               0
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        6
>        bAlternateSetting       0
>        bNumEndpoints           1
>        bInterfaceClass         2 [unknown]
>        bInterfaceSubClass      2 [unknown]
>        bInterfaceProtocol      1
>        iInterface             10
>        CDC Header:
>          bcdCDC               1.10
>        CDC Union:
>          bMasterInterface        6
>          bSlaveInterface         7
>        CDC Call Management:
>          bmCapabilities       0x00
>          bDataInterface          7
>        CDC ACM:
>          bmCapabilities       0x07
>            sends break
>            line coding and serial state
>            get/set/clear comm features
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x88  EP 8 IN
>          bmAttributes            3
>            Transfer Type            Interrupt
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0040  1x 64 bytes
>          bInterval               4
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        7
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass        10 [unknown]
>        bInterfaceSubClass      0 [unknown]
>        bInterfaceProtocol      0
>        iInterface             11
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x84  EP 4 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x04  EP 4 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
> 
Hi,

I can't see anything wrong with the union descriptor in your listing. 
What is your reason for adding this device to cdc-acm?

thanks
Lars

