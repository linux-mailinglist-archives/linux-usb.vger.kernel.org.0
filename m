Return-Path: <linux-usb+bounces-33125-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOH2B2zUhGlo5gMAu9opvQ
	(envelope-from <linux-usb+bounces-33125-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 18:33:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2535F5F8F
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 18:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80AB3301F17A
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 17:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628922F069E;
	Thu,  5 Feb 2026 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D14FRH5M"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A0E23E35F;
	Thu,  5 Feb 2026 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770312807; cv=none; b=HN8CmCHf6eikElwApG+TsfGKP/rScmIOYmCA5vFUE8rNrSWoIvy/AiLWlbHLW9qHNeAS6/6kAw5ngoveHOJQsk7EEiY1GN+siWPBOTUUZwEqDBLxYDMRwm41sQC4duU2/DCRuZeQUh6JgzbOZ/PmSkGJQ1xZFDUu5Odf2+XqAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770312807; c=relaxed/simple;
	bh=E0QQ6JFsS0MRxtYhUVUPd4RCwfdAxw9Ag5VEZBnSNHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahFItcwYBbibpJsIAa/uiPf4V1ShFQmkrgAPVUyjFIZghJdLrHZz18gG3Xt8rp/4hgBKNOybLR3nW0cmAu/Oj5j0T1DBOF/DaZaT0khZOlI7JVSUd7cGVSLAm9enuTLnG0WmyTKDtnlvoKayzt6oN3NRE3wXD5h30JniQXL6DLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D14FRH5M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E529CC4CEF7;
	Thu,  5 Feb 2026 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770312806;
	bh=E0QQ6JFsS0MRxtYhUVUPd4RCwfdAxw9Ag5VEZBnSNHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D14FRH5MAL9c5i4EsHlosrXq2Os439jFsBfxkg7lEe4uNnjosVNYLArjBo3JLKabT
	 eWJKoltkqRPbHmCCCcaDabbvLQcRZnz4RG+inCnmQG9Ykh614NO9GcLUusM69omX8R
	 gQpXWAxAfRmwSMZ9WKy79OyZtRY/WN4WMxSFtH4s=
Date: Thu, 5 Feb 2026 18:33:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: sharms <sharms@snowfoundry.com>
Cc: dev@a1rm4x.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	limiao@kylinos.cn, oneukum@suse.com, huanglei@kylinos.cn,
	lijiayi@kylinos.cn, johannes.bruederl@gmail.com
Subject: Re: [PATCH] usb: add QUIRK_NO_BOS for several devices
Message-ID: <2026020536-bullseye-smugly-4361@gregkh>
References: <2026020527-ivy-gathering-93a7@gregkh>
 <20260205172432.1007632-1-sharms@snowfoundry.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205172432.1007632-1-sharms@snowfoundry.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33125-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[a1rm4x.com,vger.kernel.org,kylinos.cn,suse.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[snowfoundry.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2535F5F8F
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 10:24:32AM -0700, sharms wrote:
> From: Steve Harms <sharms@snowfoundry.com>
> 
> On Thu, Feb 05, 2026 at 07:51:17AM +0100, Greg KH wrote:
> > Ok, it looks like there is a very broken USB controller chip out there
> > in all of these devices.
> 
> Hey Greg,
> 
> I think this references the same issues as in
> https://lore.kernel.org/linux-usb/2025122837-creamlike-motivator-8dcb@gregkh/

Yes.

> There are a few of us who need 10G support for video capture with
> these devices.

Understood, and I guess they are all using the same chip in the device?
I have the one listed at the link above for testing, but it would be
really good if someone could figure out why Windows doesn't have this
problem and only Linux does...

thanks,

greg k-h

