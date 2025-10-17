Return-Path: <linux-usb+bounces-29410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 801BFBE8C1B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 15:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ECF71AA4C8F
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 13:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CF1345759;
	Fri, 17 Oct 2025 13:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BaSxQt/e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2A343D83
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706630; cv=none; b=GEZipSfyBHXM21Ihg/GztKRw/vGVXjSUo9+/VTkA8leF7L1O9P3BERUr3lpwIMyePz/04dl8p2Cn4zMxCbHcZ0FQGr2dqJO9gUKNASDjRDmiO2YqtyLnSPufj5efxvln1H8DPP5PRuacZq/Yf9qHtJnGsMZATSfF/nfFicBNZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706630; c=relaxed/simple;
	bh=439D4x4RewosLmOifKb8w/D7qCnx3Fln5kuNMbO8pxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+EDLguGVu5oITYgmaHG+OkrW72wmI5nJ6wRFHEcn6oOTkuJghmh3mfa5Od9BiLMEZNs7h5jcGdTKbjDNV1rqIrEGWkQ61v05AdoWHum+oWw61P9nEDe+UBIcsho1911DKv+5NRY/kiDKTPbAjJf8PeYxhuDsrPBUSlYCUGWqLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BaSxQt/e; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8915bd01244so57238885a.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760706627; x=1761311427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3n12fDi8NT3PL5BkJsb+zATv8iKj3oJFPgatJxL6saw=;
        b=BaSxQt/eNed5m0chPoCyNucSmmD28R59Si2dbjx+PwIRE8Dihx8tqS+RARYRwXKBWh
         TC5cC9ho/sVLB8s9EOPsplmCR3VweeGI1mvHgIiF1hv5VJxEVyabyIDTcVBdoFgkICDF
         09vYVtKNqSdPualE2oXS9GrCRgFn91KhW37muojt7+xfBH7uFYFKHrqE7jlUL/nN5Gvi
         /oCkop+zjJ8UxaAkaM2CYEAFlD3mdLQO1ZkuIjeuIw7+ZMhPvUeNAdA+0PXRLr1Sh97S
         yXqt0zvy7hYRuYEC0bwmRzcnsfM8DhGIfIcaR5V5ai/ZVweqY4pXSkbhkDnGMT0IBv58
         bXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706627; x=1761311427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n12fDi8NT3PL5BkJsb+zATv8iKj3oJFPgatJxL6saw=;
        b=lfXk/1JabM7JbcfqlY9MqmYOFyU281P4e3cNc7SSvgShuvlVc0CryKMuZFWDvyD5sS
         KRdurUgWcNG0M8slJaYtJczZJhmYQkaugVcOXMbn5zmlUMhzGzc8S7WSP6qLtUKGOeo8
         m5tfdVciwG5ZOU2ILhXBqNotTAGcYkwC40VRWKUGBuZQzC28T2yMyTdT9usbblEpwVCr
         9FTKv+YFkIbGx3hfiF/5ZtusBXaMdj1+NHsyiODU+C8Za9L5iZVAFIo6dkTG5hUN9tQd
         VwTmmEADA2LYWIyECXa4ahlatDlbJ9nUYjz8ylSKtNh86bweMV8DKMgzKTWP9n5YEYYV
         HWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx9UqwQUc3n1m6XNGp9IkqBP1Lad6GDVTv5+7pMqy4zHL2Rs4gndAYq9J4bQ5OcX+5LR3Eho4kopE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6tzN4ze1tD8dVVLIrvbMxNw3jD6Et/jOnMqVt8q+gfSMesa4c
	WwGetr30xGHrTE5VVAqEhQLrTo3tbGCj6TE+u8q+g9z4oNUp0sgt65sDftIyF3Ddrw==
X-Gm-Gg: ASbGncva+YXOmGyUu2vFi9/btBxkG8uSAv2Mmy1ct8DhRrn0SryChxl94M4Os2sxNk8
	rpWGjd+Pt8JDGQV156GSoyRR3kw0Tpj5tAc66S9XMBTuwxTfeGKnKiReCgdVlLnLhoLa9E4xJ+I
	GOOp/jHpa8dUPx98nMrGcgKF2Y4rIc6yrxKexsJJCsGoWbquZYMzuvAEmXkq/bYkdbWV0Sj/XVv
	CAT6a6cGAmNbSY7SB7GwgUIz8nI4NlBK8FO7ywNVRJFXMNWuIPnqQ2+iA4qjDhsNm6sWDAinjZp
	VB/zgGxQlBNbKbTELhYnufvVd0/vBJcvfD6UiFdg2WCljc8UD1UtFH0Hv71/wpOqQd/nx3eucep
	KWqVx1GQlGO0blnpqvcF+MHusDYbR8MQ6Xao5kK/dggpsdfePP25uWunqO2yZfaLVhz2EU/MF8A
	tljJXBXBbTbGhdzZl5GMKY4us=
X-Google-Smtp-Source: AGHT+IEpkGgt8qwkxX2G4nNg9sTqQYAmhd3dwwQtJvwgWPzzvMXMssW2nEo8a9VhAs8cB00VbditYw==
X-Received: by 2002:a05:620a:1a2a:b0:85c:dda4:1cc8 with SMTP id af79cd13be357-8906fd18369mr434075485a.45.1760706627085;
        Fri, 17 Oct 2025 06:10:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::ba76])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37f45129sm415854285a.38.2025.10.17.06.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:10:26 -0700 (PDT)
Date: Fri, 17 Oct 2025 09:10:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: yicongsrfy@163.com
Cc: michal.pecio@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
Message-ID: <db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
References: <20251013110753.0f640774.michal.pecio@gmail.com>
 <20251017024229.1959295-1-yicongsrfy@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017024229.1959295-1-yicongsrfy@163.com>

On Fri, Oct 17, 2025 at 10:42:29AM +0800, yicongsrfy@163.com wrote:
> > > +	/* The vendor mode is not always config #1, so to find it out. */
> > > +	c = udev->config;
> > > +	num_configs = udev->descriptor.bNumConfigurations;
> > > +	for (i = 0; i < num_configs; (i++, c++)) {
> > > +		struct usb_interface_descriptor	*desc = NULL;
> > > +
> > > +		if (!c->desc.bNumInterfaces)
> > > +			continue;
> > > +		desc = &c->intf_cache[0]->altsetting->desc;
> > > +		if (desc->bInterfaceClass == USB_CLASS_VENDOR_SPEC)
> > > +			break;
> > > +	}
> > > +
> > > +	if (i == num_configs)
> > > +		return -ENODEV;
> > > +
> > > +	return c->desc.bConfigurationValue;
> > > +}
> >
> > I wonder how many copies of this code would justify making it some
> > sort of library in usbnet or usbcore?
> 
> Yes, there are many similar code instances in the USB subsystem.
> However, I'm primarily focused on the networking subsystem,
> so my abstraction work here might not be thorough enough.
> Hopefully, an experienced USB developer may can optimize this issue.

Would it help to have a USB quirks flag that tells the core to prefer 
configurations with a USB_CLASS_VENDOR_SPEC interface class when we 
choose the device's configuration?  Or something similar to that (I'm 
not sure exactly what you are looking for)?

Alan Stern

