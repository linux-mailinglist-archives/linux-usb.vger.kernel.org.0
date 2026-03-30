Return-Path: <linux-usb+bounces-35651-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPMOJr9Cymky7AUAu9opvQ
	(envelope-from <linux-usb+bounces-35651-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:30:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5A8358369
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 349E23014F66
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229293AF676;
	Mon, 30 Mar 2026 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blAGT2Q/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64983822BA;
	Mon, 30 Mar 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862494; cv=none; b=Buqi4pQXimu3LOpgpwH74iuL/lbIdKzMTHPv5x80aidDieBbB25ZB7Bv8O1a1MpXJ4otKoYZtT8HbCJ6kpEHZ9sOEvh2D2WteJQht7zeRA40DJ9BdguM/avylEzbvBuyGAvnj+0vTdVj+0jfs2yvmFfuDHP1o4Fu4YkCYAcayIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862494; c=relaxed/simple;
	bh=MDcAM5kNFiE3XA6EjFqxdKlUy0aG+BBG7s9+QCWfw4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqpjqBaf6hn3qraVsXLuMFPL2DPirddHCI4ji128SLb8WccB9RjqdvZonMDqvSNTG9bJZKQ4hxm77bBPUn91Hd6knsjq0c5ttraWZODVNiCCXDnvbHhN/+hHsbFocUwKAEaa2W65zsUz7aNhCrksO+Vm1bcL69kjrYijBO+tNJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blAGT2Q/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CADDC4CEF7;
	Mon, 30 Mar 2026 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774862494;
	bh=MDcAM5kNFiE3XA6EjFqxdKlUy0aG+BBG7s9+QCWfw4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blAGT2Q/p0WgylEkrH+yz+upcH1JqT6nlyC0eiw1/Ny4Z2WCN2OZzp/iJ8t+oYxir
	 h4vZ21yAS7ZjAIj+DqUf9ecH62NmNOfb7AZBKqh2oE4Uug1J/Bpefjgv6/sJBnGdmY
	 cL2qtovgnOMLChiwcoX1Pvse/wFa5gY++BlvTMCac8ciPxw4/sET0st8b7QVqT94nk
	 qEfWGfWvKrtyZdeIKklJ517eYdVRo5/IC8S061HEIwJduN2jSruESOsAtCjjn3W/iW
	 cCPBOZujuX07zBJWX5saiVhQKOLJ+a8A++WyllCOG9O6PFM6MvPMKmfrPWcOmoZ1Ai
	 0wwwDk78SH+hw==
Date: Mon, 30 Mar 2026 17:21:30 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Yongchao Wu <yongchao.wu@autochips.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: gadget: fix NULL pointer dereference in
 ep_queue
Message-ID: <acpAmimXvxD+WXA1@nchen-desktop>
References: <20260328143842.57315-1-yongchao.wu@autochips.com>
 <20260329013404.116481-1-yongchao.wu@autochips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329013404.116481-1-yongchao.wu@autochips.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35651-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.chen@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,autochips.com:email]
X-Rspamd-Queue-Id: AE5A8358369
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-29 09:34:04, Yongchao Wu wrote:
> When the gadget endpoint is disabled or not yet configured, the ep->desc
> pointer can be NULL. This leads to a NULL pointer dereference when
> __cdns3_gadget_ep_queue() is called, causing a kernel crash.
> 
> Add a check to return -ESHUTDOWN if ep->desc is NULL, which is the
> standard return code for unconfigured endpoints.
> 
> This prevents potential crashes when ep_queue is called on endpoints
> that are not ready.
> 
> Signed-off-by: Yongchao Wu  <yongchao.wu@autochips.com>

Add Fixed-by tag and Cc to stable tree please, others:

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/cdns3/cdns3-gadget.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
> index d59a60a16..96d2a4c38 100644
> --- a/drivers/usb/cdns3/cdns3-gadget.c
> +++ b/drivers/usb/cdns3/cdns3-gadget.c
> @@ -2589,6 +2589,9 @@ static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
>  	struct cdns3_request *priv_req;
>  	int ret = 0;
>  
> +	if (!ep->desc)
> +		return -ESHUTDOWN;
> +
>  	request->actual = 0;
>  	request->status = -EINPROGRESS;
>  	priv_req = to_cdns3_request(request);
> -- 
> 2.43.0
> 
> 

-- 

Best regards,
Peter

