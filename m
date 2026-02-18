Return-Path: <linux-usb+bounces-33477-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHU+KA3ZlmnSpQIAu9opvQ
	(envelope-from <linux-usb+bounces-33477-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 10:34:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3AC15D64A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 10:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 660FD3027B70
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 09:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944A42F6930;
	Thu, 19 Feb 2026 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xwg+tByc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E7A70830
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771493625; cv=none; b=Wdf0V8aWZmN+xo97yRG2QjjlynvcqfqZHl6oLva+6XD5Z0vRDvMv0wGdCA2MpwLYm2kgLuqNI4Wmxvj2E3qmkvGSHh5Tb16onjmesq9jRW1HMED2ekeYxfbtqhBbdsXBMgu4c9NijwxXhh5O2TEMWsn3OyTZjaM8gLCRrd1HjWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771493625; c=relaxed/simple;
	bh=HXVMkcoy8BnPffyr3PMe3Kcz9tLAdIDnjM9ZvSp4MsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTblODkoWsEzOPKfkxoTdJtxcifzP6IHqSacRj3w/iRK1SCvpS7Rn3pZsig1pz0fjJXtG57nMGRqeXSpYojIYh3w5EOmtoKG3XgRUK+zemTXAC16PsrTg+EyXLCavde6ToCfcJfi7cZLLb6pZvPkP6gUnATjcI1s0eZP4Z88okI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xwg+tByc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FFEC4CEF7;
	Thu, 19 Feb 2026 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771493624;
	bh=HXVMkcoy8BnPffyr3PMe3Kcz9tLAdIDnjM9ZvSp4MsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xwg+tByckKGS+gbEhQ6JFY4KJdMWrBnOLPTCFP1+LZ7kLnZCzd5ZKqGUKYVTMfHV3
	 zFH6MII8KdFjnGOgr9z6fx7FMeEeQRFoSfY7J27IsNIISpAALxdNe06WTsG0HsBhVm
	 q0vFney16OfO9yCpJ4HWVebQJnjLMjO3EoX4eutk=
Date: Wed, 18 Feb 2026 06:12:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nicholas Carlini <npc@anthropic.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Stack buffer overflow (write) in kvaser_usb_leaf_wait_cmd via
 malicious USB
Message-ID: <2026021847-acclaim-coil-fe7a@gregkh>
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DATE_IN_PAST(1.00)[28];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33477-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 4C3AC15D64A
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 06:13:30PM -0800, Nicholas Carlini wrote:
> My best guess at a fix would be to check the bounds of the output
> buffer as well. Below I've written an attempt at a patch. (I know that
> it will fail to merge because gmail will break patches, sorry about
> that, I'm working on getting myself permissions to download an email
> client onto my work laptop that will let me send well-formatted
> patches to you all asap.)
> 
> Author: Nicholas Carlini <nicholas@carlini.com>
> Date:   Mon Feb 16 18:12:33 2026 +0000
> 
>     can: kvaser_usb: fix stack buffer overflow in kvaser_usb_leaf_wait_cmd()
> 
>     kvaser_usb_leaf_wait_cmd() copies a command response from a USB device into
>     a caller-provided struct kvaser_cmd on the stack. The length of the copy is
>     provided by the command byte on the USB data (tmp->len), which can be fully
>     controlled by a malicious USB device. The maximum size of tmp->len is 255,
>     but the destination buffer is only sizeof(struct kvaser_cmd) bytes (~32).
> 
>     Add a bounds check to ensure that tmp->len does not exceed sizeof(*cmd)
>     before memcpy.
> 
>     Fixes: 080f40a6fa28 ("can: kvaser_usb: Add support for Kvaser
> CAN/USB devices")
>     Signed-off-by: Nicholas Carlini <nicholas@carlini.com>
> 
> diff --git a/drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c
> b/drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c
> index 1167d38344f1..465c3a6801e4 100644
> --- a/drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c
> +++ b/drivers/net/can/usb/kvaser_usb/kvaser_usb_leaf.c
> @@ -698,6 +698,13 @@ static int kvaser_usb_leaf_wait_cmd(const struct
> kvaser_usb *dev, u8 id,
>                         }
> 
>                         if (tmp->id == id) {
> +                               if (tmp->len > sizeof(*cmd)) {
> +                                       dev_err_ratelimited(&dev->intf->dev,
> +                                               "Command %u too long
> (%u, max %zu)\n",
> +                                               tmp->id, tmp->len,
> sizeof(*cmd));
> +                                       err = -EIO;
> +                                       goto end;
> +                               }
>                                 memcpy(cmd, tmp, tmp->len);
>                                 goto end;
>                         }
> 

Can you just resend this patch, in proper format so that we can actually
apply it?  It is totally corrupted and will not work.

Also, you need to use your corporate email address, as the signed-off-by
line does not match up with your From: line on your email :)

But, I don't think the patch should be spamming the kernel log for a
broken device like this.  Just error out and all will be fine.

And is this the only place in this driver where it treats data in an
untrusted way?  As you know, once a driver is bound to a device, we
trust the hardware to work properly, so this really is just a "let's be
careful" type of fix, not any real bug to be handled as a real device
will not trigger this.

thanks,

greg k-h

