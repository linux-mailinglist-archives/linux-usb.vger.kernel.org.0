Return-Path: <linux-usb+bounces-35493-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPjZIR/yxGnv5AQAu9opvQ
	(envelope-from <linux-usb+bounces-35493-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 09:45:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106D33192D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 09:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F016B3032E7A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 08:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0893B0AC9;
	Thu, 26 Mar 2026 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JmVl1Obh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663943B8949;
	Thu, 26 Mar 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514613; cv=none; b=rtdp6XRc58iN2hB+07L1NP5rgIl146cMi8eNoSnIi0HAaDoUE+ue/x/sWA+UnngaWHotPy+fhif0tHBdLzBSEM7AsGbWm7sz/ylQ7ZmhZBim3C5KXrVLKE2GKWWNXNFVSjXUlEfwFdvLD8TU3A+FsbAeRXhVljTbxMFgW888KS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514613; c=relaxed/simple;
	bh=I4C0DIE9IYysJ67b3EaXafZqEo3cjgRh50z3+PY/nZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOIHEsyLR3Pv4ZibbAXXtkGdyiVrlDmP7AL0EdDjnxe/thf9RMC41p9TyqT8YtYNgYOHIdOTkoE4xtrIbhHGXqIKNZyoa1rxtD0sWfHAkgvrLaQpNOuh1l3zFof4YK2dfdlrEgTq0tOOEBo0mx5lNq4nnbsjRW7kxvz9Nz3WGQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JmVl1Obh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BE4C116C6;
	Thu, 26 Mar 2026 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774514612;
	bh=I4C0DIE9IYysJ67b3EaXafZqEo3cjgRh50z3+PY/nZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmVl1ObhbdlOqsswZfB2t1ljABCYlR2szi7bnJFbnrFwTP/pGSoi9pcKe2sYwNX97
	 Q1DucSGllzFAHzHuO6vKhOjFpK7k8l3O6Lf+OSK+RADv1GrkUaffFqSbq86aUbh0fV
	 WLdmPDGQ/nD8JBojMorZ8vzxKwtkOSuNI9ZPpqV0=
Date: Thu, 26 Mar 2026 09:43:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: skhan@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH v2] usbip: tools: Add usbip host driver availability check
Message-ID: <2026032615-donated-chaps-9eac@gregkh>
References: <29c03d8b-c73b-4393-95ff-bbf5c31df86e@linuxfoundation.org>
 <20260325022634.279624-1-min_halo@163.com>
 <2026032555-headrest-example-af16@gregkh>
 <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fdab10a-86f0-454a-af10-396a53169ea7@163.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35493-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,gmail.com,kylinos.cn];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,linuxfoundation.org:dkim,linuxfoundation.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4106D33192D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 11:10:02AM +0800, Zongmin Zhou wrote:
> 
> On 2026/3/25 16:58, Greg KH wrote:
> > On Wed, Mar 25, 2026 at 10:26:34AM +0800, Zongmin Zhou wrote:
> > > From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > 
> > > Currently, usbip_generic_driver_open() doesn't verify that the required
> > > kernel module (usbip-host or usbip-vudc) is actually loaded.
> > > The function returns success even when no driver is present,
> > > leading to usbipd daemon run success without driver loaded.
> > > 
> > > So add a check function to ensure usbip host driver has been loaded.
> > > 
> > > Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> > > Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > ---
> > > Changes in v2:
> > > - Use system calls directly instead of checking sysfs dir.
> > > 
> > >   tools/usb/usbip/libsrc/usbip_device_driver.c | 7 +++++--
> > >   tools/usb/usbip/libsrc/usbip_host_driver.c   | 8 ++++++--
> > >   2 files changed, 11 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
> > > index 927a151fa9aa..45ab647ef241 100644
> > > --- a/tools/usb/usbip/libsrc/usbip_device_driver.c
> > > +++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
> > > @@ -136,10 +136,13 @@ static int usbip_device_driver_open(struct usbip_host_driver *hdriver)
> > >   	hdriver->ndevs = 0;
> > >   	INIT_LIST_HEAD(&hdriver->edev_list);
> > > -	ret = usbip_generic_driver_open(hdriver);
> > > -	if (ret)
> > > +	if (system("/sbin/lsmod | grep -q usbip_vudc")){
> > What happens if the module is built into the kernel?
> > 
> > >   		err("please load " USBIP_CORE_MOD_NAME ".ko and "
> > >   		    USBIP_DEVICE_DRV_NAME ".ko!");
> > > +		return -1;
> > > +	}
> > > +
> > > +	ret = usbip_generic_driver_open(hdriver);
> > >   	return ret;
> > >   }
> > > diff --git a/tools/usb/usbip/libsrc/usbip_host_driver.c b/tools/usb/usbip/libsrc/usbip_host_driver.c
> > > index 573e73ec36bd..f0ac941d4f6e 100644
> > > --- a/tools/usb/usbip/libsrc/usbip_host_driver.c
> > > +++ b/tools/usb/usbip/libsrc/usbip_host_driver.c
> > > @@ -31,10 +31,14 @@ static int usbip_host_driver_open(struct usbip_host_driver *hdriver)
> > >   	hdriver->ndevs = 0;
> > >   	INIT_LIST_HEAD(&hdriver->edev_list);
> > > -	ret = usbip_generic_driver_open(hdriver);
> > > -	if (ret)
> > > +	if (system("/sbin/lsmod | grep -q usbip_host")){
> > Same here, what happens if it is built in?
> Thank you for pointing this out.
> I apologize for not considering the built-in module case.
> 
> You are right that using lsmod | grep would incorrectly fail when usbip_host
> is built into the kernel (CONFIG_USBIP_HOST=y).
> Usbip has always been built as a loadable module (.ko) by default, which led
> to this oversight.
> 
> To address this issue, would the following approach be acceptable?

Wait, what "issue" are you trying to fix here?  Why can't you just check
for opening the correct device node when the host opens the file and if
that fails, report an error?  Doesn't that happen today already?

> 1. Uses /sys/module/usbip_host to check wehther had been loaded, which
> exists for both loadable modules and built-in drivers.
> 2. Attempts to load the module via modprobe if it is not already loaded.

Don't do module autoloading, that might surprise users that previously
were not expecting it.

thanks,

greg k-h

