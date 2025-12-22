Return-Path: <linux-usb+bounces-31668-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E7CD4EA7
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 08:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B09D30184EF
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 07:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3947D30B51A;
	Mon, 22 Dec 2025 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6oCG2Xa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5702F744F
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390151; cv=none; b=e0dq0A/fERXND5TzV+8TqNUXu0MhpEJULv8QMJvcgAoA1uPp2ITRGXO74iyTJkXhdXj1rXRuJzWBxvqhw3MPxd4BnGD4O3h0wfw0ZIXqIRbFhFxdxrvkRR88CAZ0J6W/SfDeAR7Cw0afODZsPtxUYPyDfrMYLpuEpAR/ep5ty68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390151; c=relaxed/simple;
	bh=+yPOjc+fqkDPEHqb4AUcpPWxXHxorRpawbbFTVTvM6c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NxgZ03nMPo9cB9I8K9zplyfiOuMTotMfn7j9zoOuEXs/5yO37ErxEmlHdGofAbDBlJeunpN7oqyQrCvi6WyUmHSh5E639ENf5sZQbBLA2BjiEVRf+Xs9TrTO40h+gQ15BJsERxL0hWtNgCRUfAEC5bXPjfY5G3XTFh+sgtZHRlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6oCG2Xa; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7a6e56193cso610473566b.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Dec 2025 23:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766390148; x=1766994948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaHVBuWBeHTZHoY+QCI6EjtKxWsuUfcPRstWfRihDUk=;
        b=f6oCG2Xaq1IXK1Y6f/cS6dz41cxVvNtpnikdw6aKCNzILxf0p+1yKmeCAwjZZ0/wbK
         OJgE/ZERHZ7RiFg1nn6T5fL+jfdMcCvciiU/fccGNq/h5lgNgM8XJSalGJtCDUBjbVVf
         MgpA3LrU+/VtcgPBHrxZ1KauRy2fEJTWEzQjPUg1PP6xvDQ/6G0R0tnpvMDKZTVE9g67
         nx67ApPewrwxwFRbcsFAAX9lXH+QNXF+NrbyV7FXXCUA4QNS4cbw3kZ37Wdi5OqYojIf
         IzSSmgeidtPy8A5EydOHnQjK775+AbPNJazudm4NxC+Rflbi5WfaR6kF5oJtzp76gXZx
         xORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766390148; x=1766994948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yaHVBuWBeHTZHoY+QCI6EjtKxWsuUfcPRstWfRihDUk=;
        b=COLYcc0PhDLL0lncOjnZ4gRYjY7ROT7gym/usL08r0DdF/bC/wkeucHEdhWhtYnItD
         pHD93YdfHB67mB8Fo24Tnjk0TeM2HGDkOrRTFSXgKAm4aNbNu2Cyjgg4fcmVgHxg0tsu
         nL+C1uJVy8rDF1tPODEC93hnYLQM1dfjU2wwoTCLaopR0kga47eFHjJjzNKum98E/8P+
         39nrIQmxvCJsUnzbNqDd7dKpEFJ0m1GirUGkK3k0bdxvO/d2sbsRiXcrBuQ+kw9CykqW
         HH9FRJGSqEb4ilhsou30956zHTdM87TLqDsz+yV4LzyyCRC0X0zFFN/4Id160kNlwW3l
         aqXg==
X-Forwarded-Encrypted: i=1; AJvYcCU6Hw42D/ex9Xla0hsQTx+cc6MTNiP5VFLg4PS8kAEYvJkPCpeWHkYqOPQnNvqolgd43GEUYJ3mghA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7FNfkER7PZuDvmUB29AR8XL/8U28hASyE+f/3XSLqfdLU76ZU
	48Z3Zwg/8GqqxNXsXzJwyVPq8jCwFdqymRGzXbDLGSRoLDKb6ZZLVXdJ
X-Gm-Gg: AY/fxX59O+swo7KjV6FHKtZjuxDpWoWETILW1cJ+A/1as7iX+ByQ5KL3pLgBZ9EaZFP
	JhcXyXH7JKaqOMkvdCpyFZi2fi7ibG4MTu34wpKYedre0uRswcGCxzCscggqRnM2+zH/OH3Bpw5
	BWyohj7a7cDnQ36lhy//2/dEesLn0uC3Xr+1JGHt1TUVOlQsvsnIdiNcAfuyyH2/ziHEFQr1oE4
	4+Ozugz0deS+Bs57DecBeUxqu4rXHcHvf7/lD25BCG4RQEC03kN+v5PZAilh/RDzQiWY/NosLAb
	sLOce1Jz9I1LFDrJbnl4KdqJKUvH1lzxrIl9KJ89BYAhvGOZ0T+kKoC+tp0db5+FsdIwve8tQVo
	BPRzlWHAZKth7yVZ+ODR8cFlw8vR0yEoubdRtrwq7ctrrxiqf/O18KFCsRbB0LGTKXbVf6uW8jX
	PRMPYZAuO2+CuLAj42aJg+c2s=
X-Google-Smtp-Source: AGHT+IEMxTuUMUeAngDSLDPqkKs6ChHZnQLqP3jie8llW6T/pcPh84Oq0OS1p+ubMfZ3MFLNjD+3vQ==
X-Received: by 2002:a17:907:7638:b0:b80:6ddc:7dcd with SMTP id a640c23a62f3a-b806ddc842amr211586466b.31.1766390148233;
        Sun, 21 Dec 2025 23:55:48 -0800 (PST)
Received: from foxbook (bfd193.neoplus.adsl.tpnet.pl. [83.28.41.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ebbasm985598766b.55.2025.12.21.23.55.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 21 Dec 2025 23:55:47 -0800 (PST)
Date: Mon, 22 Dec 2025 08:55:43 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, =?UTF-8?B?6IOh6L+e5Yuk?=
 <hulianqin@vivo.com>, Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Sarah Sharp
 <sarah.a.sharp@linux.intel.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <20251222085543.4d7430d5.michal.pecio@gmail.com>
In-Reply-To: <2025122253-stopper-tweed-6e68@gregkh>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
	<TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20251220141510.1bc1ef19.michal.pecio@gmail.com>
	<20251222064252.GA1196800@google.com>
	<2025122253-stopper-tweed-6e68@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 22 Dec 2025 08:13:21 +0100, Greg Kroah-Hartman wrote:
> > An API that insists on its users exercising care, knowledge and
> > cognisance sounds fragile and vulnerable.  
> 
> Fragile yes, vulnerable no.  Let's fix the fragility then, but as has
> been pointed out in this thread, we don't know the root cause, and I
> don't even think this "fix" would do the right thing anyway.

The patch looks wrong. I suspect this happens when add_endpoint() is
called concurrently with resume(), which makes little sense. And it
means the same code can probably call add_endpoint() before resume(),
which makes no sense either. We can't do that with suspended HW.

Chances are that this crash isn't even the only thing that could go
wrong when such calls are attempted. For one, xhci_resume() drops
the spinlock after reporting usb_root_hub_lost_power(), so your guess
elsewhere was correct - this code isn't even locked properly.

It seems no operations on USB devices during resume() are expected.

Regards,
Michal

