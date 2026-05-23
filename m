Return-Path: <linux-usb+bounces-37961-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBJYOBRcEWollAYAu9opvQ
	(envelope-from <linux-usb+bounces-37961-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 09:49:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 645105BDC79
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 09:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6195D3019152
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 07:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A06733DEE1;
	Sat, 23 May 2026 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAHhULNt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13119EED0;
	Sat, 23 May 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779522577; cv=none; b=qE4Bgo3lferQ09LT06Q/VhvR/5KuQs3iMMHkfQmlCdq+PcjlDLFsHRoCeyShk53jGK+ZXXhevbckIUM/m8o23uJeYPmW74aN6LOxOVzXH8E1cAcmZqAB+UgXSfoGF+Jp4hO14ngXZJKJg24BEJU+1I2kEQsr21iG59K7zvg/L84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779522577; c=relaxed/simple;
	bh=BudDFIonwz5iOAPz+CsP8DY0Iz7zBglB7zg4r6MSA5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2f1U/uNU4Jg8D7YQm5uajILQ9dIagXPCn0HsLA4oYD47hsHEYw845JI1GZIyMoJTcJdLCzvpKSpc/fNS/gx2imECIr8IhsmO4JOLW75ywZs45fNnpm+NBrxmdnMlqHaPuzdL/KVvlJ8UWe30sCTYfIEOQpP/gHrME4TWGkFbt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAHhULNt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9827C1F000E9;
	Sat, 23 May 2026 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779522576;
	bh=mEjUWYqrEz6avjsHRkM4qm3AHXovNIrrVSRcYajq8pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fAHhULNtZvLDCE+pFsDVoskh7uMqnOi1OOgO93RuQZ1iHnq2NCWtCC/fNPaURF5t2
	 v9+7ZPCKbj0vBYeTK1KFp81G0/if7qYj3y/0f2rIiMdsf2Z4DRN5IREykF1wxccYzp
	 0LORHfefqutMUde6LbOLaYVPPf2fFrdxpBuf13xOXrsAA6PiTDAAj9vQCbcajS/vZa
	 SxjH0XcDRjLBhiZ/cO3Ws7tzV5zgAYgzzdvnsSgK3RiywCvutBHNnvE+jhPrnhh5r4
	 Xnd0c/qxMuAnDjFzRV7pUoIdyM1E+1RWGXpAXrKPYMJdkNsbXLT3sW5MJCdcEpBjId
	 36lVeCCvTBViQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wQh70-000000045nJ-0mAp;
	Sat, 23 May 2026 09:49:34 +0200
Date: Sat, 23 May 2026 09:49:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com, 2045gemini@gmail.com
Subject: Re: [PATCH v2] USB: serial: cypress_m8: validate interrupt packet
 headers
Message-ID: <ahFcDudL4N01Fycs@hovoldconsulting.com>
References: <20260522145442.2868601-1-rollkingzzc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522145442.2868601-1-rollkingzzc@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37961-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 645105BDC79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 10:54:42PM +0800, Zhang Cen wrote:
> cypress_read_int_callback() parses the interrupt-in buffer according to
> the selected Cypress packet format. Format 1 has a two-byte status/count
> header and format 2 has a one-byte combined status/count header. The
> usb-serial core sizes the interrupt-in buffer from the endpoint
> descriptor's wMaxPacketSize, and successful interrupt transfers can
> complete short when URB_SHORT_NOT_OK is not set.
> 
> Check that the completed packet contains the selected header before
> reading it. Malformed short reports are ignored and the interrupt URB is
> resubmitted through the existing retry path, preventing out-of-bounds
> header-byte reads.
> 
> KASAN report as below:
> KASAN slab-out-of-bounds in cypress_read_int_callback+0x240/0x7f0
> Read of size 1
> Call trace:
>   cypress_read_int_callback() (drivers/usb/serial/cypress_m8.c:1009)
>   __usb_hcd_giveback_urb()
>   dummy_timer()
> 
> Fixes: 3416eaa1f8f8 ("USB: cypress_m8: Packet format is separate from characteristic size")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> ---
> v2:
> Check only urb->actual_length before reading the packet-format header.
> Reuse the existing i header-length variable instead of adding a new one.
> Shorten the KASAN trace in the commit message.

Thanks for the v2.

>  drivers/usb/serial/cypress_m8.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
> index afff1a0f4298b..49c0f3e379bd0 100644
> --- a/drivers/usb/serial/cypress_m8.c
> +++ b/drivers/usb/serial/cypress_m8.c
> @@ -1060,18 +1060,27 @@ static void cypress_read_int_callback(struct urb *urb)
>  	default:
>  	case packet_format_1:
>  		/* This is for the CY7C64013... */
> -		priv->current_status = data[0] & 0xF8;
> -		bytes = data[1] + 2;
>  		i = 2;
> +		if (result < i)
> +			break;
> +		priv->current_status = data[0] & 0xF8;
> +		bytes = data[1] + i;
>  		break;

I know I asked you to move the initialisation of i (the header length),
but when applying I ended up changing this so that the sanity checks use
constants instead, which I found more readable.

The end result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-linus&id=9f9bfc80c67f35a275820da7e83a35dface08281

Johan

