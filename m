Return-Path: <linux-usb+bounces-37930-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEY8JDk0EGqqUwYAu9opvQ
	(envelope-from <linux-usb+bounces-37930-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 12:47:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE25B26D2
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 12:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BAA0304D734
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 10:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068A13911CE;
	Fri, 22 May 2026 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KuIODNQ6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676B83C73D7;
	Fri, 22 May 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446381; cv=none; b=FsX4J9NxqK/OZ/4dhsVLayhZFy3eTb4n9Wnzjwiqb6Tge8yh3Y381TTyymcvarI3FrfdXlX3bJ5s9lvEQeNas38XIvytg9z0QJunVtFVlaC1foyr68tu5xF5L6ozleRQLlBm0Ad3Yz9Z6jDbg2Ea4jRotTizGQ14veYdZbKnX0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446381; c=relaxed/simple;
	bh=3SS85W7AN4kgeLXRo41OHOunVnR7aevl5WaTAw9IfUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8PQYK7jv3JedI6No9jcSeLv4E3uf/Z7op/hlv1MOowZsyOJ3HEeRMf1KqHVRI8BBwTEvVRIoUy8JHvpL9DgM27MTLDktwXYX0giEPDqZ9qMjPYJWNsi8BhYAptqoZUG4iETToc0PeyPlxmR+vQsO3l+LuFNmcdPS8GyIkgaMWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KuIODNQ6; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B0C1F000E9;
	Fri, 22 May 2026 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779446380;
	bh=U31A1LWQEZQv+LXroB0X1eI2M0JFE0ukry7xzNzoeUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KuIODNQ6OOHoGo0cYLFvHrt8YEexkoIAL1K0N6viXROOtJhO8a77nfiqROjVskwpL
	 MnXLfvttc46h8p3cOWyNakyuhjw7emDfPeX1IFqIHwTOX6Rd6zfc58ZBpwLip643h9
	 FBbCsSuVqIdymM+Wfr5shwZ9OXXghUOYScMckaX0=
Date: Fri, 22 May 2026 12:39:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	George D Sworo <george.d.sworo@intel.com>,
	Matt DeVillier <matt.devillier@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: check for a pending command completion during
 command timeout
Message-ID: <2026052218-starboard-reach-5db4@gregkh>
References: <20260522085828.24142-2-pmenzel@molgen.mpg.de>
 <20260522085828.24142-4-pmenzel@molgen.mpg.de>
 <2026052213-deserving-oppressor-bb81@gregkh>
 <fdb02568-2267-49b7-bfab-f4159d211863@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdb02568-2267-49b7-bfab-f4159d211863@molgen.mpg.de>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37930-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,linux.intel.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim,intel.com:email]
X-Rspamd-Queue-Id: EFFE25B26D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 11:35:47AM +0200, Paul Menzel wrote:
> Dear Greg,
> 
> 
> Am 22.05.26 um 11:23 schrieb Greg Kroah-Hartman:
> > On Fri, May 22, 2026 at 10:58:27AM +0200, Paul Menzel wrote:
> > > From: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > 
> > > It's possible a command times out even if xHC hardware already completed
> > > the command. Driver is unaware of the command completion if interrupt
> > > handler is blocked for a long time.
> > > 
> > > Check if there is an unhandled command completion on the event ring during
> > > command timeout.
> > > 
> > > In this case just give the command additional time to complete. There's no
> > > point in aborting the command ring to move past a stuck command.
> > > 
> > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > Signed-off-by: George D Sworo <george.d.sworo@intel.com>
> > > Link: https://chromium.googlesource.com/chromiumos/third_party/kernel/+/478ab723af9414b0a2a2fbc59ac34f5d319a4fc3
> > > [pmenzel: one adaptation for mainline 7.1: next_trb() uses the
> > >    2-argument form next_trb(&seg, &deq) — the mainline 7.1 signature
> > >    dropped the xhci and ring arguments present in the 6.12 source the
> > >    patch was ported from.  xhci_pending_interrupt() is used directly as
> > >    it is now committed as the preceding prerequisite.]
> > > Assisted-by: Claude Sonnet 4.6
> > > [pmenzel: No devices with the problem available, but no regressions on
> > >    Dell XPS 13 9360 and QEMU 7.2.0.
> > > 
> > >        qemu-system-x86_64 -enable-kvm -cpu host -m 3G -device qemu-xhci,id=xhci -device usb-storage,bus=xhci.0
> > > 
> > >    xHCI host controller initialised cleanly, USB 3.0 SuperSpeed root
> > >    hubs and USB mass storage device enumerated without errors.
> > >    The specific race (command timeout with blocked interrupt handler)
> > >    cannot easily be forced in QEMU, but no regressions in the normal
> > >    command path were observed.]
> > 
> > What are these additions from?  Did you mean to send these out to the
> > lists?
> 
> Yes, they are authored by me and meant for the list. I wanted to document,
> where I got the patch from and how I tested the change. Feel free to remove
> them.

These make no sense, please remove them yourself and resend.

thanks,

greg k-h

