Return-Path: <linux-usb+bounces-15812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B37B992E14
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 16:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6F41C22FE8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 14:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0441D5CCC;
	Mon,  7 Oct 2024 13:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="X1JsBmzn"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455C1D47BD
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309593; cv=none; b=iv5HIiWbJuKihJUQ7C9giUER1J8LTHMeexNa9Drd1jiIJyUpruo2uuikya5+PBkJ0DKwnewKq6xW6pQOzDaRtXN9Dl2QhlSpL0GYr4N1OVHAMQ3xrsDK4w+nwB+T5FoyAzUfhJBwsLYIYXhJsoen955oKtVETOP4hLue1qiLUMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309593; c=relaxed/simple;
	bh=tKYBzFkKPp79i03Dm8syiDfV36gFIXsUZsW/ygSiprs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBUp3SW8FDN8ZGzxL8Ae5ms0SA9YuEbWKIzmdCVF4JXSs2htnQadvHALhmzrkWdZQocl1tDGePH96kC0zlkJUWOA9sWs3VBmNXfh/7jAP3IBNYDT+b3ZatRtG6XIGgGXYnpF6U+dhcPio5ZFf1D+8TvE1FwXhO5NM+Ifocv3++c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=X1JsBmzn; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Z5S2SkVPPj94N/f8zkfvc4+J6l3XHXCJGE+ckfMMtiM=; b=X1JsBmzn31twfhwP8j7s1kIKrg
	G9nYaAeSrjFWFeky4yt2rzP75UudHxLK8TT5uAUaNpd7W+MBYgFaJCAX5BHGteLhL6KbigYk03yk/
	dZ3+EMvLnvhwW7qhEP79BWmsn9T4blyuxXTAaIsxtB4Uwz6PGsdKIO03cXxwCxN6KkxuNkaiMK3bC
	86jeHoN0XUBxTempTn8VvKD3ZUWxNosbaNpUI8GD/CF/XvkARiJl3ehoyrc+7rmisjYHOZMBtTNrq
	CtRbBy6cPl98J4BYndCkvoa9bPM2/cEmeOMPeZwd/Qci5snBmE25EWj1bq/Toa7LrphSOjFrHxM11
	Lr3rmxDQ==;
Received: from 179-125-64-236-dinamico.pombonet.net.br ([179.125.64.236] helo=quatroqueijos.cascardo.eti.br)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sxoH4-0069t6-HX; Mon, 07 Oct 2024 15:59:47 +0200
Date: Mon, 7 Oct 2024 10:59:42 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-dev@igalia.com
Subject: Re: [PATCH] usb: typec: altmode should keep reference to parent
Message-ID: <ZwPpTtQ1CG4NV8UR@quatroqueijos.cascardo.eti.br>
References: <20241004123738.2964524-1-cascardo@igalia.com>
 <Zv_23J-1U5pZ6rgT@kuha.fi.intel.com>
 <Zv/43ewc3n5aSEUO@quatroqueijos.cascardo.eti.br>
 <ZwOcxWOftFJxpMbo@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwOcxWOftFJxpMbo@kuha.fi.intel.com>

On Mon, Oct 07, 2024 at 11:33:09AM +0300, Heikki Krogerus wrote:
> Hi,
> 
> On Fri, Oct 04, 2024 at 11:17:01AM -0300, Thadeu Lima de Souza Cascardo wrote:
> > On Fri, Oct 04, 2024 at 05:08:28PM +0300, Heikki Krogerus wrote:
> > > On Fri, Oct 04, 2024 at 09:37:38AM -0300, Thadeu Lima de Souza Cascardo wrote:
> > > > The altmode device release refers to its parent device, but without keeping
> > > > a reference to it.
> > > > 
> > > > When registering the altmode, get a reference to the parent and put it in
> > > > the release function.
> > > > 
> > > > Before this fix, when using CONFIG_DEBUG_KOBJECT_RELEASE, we see issues
> > > > like this:
> > > 
> > > Let me study what's going on in the drivers code. The children should
> > > _not_ be cleaned first before the parent. I'll have to come back to
> > > this on Monday.
> > > 
> > > This really should not be necessary.
> > > 
> > 
> > Well, they are likely not. But driver core API states that either way, you
> > should keep such references. And one way to test it is using
> > CONFIG_DEBUG_KOBJECT_RELEASE. That delays the actual release/cleanup of the
> > struct device, so:
> 
> What I want to understand is, what is the rationale for this behaviour
> in the core. If this is something that the drivers can do, then why is
> the core not doing it for everything? Why is the core decrementing the
> parent reference count already in device_del() instead of
> device_release()?
> 
> I'm probable missing something, but I really want to understand this.
> There are other drivers also need resources from their parent, so if
> there is nothing preventing this from being handled in the core, then
> that's where it really should be handled.
> 
> thanks,
> 
> -- 
> heikki
> 

It has been like that for 20+ years, it seems. I noticed that you have
changed the behavior in the case of kobject parent lifetime relatively
recently (back in 2020).

One potential challenge of changing this is that dev->parent is usually set
even before device_initialize gets called. At least, the reference must be
get there at device_initialize. A quick glance here shows that the parent
may be set between device_initialize and device_add, including in
device_create_groups_vargs.

Around 315 calls would need to be inspected, I would guess more than 100
callsites would need to be "fixed" for this change in the API.

And, then, how many really need to keep the reference to the parent, and
wouldn't keep such a reference cause any problems in any of these cases?

Cascardo.

