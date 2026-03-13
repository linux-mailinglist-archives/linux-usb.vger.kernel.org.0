Return-Path: <linux-usb+bounces-34725-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GO0IMx64s2nbaAAAu9opvQ
	(envelope-from <linux-usb+bounces-34725-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 08:09:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 477AD27E852
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 08:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0437D300BC49
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67152381AF;
	Fri, 13 Mar 2026 07:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JyIJBBx9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24236604A
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385742; cv=none; b=lhyA1X/Er8qRTUeBhL8DRtQ26dUJDKczyc9WP9UmfUZRUQKJl/+HobmFNK+QAv382+FYhiKn8Vi5yi78gH80VH31u9syfI4R/IekibObd4mWCVnBXMmTNQYdBHQafGHWUfPSPk9FSdClf3OqWJITcM3ifJnNh+iU531wBulqpHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385742; c=relaxed/simple;
	bh=2JmEn35Nt09B4Km6j8epEOo0GxfeT07GF86NKCQ5/+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbYNad5OZznrreIu5Sh7aPI3QJ4sD1oL+UHeg4DGX4KKmTajj4rMOzaFo6VovwEsGFgMwSfw8AGAk22bLkIjwhSd677pdFswhtnllh4Vk3NHqmDcOdw0zyCQ+yi+YvS9R8HhmlyU2KWl24jtuXTKzRoF1PhDwOrR6fHmbfZZw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JyIJBBx9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8783C19424;
	Fri, 13 Mar 2026 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773385741;
	bh=2JmEn35Nt09B4Km6j8epEOo0GxfeT07GF86NKCQ5/+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyIJBBx9jBM/Hg4bMPt/2f3mueJlGVEmUR7jgaHr+hJ0Mdzp3c3IpIzBKlfUB7S7m
	 9Hvx7Z8ZAGLHMViQhjKRzh4sUZk5UMotWj2gmWv/GKMDrmLJwu86LWPjovGzS9wiSH
	 7/9uzUjKYnjJrZ/MS3nmmfTWeLBdD5t1ooGq+oKc=
Date: Fri, 13 Mar 2026 08:08:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: CaTaTo <vahnenko2003@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
Message-ID: <2026031331-overrun-palpitate-71c4@gregkh>
References: <966898e9-229d-495a-bef1-07ce5d2ad640@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <966898e9-229d-495a-bef1-07ce5d2ad640@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34725-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 477AD27E852
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:10:34PM +0300, CaTaTo wrote:
> This is related to https://bugzilla.kernel.org/show_bug.cgi?id=221216, I
> attached changed file, sorry again for this is not actual git patch, I made
> this off repo as an quick test fix, I tried make patch from diff, but it
> wouldn't apply for some reason. I added 2 lines on 596 and 597.

That's odd, did you take a look at the documentation for how to make a
patch?  Take a look at Documentation/process/submitting-patches.rst

thanks,

greg k-h

