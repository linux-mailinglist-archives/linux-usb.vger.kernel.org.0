Return-Path: <linux-usb+bounces-33121-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJgLADLAhGnG4wMAu9opvQ
	(envelope-from <linux-usb+bounces-33121-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 17:07:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F34FF4F75
	for <lists+linux-usb@lfdr.de>; Thu, 05 Feb 2026 17:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A6363025E59
	for <lists+linux-usb@lfdr.de>; Thu,  5 Feb 2026 16:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70616436354;
	Thu,  5 Feb 2026 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ERr4hNA2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F280F421F10;
	Thu,  5 Feb 2026 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770307627; cv=none; b=mj1dR+Redbi7a+d8mxxIMncDiWJTuxFoFsGruPs6grXj88PhQRUY3qr5hsLanuwSsLGI+4nAU2D4Xbj6wFZJt7KCHTG1qKARCjvFt7prjjLqxmP1iDwB4sozXuJuf8LAsLfXgOVwnJ9g033fxf0PEpDcYfOCW8I1uKedJBl711U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770307627; c=relaxed/simple;
	bh=zQrCKvALeYKSNawTM2Qn6t8bur9FZaWr0VuqXzom4tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cjw03XV9PW1nMiMl9mxlcolIIR5X+KrfcMK9aRVoWx4tQug5pjFhZLCVbu12mF+kRggo7+kwmfzTvimDNqGMjzp74vfqWMolvxUR/EQQFCWN3JsF3XOPv8m5cTcrJN6lTCjgskl3jdzglmOJhcrUD0XnEyFn3QM0gpB2H+O97uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ERr4hNA2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25449C4CEF7;
	Thu,  5 Feb 2026 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770307626;
	bh=zQrCKvALeYKSNawTM2Qn6t8bur9FZaWr0VuqXzom4tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERr4hNA29GwkfZO2qVL8ksVL0HHnDFNpQylAIjyuAc9oHVyphdvgdeReqDeroBJY0
	 vUJX5G0ENZUb8E6isdDJJw+vSPtxr09IKUmYWrDC5YFDEzjYmg/K0m7klf80n9qAcl
	 YTnkb2sgIvuVcyQJbXv/gBxxo742peBLEBHdp+B4=
Date: Thu, 5 Feb 2026 17:07:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial device ids for 6.20-rc1
Message-ID: <2026020557-during-overdress-d04b@gregkh>
References: <aYN1KleJnyjJb6HR@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYN1KleJnyjJb6HR@hovoldconsulting.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33121-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F34FF4F75
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 05:34:50PM +0100, Johan Hovold wrote:
> The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:
> 
>   Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.20-rc1
> 
> for you to fetch changes up to 509f403f3ccec14188036212118651bf23599396:
> 
>   USB: serial: option: add Telit FN920C04 RNDIS compositions (2026-01-27 16:29:46 +0100)
> 
> ----------------------------------------------------------------
> USB serial device ids for 6.20-rc1
> 
> Here are some new modem device ids for 6.20-rc1.
> 
> Everything has been in linux-next with no reported issues.
> 
> ----------------------------------------------------------------
> Fabio Porcedda (1):
>       USB: serial: option: add Telit FN920C04 RNDIS compositions
> 
>  drivers/usb/serial/option.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Pulled and pushed out, thanks.

greg k-h

