Return-Path: <linux-usb+bounces-34698-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLHINWP4smmLRAAAu9opvQ
	(envelope-from <linux-usb+bounces-34698-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:31:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F53276919
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7A08307F280
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 17:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E892E62C0;
	Thu, 12 Mar 2026 17:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n5G1m3bf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A07212542
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 17:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336637; cv=none; b=arXflsm5ygW50uBbGxsq/RGjEJ92hLuMNJA20hpBPpKe9Vctn6TsV8MYASo0lJBEGz24tQit0K5wrc6tC9SyF1XZVW5ixQlPn9ajQKEWooL3yMzKHuj/3imTxsG4hhU9r0b4k/CqR8Bab0GOgOUzSd0BFE6+zhAAYZZ/+9k6+0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336637; c=relaxed/simple;
	bh=jzfxmzlin2B0Zo/EPs2Whh0ud13VJLiqljUK4l6501U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIjdVqJkEMMcRF9vnuUQbO/0kPtETnpq8owCmOXccYzOBS1HQuijqMwQ3smNqk3wNyYLkAo3PDsNJ32br5tPk483D0iJuGJ+1xRTceS5funS905A+r/I4JzbHaECgqLZcOhmm64GTOvBjBqdoZ8er4zCyCCpK8qkOXKSNZ1dq1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n5G1m3bf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FD5C4CEF7;
	Thu, 12 Mar 2026 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773336637;
	bh=jzfxmzlin2B0Zo/EPs2Whh0ud13VJLiqljUK4l6501U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5G1m3bf9NbgrCZR4D5muZoS4s06M6ksoU7PhnfvwOfvYFMiuwqXP71H74KzxrQzh
	 20gF4nXHVZYyv+XNd/pqKJaMdX8Q7Qi/J538PdoMc+g35m4S3r20hDS2GNDB+X5Jdc
	 Y6FYxYAPM/rDdEXEph4j6dEDvPK43haREMdlY8Sw=
Date: Thu, 12 Mar 2026 18:30:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 221216] New: ezcap401 needs USB_QUIRK_NO_BOS to function on
 10gbs usb speed
Message-ID: <2026031206-blissful-overlap-b484@gregkh>
References: <bug-221216-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-221216-208809@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-34698-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 68F53276919
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 05:15:47PM +0000, bugzilla-daemon@kernel.org wrote:
> Hello, my new capture card works only in 5gbs usb speed, with deepseek's help I
> applied { USB_DEVICE(0x32ed, 0x0401), .driver_info = USB_QUIRK_NO_BOS }, to
> drivers/usb/core/quirks.c quirk and now it's working at full speed.

Can you send a patch that adds this entry to the kernel so that you get
this fixed properly?

thanks,

greg k-h

