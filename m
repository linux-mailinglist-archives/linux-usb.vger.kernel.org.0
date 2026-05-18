Return-Path: <linux-usb+bounces-37637-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGM3M2mJC2p1IwUAu9opvQ
	(envelope-from <linux-usb+bounces-37637-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:49:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 360DE57418C
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BCE7307400E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 21:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA4E39A05A;
	Mon, 18 May 2026 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="f7A+p/Cf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7049C39A052
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 21:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779140610; cv=none; b=tz1vLqNG9be0hla5wYZQmXwN6b5YLs2BcV66NzDRUrM/yXXoAnP/2atjXZM3+y4DRVxk/1BSA5mUiPYbv1rta1Ji6fP4D9Rda7DHyA/mpckgavkpEBJ3+WQ85Dy8e6gUUrJqdWSduurHPswwGkjR+HqUemMPo1NRnDuILVhMH9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779140610; c=relaxed/simple;
	bh=d7v4o7G5YVe90dJf3EbeKoJeqFNTcHsYW3brCtBaHxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rebsnpCcgBaz4dfTX7eNaTMLkQYOV2399Pg9XffNSA7XLy6hkB5pFuwfq8T8egW6oQ5LmEUgbxd7MFL3OIVW/5bVllehC8P0SkOsybvAzYubAiPvF3XTRSyqVzSVkJBKV2k5rzyD9ZDlZ0S9FDridBaHdyRmoaDUrHQz2h70K8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=f7A+p/Cf; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-911796e9885so278208185a.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1779140607; x=1779745407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OANDM8Na3472eWZUNdpiSE+WZ0j53b9Df8FisM//ZFk=;
        b=f7A+p/CfbO66BMKNyNDiF+pVau/m+UELOYmQ6Cjs+88l0ly4P02Rpo5Pr3EDCOIRbq
         /LbMRLwuvmsYAFxaBgDqteohjBdj53LutALze21LgBcjyZQcKejAZxM6muDiueXWO7WU
         VysccRLmvwNxJel/83mcxUwm8AtPAcKIbTtzYV6Lmwl5Ak7llytzQxy8YxuXQhTtGftH
         f5HkuTDAPC5o9Kxs/j8VVTsxa355QQgabDIyDjRuP99q+iD9SXK8JxvKJbVOgp8FSgnV
         Me2nZU27nNlAifyes2ex2zCF40+FeR3JRawRaY0M8iXFQuCJQX9KwNm9UJqHLPn2xaUt
         tqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779140607; x=1779745407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OANDM8Na3472eWZUNdpiSE+WZ0j53b9Df8FisM//ZFk=;
        b=VSKNEh/24Y1yDA9CuY6UzW5BjzJ9zKLFx/XZcSVGZlFfV9WkCEz/GyK1h90gp/xUQ3
         4/fzVD3ilTLtApL5+BdewmWaFCAEJCEcrzjE4cjrerBaVrbh0xjXMF73yPG93/WRtMMP
         LVWV3dnJJplbnzx31JAomSmY6cDIAIfT7Zm23O7e1FW6dhA+uPBaUM6Rg6RxwDN4r19h
         VHPFmxNAqPox59ry7olpWwP3XNW0qdPiWsWjlztbgOxYDQMvGlWqw1K06DCKxy04niwy
         ULRXTxQ91Bzp0bztzdhRTbAX5Arwy6VYD64U8BwcNCMllXvNmYwpHjLrWS6hBcB/8BdQ
         c9Dg==
X-Forwarded-Encrypted: i=1; AFNElJ/6ZmhfohBySCrR7kGmsvfrNRoELrYSBAx3QWnvbcQimQuluBXcJzXPfnGCs+tgfbqCJrXj5Q4EvO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBK4nLDv8tpSHTwLUGAHy15TGoU329C6zDVio34yyrh5jsJm26
	NyZpw42ZopSnN5RNyEjjBDNC2HR0Tyeu3BkyuXOvtdczycSmXcGqqxVW3S8/zVJvqg==
X-Gm-Gg: Acq92OFsCbiMuWGYUGXW/QLQv9i8+EflLHEh8diF+OWiq4+X63bzLm8P9mJIO9FAufc
	xgEOrMj9zFA+jMh3IDdqSgN/6IUDCv32vjO3aAO12QE/KQuLIJlbA6fR14Yvu6MoRvaib2d8wZE
	o+gWGJedVVxP69+8rgDk5ibzhWAuYZfWL5bRvnKS8nMgaE2NDc5q7bGGq6EPGvuq+9FhLACbLqa
	dozI+Xv/pJYoAZJ+pPkWQAVBQtMP5kxIMh8/pvXFUaMP2KhBTt/Bov+rj8dhBUdBLVCGigAQ3dX
	6EYa1zcVn8qlPamyUHUv8ntoeYpYmnsjaSukMvqA0gFid6G6o80TTNquWOzczVfueadOQ+pvEvM
	2IaEFNGYVtW2itecuvgdyi6P9EKw8jYp1yNQ0/eJrnjEU/uGn6AeVEhgK3/vjza2vb5fP1GsBep
	FusN7FEusQ+HUvSCWqIZOtkSRshcMF5V1Vwyw06fJVqDY=
X-Received: by 2002:a05:620a:2587:b0:8f1:9e59:21fa with SMTP id af79cd13be357-911cd858a7amr2197388885a.5.1779140607206;
        Mon, 18 May 2026 14:43:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba182535sm1622387185a.8.2026.05.18.14.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 14:43:26 -0700 (PDT)
Date: Mon, 18 May 2026 17:43:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: aspeed_udc: avoid past-the-end iterator in
 dequeue
Message-ID: <d659cf09-8136-4383-b61f-045b92d495db@rowland.harvard.edu>
References: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37637-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 360DE57418C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 03:34:03PM +0800, Maoyi Xie wrote:
> From: Maoyi Xie <maoyixie.tju@gmail.com>
> 
> ast_udc_ep_dequeue() declares the loop cursor `req` outside the
> list_for_each_entry(). After the loop it tests `&req->req != _req`
> to decide whether the request was found. If the queue holds no
> match, `req` is past-the-end. It then aliases
> container_of(&ep->queue, struct ast_udc_request, queue) via offset
> cancellation. Whether that synthetic address equals `_req` depends
> on heap layout. The function can return 0 without dequeueing
> anything.
> 
> Use the cursor-vs-result idiom from the sibling aspeed-vhub driver,
> ast_vhub_epn_dequeue() in drivers/usb/gadget/udc/aspeed-vhub/epn.c.
> A separate `iter` walks the list. `req` is set only when a request
> matches. After the loop, `req` is NULL if nothing matched.
> 
> The same idiom is used by the other UDC drivers in
> drivers/usb/gadget/udc/ (at91_udc, atmel_usba_udc, dummy_hcd,
> fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc,
> max3420_udc, net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx,
> bcm63xx_udc).
> 
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed_udc.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> --- a/drivers/usb/gadget/udc/aspeed_udc.c
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c
> @@ -692,26 +692,30 @@
>  {
>  	struct ast_udc_ep *ep = to_ast_ep(_ep);
>  	struct ast_udc_dev *udc = ep->udc;
> -	struct ast_udc_request *req;
> +	struct ast_udc_request *req = NULL, *iter;
>  	unsigned long flags;
>  	int rc = 0;
>  
>  	spin_lock_irqsave(&udc->lock, flags);
>  
>  	/* make sure it's actually queued on this endpoint */
> -	list_for_each_entry(req, &ep->queue, queue) {
> -		if (&req->req == _req) {
> -			list_del_init(&req->queue);
> -			ast_udc_done(ep, req, -ESHUTDOWN);
> -			_req->status = -ECONNRESET;
> -			break;
> -		}
> +	list_for_each_entry(iter, &ep->queue, queue) {
> +		if (&iter->req != _req)
> +			continue;
> +		req = iter;
> +		break;
>  	}

There's nothing wrong with doing it this way, and this is how the other 
drivers do it.  Still, organizing the loop in this way does look a 
little strange.  Consider this instead:

	list_for_each_entry(iter, &ep->queue, queue) {
		if (&iter->req == _req) {
			req = iter;
			break;
		}
	}

Alan Stern

