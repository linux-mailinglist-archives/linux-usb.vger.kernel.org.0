Return-Path: <linux-usb+bounces-37568-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM9pCGyiCmqL4QQAu9opvQ
	(envelope-from <linux-usb+bounces-37568-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:23:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17F56617D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B5F9302675F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 05:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7417F395DAA;
	Mon, 18 May 2026 05:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rGIKvhoz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D071E391842;
	Mon, 18 May 2026 05:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779081572; cv=none; b=AQXLgVGTeCoh/5wpf3zgIiFMRnUH9ZFZde0PrntDNCiAmahSnrWAt5/LYj6uGTohJCgmLhlxEfCTyhIvQ0uDj5Au0krCzDBvHPTSj4v+xG2gTFvE2IpkKCYule0O13weM1CopFGax+KDoylHcrbl17e3xg+9ZnIP1fyJ4f1mLRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779081572; c=relaxed/simple;
	bh=XgQnF6E0hAXr6C9UwWwmqeWHxO+ZWi4UQXpwE9r8/G8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVVIgTM/dcWMKRM5L/D6RFBWnXYB9qO4dtY+/MdoodQB3gwtiMlJY1Nr3N6i6byRQm0qDlAdIW/WxQm/HwGoJe4aHAHR01udMCluiFSPxPw/MByvbNU5vJioyYwxhuaUhB9WZgM0jBr92AmJ0mSzS3tYGPAO4s41F4MAmbFXu8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rGIKvhoz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4094CC2BCC6;
	Mon, 18 May 2026 05:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779081571;
	bh=XgQnF6E0hAXr6C9UwWwmqeWHxO+ZWi4UQXpwE9r8/G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGIKvhozLSXeCYWhzC4u7R2BzYZBco3T+605zkBuJdO+CZmc08eCy3bfF47GqNcnY
	 CK/YhfpCY13dvdad5wztkvlUdUe6iB56l6/s5r5e7Pwv2YqA2Yjn08ABqEk48nXkjQ
	 2QEd9tkqk9zNxHCJiayyWlQTWkYCHkCJmqpzog9g=
Date: Mon, 18 May 2026 07:19:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Seungjin Bae <eeodqql09@gmail.com>
Cc: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: max3421: Fix shift-out-of-bounds in
 max3421_hub_control()
Message-ID: <2026051801-manual-helper-c7b3@gregkh>
References: <20260517000145.1868817-2-eeodqql09@gmail.com>
 <2026051731-ripeness-wipe-ebf6@gregkh>
 <CAAsoPpXhyaWp98Mge3zXz8a9XGJoL=MG-+iL3E=B7GBf_EVRmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAsoPpXhyaWp98Mge3zXz8a9XGJoL=MG-+iL3E=B7GBf_EVRmA@mail.gmail.com>
X-Rspamd-Queue-Id: 8D17F56617D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37568-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 02:19:07PM -0400, Seungjin Bae wrote:
> 2026년 5월 17일 (일) 오전 1:49, Greg Kroah-Hartman <gregkh@linuxfoundation.org>님이 작성:
> >
> > On Sat, May 16, 2026 at 08:01:46PM -0400, pip-izony wrote:
> > > From: Seungjin Bae <eeodqql09@gmail.com>
> > >
> > > So if a malicious userspace task with access to the root hub via
> > > /dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
> > > greater than or equal to 32, the left shift operation invokes
> > > shift-out-of-bounds undefined behavior. This results in arbitrary
> > > bit corruption of `port_status`, including the normally-immutable
> > > change bits, which can bypass internal state checks and confuse the
> > > hub status.
> > >
> > > Fix this by rejecting requests whose `value` exceeds the shift width
> > > before performing the shift.
> > >
> > > Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
> > > Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> > > ---
> > >  drivers/usb/host/max3421-hcd.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
> > > index 0e17c988d36a..3d6b351dcb1a 100644
> > > --- a/drivers/usb/host/max3421-hcd.c
> > > +++ b/drivers/usb/host/max3421-hcd.c
> > > @@ -1694,6 +1694,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
> > >                                               !pdata->vbus_active_level);
> > >                       fallthrough;
> > >               default:
> > > +                     if (value >= 32)
> > > +                             goto error;
> >
> > Cool, what tool found this?  I've been running some static checkers and
> > I don't think it turned this one up yet.
> >
> > thanks,
> >
> > greg k-h
> 
> Thanks for your interest!
> 
> It's a KLEE-based symbolic execution tool I've been developing for
> kernel drivers. It's still a work in progress, but I'd be happy to
> share more details and the tool itself once it's in better shape.

As per our documentation, you MUST document the fact that you are using
a tool to find/fix things.  Please fix up our newly submitted patches to
include that information.

thanks,

greg k-h

