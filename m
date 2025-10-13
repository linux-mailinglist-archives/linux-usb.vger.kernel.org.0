Return-Path: <linux-usb+bounces-29197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A228BD1900
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 07:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 279874E9C19
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 05:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5F32DF137;
	Mon, 13 Oct 2025 05:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjjhREQy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0782F2DC339
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 05:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335184; cv=none; b=q8B+UXHV6tjGckv2Hd9Nd8CXo0V0/B0o7z3Tr9izbnYjSMjMpoWGZ2j7UELr3CO403pF+hRTGIhu5eFK4z9un6YmpP63ukbvLEq41t11h5xZKEX039Z8EXc7RcsP/QgjZ4Kr0b6v6u8WZk+KY9Q4SQINZzM3yb1g37S8DJUkOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335184; c=relaxed/simple;
	bh=Bd28e7IuOcHibn3LLyPlNz4Tj23RtsGOy6jtLQP1y84=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f9ThUfcMxaum00r4HGcyszIb6ggwPh9GktekInOda2FCxm/qcuanVDEm4wfA3+o+oZLMzi2BDGXSdqnmqSuQQOA6xu3zxgEck9nSN/SExxB4JSYJjenh2DpOa7TORxFb9NfiGSumrNgd9zROdsXOtdDRiIHgQUzskY37oSWzzJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjjhREQy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so7928300a12.3
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 22:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760335181; x=1760939981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQNzxcG14jNClBvMbrCumaocAylKfaLe9L9Jz7gjInc=;
        b=fjjhREQyYvIXooCRS2QdQWl0TXKyOm2CeFRLd7GTQXju/WgHUwxKn4LvU56cUlLn6j
         QJYVeIL/grccyAg7uoIsfmBF31uiGo7t4+ikxUvP6ONxd9ShP3rCk0ni8m6zZCgCNN8o
         xsXJXhCLaFzyvbSDSnphwExdRjtxEUTTardYk7ebvF3+bHnCtFpCZ6LgYRfCYVJib9x4
         8Abeqx6fXkD5nL/8UZkWXZCUKeiEObmoLd8YaSwB9VDLjH/JYpd4yKH29xdQS+bM1b5G
         ObJ2Zeu4gLUEvfOIEtvHbd/maQHP8qsQTA9k9p5QG454ybF93eQ29piwxwO48OBhVNpi
         OwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335181; x=1760939981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQNzxcG14jNClBvMbrCumaocAylKfaLe9L9Jz7gjInc=;
        b=v+u/r6RaNNQNy9/B+CNikkLwAjuVVWUkgRT7tEzKCui15quUHyqPcXzYNzfMmnIag1
         BzSF1Qi/PitWnGP/1/0UjtFvHzQUZlaKZul0dOab0f0/3IcBAdFzsE4QE9B3FV7c0jjP
         ZQYjgIdvBqvfRWH7uRXqNZplLqXtx5BkPHLAIxThQKbBuYv2j93gjWISFCWu7gAwX9dt
         InY2Fd6Fg7EW3Cc/N19lEnZVSG6/OGOmLABrzmRcBVgAVguPvLAjaJkEBRMOTM6dGwxi
         tiZbxum3SiSQyxWNev/NeIigHG8lFuH8LAqRDRu0o2NQbLEUYnWYoFpmsDVtKTqmGPZd
         PVKw==
X-Forwarded-Encrypted: i=1; AJvYcCVBHjF3NAwW1HFtKA7ClxB5OxT5WyForuNg6zChT6YqZ7e7lcJgv6k6AaFRUgkALeZRwc2pj4L0sww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3r9gXWFe57V7dQCYI2eGKEjKwbHLmQMIA8xTVvvH9e09g9jhE
	Rwhfda/D1Bp+THakspWfi73BgiI7hJV7/AgJxm/wP67W75URfJxZhxt2qv5ULw==
X-Gm-Gg: ASbGncvj/BTjhrW/CuAR5gudU1eTyvg6XrF80vAz0mWM8hu6mNNY7NgEL0Es1Aw1GTX
	R7TzE9c/5F2A/SmS4+QzP0EMxox4Nbd2pAnc2GlO/CCpL208ccz47t2VkLyY76wtDcicRN0OGQu
	UQabag8EiV1MEZ2wBfxktPXJVbTM/7iJQMvlb9nrGaBmZuaRK/7YOeDV5TUGkftHpA+S+9FGqBa
	KA8YvtT8FlA1Lnm9tYsYXziRP9Cb7p0l7wPeIwqJ2EqIYRjo8qzBnNYjewwGLoEq7uxGqAFA3cp
	xtSWMmTC/qvY19EQUzFBNA66bdALR6YX+u+qXfJnDBZrXMf2VCdDz4dmaxr3qdZrxvs+xn7lMt8
	vb1O0vz7JAaizLUUYeiOXZiUY0ksM9klpNiAY97vxaqXglIWAUnoIjQ==
X-Google-Smtp-Source: AGHT+IGiGEcrsAYUHxU2I2SrW2lGOTNaCoPwD4SCwXuyD4vprrWrEyrI422ngQmr2KS9P8klCSJyjQ==
X-Received: by 2002:a17:907:86a6:b0:b45:eea7:e986 with SMTP id a640c23a62f3a-b50ac4db255mr2188162966b.43.1760335181143;
        Sun, 12 Oct 2025 22:59:41 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c129c4sm862815366b.41.2025.10.12.22.59.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 12 Oct 2025 22:59:40 -0700 (PDT)
Date: Mon, 13 Oct 2025 07:59:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 marcan@marcan.st, netdev@vger.kernel.org, pabeni@redhat.com,
 yicong@kylinos.cn
Subject: Re: [PATCH v4 3/3] net: usb: ax88179_178a: add USB device driver
 for config selection
Message-ID: <20251013075937.4de02dfe.michal.pecio@gmail.com>
In-Reply-To: <666ef6bf-46f0-4b3e-9c28-9c9b7e602900@suse.com>
References: <5a3b2616-fcfd-483a-81a4-34dd3493a97c@suse.com>
	<20250930080709.3408463-1-yicongsrfy@163.com>
	<20250930080709.3408463-3-yicongsrfy@163.com>
	<666ef6bf-46f0-4b3e-9c28-9c9b7e602900@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Sep 2025 10:57:05 +0200, Oliver Neukum wrote:
> > +static int __init ax88179_driver_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = usb_register_device_driver(&ax88179_cfgselector_driver, THIS_MODULE);
> > +	if (ret)
> > +		return ret;
> > +	return usb_register(&ax88179_178a_driver);  
> 
> Missing error handling. If you cannot register ax88179_178a_driver
> you definitely do not want to keep ax88179_cfgselector_driver
> 
> > +}
> > +
> > +static void __exit ax88179_driver_exit(void)
> > +{
> > +	usb_deregister(&ax88179_178a_driver);  
> 
> The window for the race
> 
> > +	usb_deregister_device_driver(&ax88179_cfgselector_driver);  
> 
> Wrong order. I you remove ax88179_178a_driver before you remove
> ax88179_cfgselector_driver, you'll leave a window during which
> devices would be switched to a mode no driver exists for.

Hmm, what about registration?

I added msleep(1000) and simulated usb_register() error, then
cfgselector binds to the device and switches configuration before
the interface driver is available. But the module fails to load
(I fixed this) and device is left with no driver whatsoever.

Moreover, according to c67cc4315a8e, config switch is irreversible
since the device reconnects with only the vendor config available.
I can't test it because my device doesn't have a CDC config at all.

There is a gotcha. I tried to test in a realistic scenario: device
hotplug, module not loaded yet. I found that udev apparently retries
loading the module, so this state would be fixed unless the module
init error is persistent. Still, better not to rely on this?

Would it make sense to swap registration order?

Regards,
Michal

