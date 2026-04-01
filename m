Return-Path: <linux-usb+bounces-35777-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFQJFWoGzWkjZgYAu9opvQ
	(envelope-from <linux-usb+bounces-35777-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 13:50:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA8F379CF4
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 13:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03ED2308D634
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 11:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512B73F8E03;
	Wed,  1 Apr 2026 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m8O29xIE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F0D3F8801;
	Wed,  1 Apr 2026 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043048; cv=none; b=NPxN2lRFjUYuU383jvD+xq6K879ceYhDHTT2lR/eTZ3iAv3qucYnMhT54hCfBwRwBGSERdIkKGKkjPo3k7fa1QfpJlbS8+VQhuH4M1Nlq4oTROBVXlsiehiFYh0XKToiEdDGxLouTMUjGpCePvqdvnZPOKCqvUbPa/UvFtyCK0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043048; c=relaxed/simple;
	bh=Gp4+lC6r5Flzym+ffuJOaBtHcfM5CzGfglQ5zESJL30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biXZsHpXJ9wzs4kqIamzWRZuFIVRyIVewwat+eerpGwtcS7UdW3iaIYAlya3xB5qAOCDDHhW3Z7iNAgSUmnOpGQOdE+C219M2sSU/uj6QBIztxUTFaCEylCZZNt7p0kY131NnhOoJhMNyTiRVu7jU0NmEMISqE9zak+cW8Wb3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m8O29xIE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E31C4CEF7;
	Wed,  1 Apr 2026 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775043048;
	bh=Gp4+lC6r5Flzym+ffuJOaBtHcfM5CzGfglQ5zESJL30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8O29xIEaWY91wgd87rIn1FyRAAR5F3FajU9tni6bsGXe5BW6jx3tR2bXdhiGfIh+
	 JiYSCCpdkgPtXAKqmJHhMCNeBPSaTG8HxIbD3uDKfw0C3S4jVdmoi8ZQosYbBfq3fH
	 ScWmR2uHPD419tM7Ry4ZdGeXq+Xlq9WjooSsp52A=
Date: Wed, 1 Apr 2026 13:30:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Taegu Ha <hataegu0826@gmail.com>
Cc: linux-usb@vger.kernel.org, kees@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: validate control request size
Message-ID: <2026040124-unheated-opponent-3c56@gregkh>
References: <20260401104611.3375330-1-hataegu0826@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401104611.3375330-1-hataegu0826@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-35777-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.984];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AA8F379CF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 07:46:11PM +0900, Taegu Ha wrote:
> f_audio_complete() copies req->length bytes into a 4-byte stack
> variable:
> 
>   u32 data = 0;
>   memcpy(&data, req->buf, req->length);
> 
> req->length is derived from the host-controlled USB request path,
> which can lead to a stack out-of-bounds write.
> 
> Validate req->actual against the expected payload size for the
> supported control selectors and decode only the expected amount
> of data.
> 
> This avoids copying a host-influenced length into a fixed-size
> stack object.
> 
> Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
> ---
>  drivers/usb/gadget/function/f_uac1_legacy.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> index a0c953a99727..6d6fe5db99f5 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/device.h>
>  #include <linux/atomic.h>
> +#include <asm/unaligned.h>
>  
>  #include "u_uac1_legacy.h"
>  
> @@ -370,9 +371,21 @@ static void f_audio_complete(struct usb_ep *ep, struct usb_request *req)
>  		if (ep == out_ep)
>  			f_audio_out_ep_complete(ep, req);
>  		else if (audio->set_con) {
> -			memcpy(&data, req->buf, req->length);
> -			audio->set_con->set(audio->set_con, audio->set_cmd,
> -					le16_to_cpu(data));
> +			struct usb_audio_control *con = audio->set_con;
> +
> +			if ((con->type == UAC_FU_MUTE && req->actual != sizeof(u8)) ||
> +				(con->type == UAC_FU_VOLUME && req->actual != sizeof(__le16)) ||
> +				(con->type != UAC_FU_MUTE && con->type != UAC_FU_VOLUME)) {
> +				usb_ep_set_halt(ep);
> +				audio->set_con = NULL;
> +				break;
> +			}
> +
> +			if (con->type == UAC_FU_MUTE)
> +				data = *(u8 *)req->buf;
> +			else
> +				data = get_unaligned_le16(req->buf);

Very cool, thanks for finding and fixing this.  But there is a bit of a
coding style issue in that big if check, AND it's hard to follow, how
about doing something like this instead (totally untested and not even
compiled:
			struct usb_audio_control *con = audio->set_con;
			u8 type = con->type;
			bool valid_request = false;

			switch (type) {
			case: UAC_FU_MUTE:
				if (req->actual == sizeof(__u8)) {
					memcpy(&data, req->buf, sizeof(__u8));
					valid_request = true;
				}
				break;
			case UAC_FU_VOLUME:
				if (req->actual == sizeof(__le16) {
					memcpy(&data, req->buf, sizeof(__le16));
					valid_request = true;
				}
				break;
			}
			if (valid_request)
				con->set(con, audio->set_cmd, data);
			else
				usb_ep_set_halt(ep);

  			audio->set_con = NULL;
		}

Does that make it easier to read?  I don't know, maybe not, your call,
but this way the memcpy of a constant size should be equalivant to your
direct cast if the compiler is sane, right?

And as this is a __le16 value, should we be doing some endian conversion
somewhere?

thanks,

greg k-h

