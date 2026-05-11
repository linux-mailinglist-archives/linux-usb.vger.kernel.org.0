Return-Path: <linux-usb+bounces-37232-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEUdCAuEAWoFcAEAu9opvQ
	(envelope-from <linux-usb+bounces-37232-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:23:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FD2509151
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 09:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D95DE303C7CC
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 07:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED6F375AB2;
	Mon, 11 May 2026 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETTPA/Zl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE90363C57;
	Mon, 11 May 2026 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483948; cv=none; b=hdxT8diYlaPQ1sCS/Kg9WjVfi/gGSNuOHwd5CQTlcWElLpnZm7j99eQVTj+zf1U0+xL7VW7IVCqd2YKvN26h3VRUc0m0A0bxQ/4qVO+gLAN0W/twDAhXvjW53E84yLKGh4CHrA+5MvN2gMfN9CTTozsRrPIvWw4nXIkw8sYqqlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483948; c=relaxed/simple;
	bh=LSPBVBQv+P4UqoxZzhiJ+u+aM9TI6KcFReV+4D0B0zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz2UYrb8KKrjDt1HkvPmWPtUxvwGlRZiK1bIFdd/JmQ2wN0DnUDdsyNkopO/i1a3EwZhJQbTJH8hkruIVIcO+Prm8v0yT5g0rUO/XPiLYHH99ONWBiyws46Z5Ng1YgaPwzJ1BI9S7N+O2EQmT8kphyltMHfV6qHvgqen5cemnPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETTPA/Zl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1F2C2BCB0;
	Mon, 11 May 2026 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483948;
	bh=LSPBVBQv+P4UqoxZzhiJ+u+aM9TI6KcFReV+4D0B0zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETTPA/Zlpz1AogsVOpTWPURJOVDBR8sVTIEx1blSCoTS4J4dxJ8NUr8sD3FCmr0aS
	 v8nstXTzm5lrkNwToT1MfJI3oTye/rAJFYc9QsrOTVmAZgrsCKTnM3tWnCS2zj4xGJ
	 gtcXaefCVSe9brohTrbdhS0XZiTvNLkAV7Y162DI4d1+fsI6iCEe8PqapmrHgd+nAz
	 4MIipJyJ0/VpUaCAr6S0SqujCwbVO5IrFNUtzjUvFxQm1VovgAwG1phrtv+9c/Dr0m
	 qXt5TBo45g7W2Ze1A4sRaZBISAHP2Wl67r9Ik6u0lMDUsSk8+0SHkJ/N9cTyYNCrSF
	 PESDXlzV0Uysg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKuv-00000002a2b-3Msy;
	Mon, 11 May 2026 09:19:05 +0200
Date: Mon, 11 May 2026 09:19:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Crescent Hsieh <crescentcy.hsieh@moxa.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: mxuport: update number-of-ports encoding
Message-ID: <agGC6aRZAukx0BDM@hovoldconsulting.com>
References: <20260507141114.284470-1-johan@kernel.org>
 <2026050839-spry-ogle-5ddd@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026050839-spry-ogle-5ddd@gregkh>
X-Rspamd-Queue-Id: 82FD2509151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37232-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 07:16:46AM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 07, 2026 at 04:11:14PM +0200, Johan Hovold wrote:
> > In preparation for adding support for 3, 5, 6 and 7 port devices, replace
> > the current one-bit-per-type encoding of the number of ports with a more
> > compact four bit encoding (2..16 ports or undefined).
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/usb/serial/mxuport.c | 38 +++++++++++++++---------------------
> >  1 file changed, 16 insertions(+), 22 deletions(-)
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing. Now applied.

Johan

