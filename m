Return-Path: <linux-usb+bounces-35291-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Gk0xL/RGwGkqFgQAu9opvQ
	(envelope-from <linux-usb+bounces-35291-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 20:45:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 676812EA885
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 20:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8DA3300AB38
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 19:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A9329BD91;
	Sun, 22 Mar 2026 19:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m8CYQ7tn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF5640DFC5
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 19:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774208752; cv=none; b=effbG0A7MqpKZN6hDZ+E3/ZwiSZpZ7EWnUtoE/RMSyKSZxgEowmFLBO0/ANZJqqrhlZq8DljibsHvMDIN5CImruf+35JFxCj9QrkHjarH8DRIeIH8zvMDgqROBAa04xiIhAZfrFGtgkN2VZo5DONzUqn8uE5yX7BxtK9+akrr8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774208752; c=relaxed/simple;
	bh=DNiRHDrn2qWTU1PuQ0XTO53zGXXZC+ZPbaD40hBhsdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnqJ/DjhYFEO49HYtTJ7MTNC/425GrndB10JpiuiVjSSrKp4uoczsfLqAnhLG4UFqCKv1xt2iNIzj3G1Ta7OJqr+/vPH168j6KvCOu7dO0ZUnCUqhoogN3Mnr5JNQvKBpvCm9vmtc5OjnxHZfp+ck8AUvb15Th+eDAhJAyJN5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m8CYQ7tn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002C3C19424;
	Sun, 22 Mar 2026 19:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774208752;
	bh=DNiRHDrn2qWTU1PuQ0XTO53zGXXZC+ZPbaD40hBhsdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8CYQ7tnGnopAPpX/1D4lWFykiLtfOI1YnnF+P/7OfU4o4SsemDpaaQH6WL4YxHGJ
	 ZuafLZ7Xc7GIVGfGDCH9qQLugSonko8yRkgkjBwmJtrz21uF9veoafnHuIQvykKxLw
	 VIBq12B2FY3Q97JUh9Cs2zaMeKdA58MsU45lhkeU=
Date: Sun, 22 Mar 2026 20:45:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Francois Scala <francois@scala.name>
Cc: linux-usb@vger.kernel.org
Subject: Re: Caldigit TS5+ problem with work in progress patch
Message-ID: <2026032244-imprint-reverb-32d0@gregkh>
References: <7333738a-8364-42fa-b334-c4dc4b0ee503@scala.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7333738a-8364-42fa-b334-c4dc4b0ee503@scala.name>
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
	TAGGED_FROM(0.00)[bounces-35291-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	URIBL_MULTI_FAIL(0.00)[linuxfoundation.org:server fail,archlinux.org:server fail,sea.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 676812EA885
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 05:37:11PM +0100, François Scala wrote:
> So I started to work on a patch to handle this situation (available for
> kernel 6.19 here: https://gitlab.archlinux.org/fs75/linux-ts5plus/-/blob/v6.19-ts5plus-test/ts5-test.patch?ref_type=heads

Great!

> My question is: how do I get my patch reviewed/merged ?

Did you read Documentation/process/submitting-patches.rst ?  That's the
place to start.  You might want to start by running
scripts/checkpatch.pl on your changes, I see a bunch of minor coding
style issues that you can easily fix up.

thanks,

greg k-h

