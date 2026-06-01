Return-Path: <linux-usb+bounces-38216-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL5vJDMcHWoeVwkAu9opvQ
	(envelope-from <linux-usb+bounces-38216-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 07:44:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267A619C1D
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 07:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99066300D14D
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 05:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9DF33DEFC;
	Mon,  1 Jun 2026 05:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fxq+9+nv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD4014A8B
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 05:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292653; cv=none; b=YjycoLlUCdXzYJAwFBQWFnp9pEAwFjZNyr0WKqnaWsCjMUXPshh2SXwd+7EuyEbMVLHidGdC2WMxAj5NhHO0sCtkGnbydfbHrk5G/auAjgpvTpNz0vJXugx3HSsEskOxn/XcqGPqEnICAavk+YmJ29oM1Iz9PEUQD7CTCkMEodY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292653; c=relaxed/simple;
	bh=hk750NYhlKOMzWub3pPu33E2MYch0PsKBYOjxJOv2EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axbxfP9JMmfnBh757rEly304Pb9vFgOXaz77MGCbB12C0v1h3FFqRH21z3cX0rZwUuvJZnG5TxJahHjcNXQKtkLh1DjgktoHgtFfDJub7Yg9MphWeyxXX6wzVLj5S3aYQOHbAWEwvivyq4dHkYzooFvpqoD+QZ1pIpdl0DHre1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Fxq+9+nv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F9F1F00893;
	Mon,  1 Jun 2026 05:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780292652;
	bh=cAmfmcs46OCwYzGe2CZ9FiQT0k9DETufJE2d6YqGz3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fxq+9+nvnYgcb+tq88YpvFmns23JxEKnOwKi//RXdk9iI13VVtARv0nfCZ89RWSna
	 2EbLoWfk9bwj1/kWVBUxRVuuDi3iY1F2havzja2nZtm8pr7dvoPoiOZBdLEkhO16ss
	 Vb5mGG4EjTRbxByYwVc+Kd8Emym4AWm7Vqlv4kcM=
Date: Mon, 1 Jun 2026 07:43:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ginger <ginger.jzllee@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [bug report] Potential order bug in 'drivers/usb/misc/ldusb.c',
 mainly in 'ld_usb_disconnect()'
Message-ID: <2026060157-pettiness-corporal-05eb@gregkh>
References: <CAGp+u1a_9JNnadwUmCTPAWrs=nxL2KJbxr=tzo7BiJBYzFcpsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1a_9JNnadwUmCTPAWrs=nxL2KJbxr=tzo7BiJBYzFcpsQ@mail.gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38216-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,linuxfoundation.org:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2267A619C1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 12:10:37PM +0800, Ginger wrote:
> Dear Linux kernel maintainers,
> 
> My research-based static analyzer found a potential order bug within
> the 'drivers/usb/misc' subsystem, more specifically, in
> 'drivers/usb/misc/ldusb.c'.
> 
> This potential issue is similar to a previously reported one
> (https://lore.kernel.org/linux-usb/2026042444-freeing-consumer-468b@gregkh/).
> It is present as of git commit eb3f4b7426cfd2b79d65b7d37155480b32259a11.
> 
> Potential concurrent triggering executions:
> T0:
> ld_usb_disconnect
>     --> usb_set_intfdata(interface, NULL); [t0]
>     --> usb_deregister_dev(interface, &ld_usb_class);
>          --> usb_minors[intf->minor] = NULL; [t2]
> T1:
> usb_open
>    --> new_fops = fops_get(usb_minors[iminor(inode)]); [t1]
>    --> err = file->f_op->open(inode, file);
>        --> ...
>        --> ld_usb_open
>              --> dev = usb_get_intfdata(interface); [t3]
> 
> In T0, the interface is nullified before its get deregistered. Thus,
> it is possible for T1 to still get the usb dev and access it via the
> interface, which, however, has already been nullified.
> The concurrent buggy order is t0 -> t1 -> t2 -> t3.
> 
> Thank you for your time and consideration.

If you think this needs to be fixed, please just send a patch for it and
we can evaluate it that way.

thanks,

greg k-h

