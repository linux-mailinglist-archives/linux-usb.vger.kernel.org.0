Return-Path: <linux-usb+bounces-30891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2D9C8413D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 09:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8E29B34D8EE
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 08:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917842FE05B;
	Tue, 25 Nov 2025 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eavrrL1b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE8F2DAFB5
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764060832; cv=none; b=Teh6JvWrTxfD5GFHPcK2B5CfbN72fNI3l0+13hA8T7wcW/R7RBRVFVUx2NsBBG35QK3y74ZdJCxq4VJBWUoeZEFPBjgKT3tc1W2RDpgqGfbs3ltjN3lPq64HC/sjoWBs0KGUlNqwYhzNmIZjrpQHdOuLl51hDug+H0FEzKTpl6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764060832; c=relaxed/simple;
	bh=OaixabYL/pzvVt937sFM5T0oWorMyaMvHFmrerV7VSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tk3IpokugrwdqaMVznUShttiMaCZWwbM9xXgdouEthgGOuFmj9kxy0GpH0bXb82ujBVH6KRdHCbmOXjmropLo6ARf8I2HBpoAuWdVz4gFbEErKwJGOx4KWkGKc8XZmlJ06iIWvKY7VMnBNW0Q31kE/1Q3IJSnxV+aOGiS7NGVIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eavrrL1b; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3434700be69so7567670a91.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 00:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764060830; x=1764665630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idnE8i8EBv7r7PxlqTUYD++zMkmK8mL491TnL2flSPM=;
        b=eavrrL1bddEUjL+HMV8KZiQobwvWP2CcrgKrVoTfjmK0fT8rbkF6f9w9Rsu0d72MUn
         xoAGiAv9D2bDOcS3Ayj5st1c3R1VYNmdomPG4A07LNMwXAH9R+2mVWSd6YC3VL2YR7ci
         ow5nK9csh/WhBrhxz4YppszompP+DUle3F55AIrwUYJJ7pqKQaFb8bBU/IeogSzWouFb
         5CuMQhUwg/ihDNF12dv0TsaXMp3ngD1Y5IaudJz25LJv8iD8cyCcQiBt5fhvzDD7klnn
         UzuXSccoGbaAl7MjDdUHpeZoWM2yFqQUlJUeH4CYhlkUt/8PIzWKI+yLcRuhCCKUrGXl
         gX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764060830; x=1764665630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idnE8i8EBv7r7PxlqTUYD++zMkmK8mL491TnL2flSPM=;
        b=Qt8rR/F7n7jmePYiPIBvkvFJHSgvBEdE7OYlt90Aq0pbzbYojhEbgMV6O9WQsmbbRk
         e9F4N7tAg8mn3pdHB8NP0pI49lo/0ZMTFXr8DMQB5KiFIPL0bgYLtcGiPiZ6ebJIlhMy
         v7A0PpxUl/SeaAW/1/8pqPJy2wn/dI0fW49T/uK53eGFxPGCcFloH5LqUiEa0+brRZf0
         j1gEaP8G6QEFXf0P7P3KbztGF/UWjYsViQyTMQsxTA8JupxfDJ8McuI8k2bqx2QE5xuZ
         V4HWSeaEjVlydJ4mgRzIvA7s6tbrhkv9PfSs1TsSNesGe9DoeQ2BrcMkzp+szyn6xjO+
         AS9g==
X-Forwarded-Encrypted: i=1; AJvYcCVpd39IP9sS0j+RjJDHLx8+U5iKFCl1gdHXBfF7qQoRW5TL+K+vpnlP+R9Avaj33A0gIBwGg0CgJfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL0VMa/vBy/Xb5GBwug2Oe8E7d5YtNgyw4rfEkLmyBs21o4Xqb
	u++ZLXSszmbPMKf1/mDCPXjxSEm6AVh48H5w2Onc24wmA14FSBDHk0D0
X-Gm-Gg: ASbGncvlYYcIi9XkGqmjWcbH9HABS2LnFPGhPF8XnPW6s9wX9SqZoZuU82wQXb5Jmtf
	gQPSXz8abyniSA7SlgwVzOYWz7GnYcVBJ0dZNpZQBliF9Q02rAi+I/r6mL/DbvkNGaU5K+SG2H0
	YeeisFzknyGUHR4Br7tbBIa5XMcNoqc0TWcmu8nn8FeFArsLcE4i2XMXHn0CVb1YPbwdimmRXye
	aJMgiBpOrwWx4SGh/7+IcgSZaY6Cb7MTG3g0Hv+AGEuDFb/c9o3epX5scKckk9cWIIXg13QbqVk
	vLZGg537fApBWRM4tPAlrUKxCDAkh9BXdANg7eKmADIR7lZvCV8Id0L17cf9Vs461mQCMLrmkyo
	GXDuNcKyMTBYfGXJbkfG9gd01YQGYYqyWOIUqTQ3NmDZuvpASklThV59roBfsDl7G4ZKNoFOtjS
	BWFMFNlpzHFialhNIVdrHOEcuI4jdlKUaFQgl1beh9cZ0MWOJTD1pfHj1+t5VcCzueGsVl/OoSj
	+xrTA==
X-Google-Smtp-Source: AGHT+IF09aAoG0fdC03LEPDhaWd7ZNYZB8Nb8YTSw7dv0D57SxbMatq+NZAv7oav6b+mp4soiJF+CQ==
X-Received: by 2002:a17:90b:3bcf:b0:341:88c1:6a7d with SMTP id 98e67ed59e1d1-3475ed4479amr2167477a91.18.1764060829961;
        Tue, 25 Nov 2025 00:53:49 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:2a7:6ce3:9784:8134:7053:7cba? ([2a00:1fa0:2a7:6ce3:9784:8134:7053:7cba])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def75ffsm16020098a12.3.2025.11.25.00.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 00:53:49 -0800 (PST)
Message-ID: <da4ed386-505f-459a-91f0-292b77cfb74f@gmail.com>
Date: Tue, 25 Nov 2025 11:53:42 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: fix probe failure in
 gaokun_ucsi_probe()
To: Duoming Zhou <duoming@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
 mitltlatltl@gmail.com, linux-kernel@vger.kernel.org
References: <20251125082505.52249-1-duoming@zju.edu.cn>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20251125082505.52249-1-duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/25 11:25 AM, Duoming Zhou wrote:

> The gaokun_ucsi_probe() uses ucsi_create() to allocate a UCSI instance.
> The ucsi_create() validates whether ops->poll_cci is defined, and if not,
> it directly returns -EINVAL. However, the gaokun_ucsi_ops structure dose

   s/dose/does/.

> not define the poll_cci, causing ucsi_create() always fail with -EINVAL.
> This issue can be observed in the kernel log with the following error:
> 
> ucsi_huawei_gaokun.ucsi huawei_gaokun_ec.ucsi.0: probe with driver
> ucsi_huawei_gaokun.ucsi failed with error -22
> 
> Fix the issue by adding the missing poll_cci callback to gaokun_ucsi_ops.
> 
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
[...]

MBR, Sergey


