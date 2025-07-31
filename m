Return-Path: <linux-usb+bounces-26284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80431B16D4E
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 10:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C9393B0BE9
	for <lists+linux-usb@lfdr.de>; Thu, 31 Jul 2025 08:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCFF1F1505;
	Thu, 31 Jul 2025 08:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0TP1DaA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA82AE74
	for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753949848; cv=none; b=cpHvwZhXAJGqaVOEAoiOVJ81oLQb0fBz6Hmc6Qiuisjt9LL19rdKWRR3wy6YITbB8qbjYSUYeTujnEaG81e6Yijp1mGWopZQht3V6P+Pfoy0qr88AFNRr4d3Fx/5TK969AbhtwxXM2aZ6JSzX0CNQmjZhVw5Jfe/b/ScYNhozKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753949848; c=relaxed/simple;
	bh=MlphjwG77RXL9WZytaR/6zWxmgDVa4lylltMB/4KFjE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAs5lPomrHPkrb9bdQSYxct5Da1ILYzprKrmPBIx4EjkOzPa/JDojsEZoqYCBhbkl24+skyroPIWLC/eTF6Emo6ODFON2+Y0N+EjcRIfoRqTXqqoszKSNaSuBT90aSW/laT0zV2/t1nD/JK1UosBD1xDLAFGatkD2mODzN8zpiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0TP1DaA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6154d14d6b7so636171a12.2
        for <linux-usb@vger.kernel.org>; Thu, 31 Jul 2025 01:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753949845; x=1754554645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soyS07b6jqk3SyO6J6z0IHIOEdqOIHxHX/A0CTU5FxM=;
        b=B0TP1DaA+u3JjlkbHIwk1t4KjMI5VcBDMbqpYz3mOi9e8E6nOClje0XLmItPg0VK2u
         hhkkW89PXvtEd/jooxWBrYL1brdKd+zRBpbLTk8/U0Rb8yBHAtGKI3DWvuBOvOnlPqhy
         RQB6zp3Mz0Z0OYUb5jubus4Bm4yKkP6HkjU3kbJ1K+FFn9/g0GB/f3bwUXCGYunMphOd
         OYAAHMog2BVoRszWp1IKEimjzi+isrWY8Qr7F51PMphcoji+2VfChO/ddfQqRIjM+jP/
         djXSCq97ZA0tsj3eaLrTnwGLPIdcjPM5kVANLnAphXFe5yAnVJsk2aoG+tbKGqCflfFw
         zBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753949845; x=1754554645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soyS07b6jqk3SyO6J6z0IHIOEdqOIHxHX/A0CTU5FxM=;
        b=wQFdC8O2Qv0ATw25PexLYqgcRRkecLg8vp7cFxU6vC0RBIOUiD6bKftg+8DzJaHTNF
         eOtpyAI3hWuoQV6H9IXlD1CMS3xY2VnujEI2bLhsZ6KInTtwH4cNGQvB9KBqyFy+9+/f
         kJsPRojeCCZV7zXqgnAqhJKwOQLGli30qsWPmpwTblXK0Uo8/VS3BVFhhjLrDnVWOijw
         jN+TbbL6xD9w6nLKoxwgCEZctidCsXSyzvxCDkP2gtjxVbsk53bdPw9MSgHgcH60OwP4
         gR/LmrMHJu4Q5XIpeeoxx9FqqT4oX+7lrSb+QJ1ozWaRTHJ48I0wSmgOzqMulFkTcXQn
         cHVg==
X-Gm-Message-State: AOJu0YxUWTOLCNifiUgiTLR1UkPnSQNyjS/1jVCIhphNQiAqniBOPcJA
	T7R47oTDyQ39O+W09Xg3umzd1qgVFJD3SgRR+JU2n5E1xnJNqAVp3Q/xgriTMw==
X-Gm-Gg: ASbGnctbdPjSXq5/R87yR7udRuzD22CVMoZcyoFF11plHzKK5JA2qbO8/e331DsIa74
	NKW3YpKO6N1SpU/7ecNuzX5mYNOPZkRp7COmEo+tTvxRQEpGz9CyErze4+iJ3bSgW/SIV3jZMc9
	Iajqr2ciRn/0ZLXi6B97Ztu6h9BsDPwEQ/RvO82nkk9WI6vNHfOqSdYFASu+MXxYMC6xiO1yddO
	LF9XCaLp3OWdjgQFqGiImVTXdhqfh/tEafnNDNHWJsv5Jj9zzzLRDd6InVYll6YEurnm2vgDk6T
	ZGVy4YmpehjC15+ALcHeNfjoqKzB6lQv3/CRyzvEZf1NY3lOGCRZLAm6WebdZSeGeWD4+Mzo3OD
	iq1NshYzLubdcCnbN1kiE8DBjyh118i0znWQ67QQTEAX0GJQfASD1dOqG
X-Google-Smtp-Source: AGHT+IEGo1nEGSGyXWeOpnxXbgy7A36hTtpmmlhU6M47/ij+2hY+CMWEXpoUYso7GW5nJHdxXl3nwg==
X-Received: by 2002:a17:906:9f86:b0:aec:5a33:1549 with SMTP id a640c23a62f3a-af8fd9c2024mr720949066b.40.1753949844922;
        Thu, 31 Jul 2025 01:17:24 -0700 (PDT)
Received: from foxbook (bfk202.neoplus.adsl.tpnet.pl. [83.28.48.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a219ef2sm70887866b.96.2025.07.31.01.17.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jul 2025 01:17:24 -0700 (PDT)
Date: Thu, 31 Jul 2025 10:17:20 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Bob Ham <rah@settrans.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: Audio interface causing "xhci_hcd ... WARN: buffer overrun
 event" messages
Message-ID: <20250731101720.5d10a8f1@foxbook>
In-Reply-To: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
References: <ba0ebd17-dade-4a97-b696-5ad19ebfca1d@settrans.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

The 6.12 kernel series is half year old, so this may be unique to your
hardware. Can you try other (ideally similar) UAC devices in the same
USB port, or this device with different xHCI (or EHCI) controllers?

On Wed, 30 Jul 2025 21:02:24 +0100, Bob Ham wrote:
> I'm trying to get an Arturia AudioFuse 16Rig audio interface working
> under Linux.  During loading of snd-usb-audio and when trying to play
> through the interface, the kernel spews a whole bunch of messages
> like so:
> 
> [ 1667.208402] xhci_hcd 0000:00:14.0: WARN: buffer overrun event for
> slot 3 ep 2 on endpoint
> [ 1667.216585] xhci_hcd 0000:00:14.0: WARN: buffer overrun event for
> slot 3 ep 2 on endpoint
> [ 1667.224778] xhci_hcd 0000:00:14.0: WARN: buffer overrun event for
> slot 3 ep 2 on endpoint

"ep 2" means "ep index 2", which is USB endpoint 0x81 aka EP 1 IN.
So this is caused by recording, or maybe by playback while recording,
but not by playback alone.

At face value, "buffer overrun" means that the device sends a packet
which doesn't exceed the endpoint's limit (that would be babble), but
exceeds the data buffer submitted by the UAC driver. In the snippet
above, it seems to be happening regularly every 65 USB microframes.

It could be a UAC issue, or it could still be an xHCI issue if buffer
size is miscommunicated to the hardware or misunderstood by it.

Can you mount debugfs and see if you can find the directory below? It
would tell if there is anything unusual about those 1 in 65 buffers.

/sys/kernel/debug/usb/xhci/0000:00:14.0/


Regards,
Michal


