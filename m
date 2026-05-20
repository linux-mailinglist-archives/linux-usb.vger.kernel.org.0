Return-Path: <linux-usb+bounces-37745-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8E14CGMWDWq5tAUAu9opvQ
	(envelope-from <linux-usb+bounces-37745-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 04:03:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB2586B07
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 04:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 054D6302BA4D
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 02:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB4C2ECD1D;
	Wed, 20 May 2026 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="WbV/MPMu"
X-Original-To: linux-usb@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D0329CE1;
	Wed, 20 May 2026 02:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779242482; cv=none; b=VKLjlB+DTo4anjGPI5HSmAk8k+VAZXy3fqKWe6Ez2njAydMjY4ahnW+mowGqmGxq6QtuCNdLMgGXDMCYdu9++8V3iTFQurfAO5tkjAFS3eSYmNvMuUCLFTGzj+304rxG+tk4IfV8orJLOJtiRnKaxMiJOx7+pYOQmfGxAb1VrU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779242482; c=relaxed/simple;
	bh=SPIV5m5fShhlxDtmZ/Ey3UEK8WV2GV6Y2A0KZWA1tpw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W2NA1KfI4OVtRiAI70Dpa9UC+dk/qw+NjrABTWE2/TmoZphS4CDflpwNam47pbGzTwmK3rAtAhHsX/Xcfj/nZ/9A5Q/HpN9jOznXNdnSxY1tykj0dl1YgDhEHQH9vfLKXl0yZNn++1FfaG9nBNSvmLuVZDiQCzsCGW/10jVZABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=WbV/MPMu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779242477;
	bh=Kk4mDuk1bqlhfjj6bz2g4hB4FwIz7h/oUwNv9idu2CE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WbV/MPMu3iCPoNjBN3QV8ZCBkgGN2jzbkZVfURuYvvWn4JYuZzyGcIvLS/Oavp/+O
	 WxVthfEBocwEJU2xR1pHF8QC635aFAqYGaL3oJd9CspI/+qhXbnds75YwkQp+8ENVh
	 UcOulj9Q2V8epYCcVHwuP8XBNlSzWWOV8bFKajrWGL4/OQge2oHyfuxTA159Ue5+dc
	 VS3IRjjLQyFfkN8W94o1y78M/FiLxPFxisfKcxPLBvN/JL2/T7vvZBImjOQaur7Gd+
	 jPv7vMbTQtrYSEva4R0DfDq1ky7PZkMRSJBXdP32HFRjs3ynRsLwgUNQFqH319NEDu
	 H8wSd7RkWgOdw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AC7A260263;
	Wed, 20 May 2026 10:01:14 +0800 (AWST)
Message-ID: <eeadb3378066f18cf36469adfc3a70be3ad7b787.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: avoid past-the-end iterator
 in dequeue
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Maoyi Xie <maoyixie.tju@gmail.com>, Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	 <andrew@aj.id.au>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 20 May 2026 11:31:14 +0930
In-Reply-To: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
References: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
	 <20260519080213.1932516-1-maoyixie.tju@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37745-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,aspeedtech.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Queue-Id: 65FB2586B07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-05-19 at 16:02 +0800, Maoyi Xie wrote:
> ast_udc_ep_dequeue() declares the loop cursor `req` outside the
> list_for_each_entry(). After the loop it tests `&req->req !=3D _req`
> to decide whether the request was found. If the queue holds no
> match, `req` is past-the-end. It then aliases
> container_of(&ep->queue, struct ast_udc_request, queue) via offset
> cancellation. Whether that synthetic address equals `_req` depends
> on heap layout. The function can return 0 without dequeueing
> anything.
>=20
> Walk the list with a separate `iter`. Set `req` only when a
> request matches. After the loop, `req` is NULL if nothing
> matched.
>=20
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
> v2: Switch the loop body to Alan Stern's shape: test inside
> =C2=A0=C2=A0=C2=A0 the if, assign `req`, break. Same behaviour as v1.
> v1: https://lore.kernel.org/linux-usb/20260518073403.1285339-1-maoyi.xie@=
ntu.edu.sg/
>=20
> =C2=A0drivers/usb/gadget/udc/aspeed_udc.c | 20 ++++++++++++--------
> =C2=A01 file changed, 12 insertions(+), 8 deletions(-)
>=20
> --- a/drivers/usb/gadget/udc/aspeed_udc.c	2026-05-19 15:29:28.690931576 +=
0800
> +++ b/drivers/usb/gadget/udc/aspeed_udc.c	2026-05-19 15:29:59.482953528 +=
0800
> @@ -692,26 +692,30 @@
> =C2=A0{
> =C2=A0	struct ast_udc_ep *ep =3D to_ast_ep(_ep);
> =C2=A0	struct ast_udc_dev *udc =3D ep->udc;
> -	struct ast_udc_request *req;
> +	struct ast_udc_request *req =3D NULL, *iter;
> =C2=A0	unsigned long flags;
> =C2=A0	int rc =3D 0;
> =C2=A0
> =C2=A0	spin_lock_irqsave(&udc->lock, flags);
> =C2=A0
> =C2=A0	/* make sure it's actually queued on this endpoint */
> -	list_for_each_entry(req, &ep->queue, queue) {
> -		if (&req->req =3D=3D _req) {
> -			list_del_init(&req->queue);
> -			ast_udc_done(ep, req, -ESHUTDOWN);
> -			_req->status =3D -ECONNRESET;
> +	list_for_each_entry(iter, &ep->queue, queue) {
> +		if (&iter->req =3D=3D _req) {
> +			req =3D iter;
> =C2=A0			break;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	/* dequeue request not found */
> -	if (&req->req !=3D _req)
> +	if (!req) {
> =C2=A0		rc =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	list_del_init(&req->queue);
> +	ast_udc_done(ep, req, -ESHUTDOWN);
> +	_req->status =3D -ECONNRESET;
> =C2=A0
> +out:
> =C2=A0	spin_unlock_irqrestore(&udc->lock, flags);
> =C2=A0
> =C2=A0	return rc;

This is a bit of a bikeshed comment and doesn't solve making the code
similar to other cases, however: Golfing the diff a bit, perhaps we can
start from the assumption that there isn't a match, and require the
search disprove that. Then we don't have to test whether we saw
something after-the-fact, and we avoid the goto as proposed above.

Untested:

   diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/ud=
c/aspeed_udc.c
   index 7fc6696b7694..75f9c831b21a 100644
   --- a/drivers/usb/gadget/udc/aspeed_udc.c
   +++ b/drivers/usb/gadget/udc/aspeed_udc.c
   @@ -694,7 +694,7 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, st=
ruct usb_request *_req)
           struct ast_udc_dev *udc =3D ep->udc;
           struct ast_udc_request *req;
           unsigned long flags;
   -       int rc =3D 0;
   +       int rc =3D -EINVAL;
  =20
           spin_lock_irqsave(&udc->lock, flags);
  =20
   @@ -704,14 +704,11 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, =
struct usb_request *_req)
                           list_del_init(&req->queue);
                           ast_udc_done(ep, req, -ESHUTDOWN);
                           _req->status =3D -ECONNRESET;
   +                       rc =3D 0;
                           break;
                   }
           }
  =20
   -       /* dequeue request not found */
   -       if (&req->req !=3D _req)
   -               rc =3D -EINVAL;
   -
           spin_unlock_irqrestore(&udc->lock, flags);
  =20
           return rc;
  =20
  =20
  =20

