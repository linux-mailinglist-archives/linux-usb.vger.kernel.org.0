Return-Path: <linux-usb+bounces-33489-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFEkDbT6l2m6+wIAu9opvQ
	(envelope-from <linux-usb+bounces-33489-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:09:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A185A164E68
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16E2E30221EE
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 06:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7EF2F25F5;
	Fri, 20 Feb 2026 06:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oxRo2y3N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD961237707
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 06:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771567791; cv=none; b=QYdOtlg3Ct8oBNyeJpNYS7iyNsYXzEwRXaB8y8dMA0MvObX4w/S9JEWgh2jE7qWYw8CbzvUFldwww3Y9uE+PEeFvaSDuj7FL7euc6dEzkEyOytWewmZ9oXkv7h9FCTwmg6Wet8D3qp8ZHjfniWkg1vosnDV5uYmXKmvPODl+lAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771567791; c=relaxed/simple;
	bh=02ldnRAs5IrlSKH5eCJK9iiEuFvpHx9evK1GLRZkf20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlNlb72PYv/hTlEZtHkjzubDBZWGZk5U3lPD+NDKzzxDPBXaNOY4Xwz3Dzikz2DF4fY7BUX/8XNWH2/gURMLtrNjJEJmUVKY3sNJoukV10FziRVsXvBcBD3tjnbu0Sjy1d+h/jhancKG/sQtlkf3SkA9PB0NsConcREu9vXTg6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oxRo2y3N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23685C116D0;
	Fri, 20 Feb 2026 06:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771567791;
	bh=02ldnRAs5IrlSKH5eCJK9iiEuFvpHx9evK1GLRZkf20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oxRo2y3NtFXWe+ewVaE3pVtyWcZ6PoeVyJqzduoSiBxmONRADdKJz5Dg0m+/QAP6/
	 bbMLj82BGgH7kDAWLof+o61KSSN0mc6bK3SXWZsUgfRfZn8b4KpDLesQSMoBs0Wi0Z
	 noMDTUuD9WgLrlO227hPszMe06IRs4b92Zj65I/8=
Date: Fri, 20 Feb 2026 07:09:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 1/2] usb: typec: ucsi: validate connector number in
 ucsi_connector_change()
Message-ID: <2026022023-shakable-squatting-8747@gregkh>
References: <20260219164925.3249-1-nathan.c.rebello@gmail.com>
 <20260219164925.3249-2-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219164925.3249-2-nathan.c.rebello@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33489-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A185A164E68
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 11:49:23AM -0500, Nathan Rebello wrote:
> ucsi_connector_change() uses the connector number from the CCI as an
> index into the connector array without first verifying it falls within
> the valid range. The connector number is extracted from the CCI register
> via UCSI_CCI_CONNECTOR(), which returns a 7-bit value (1-127), but the
> connector array is typically only 2-4 entries.
> 
> A malicious or malfunctioning device could report an out-of-range
> connector number, causing an out-of-bounds array access.

Is this before, or after, the device has been bound to the driver?

thanks,

greg k-h

