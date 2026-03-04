Return-Path: <linux-usb+bounces-33986-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCjxGUJYqGlQtgAAu9opvQ
	(envelope-from <linux-usb+bounces-33986-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:05:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA81203ABB
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4B9C328D06A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 15:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38AB34F484;
	Wed,  4 Mar 2026 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gOoDmoGy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB0C34BA21
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638535; cv=none; b=kUIMgkKzY8KVme5QD1NSJn/wpojHHYyuGaY+md6devue6wZYCAj1JbhBOkSkCJgU3KtlKPHF1V3wgIs313qPdsKp5Vqhrm+3VmZxxYBcsLOwzADM+MsVr3cHW/u82c3mNKXLaxpHzE+yWYxckkDWOzpF5VIO0TKPheZNsd87KMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638535; c=relaxed/simple;
	bh=J1cxwXMs2xeUzTohEKnOqx2b/dPmJZS4nycRD65DbLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gz0DhXIlKJIFs8gJUZhWIbz5qFPLYs6OGjNsxDIzc9gae8fxo9saOYoYHstjdQg/OUumnUTdJrHgpJ94/RNISaum+LM6IbaBYhGp/FboLyZu51+H7vuV8lM8SULXoWtkmxxIhVtrwiou7HmhWCsYyoqmOPmr3vql75Ur5YJdOlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gOoDmoGy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B88C4CEF7;
	Wed,  4 Mar 2026 15:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772638534;
	bh=J1cxwXMs2xeUzTohEKnOqx2b/dPmJZS4nycRD65DbLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOoDmoGyvNAT5Y/1+kwlVXpJg4ViUsiy6l8vWMl0nQRf/8ZaXuW8Wii2FXeRd8Mex
	 4ZS7IRrIynEd1RY8ot6KiKsWhf7HoB2XfAR6YSLZka4MqNLdrpZI4oRfFi8ByOcnX4
	 6HcttYI+iAm7VnYuoN+fC7KbThxC+Zk86ffTcT+o=
Date: Wed, 4 Mar 2026 16:35:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [PATCH] usb: class: cdc-wdm: fix reordering issue in read code
 path
Message-ID: <2026030408-concept-relish-4ab2@gregkh>
References: <20260304130116.1721682-1-oneukum@suse.com>
 <CALbr=LZLTrAHLVeE2twUoHb=S=RCEnhZMjp77E-ZUU2_Krtb6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALbr=LZLTrAHLVeE2twUoHb=S=RCEnhZMjp77E-ZUU2_Krtb6g@mail.gmail.com>
X-Rspamd-Queue-Id: BEA81203ABB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33986-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,linuxfoundation.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 09:43:47PM +0800, Gui-Dong Han wrote:
> On Wed, Mar 4, 2026 at 9:01 PM Oliver Neukum <oneukum@suse.com> wrote:
> >
> > Quoting the bug report:
> >
> > Due to compiler optimization or CPU out-of-order execution, the
> > desc->length update can be reordered before the memmove. If this
> > happens, wdm_read() can see the new length and call copy_to_user() on
> > uninitialized memory. This also violates LKMM data race rules [1].
> >
> > Fix it by using WRITE_ONCE and memory barriers.
> >
> > Fixes: afba937e540c9 ("USB: CDC WDM driver")
> 
> Closes: https://lore.kernel.org/linux-usb/CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com/
> Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> 
> Looks good for the immediate fix.
> 
> As a long-term solution, refactoring this to use kfifo would be much
> better. The race condition I reported is just one example of how this
> ad-hoc lockless implementation can fail. Hand-rolling lockless
> algorithms is highly error-prone and likely hides other subtle bugs.

Again, great, please submit patches to do this.  It was done "recently"
for the tty layer, so perhaps take a look at that work to see how it can
be done, and the issues involved.  I'd be interested if it changes the
throughput and code size any (probably not on throughput given the slow
speeds of USB, but code size might be more interesting...)

thanks,

greg k-h

