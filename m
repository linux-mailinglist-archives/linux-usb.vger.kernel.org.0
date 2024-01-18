Return-Path: <linux-usb+bounces-5231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E1831C8F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 16:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56B50281B18
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 15:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E18241F5;
	Thu, 18 Jan 2024 15:28:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C9B6C28DB1
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705591728; cv=none; b=YRWuRgfz/opX834TYq2tYkpjG2AumUp40nT8GVRJsjLoE4/pX9qsZZ7FuaQBnQnLNboLmzc6VeErrxsYHIbapctaNLqlT4VUlkRgtM0cvkm+qwjl6ZfHjHnWjYOYhs//erB5d1OH0p1R85S0PkjV8mOJmOP32LQTG6slvWzZTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705591728; c=relaxed/simple;
	bh=dIpv6eBb1sHXsfZHnl/dZffA2Fo3Kr1kOw/x/LnJjno=;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=DfbMqmMTpM5ExEr74A2ww5bUGKdsMWmvaswcMY40FaALrfgq6B0yUkpYKfXX6wGy7kLwJ/R3pYLYDF5gBWS1xRpBMOrsZBPqBthUGTZzurS9+nwAqr/X8qsTIwDjVmkAv83EWh+ElLaXaTg7uLENXbbO0EwhHR0DyI6ubhLnJrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 7785 invoked by uid 1000); 18 Jan 2024 10:28:38 -0500
Date: Thu, 18 Jan 2024 10:28:38 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
  Xu Yang <xu.yang_2@nxp.com>,
  "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
  "hdegoede@redhat.com" <hdegoede@redhat.com>,
  "ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <0f386d9a-b375-472b-8054-beb142916faf@rowland.harvard.edu>
References: <2024011214-disbelief-sincere-805e@gregkh>
 <DU2PR04MB8822B8AD6A6DE873F2F160588C6C2@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024011842-harpist-password-b965@gregkh>

On Thu, Jan 18, 2024 at 03:54:16PM +0100, Greg KH wrote:
> On Thu, Jan 18, 2024 at 02:38:58PM +0200, Heikki Krogerus wrote:
> > It is "being used" when something (user) acquires reference to the
> > role switch that it provides. The "user" is in most cases USB Type-C
> > port driver - what ever knows the role the port needs to be in.
> > 
> > USB role switch is meant to act as a "resource" like any other. So
> > when you acquire for example a GPIO, the gpiodev driver is pinned down
> > by calling module_get() just like this driver is doing to the switch
> > provider.
> 
> So again, if the hardware is present in the system, the module reference
> count will always be increased and can never be removed no matter what a
> user does?  That feels wrong if so.

It's not quite that bad.  Even if the USB role-switch hardware is 
present in the system, the module controlling it can be removed if the 
role-switch resource isn't being used (which will cause the module count 
will go back down to 0).  This may require the user first to remove the 
module that's using the resource.

> > > Any module should be able to be removed any time, unless there is a
> > > "code" requirement of it being present.  The driver model structures
> > > should make this possible if used properly.  Trying to much around in
> > > various parent devices and the drivers bound to parents should NEVER be
> > > done as happens here, sorry I missed that in the review process.
> > 
> > If this is not something that this kind of device class should be
> > doing, then let's remove the whole thing. But if that is the case,
> > then shouldn't we remove that from all the other bus and device class
> > drivers as well?
> 
> I started to remove it many years ago, but then something prevented that
> as there was actually some valid uses, but I can't remember at the
> moment.  Try taking it out and see what happens!  :)

The problem here is that a device is being used by module B that isn't a 
descendant of the device's driver module A.  If B didn't take a 
reference to A then A could be unloaded while B was still using the 
device.  When B finally drops its reference to the device, the 
driver-model release call would get a NULL-pointer violation, since the 
code for the release method was part of A and has been unloaded from 
memory.

In the current code, B takes a module reference to A and drops that 
reference after dropping its reference to the device.  The bug that Xu 
Yang wants to fix (the original reason for this discussion) has to do 
with the way B drops its module reference to A.  It gets the module 
handle of A by looking up the owner of the device's driver -- and that 
approach doesn't work if the device has been unbound from its driver, 
for the obvious reason.  The proper solution to this problem is for B to 
cache A's handle at the time when it first acquires the module 
reference.

Alan Stern

