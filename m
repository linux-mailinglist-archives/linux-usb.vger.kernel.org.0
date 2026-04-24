Return-Path: <linux-usb+bounces-36471-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEoxKOWG62lBNwAAu9opvQ
	(envelope-from <linux-usb+bounces-36471-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 17:06:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 263894607CF
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 17:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31C69301EC41
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2026 15:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6385929C35A;
	Fri, 24 Apr 2026 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yCCEooWM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73BB28850D;
	Fri, 24 Apr 2026 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043160; cv=none; b=TgvwzRAbbG1zZdCUUBNPL7ysn1gbgZggBbV2R423lbYZEDMUyeLCb6mdS40GiDUq2l/7Y+XUwdHbrAXipDIyXoCCNpbXKjQ2VAQROcMpsuMWcspRCw2T8+oW67XTcuZ1/dOU6NRXK9NYYcOYgiI3Cv/0G6/Og8zFZxwiQUBqvTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043160; c=relaxed/simple;
	bh=l5Q9AFMzlpKQVorlQSvGRFVl090Jmr1cSAG2/JHM6BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKC7pjScJsqMhdKgyjht+fosDlN+BJAN/wNiIH2np07Jeqc7JO73HeBBti6VY+o04UUcQKsVpzShtEg2kWsG89yHV3gYo5zAfiBGcaex98IZ+J6FP0hZvEIP73HU4rnqobbcZXVfZTnVm/EMx2heJft5Xs2eAcxhWwLk1XEJ0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yCCEooWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEE1C19425;
	Fri, 24 Apr 2026 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777043159;
	bh=l5Q9AFMzlpKQVorlQSvGRFVl090Jmr1cSAG2/JHM6BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yCCEooWMPEB9+bbxlos84GHr3SSnzALyagujdNk3p4XneIt3lB9D4lrwweYHoULQy
	 gsCb5TL92Up7QSzd9XrQFBbtmr8T2d43jwe6WcLGV7/4C5Aq+74PRp3LYptm874aB4
	 vTUh9bk12Bp12Rvp6AS9xjaJMFysqcZA4J8+JGbw=
Date: Fri, 24 Apr 2026 17:05:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ginger <ginger.jzllee@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [bug report] Potential order bug in 'drivers/usb/misc/yurex.c',
 mainly in 'yurex_disconnect()'
Message-ID: <2026042444-freeing-consumer-468b@gregkh>
References: <CAGp+u1atc_x1o18+Jk+0N+rWnN_RzmWYDAXT=H+oq8jwNdqLEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGp+u1atc_x1o18+Jk+0N+rWnN_RzmWYDAXT=H+oq8jwNdqLEg@mail.gmail.com>
X-Rspamd-Queue-Id: 263894607CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-36471-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]

On Fri, Apr 24, 2026 at 11:01:04PM +0800, Ginger wrote:
> Dear Linux kernel maintainers,
> 
> My research-based static analyzer found a potential orderbug within
> the 'drivers/usb/misc' subsystem, more specifically, in
> 'drivers/usb/misc/yurex.c'.
> 
> Kernel version: long-term kernel v6.18.9
> 
> Potential concurrent triggering executions:
> T0:
> yurex_disconnect
>     --> usb_set_intfdata(interface, NULL); [t0]
>     --> usb_deregister_dev(interface, &yurex_class);
>          --> usb_minors[intf->minor] = NULL; [t2]
> T1:
> usb_open
>    --> new_fops = fops_get(usb_minors[iminor(inode)]); [t1]
>    --> err = file->f_op->open(inode, file);
>        --> ...
>        --> yurex_open
>              --> dev = usb_get_intfdata(interface); [t3]
> 
> In T0, the interface is nullified before its get deregistered. Thus,
> it is possible for T1 to still get the usb dev and access it via the
> interface, which, however, has been already nullified.
> The concurrent buggy order is t0 -> t1 -> t2 -> t3.

Great, can you send a patch to fix this?

thanks,

greg k-h

