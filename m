Return-Path: <linux-usb+bounces-28955-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C90CBBBFEDE
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 03:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5A55189D7D6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 01:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E171DE3B7;
	Tue,  7 Oct 2025 01:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XncjnnSB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F0734BA44
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 01:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800139; cv=none; b=iiG9VlBQXZWxhIf+5TI1qkaPQWs2U2tAWU37GM1e/buD+mLDZk8sJEk3GIXmTTbmAixc8m/u9Qx7lPpFkbT9LMb6G1Ze7KXFhhiSFWqNiOlMt9aYRHZmK+AlWLaqLPjGkM0RvbWFbLrHX2HkjC3V3Xe9JBjtJseupQn6vBjnHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800139; c=relaxed/simple;
	bh=H/Vde5fSyegTVrxDL779b0Ekl1TqghJb8VzoeMUW5sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q647wDsWNMc8QHyzDKXFmhGVhJAyjHmcA2FmsPlNsOy40iJrCUcYXHy37wcvAg6E//0I6zZvB0twcXgc+7HacBTWrL5kdLGlaY4TSWrFoa0UJ8pb34LmowZgFbtVvaXmuQ6lfby+mWJXNvkSJbiIAIEsXcNHu7+c+P6EINTJZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XncjnnSB; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8e936be1359so3513406241.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 18:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759800137; x=1760404937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeZtd1lS2iAL5Eb5txNbBPZr6F+hk2iic2qSNfSBlxc=;
        b=XncjnnSB2+L1F4/tJ8mSC8SG4h/oSIvs7toO039nd5FdscCP2C/rDKR1v0tEB/O20y
         f2CjZ1M04v9k5A4pcEyHSWgtEfzTnJpaAmNI001gtaNQiPtq+I1WzaMPse6RtfkJLg+b
         RW0ac9W6hRUw/b54tpR6IsZ7THsw6ol/d+tfv8tH8aU1aicHprE8jc1QyRbXo6g3Xdu/
         3CcccBd+MVYtakcehaMCi0lBPSxHGBrd12eIfHwUc2+KtRXZlsXa4c5ceCGiphpe+mnT
         hmA2oLhZ3Au9c/lvTlzhkdEB5yCZ5Sr2I6Qca9I3c7MAsgfsrTyDuvfDDkrHa2++7YRi
         n3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800137; x=1760404937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeZtd1lS2iAL5Eb5txNbBPZr6F+hk2iic2qSNfSBlxc=;
        b=hgMxIV8SMEuEyX+FQd7tV+VPmW//jp4fhYt3X4cgky5XNV7DNoomNmsNKhMdILe11c
         PPqng6ZPEO0f/p6SMjFr7tGAfL3eHIFPL5JErn9S6qpLLJy05OneQKxJTt4ntDZR0pFK
         cP2dt0Uvkto8kWGC4KyiTPZKmg0i6tIuDdBFgycKYND0HFS6xikW8MU0pOnMs2QikgDJ
         qdUpkDhcpa/ggDMsdDFVZA8O6XqA+7x+q1M4XUzqqAUnffCtCwYOh1JatQS4GNMJj6Jl
         Zb2FmgJD/sPJiuxJsNHA4vQ1spbqNtXJw7e+UiEY2E7gNMfsHIArbpmzrYgrh2qz3uyC
         OEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZxvKw2jBaAT8IpafsPHs3vqBeu9qncIcTfrg7snvsqVnVr3k5C55YeT6Y/T0SbfjJ9EuU570DRm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy578RRWvVwa2LR9ZPD+rDM0NmugnxTuNIdKU1KjdHNC+uvXkx/
	QN8ktDWM6i1e7nwdxRacg0x/xpQV2jSyFx5CnfQpSypOyzCsvZptB/aT
X-Gm-Gg: ASbGncvZDnGhmidLPqbLzIB24CvsaohGolIai3MeMlEDLehWE7/JgoaIcyQDilk6yXM
	BuWfTnt800HnO3QRGa4ODnkKii+eTkLnR2dPiKwRQkix0gvqwRqoo1jLfkCudI97d5UvPxKzHmO
	TUSdyNQyQF9sWeE3V/SN492xxObcYz3SgRo657DVew+acf/vpI9V6Pw7UiK4LZIZVVjnb/GEBCv
	xqt5dvzKJEloExyoHPtNpk0etEwr3R2acj5oQkDhMrWLsq+nOVPMfpwAj2RLcfyBRjcGqIFnoA7
	kEe5LKm3yyTQhq/mMw0MAeTg0Hoy5D+YSG5HsDYlafiDB9kgCmpfdeqCL0MqVjflcVq8336zv8r
	aC0nNcVXIKCrPSCMYRAozHGWwCmOB8cIzLd3Rl8EgxJOVRDVwk8tmcZRfl92or4Q=
X-Google-Smtp-Source: AGHT+IFmBzhKhtg5t4PSLIdciapJfvhjo0L3FJBJCxbNlT3KY5aZygpXM3hCFzRlcEVz+ZGVmyRtfQ==
X-Received: by 2002:a05:6122:514:b0:54b:bc60:93f8 with SMTP id 71dfb90a1353d-5524ea2517fmr5491547e0c.9.1759800137067;
        Mon, 06 Oct 2025 18:22:17 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf6558esm3444393e0c.22.2025.10.06.18.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:22:16 -0700 (PDT)
Message-ID: <4124e1a5-fcd9-4ce3-9d97-5ebe8018207e@gmail.com>
Date: Mon, 6 Oct 2025 21:22:12 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: usb: lan78xx: fix use of improperly initialized
 dev->chipid in lan78xx_reset
To: I Viswanath <viswanathiyyappan@gmail.com>, Thangaraj.S@microchip.com,
 Rengarajan.S@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20251001131409.155650-1-viswanathiyyappan@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251001131409.155650-1-viswanathiyyappan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/25 09:14, I Viswanath wrote:
> dev->chipid is used in lan78xx_init_mac_address before it's initialized:
> 
> lan78xx_reset() {
>     lan78xx_init_mac_address()
>         lan78xx_read_eeprom()
>             lan78xx_read_raw_eeprom() <- dev->chipid is used here
> 
>     dev->chipid = ... <- dev->chipid is initialized correctly here
> }

Please describe the testing you performed.

