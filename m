Return-Path: <linux-usb+bounces-29415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A248BEB0C1
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 19:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A3953B412F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 17:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236262FD7B2;
	Fri, 17 Oct 2025 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ik8IJV+r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3642FFF9F
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760721323; cv=none; b=IREBlpt5a8MPPijnKDeFHYsg1xxouJriM1pMqEZDE8JOD9FDrQmIe5QTlDfmYkBqCLkcFgfrnuF2El/4JVl1hZWTguFlQVRrfHA9oG3xC9Z8/cbwHGJ8Cr9geos8vufAPrAsk6027R0NSMA6EEA7hLH+tW0av4UfwaNTx8kU2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760721323; c=relaxed/simple;
	bh=PTe+dRMjjEdRz7HMYRB8/b977V5NY2J45HmjgRVliVE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RF9gPYBtv8Oqle92xbsnFCjGagjP24IacE7PDsyzRUNzANukrfdOCXtSVcFxMRDiD8VDmXAT9rNybsYpFzL8apihAfrSS1PrBeRqAa/dKqNjaHQmm4qBUTMhK2lrDeIoIwycu7KlIfeM48svCmF5wlM7hF0zNBv1/CD9aOEvaeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ik8IJV+r; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c2d72582cso1478816a12.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 10:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760721320; x=1761326120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erzvErFOuLAlu2WyRngTfkGBQrXV/AI4uNuvvvLtDAM=;
        b=Ik8IJV+rCGPxvPfFc0ax/4m7CQRXfq1I/YZNlTlReNsZbdbsgMYSbBTHU877jI7bV3
         mi8/OPAJp59VlTQ9FnXTmt14tUsZCemSOV2UPLJXnFoJ31WggpfcByJ2lXpdKRVtS8Ml
         S7nj/spySATy7dEgZTVNgm3QlHF9V0xAhoX6kso5gzjvbOWHw+ATSPIL2LDEtKW0/Vh4
         2ZM9hBcwgbaGacWANnhmp3/GWf4aUDN6pG6ai3OqmWj8j1MzX7W5E8DBk0Sfy8viTuct
         mzZYnan8Hz0UlxMuGBh3OEkH2ntJ5Yf/XWorag8UAWs8M2yYp8tRc8DIvou/Mwowv/0k
         0Akg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760721320; x=1761326120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erzvErFOuLAlu2WyRngTfkGBQrXV/AI4uNuvvvLtDAM=;
        b=sFvhrkUMrgidlzb6HTG+NuyqrZmzyyp394XVsc1u5mQxCAJC+DdyOE88D0MXgMWHEv
         sZ7ZcvoPxu/tj9UreLIPaZ1xMzZQwSNdTdm5OVPlmAuHHoP+ddwCF/2gDnWxvHtA43Ev
         K9W9DDavDIzeiJbEt6BHjyKCxNpe5D3y7wX+ghgZk+ArTV9q1aaqNrdDTDWD6XslBodf
         cHg3acymqXfm5UB1EB+uoEGOBtl/ixFZzviGQSRtcXJQOz8+Cq0jvpgzvpCg755JkcQK
         GFUYdLGXgoWaPPgVz3YqPDlQRYH63wj8jLTnzY/LesUenfYwmqL/1QFwBZKRQe1UHbvu
         qsXg==
X-Forwarded-Encrypted: i=1; AJvYcCVsBoKvF8xB5OPepUMNL2ejxeC1rI0KCfNDTLH7NuoicrH2m3t6Frr2viz8oXICStEBssKlfiWaMMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9JqNmtQOEK9r/Cap+QNVhq3DJkjPQvsUKOzWi5VCgQsR6bam
	gwardnG0hMA5gZWhUvTW9b4cKxJaYIMUKQb11j2zFvdQUS/+CIH+dHAy
X-Gm-Gg: ASbGncuwefgEVZlez6ArEfxh6k3WyJEOOgYpD7Sx/0ZFeK29I7xYYDhigsBLhFmhH5F
	8WveAwgoD3nxfZReBOrMhP+C6lFo0DozjMJfQcpth8u42bhktdeQngHXGAoOta8KnQ/3sobXX2z
	qvxAD8TR2IdL+b+JUwt/qmWve85i2njKcPd0/rnpPrNx0+2IoI3Him0DNpzkHmuBHshbitEQzSR
	vuV2CaN0rqZRYW8KG2UzavIF+AtLFVWy4Pg6XXIinJC6y0h/ip4jFvcjaFwvAOnsLo+/7dcWIRy
	Vt+6N3YbGod0z/5gbgz1ESAecUmRNaBMtHXFmFuJQeCqhR5dL7eJ9kvcfQZdagbpRkBKWmzD89c
	aU4CBw2Hs5rccw+99nH3BaYsTBERdmo4XUtt5AtdpZ4a7ABQ6pkOF1CxRn7q7jsqy/F8dsBBVTp
	JHQDhfny5Wpb5r2q4gNnePLo1jqcc=
X-Google-Smtp-Source: AGHT+IE5Zw3rQxm/Y37fbi6ptZgeE5aH3alHgFtNRGifq3aMvpVdl0YWLVe15T9b0wrPXZ7jYbyBTQ==
X-Received: by 2002:aa7:cb0f:0:b0:639:720d:72d with SMTP id 4fb4d7f45d1cf-63c1f6d5bc3mr2793191a12.29.1760721320098;
        Fri, 17 Oct 2025 10:15:20 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48a928dasm203300a12.2.2025.10.17.10.15.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 17 Oct 2025 10:15:19 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:15:11 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device
 driver for config selection
Message-ID: <20251017191511.6dd841e9.michal.pecio@gmail.com>
In-Reply-To: <db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
References: <20251013110753.0f640774.michal.pecio@gmail.com>
	<20251017024229.1959295-1-yicongsrfy@163.com>
	<db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 09:10:22 -0400, Alan Stern wrote:
> On Fri, Oct 17, 2025 at 10:42:29AM +0800, yicongsrfy@163.com wrote:
> > > > +	/* The vendor mode is not always config #1, so to find it out. */
> > > > +	c = udev->config;
> > > > +	num_configs = udev->descriptor.bNumConfigurations;
> > > > +	for (i = 0; i < num_configs; (i++, c++)) {
> > > > +		struct usb_interface_descriptor	*desc = NULL;
> > > > +
> > > > +		if (!c->desc.bNumInterfaces)
> > > > +			continue;
> > > > +		desc = &c->intf_cache[0]->altsetting->desc;
> > > > +		if (desc->bInterfaceClass == USB_CLASS_VENDOR_SPEC)
> > > > +			break;
> > > > +	}
> > > > +
> > > > +	if (i == num_configs)
> > > > +		return -ENODEV;
> > > > +
> > > > +	return c->desc.bConfigurationValue;
> > > > +}  
> > >
> > > I wonder how many copies of this code would justify making it some
> > > sort of library in usbnet or usbcore?  
> > 
> > Yes, there are many similar code instances in the USB subsystem.
> > However, I'm primarily focused on the networking subsystem,
> > so my abstraction work here might not be thorough enough.
> > Hopefully, an experienced USB developer may can optimize this issue.  
> 
> Would it help to have a USB quirks flag that tells the core to prefer 
> configurations with a USB_CLASS_VENDOR_SPEC interface class when we 
> choose the device's configuration?  Or something similar to that (I'm 
> not sure exactly what you are looking for)?

Either that or just patch usb_choose_configuration() to prefer vendor
config *if* an interface driver is available. But not 100% sure if that
couldn't backfire, so maybe only if the driver asked for it, indeed.

I was looking into making a PoC of that (I have r8152 with two configs)
but there is a snag: r8152-cfgselector bails out if a vendor-specific
check indicates the chip isn't a supported HW revision.

So to to fully replicate r8152-cfgselector, core would neet to get new
"pre_probe" callback in the interface driver. It gets complicated.

A less complicated improvement could be moving the common part of all
cfgselectors into usbnet. Not sure if it's worth it yet for only two?

Regards,
Michal 

