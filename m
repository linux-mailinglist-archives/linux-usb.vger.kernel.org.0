Return-Path: <linux-usb+bounces-29466-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A53AFBF2469
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 18:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91C6F421AB5
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 15:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BB127B330;
	Mon, 20 Oct 2025 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNRGioMf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D9279DA2
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975973; cv=none; b=J6MezvNLMwe4TPR/XTUwJ+Ia4qSHzUus0mPmbhzPC3HggS2s02N4Z+nDb1vKpWEeJj+a/zWi/kJ+8mvdK7ff8krnkSETRUdcOwOlZz6QPfkrRLePln9hh409Azl6P95BFYeYILrR69zI2FrspIay9PEc15eZZ1BJNY3EvqEorzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975973; c=relaxed/simple;
	bh=AlDvcD9cvxmMZ6FlYffLLHdIC2zxgQvA/MqWm52xXCo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlYBl10CS7brINX7M7Xrueafx3XoHTjyez1r6JiLzMQMBtA7vIY4Fc5eHtdAEZJkkftPb4PO/1QJriM4fQMpJpxNKmUGwt3LkjF7H+BwpKp0KGbxroi52TJ9prkt3oKMGW9g8P65VDiwbDrEBGrj/VYAfzLHslu8lcQ5hea3X+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNRGioMf; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-36d77ae9de5so42575371fa.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760975970; x=1761580770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pmrut9vzQewm/iu1qN7J3aMf6a3LdQNxNG+gDEApfU=;
        b=RNRGioMf/ANu9iBnyZFkqpy+0wsKogiHXzUWMLAJ5C1SOggLAuuYAnTGiWJds6zaNN
         eZzEGpnTci0x2Q4u1T3bVHPUUuHmRqEvLNM2jOzmQZ2v7t9IdyzvXuzgK+1BFW5uSs1H
         Bx0rCMwGLclXUG9Xio+opaF8VaAZE9uDzDOWVldgXUqIdp9rJWzjq6CRKH6tdtpJpJts
         S5cmmA/bx9GAuFeeM6uwTdC3xgdFFGqGFK8uHwezMLEiaxsvWiudo5c51tctdP/LNVH8
         ciIwKdaubk2EZ3aqtn5BzgcOe1t2kuISfCAyvln+MEYp61ByuGOekO6suuDaNkkeVJxw
         bJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975970; x=1761580770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0pmrut9vzQewm/iu1qN7J3aMf6a3LdQNxNG+gDEApfU=;
        b=LoHXMIzzEngdO+vYyrdX0UkQf93N2efXfouj9cHdJ6sG2mFB3gRVxt4SFESso/EK/8
         HJd0qdY6qSgKyK7vNi/6a0mrmr3EvdIPWEo2SRYcnwhaZUxfqpj2oIrQ9QEo1JdkNdNg
         /COS+y+zyzkOEKKYyDj/+viPQ3XfWsfXqar0dbn0r3vbwa+sOmZ89qoctS9QoMZCcwQi
         bgPxIW3RrLQiJqdaYE71/OwS9eUGlY2wg3GXPl/2oAMG+41jeYzZ2iTBkrB/Ho5yZKf8
         PEC6lUTHAGezddMtTROdNR75iqi3h7/Mq30iLkw9/EdlbagmIOq878QiDBp+lO9EiLWT
         RxPA==
X-Forwarded-Encrypted: i=1; AJvYcCUEqizz9qsdvKDsgj6ehhpVapQXJGkDfChMQ10VeohpkyiIse4/+Ab1nkzuHoRmBtBDBKp2yIjxBEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXphSdzdT6LcAO3+Y90mmy960X39pCOzS9rFyXFWn9LRSnKng7
	6dYuyeBYwVI0i7TgWyx+aHoz4suE9Pm6Gbcvfi2rUDg0M/bQ3hx+59Ow
X-Gm-Gg: ASbGncvDQlZBhC1LsKhsAJWl/GckcmEJNdUcMeeZ6ClQGkpwDwEnnOdZWVMRkvc2ENP
	UJfavITXR/eqsYIpIdCFoSHo1eGwkTRsZRMqJDd5ijiffnFkHhQqQ5hS8DjjS0JVhT9iY6duLAH
	UtMH5SafItZcfPgOn+C894L8TMN/RgJsWn7b0h052NR8wsty7hQYDEGXViF+A5c1/pnt6/m73df
	Ol8PXqJUkSAX0Z4hG0sj81LXvrVjgEI9wHDATuGuEpe0630oVsEWmAC/18nzMWNoQVpYuQsQxlE
	HsgwlNQVMkWn5TPb36MBB+DlBYE5/WgTVb2KRBuZBho8r5o4KiGOXJsqkLhnE/RcfO7eXAQ4qX+
	qTMnPUl4mkUfojMnajyRbdVbGzPKog8gLYjKXaasybFX88fPMaRcX11gjxVhvwZNKgREerxNHKL
	1bOKu/Vt+U92FCxNGGUmIA4Bid9eQ=
X-Google-Smtp-Source: AGHT+IFnsBfPmbrXHVP1H18le6ketuD3FxoDsZnnDHxp5mkqhfsJGXHXxZ4B0uiPRDgcQlvozLnsCQ==
X-Received: by 2002:a05:651c:255a:10b0:377:c522:b816 with SMTP id 38308e7fff4ca-377c522b9e0mr5967821fa.19.1760975969206;
        Mon, 20 Oct 2025 08:59:29 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a9664a97sm21735171fa.50.2025.10.20.08.59.26
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 20 Oct 2025 08:59:27 -0700 (PDT)
Date: Mon, 20 Oct 2025 17:59:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, yicongsrfy@163.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device
 driver for config selection
Message-ID: <20251020175921.37f35e5a.michal.pecio@gmail.com>
In-Reply-To: <2fae9966-5e3a-488b-8ab5-51d46488e097@suse.com>
References: <20251013110753.0f640774.michal.pecio@gmail.com>
	<20251017024229.1959295-1-yicongsrfy@163.com>
	<db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
	<20251017191511.6dd841e9.michal.pecio@gmail.com>
	<bda50568-a05d-4241-adbe-18efb2251d6e@rowland.harvard.edu>
	<20251018172156.69e93897.michal.pecio@gmail.com>
	<2fae9966-5e3a-488b-8ab5-51d46488e097@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Oct 2025 11:59:06 +0200, Oliver Neukum wrote:
> On 18.10.25 17:21, Michal Pecio wrote:
> 
> > index e85105939af8..1d2c5ebc81ab 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -1202,6 +1202,8 @@ extern ssize_t usb_show_dynids(struct usb_dynids *dynids, char *buf);
> >    * @post_reset: Called by usb_reset_device() after the device
> >    *	has been reset
> >    * @shutdown: Called at shut-down time to quiesce the device.
> > + * @preferred: Check if this driver is preferred over generic class drivers
> > + *	applicable to the device. May probe device with control transfers.
> >    * @id_table: USB drivers use ID table to support hotplugging.
> >    *	Export this with MODULE_DEVICE_TABLE(usb,...).  This must be set
> >    *	or your driver's probe function will never get called.
> > @@ -1255,6 +1257,8 @@ struct usb_driver {
> >   
> >   	void (*shutdown)(struct usb_interface *intf);
> >   
> > +	bool (*preferred)(struct usb_device *udev);  
> 
> I am sorry, but this is a bit clunky. If you really want to
> introduce such a method, why not just return the preferred
> configuration?

Because I wanted to introduce exactly such a method, rather than one
which returns the configuration ;)

The point was to pull configuration selection *out* of those drivers.
They already do it, and it makes them copy-paste the same trivial loop
which iterates through configs until it finds the vendor interface.

The idea is to have a maximally simple check for a known-good vendor
interface driver before making unfounded assumptions like:

/* From the remaining configs, choose the first one whose
 * first interface is for a non-vendor-specific class.
 * Reason: Linux is more likely to have a class driver
 * than a vendor-specific driver. */

Unfortunately, that's only half the battle. The other half is forcing
configuration reevaluation when such a driver is loaded. I hoped it
would be trivial, but so far it costs me a new bus_for_each_device()
and a whole nontrivial function, while cfgselectors have it for free.

I got my PoC up to feature parity with r8152-cfgselector and it adds
about as much code as it removes (uless more cfgselectors are added).
And of course it's dead weight for those with USB but not USBNET.

 drivers/net/usb/r8152.c    | 69 ++++++++-------------------------------------------------------------
 drivers/usb/core/driver.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/generic.c | 26 ++++++++++++++++----------
 include/linux/usb.h        | 11 ++++++-----
 4 files changed, 78 insertions(+), 76 deletions(-)

So not sure if it's worth pursuing.

Regards,
Michal




