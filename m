Return-Path: <linux-usb+bounces-31059-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2CC96B68
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 11:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1E6173437B2
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 10:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68068303CBB;
	Mon,  1 Dec 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7vS249u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FEF24A051
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 10:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586039; cv=none; b=GYYSfExYvJT6MwFVQVbCFInIkvn/3+WCO4JxZycnnJivJo8H9jiKNKNk/iYmxQ3lulGlqrQCLGA21fQquwmDNPzr3z98bGdld69qP7+gwGLm8BNP9NukzYyl7QuaEnKHG+1rDjx69vyK51K4dWsxJ88Ev5pYnHyUhxHZFWFTW7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586039; c=relaxed/simple;
	bh=ULD4yupbDE27rYGMxSf/jWwpZnWR3LhbXfbtdyZVFt0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BzeAVjRC1j+xHCE23GRoQzgaOP1C8177LTyE+loyHdS4e8iRKbr0TsdIvgUo9FXbtjQe4eEaLohFemfKE2Dzp9TyB47nIUBaJqNhx/emQaw4r9WzdoPxr4uF2qaCnMKGNZMev8C7hSmoZYXEQ31GjIuvRvvK+vkkmgQAHpnXSqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7vS249u; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b737502f77bso552241466b.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 02:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764586036; x=1765190836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V57w6qXgAFJm1uGpq7MxniYcmUVxpe3AE4JhOHgx7SY=;
        b=P7vS249uC5Era+J6/5voSrVj90DguQ6M3w90LlO1BVXyVFaaUVb4nIhhim3Q+B4c4l
         d/ognHb9fPwJO6ccim2VpFNS5Gog9nv7CMxp8MxD7UBYiKdgYNe2+fvu6CttHXRp0msR
         yPyg3kq1TvxXgwFeVy9/kR1z7Tn0U+i63QKPn/2YBVig4K5vDdfh8IHZ6tAdcwE7WeTc
         3JVMDMzZKqt7MQGL0VD3Ts6Mq2MotoFAZ4at5TXF8B8w5+pBuLle8oPrKZAxIkr1ZIvY
         N4SbYYotHjuEcNpUFawAmN3VeFnuTyXfQ155bCL+Jb6rocuniI9BO+a4Ipuq2kKMG9E5
         OIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764586036; x=1765190836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V57w6qXgAFJm1uGpq7MxniYcmUVxpe3AE4JhOHgx7SY=;
        b=osh179XlK9vP1d1NKqzOJ8zmgNCSEN627ELZtzyb7rzwrJxTuoK7J/F58gTG6cqyNP
         FtpSFN6627Rqii6RaAXTdRCLYO2JMbBVU/9Fck7UJLnL9QP1mZo4/luJzuGJ1kZOxrHu
         +ZWZFg0vkay+6LQyeyjx90gQQHoL7wlNPIQq9NHriMNWy7GeDy2sK9p3qXCsGgQHM0qx
         g6RNDSCDNxTax+hbd/YZx7rTDTzUwRRVkyeFUPdHoNds1WalMN3Q2F7EBqxV0xOXOEKp
         fJNLwwNOJp46x2TFPdWG2timYXGIRUHIb0fH3cj8sQ7Jm6QWITKS3++qCO7tbyiOq6rC
         LGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2fI5MR+P4dsvp5luoCXgFejXwtaU2oZ2uaooEkJs7tLm/m68F6FDd0mjsPB9U7Il489YyOwzo+A8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjCh8g4i5Nhl5Sw2KSWOendAyrARyviK4w4PmyDUfkEdT4VNig
	RpM9Y05Byqn0jCfEKW39DAsg+lCBilvDysOTanuzhTqmBNOSPm4XZ8ax
X-Gm-Gg: ASbGnctxVsYcc1T7J31c0s56nx4jFapsRsFp+F/yINw3btIUqHiR+7ok3EUux9kAlz0
	Z4B6Lj/4cEHm6eNoUQ9VJY/AFDkv5ZN1KRbYUnpoGTBYgRK2NVAbjaCvTHQ6mv+YfB/SBrecuzz
	KsEj1QVsxQ/05sr5pgDmSq8k+nmdxmBoS3ciKZ7Cdb/VV2+8IArQeUYKpt5tmSg0FyQeMvyxl5a
	8KMz1srzpV0WmHsltwu1GiVAZRrlDj9T/cl+F88npvseluC8/FBLBBY1lQS+dnHa6IoNIRyR878
	za3JQCnXootmZA0A7OYA1sKBV4ryzaYBzG9xzykbFnJXk3QIsrRY/r4MshMG/NffPP0S4WnAFN4
	PCIin8l6sARTIIV4vyzwBhcpv/vPOfLN+m3/3y37h6Sy5ukA2hPysD0ysGxYgaimhr412Tm+Kce
	4kv+iRCz8ML6qRBwCjZQVC7H21fUlb3m9oyw==
X-Google-Smtp-Source: AGHT+IHJ+rIlRaBl/+dxZ6W/cUfKTMrd7nfPT3/hTR/sz8+b2cY3NZEyeeFIVslJ/DYz5tNdaoswWw==
X-Received: by 2002:a17:907:6eac:b0:b73:42e5:a59e with SMTP id a640c23a62f3a-b76c5355c0cmr2647911666b.12.1764586035968;
        Mon, 01 Dec 2025 02:47:15 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a6a5csm1202548466b.41.2025.12.01.02.47.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 01 Dec 2025 02:47:10 -0800 (PST)
Date: Mon, 1 Dec 2025 11:47:05 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dylan Robinson <dylan_robinson@motu.com>, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
Message-ID: <20251201114705.470325f5.michal.pecio@gmail.com>
In-Reply-To: <87h5ubd8o7.wl-tiwai@suse.de>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
	<20251129205639.48fdbdf9.michal.pecio@gmail.com>
	<87jyz7dc6k.wl-tiwai@suse.de>
	<20251130130035.6f44713e.michal.pecio@gmail.com>
	<87h5ubd8o7.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Nov 2025 13:08:56 +0100, Takashi Iwai wrote:
> On Sun, 30 Nov 2025 13:00:35 +0100,
> Michal Pecio wrote:
> > 
> > On Sun, 30 Nov 2025 11:53:07 +0100, Takashi Iwai wrote:  
> > > On Sat, 29 Nov 2025 20:56:39 +0100,
> > > Michal Pecio wrote:  
> > > > 
> > > > On Mon, 24 Nov 2025 16:05:18 -0500, Dylan Robinson wrote:    
> > > > > The maxpacksize field in struct audioformat represents the maximum number
> > > > > of bytes per isochronous interval. The current implementation only
> > > > > special-cases high-speed endpoints and does not account for the different
> > > > > computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
> > > > > result, USB audio class devices operating at these speeds may fail to
> > > > > stream correctly. The issue was observed on a MOTU 16A (2025) interface,
> > > > > which requires more than 1024 bytes per interval at SuperSpeed.
> > > > > 
> > > > > This patch replaces the existing logic with a helper that computes the
> > > > > correct maximum bytes-per-interval for all USB speeds, borrowing the logic
> > > > > used in drivers/usb/core/urb.c.    
> > > > 
> > > > Hi,
> > > > 
> > > > Since v6.18 we have usb_endpoint_max_periodic_payload(), which looks
> > > > like the exact function you need. It is already used by uvcvideo and
> > > > xhci_hcd, the latter being particularly important because it ensures
> > > > that your endpoints will get the bandwidth allocation you expect.
> > > > 
> > > > The copy-pasta in urb.c should probably be cleaned up at this point,
> > > > but that would be a separate and unrelated patch, of course.    
> > > 
> > > Thanks for the information!  So we can clean up a lot with this new
> > > helper like below.  
> > 
> > Yes, something like that.
> > 
> > Note that there is a small gotcha here: Dylan's patch and the original
> > code, as well as usb_submit_urb(), didn't take wBytesPerInterval into
> > account, while usb_endpoint_max_periodic_payload() and xhci_hcd do.
> > 
> > Odd SuperSpeed endpoints like those below will now be considered to
> > have 512B/1536B capacity, not 1KB/2KB. Whether any such UAC devices
> > exist (mine is UVC) I don't know. My only SuperSpeed UAC device uses
> > one packet per interval and wMaxPacketSize == wBytesPerInterval.
> > 
> >         wMaxPacketSize     0x0400  1x 1024 bytes
> >         bInterval               1
> >         bMaxBurst               0
> >         wBytesPerInterval     512
> > 
> >         wMaxPacketSize     0x0400  1x 1024 bytes
> >         bInterval               1
> >         bMaxBurst               1       /* two packets per interval */
> >         wBytesPerInterval    1536
> > 
> > I also don't know whether this affects UAC operation in any way, but
> > it's something to watch out for.
> > 
> > Ignoring wBytesPerInterval wasn't right either, because xhci_hcd would
> > still reserve wBytesPerInterval bandwidth (as per spec) and URBs which
> > exceed that could complete with an error.
> > 
> > If a device is found where wBytesPerInterval makes no sense and must be
> > ignored, it needs to be ignored consistently across the kernel.  
> 
> Agreed, it makes more sense to have the common criteria applied to all
> places.

FWIW, I cherry-picked these two patches on v6.18 and confirmed that
my SuperSpeed HDMI capture adapter still works.

But that was not surprising, its audio endpoint is completely boring
and equivalent code existed in uvcvideo and xhci_hcd since forever.

      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes           13
          Transfer Type            Isochronous
          Synch Type               Synchronous
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        bMaxBurst               0
        wBytesPerInterval     192

Michal

