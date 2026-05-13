Return-Path: <linux-usb+bounces-37376-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFz+BtxTBGp/HAIAu9opvQ
	(envelope-from <linux-usb+bounces-37376-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 12:35:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B2C5315C5
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 12:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10C48303618F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3303BAD96;
	Wed, 13 May 2026 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kSr94M6Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A10387347;
	Wed, 13 May 2026 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668502; cv=none; b=bs+0ONbuAvgRK0PrVpSMsRLYnSVnoR0kKOODLyYkHOddaM0hPyZDmhLPndA5SdIxXKT9hu9ciAs4iZ7Y9eaSHw2wmAsHSDWEjnBLuuUOZezapsdqWj6J9n9q7m14rj/8nooSOU02RvlJHEzDS+E4yajLE81Y4QtdyI1+ce+L6V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668502; c=relaxed/simple;
	bh=vJzmSQDI+kPOU4dG6WYjc2WqLxKtDKAaNkpx0gfXFr0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvGjo4PGXC7HTIVSZVQgloVXm2hkbxKD/cEWJ76XrYNp1sEzxPY3zgng5CPvmTpRuMgh5+cVDBniuhc9JDOT+cgvP0HldAsHPu6EO68SALXY2iQwHqMU2KceSHMJCUJcc3KRxMKumxiroPKsB4HNuPYOrMfc8oLTE9XJypzmLBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kSr94M6Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC07C2BCB7;
	Wed, 13 May 2026 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778668502;
	bh=vJzmSQDI+kPOU4dG6WYjc2WqLxKtDKAaNkpx0gfXFr0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=kSr94M6YamK9Oud9Jk2769IHML0qw4O1sgmSzCnAUKAOR/0Tu862ZhukHAPd/XAxf
	 5IIOqt8BIyIvAXcsr8P0wtVNYVb5MdUkmnb0/LIBjVwoQTwiq9QChFM0+M9HfYwWyA
	 zk4039LNrxInjph8+Z7BPJjfysXxXcQTtO5WbPCg=
Date: Wed, 13 May 2026 10:48:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>,
	Crescent Hsieh <crescentcy.hsieh@moxa.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] usb: serial: mxuport: add sysfs control for UART
 FIFO
Message-ID: <2026051321-apply-charting-150e@gregkh>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-5-crescentcy.hsieh@moxa.com>
 <afy2yeDTHiVFkPmy@hovoldconsulting.com>
 <agMO03V9xppAtWjf@moxa-ThinkCentre-M90t>
 <agQ0RRpE27ComUnV@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agQ0RRpE27ComUnV@hovoldconsulting.com>
X-Rspamd-Queue-Id: B7B2C5315C5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37376-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 10:20:21AM +0200, Johan Hovold wrote:
> On Tue, May 12, 2026 at 07:28:19PM +0800, Crescent Hsieh wrote:
> > On Thu, May 07, 2026 at 05:59:05PM +0200, Johan Hovold wrote:
> > > On Tue, Mar 24, 2026 at 11:50:41AM +0800, Crescent Hsieh wrote:
> > > > Add a per-port sysfs attribute, uart_fifo, to allow userspace to enable
> > > > or disable the UART FIFO at runtime.
> > > 
> > > Why would you want to do that?
> > > 
> > > We should try to avoid driver specific sysfs knobs.
> > 
> > The motivation is to allow userspace to choose between lower latency and
> > higher throughput at runtime. Some latency-sensitive request/response
> > deployments become unreliable if the UART FIFO is enabled due to the
> > added buffering delay.
> 
> Please mention this in the commit message.

Wait, no one should EVER be relying on USB for latency-sensitive
situations.  USB does not guarantee this at all, and if you put a uart
in the way, like you are doing here, that just makes it even worse and
even more non-determinisitic.

Please don't think that this is even a viable solution, it is not.  And
no papering over it in the kernel will ever give you the requirements
that you need, so please do not do this.

Just use a "real" uart on a PCI bus if you expect anything close to
determinism.

thanks,

greg k-h

