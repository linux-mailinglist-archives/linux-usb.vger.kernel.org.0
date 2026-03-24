Return-Path: <linux-usb+bounces-35399-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APcIHt6uwmkyggQAu9opvQ
	(envelope-from <linux-usb+bounces-35399-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 16:33:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CA33181C0
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 16:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD2BB30834A7
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 15:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25834406286;
	Tue, 24 Mar 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kjIORTYP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E01405ADC
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366119; cv=none; b=byL9bWwlFl0teyP726YF+Id8IXy+c9OhorLnOw3j3PlEgAvNhS+VVdK+6Va3IS4LshJ9k99UI7O2fRljhlipN1XBjODx3qFBrGzHORo2mvB1E+grywGXUrrMfJdIuCVRHiSWsw2USOgh4QUmujJ6Y2gYAoX7jKFg+qBYLnON5Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366119; c=relaxed/simple;
	bh=eq89uO/iGvH1puHXptrRmddhmGCGk/loZxnweyrl7pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWdcah/C8WpxLzelJXnC1BRhyOClVIFE5eIczsf442gl0JzbQbU81HXd/BLB9y+rfFvAzps6LQSTJB5IgnJuFJm0o4EZJDO3lLOdKFTfdbMUURYa53xdUzzc6PP3BUejDxyQK+tVZN8znaze48HL0Kc4+tVl5qrEJBDzrrTQxz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kjIORTYP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED983C19424;
	Tue, 24 Mar 2026 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774366119;
	bh=eq89uO/iGvH1puHXptrRmddhmGCGk/loZxnweyrl7pc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kjIORTYPHSPrRxuUBwedN2Q91+qStcxv2IxFxenYbw8WWWDaX5LnMOnYu+dD01dDW
	 dH/Wr5E6FuNxqy/Egt+HBQZkwDoB5ibJhnxuwwywoTt+HUj+MZlhjt1edYmmlb21Eg
	 cm3OAAvRkD4XWbYEKH78Y/uFKUu+q5ifFVL+fvkg=
Date: Tue, 24 Mar 2026 16:28:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Zimmermann <sigmaepsilon92@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Oops when rebinding f_hid while /dev/hidg* is still opened
Message-ID: <2026032431-chance-dodge-6b6e@gregkh>
References: <CAN9vWD+13DHCyjq+7hYgTSDx87TLtKXV9-8GMnZPuZnYvjyANA@mail.gmail.com>
 <2026032337-resend-recolor-efc5@gregkh>
 <CAN9vWD+N6K4VExNgnhp=amfBDJTFN9Sz156qsy550dP-d1S9Qw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN9vWD+N6K4VExNgnhp=amfBDJTFN9Sz156qsy550dP-d1S9Qw@mail.gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-35399-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: E3CA33181C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 06:11:27PM +0100, Michael Zimmermann wrote:
> > This bug has happened a lot on many gadget drivers, I think we fixed a
> > bunch of them already, can you verify this is still an issue on the
> > latest 7.0-rc4 or 6.19.y kernel release (6.17 is very old and obsolete
> > and insecure, don't run that thing...)
> 
> Apparently, Fedora updates their images very rarely and they need a
> package manager update, sorry about that.
> 
> I now tested it 6.19.8-200.fc43.aarch64 and the bug is still there. I
> then switched to testing with buildroot, because that makes it easier
> to test different kernel versions. There, the behavior is a bit
> different but there's still a bug: Instead of immediately triggering
> an oops, everything appears fine on the first run of my script. But on
> the second run I see this:
> [   81.514126] refcount_t: underflow; use-after-free.

Ok, something is not being initialized again properly.

Take a look at the patch series at commit 41f71deda1c1 ("Merge patch
series "usb: gadget: Refactor function drivers to use __free()
cleanup"")

Perhaps something like commit 42988380ac67 ("usb: gadget: f_ecm:
Refactor bind path to use __free()") should be done for the f_hid
driver?  Can you work on that as you have a way to test this well, or do
you want a patch to test?

thanks,

greg k-h

