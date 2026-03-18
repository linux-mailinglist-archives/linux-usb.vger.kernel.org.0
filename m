Return-Path: <linux-usb+bounces-35064-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM1fAvzCumkGbgIAu9opvQ
	(envelope-from <linux-usb+bounces-35064-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:21:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 791BA2BE183
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 16:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BD293228111
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3383D7D75;
	Wed, 18 Mar 2026 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KzvpaeGP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7AC39E191
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 15:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846612; cv=none; b=iiXWgmIKnXJLS6V4B2M1wS0zWLJuRBzVxa3w4Wz9fCuh9yejik2vlZOHP4aWMVY1+FjSDT7vTiqawOsfxfX3D84YlU2QafyYCPt+KD/7ICd6WUpWkdDafIYwH+ilgBGik8PS/kG0jatOZXPtO6a8XbHQgtHSSg7KSbRo5KsewPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846612; c=relaxed/simple;
	bh=xCr4Yc0Yh8c9kLb2hPME+252KJHofPOLyzYKS2xlTaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOAzllUl67Hf2Lm3lV1iq8fw5NTKPrq7Uo0MGxubiFnAlohyRz8C19FEm5y/FvVagk+RPIbcVrkLFYRZ04oGV0hGTxTK6d64UKrvnHA+aVM5eEPS0YUX0Y89Ik2WIvtPh2QcvLQxfMnPf1n4HXZQd8feDW22L3ep3VDRSgJF3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KzvpaeGP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5A1C19421;
	Wed, 18 Mar 2026 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773846612;
	bh=xCr4Yc0Yh8c9kLb2hPME+252KJHofPOLyzYKS2xlTaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzvpaeGPSF/0OmPKQGvTqZwaKLwNVnY5DB9U6FXHUBVtmnUbWWU2LZRTjLTiioTRq
	 99daowMTNF+jeLN3h4bjaYDz83XPZvnWZSMYhq3oV17qSOfQW6hK54dhxi5o5A/t8Y
	 1aCuwzKG6r3xeGInuChAbHHDk2BEtPhiazPCU//Y=
Date: Wed, 18 Mar 2026 16:10:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: uapi: add usb 3.0 authentication declarations
Message-ID: <2026031840-unfold-crouton-bc3b@gregkh>
References: <20260317092244.1464921-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317092244.1464921-1-oneukum@suse.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-35064-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 791BA2BE183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:22:28AM +0100, Oliver Neukum wrote:
> This adds the USB authentication extensions to the
> uapi chapter 9 declarations, so that user space tools
> correctly operate on the descriptor and commands.
> This is necessary for sniffing and debugging in gadget
> mode to correctly work, even though the kernel
> does not use these requests in host mode.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  include/uapi/linux/usb/ch9.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> index 8003243a4937..6f02dc39430a 100644
> --- a/include/uapi/linux/usb/ch9.h
> +++ b/include/uapi/linux/usb/ch9.h
> @@ -102,6 +102,8 @@
>  #define USB_REQ_LOOPBACK_DATA_WRITE	0x15
>  #define USB_REQ_LOOPBACK_DATA_READ	0x16
>  #define USB_REQ_SET_INTERFACE_DS	0x17
> +#define USB_REQ_AUTH_IN			0x18
> +#define REQ_REQ_AUTH_OUT		0x19

This should be USB_REQ_AUTH_OUT, right?

thanks,

greg k-h

