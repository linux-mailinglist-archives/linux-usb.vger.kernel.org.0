Return-Path: <linux-usb+bounces-33992-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBk/NvVdqGmZtgAAu9opvQ
	(envelope-from <linux-usb+bounces-33992-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:29:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8E20445E
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5792302C931
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 16:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16B234CFB3;
	Wed,  4 Mar 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yAh+Tg1u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DD33E7;
	Wed,  4 Mar 2026 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640706; cv=none; b=VQ179dcXXKFej/V5q6gG186Y+OUMKZxkxR4uoOUTkLiTcYses3oYQcbKhltXDmmvPDfsKMKr8cGLuuGw7JrJd1tMZiEsOYZNDFdU1rcyiMYtLW3lHNxAIM8Ht+3QQx2kcU/NwhBZJfFKhy9acYBYmm0DuDyZ42qXMyV4epuMWK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640706; c=relaxed/simple;
	bh=qk4doE/6U6idW6ZjQOxlCDoRpBaNMvr1KYawbH7dg44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guABQQACf5DxLEG/vh4mqCQsiYZVzELhbtZTyuG6GLF3qxne2vRm5XYm2sxi52p8tlrWAgSGvOf4NhSjIMDwVTlFTDQpD1JMNUQAfQdO09YO90RxNlPr25SzZ81J8WtCBRiYp0HB+h6JzOmViPX1429b1m9iq3W8GtJ0prZUI6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yAh+Tg1u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2C9C4CEF7;
	Wed,  4 Mar 2026 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772640706;
	bh=qk4doE/6U6idW6ZjQOxlCDoRpBaNMvr1KYawbH7dg44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yAh+Tg1uQeXE0vS0SKwy26+9UAlLOYPZAVhAQzt3Z7EfLFGq9u0vAZwexwyebYehb
	 P2jonRbK8cWJ2oc5rSEiGGU8YrGL0e9byL/U0kjIJM6ruWBRtTSxCVt5Vzc6qc9C/m
	 JTAkgjgi28ildUqEYWgE7mhCi2btsqxkwwIf1E2M=
Date: Wed, 4 Mar 2026 17:11:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: core: remove unnecessary goto in
 usb_create_newid_files()
Message-ID: <2026030412-trace-sneer-60bf@gregkh>
References: <20260304155812.4559-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304155812.4559-1-marusik.adamenko@gmail.com>
X-Rspamd-Queue-Id: 62C8E20445E
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-33992-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:58:12AM -0800, Mark Adamenko wrote:
> The goto to 'exit' only returns the already initialized variable
> 'error', which would be 0. At that point it could not yet be anything
> else. Replacing with an early return 0 removes the
> need for the label entirely.

Odd text wrapping :(

> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
> v3: fix missing return statement at end of function
> ---

You forgot the other versions listed here :(

>  drivers/usb/core/driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

But first, why?  There's no real need for this change, why make it at
all?  It follows the "standard" way of jumping to the end of the
function to exit.  What tool asked you to make this change?

thanks,

greg k-h

