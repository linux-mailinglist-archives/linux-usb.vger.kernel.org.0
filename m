Return-Path: <linux-usb+bounces-26709-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF41B21551
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 21:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB051A22590
	for <lists+linux-usb@lfdr.de>; Mon, 11 Aug 2025 19:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66A32D839E;
	Mon, 11 Aug 2025 19:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="A6I1Yb0P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7C82D838E
	for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 19:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754940289; cv=none; b=UVVdhPqq9xRdcb7b2Yz2W9UebuO/BNGCs9uMmjhKEZB9uxje7t/XsupqFVkvBwmwBx8FibFxqpYWvycMkskeWldYA/PkynI1daN7N/BoXsRFusX4nUbkl9m2u2NfzcVfVjHe/L4v4JWYE+wF/VpUvZLnhIXJz26V2+psJD2tCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754940289; c=relaxed/simple;
	bh=puiPMvRLC0fsCgBP3I9XxgD+HqX4Ja3xWQpNrCXy5lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6kodbxuBsnFJj2iFUI1phkk+C1cYKI1Iq0b7g1c8NAmloO8ujIPncAGTlMLb6tXFSD5C/6l42nY0QyZfP0u7XFBBbgY4nRZy6UaCDypEoEndW2sy0dbnjH+iLuBHvhebz8l3ichMyHpNTGUC/AclyjFSwpPDAi5FqrnNMYhR10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=A6I1Yb0P; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-7072ed7094aso45010546d6.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Aug 2025 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1754940286; x=1755545086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QUZTA6GtaA7czamtY3xPr8PgEMTZeItGL8BIt7Y0OZY=;
        b=A6I1Yb0Pa1HhuV8UxmL3P10fGSibiEgkmYjEVAQ7d4MBABhskclsc7o6Kuq3xH5QkI
         s/Wsa6wUJliqubXpYP5zK7nxZGqudVdb7WudmZZKu7uR2pB/YPGdwoPSzjnCxej4AcEk
         WBerTvwBl3DAXsfIX9+XBkotIqBlEtpxKNQn0ParZQI+nYeaqtyvVPAfeNjA9FKmkm3x
         8W37aFksodEBRkfclnPnETRmF7M43afZC9nQ5/9GQGsaIThOf5AmISQ0SMYePk6iZXq/
         x4On5zduuwBP8pGHdgif8vG/UidTyOuZY+CdL2qDQFvflwIYZ+F+54q2VsJ0h8js9/vn
         Ftdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754940286; x=1755545086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUZTA6GtaA7czamtY3xPr8PgEMTZeItGL8BIt7Y0OZY=;
        b=fV2AldVLTiQWmbXecKbPGDEzF76XAOyUazwJC24LkhPSCSQpQFVzUlzcwW1+lekQ/j
         K0ticEG+fahteUWhoMfyyZwhxPqwpZcMGaT/nx3k3u2cCq7f05tPZkZy24feQF39n3QG
         gcT8dpYkJz+yrbZA7AXXyllSwRhts4dMFPrTCUa6PYVJMsiyynuMCWNrQho7Hz+biI2y
         mS8ufzjb4wC5o85Dks9rijORV2sdD6V0nU+oX2H+3ZjzxVHN3PgywsyCgVKIS2iL+u1t
         7xQjtr3jnlH1prYiCwk/Wqgz0vBHtChh2D5hXRw625MehwfNocJX+1XSTRSJCwF23NCj
         7xfA==
X-Forwarded-Encrypted: i=1; AJvYcCVbKdvgG2zG94VHmXpSR4zBhFkLAaIBm7CrgRgkMt8+N4qDaiy/oNlNzE8uO2BfrXNQv5mK+/hm9RE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8JSpfCK3R3z9/NdaBEmdkLcY9zMNSO8J6+It5j0CQt9azf91x
	YYN3Ka3dJj4507lPNi3Raz02Bnbz9ARaiwVqxnNcOTYkOin71K9yTt40QKO8ADzkDw==
X-Gm-Gg: ASbGncsoZA/DWNzQKIR41NMDJMkx0ZQ3gw40OjA/lBBRQuTq07GLNnzzcaSSbi1D8Am
	0Uttnk3eIMe5E5TAEo/AptqDomzK8nwF3tQald/7f3P4it84s6aftidTeoiHEXo6MQGNdeR7WFW
	CgvDySpsy+2NPZF6h1Veg9tcV6SXJee/HVleejCtXurLw9HQtKrfRV0eFiNENnpcX7MerakDrN2
	ODeG0P/qAtiAUvtsBHqcuqNemEmdd2dMknievwOXfqsGc+fhO0ufrUw4GcUEfGtZUzSk3zG9eLt
	Wn0lyzrBaZUom+rJSdORJpXZzoOwmbX73T49gpSQsvCK3ORcMOd0yOg8iS+h7mdQrJwV/wWJLKr
	NztDprRwgM2XveXc5rg95GOM8oF0PoZ6+OT7uvV0i0ErORNpSu+Rb0l/snwIzNeOaLw==
X-Google-Smtp-Source: AGHT+IFt/3YKTBCSbCpS49sRmaeAcew9QCxCqdPIrUP1a6uOv4+01cnhkX80mFQqiyFrAfNyAT7OZg==
X-Received: by 2002:ad4:5fce:0:b0:6ff:1665:44ef with SMTP id 6a1803df08f44-7099a260910mr177522336d6.22.1754940283507;
        Mon, 11 Aug 2025 12:24:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ce44849sm160795546d6.84.2025.08.11.12.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:24:42 -0700 (PDT)
Date: Mon, 11 Aug 2025 15:24:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] usb: hub: Don't try to recover devices lost during warm
 reset.
Message-ID: <f442fe21-64bf-4669-8def-e1bf9259a6b8@rowland.harvard.edu>
References: <20250623133947.3144608-1-mathias.nyman@linux.intel.com>
 <fc3e5cf5-a346-4329-a66e-5d28cb4fe763@kernel.org>
 <1c1b5552-0b43-49fb-98f0-8d2477709160@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c1b5552-0b43-49fb-98f0-8d2477709160@kernel.org>

On Mon, Aug 11, 2025 at 01:06:03PM +0200, Jiri Slaby wrote:
> On 11. 08. 25, 8:16, Jiri Slaby wrote:
> > > @@ -5850,8 +5851,11 @@ static void port_event(struct usb_hub *hub,
> > > int port1)
> > >           } else if (!udev || !(portstatus & USB_PORT_STAT_CONNECTION)
> > >                   || udev->state == USB_STATE_NOTATTACHED) {
> > >               dev_dbg(&port_dev->dev, "do warm reset, port only\n");
> > > -            if (hub_port_reset(hub, port1, NULL,
> > > -                    HUB_BH_RESET_TIME, true) < 0)
> > > +            err = hub_port_reset(hub, port1, NULL,
> > > +                         HUB_BH_RESET_TIME, true);
> > > +            if (!udev && err == -ENOTCONN)
> > > +                connect_change = 0;
> > > +            else if (err < 0)
> > >                   hub_port_disable(hub, port1, 1);
> 
> FTR this is now tracked downstream as:
> https://bugzilla.suse.com/show_bug.cgi?id=1247895
> 
> > This was reported to break the USB on one box:
> > > [Wed Aug  6 16:51:33 2025] [ T355745] usb 1-2: reset full-speed USB
> > > device number 12 using xhci_hcd
> > > [Wed Aug  6 16:51:34 2025] [ T355745] usb 1-2: device descriptor
> > > read/64, error -71
> > > [Wed Aug  6 16:51:34 2025] [ T355745] usb 1-2: device descriptor
> > > read/64, error -71

What shows up in the kernel log (with usbcore dynamic debugging enabled) 
if the commit is present and if the commit is reverted?

Alan Stern

