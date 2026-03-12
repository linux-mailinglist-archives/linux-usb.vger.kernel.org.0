Return-Path: <linux-usb+bounces-34640-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPPDCixJsmn8LAAAu9opvQ
	(envelope-from <linux-usb+bounces-34640-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 06:03:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2126D43C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 06:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6E27301D0D3
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 05:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1E238911A;
	Thu, 12 Mar 2026 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nIr7rLhU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7CC1B4F1F
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291817; cv=none; b=XHX6bKhuvpNBuPGVHd7VNy49ZA9Zedu9t2vvR/p8W1lljiilsET8MH+KJg5cWfRXmXKSS0fIowlWSWfh8cdd0Lsy1J8ieYsdNciP9G6pKb2J4TwPe6VXmAgYJrvNkaQHC+OnXGsB889Ysa0spC0yWQSvIkSaRq7PRCpWsfVcMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291817; c=relaxed/simple;
	bh=nxiv8hO2+qUyeknALpt6BxKz0qDw2EXZFokiKa8XEW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVe9Lqe8uU/HcFAS/XSBt7spTZb8JlFImgsvvcXYdeP8YoVUR3tJBBxnW3sP4na78gjAibjAurHelopoHiEJVDiVbYkX4BGOd2wFciMemSvf0DO3TJ0uac6paOWcKEQc8rAqteboKbBl2pylPFIDrEcSriBuW9CAsncx9blduUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nIr7rLhU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF85C4CEF7;
	Thu, 12 Mar 2026 05:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773291817;
	bh=nxiv8hO2+qUyeknALpt6BxKz0qDw2EXZFokiKa8XEW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIr7rLhU+HqJFtA3mizgNc/83sW+QYf2pZ2sjbb3I3syRkWYv3alPsKlge7Ojp0u4
	 pkOJsdZeYGIRJR1v+eyPu1ZrqX8/6/hHwacxELSS0BDSpfgrInJYpQR6AOCU+7Ix/P
	 fJBtUmaV95Fz5OeKT5qr3dQ6DJmdyIlNf60/6ewc=
Date: Thu, 12 Mar 2026 06:03:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
	kyungtae.kim@dartmouth.edu
Subject: Re: [PATCH 1/2] usb: typec: ucsi: validate connector number in
 ucsi_connector_change()
Message-ID: <2026031206-many-halt-cb1b@gregkh>
References: <20260219164925.3249-2-nathan.c.rebello@gmail.com>
 <2026031109-scrunch-aviator-0e2b@gregkh>
 <20260311214936.1045-1-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311214936.1045-1-nathan.c.rebello@gmail.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34640-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BAB2126D43C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 05:49:36PM -0400, Nathan Rebello wrote:
> On Wed, 11 Mar 2026 at 14:10:28 +0100, Greg KH wrote:
> > Shouldn't this return an error and have the caller stop what it was
> > attempted to do?  When this is called in ucsi_init(), the
> > num_connectors is already parsed, so how can this be wrong?  Shouldn't
> > these values all be verified in one single place and then if any of the
> > descriptors are "incorrect", the device rejected at that point in time
> > and not require "deep" changes in the logic here to try to find these
> > types of errors?
> >
> > in short, let's validate the device once, and after that is done, we can
> > "trust" that it is correct and not need to check this stuff all over the
> > place.
> 
> The CCI connector number can't be validated at init because it's not a
> static descriptor -- it arrives fresh with each runtime interrupt from
> the CCI register. The device can correctly report num_connectors=2 at
> init time, then later send an interrupt with connector_number=50 in the
> CCI. This is the same class of issue already handled at line 1840 in
> ucsi_init(), where buggy firmware sets a reserved bit in num_connectors
> and a defensive check was added because it "happens in buggy FW."
> 
> Without a bounds check, an out-of-range connector number indexes past
> the connector array into adjacent heap memory, and the resulting pointer
> is passed to schedule_work() -- dereferencing whatever function pointer
> happens to sit at that offset. A single buggy interrupt could crash the
> kernel.
> 
> The closest single validation point is ucsi_notify_common(), the sole
> entry point where the CCI is parsed before calling
> ucsi_connector_change(). A one-line bounds check there would cover all
> backends and all call sites.
> 
> Happy to send a v2 with that approach if acceptable.

Yes, please do that as we need central points where data is validated to
help keep the code sane.

thanks,

greg k-h

