Return-Path: <linux-usb+bounces-35446-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBdTIzm+w2kRtwQAu9opvQ
	(envelope-from <linux-usb+bounces-35446-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:51:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 94769323506
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 11:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B2563090375
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 10:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5533B3BC666;
	Wed, 25 Mar 2026 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nfCaWB2s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98C63B8937
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435350; cv=none; b=OBfXmcusNNgSC9t0HeB+M4JzwOKi6vP3k/TkSUsezhpoiXCq0nZRF3ypSLcSLHmm7bjRXe359t4rTVJyYpoXJAq2MJZCmty12QnSJeVBwBHkrX+QuLglUljzIVXo+ApXBRqlG2zwMbKF9VNb24rQCiPLa1n94snqanXfU6RmDWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435350; c=relaxed/simple;
	bh=dPjRdTuxeXF/tIvEJBfi9Ler3wM2RPr9//svuJJCu3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3XhhP+oPa+NfrDoaaXThKk20/fIqR9ho5YPt4AtaM9PwT9nturxxGyNh/qijN3auOwjm/J/g6s1YG2mnLyx/R6Ymwt67Sh2exgGBH1OrP+AMWyao+8EW/4mipoAchJBXrVHDHUL9xkW8B5gpDyM4sC67CL9bLTOi7TFJK+rwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nfCaWB2s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29202C2BC9E;
	Wed, 25 Mar 2026 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774435350;
	bh=dPjRdTuxeXF/tIvEJBfi9Ler3wM2RPr9//svuJJCu3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nfCaWB2sbwli2MASqW6RM7fbtPA2xQbvVhmG4fyw9zXnbb6LM6zkkzT1AYrqoLAEI
	 rRSYKP2Rq1jesqWomb8pBRidVe6uktD132WZZbYBT3L38GroKG2aC5ss/0RTvlAsG1
	 bVk8cC1GQqnO9Ao4i19T4+iBHM5vgtCKZLevq07Y=
Date: Wed, 25 Mar 2026 11:42:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kelvin Mbogo <addcontent08@gmail.com>
Cc: linux-usb@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v2 1/3] usb: usbip: fix integer overflow in
 usbip_recv_iso()
Message-ID: <2026032548-backwash-debtless-5189@gregkh>
References: <20260325103640.8090-1-addcontent08@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325103640.8090-1-addcontent08@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35446-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 94769323506
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:36:38PM +0300, Kelvin Mbogo wrote:
> usbip_recv_iso() computes the iso descriptor buffer size as:
> 
>     int size = np * sizeof(*iso);
> 
> where np comes straight from the wire (urb->number_of_packets, set by
> usbip_pack_ret_submit() before we get here).  With np = 0x10000001 and
> sizeof(*iso) == 16 the product is 0x100000010 which truncates to 16 on
> a 32-bit int.  kzalloc(16) succeeds but the following receive loop
> writes np * 16 bytes into it - game over.
> 
> USBIP_MAX_ISO_PACKETS (1024) already exists in usbip_common.h for the
> submit path but was never enforced on the receive side.
> 
> Clamp np to [1, USBIP_MAX_ISO_PACKETS] and switch to kcalloc() so
> the allocator itself can catch overflows in the future.  Fold the
> existing np == 0 early return into the new bounds check.
> 
> usbip_pack_ret_submit() already copied the bogus np into
> urb->number_of_packets before we run, so just returning -EPROTO is
> not enough - processcompl() in the HCD will still iterate that many
> iso_frame_desc entries when it completes the failed URB.  Zero out
> urb->number_of_packets before bailing to prevent that secondary crash
> (confirmed on 6.12.0, processcompl+0x63 with CR2 in unmapped slab).
> 
> Signed-off-by: Kelvin Mbogo <addcontent08@gmail.com>
> ---
>  drivers/usb/usbip/usbip_common.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
> index a2b2da1..8b6eb74 100644
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -662,7 +662,7 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
>  	void *buff;
>  	struct usbip_iso_packet_descriptor *iso;
>  	int np = urb->number_of_packets;
> -	int size = np * sizeof(*iso);
> +	int size;
>  	int i;
>  	int ret;
>  	int total_length = 0;
> @@ -670,11 +670,21 @@ int usbip_recv_iso(struct usbip_device *ud, struct urb *urb)
>  	if (!usb_pipeisoc(urb->pipe))
>  		return 0;
>  
> -	/* my Bluetooth dongle gets ISO URBs which are np = 0 */
> -	if (np == 0)
> -		return 0;
> +	if (np <= 0 || np > USBIP_MAX_ISO_PACKETS) {
> +		dev_err(&urb->dev->dev,
> +			"recv iso: invalid number_of_packets %d\n", np);
> +		/*
> +		 * usbip_pack_ret_submit() already set urb->number_of_packets
> +		 * from the wire.  Zero it so processcompl() does not iterate
> +		 * OOB descriptors on the way out.
> +		 */
> +		urb->number_of_packets = 0;
> +		return -EPROTO;
> +	}
> +
> +	size = np * sizeof(*iso);
>  
> -	buff = kzalloc(size, GFP_KERNEL);
> +	buff = kcalloc(np, sizeof(*iso), GFP_KERNEL);
>  	if (!buff)
>  		return -ENOMEM;
>  
> -- 
> 2.34.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

