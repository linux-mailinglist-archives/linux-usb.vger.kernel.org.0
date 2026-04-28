Return-Path: <linux-usb+bounces-36626-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEW3BS2k8GlAWgEAu9opvQ
	(envelope-from <linux-usb+bounces-36626-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 14:12:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9003A484A8E
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 14:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5967730C28D0
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 11:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66FB3F23B7;
	Tue, 28 Apr 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mkVczpe9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D13F23A1;
	Tue, 28 Apr 2026 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777377534; cv=none; b=BtQ2PS72igMJAIA3uLY/EFcN1nfSL04WNfWYkX7t3ttnb9QuiHt0mrko0iSvKvX8xIAzaVi8/z6FkHcQe4DGxHZRr3W9AW2HPMPtPdo2L/PCMh7h/xhOATf0xUgFbtM8mtMuttv8PXi0XLN9PYfIjVSYXUnH8MCQl8/VD8LCN0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777377534; c=relaxed/simple;
	bh=tn+y8uCLe3YX1zgm7VU1H10cIr3zbLQPqDQXB4GIjMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LsKJjMJ6F/8uKEbtYbrkJqfmAK6Gy4hcglW2vvBpgGyP6J9YbECFkYErehj2oIM9n1KFho6eZcgxP4yKtOoVshGHX4e2p9XfWv1sKl8SrLPZd2IEZ2e3TQferiCLwFKSP0M0dbz4+MxW6O+ezFJPRA5DgfgsOVdeerJopChYqEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mkVczpe9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D1BC2BCB6;
	Tue, 28 Apr 2026 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777377533;
	bh=tn+y8uCLe3YX1zgm7VU1H10cIr3zbLQPqDQXB4GIjMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkVczpe9Bgwwb9JzOWPyq0uN+RyFJlVKDjpbJ20+yYh3kDSWjq4xf3Hg+3aFdQK68
	 4eIX6xQNsZogsUOJg+Kw4aVuqCtJ+4kn5PPyUQWiX2IrSBR0CnCLtQmsQX/7z8Adta
	 E9PKnrkTicxPU9uxmj6phdp12V8iMObDdMKrSIUw=
Date: Tue, 28 Apr 2026 05:58:16 -0600
From: Greg KH <gregkh@linuxfoundation.org>
To: Ginger <ginger.jzllee@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: yurex: fix ordering of usb_deregister_dev()
 and usb_set_intfdata()
Message-ID: <2026042854-shrivel-deplete-1280@gregkh>
References: <CAGp+u1YpY=StJYjr0HdYV+uaKBdcaT3iU4jq-9vr3d_a=t_nvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1YpY=StJYjr0HdYV+uaKBdcaT3iU4jq-9vr3d_a=t_nvQ@mail.gmail.com>
X-Rspamd-Queue-Id: 9003A484A8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36626-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Tue, Apr 28, 2026 at 12:54:22PM +0800, Ginger wrote:
> In yurex_disconnect(), usb_set_intfdata(interface, NULL) was called
> before usb_deregister_dev(interface, &yurex_class).  This opens a race
> window with usb_open() in the USB core:
> 
>   T0 (yurex_disconnect)               T1 (usb_open)
>   --------------------------           -------------------------
>   usb_set_intfdata(iface, NULL) [t0]
>                                        fops = usb_minors[minor]  [t1]
>                                        /* fops still valid here */
>   usb_deregister_dev()
>     usb_minors[minor] = NULL   [t2]
>                                        file->f_op->open(inode, file)
>                                          yurex_open()
>                                            dev = usb_get_intfdata() [t3]
>                                            /* dev is NULL */
> 
> Because t0 precedes t1 precedes t2 precedes t3, T1 can obtain the
> file_operations pointer for the device (t1, while the minor is still
> registered), then continue into yurex_open() where it calls
> usb_get_intfdata() and gets NULL back, leading to a NULL dereference.
> 
> Fix the race by calling usb_deregister_dev() first, which removes the
> device from usb_minors[] before the interface data pointer is cleared.
> Concurrent usb_open() that arrives after usb_deregister_dev() returns
> will fail to look up the fops and will never reach yurex_open().
> 
> Reported-by: Ginger <ginger.jzllee@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/2026042718-unwieldy-dicing-626f@gregkh
> Signed-off-by: Ginger <ginger.jzllee@gmail.com>
> ---
>  drivers/usb/misc/yurex.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/yurex.c b/drivers/usb/misc/yurex.c
> index 6d03e689850a..b5484ab77e91 100644
> --- a/drivers/usb/misc/yurex.c
> +++ b/drivers/usb/misc/yurex.c
> @@ -310,11 +310,12 @@ static void yurex_disconnect(struct
> usb_interface *interface)
>     int minor = interface->minor;
> 
>     dev = usb_get_intfdata(interface);
> -   usb_set_intfdata(interface, NULL);
> 
>     /* give back our minor */
>     usb_deregister_dev(interface, &yurex_class);
> 
> +   usb_set_intfdata(interface, NULL);
> +
>     /* prevent more I/O from starting */
>     usb_poison_urb(dev->urb);
>     usb_poison_urb(dev->cntl_urb);
> --
> 2.39.5
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

