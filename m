Return-Path: <linux-usb+bounces-37562-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aETPFZ10Cmq41gQAu9opvQ
	(envelope-from <linux-usb+bounces-37562-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 04:08:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3611564E9F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 04:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 569303020035
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 02:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D97623AB87;
	Mon, 18 May 2026 02:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="WjJ1dXe9"
X-Original-To: linux-usb@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5B0288D0;
	Mon, 18 May 2026 02:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070099; cv=none; b=nUbPj8EMsaztcLCMsIEAQflHEYaecxmghxyFZXGf7hdk/X4zDuWPT182X/fLMOV2DXLU6v5BAW9sR7YUbstIQUx3cCo/iQIq3wi8MTmKDaRvS7jl7NP8AgBoB85xruG59IG+S7eZGRgOubZWcC2TfCGTRG5i2zIwpFUTDFhRThg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070099; c=relaxed/simple;
	bh=x8u7GTxrVk0C2PJrbCem+3xBCd5jbswvYhojVoW4ZD0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NPrHQJEKsG7YEdLV06l5ghKPzUP5bV5UmQ8x2CXvumy4pOtCv84B/Px1ZAc8lN7xdXK8zsexVo5sImFarbRVhgsxk48pclSwliIj5H6z+97YiqkqT/8a75dp541zpo6fE5UUnNYiLTX6JMTMhFTS85vBBLkyoytAGYGrc63wWCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=WjJ1dXe9; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779070089;
	bh=x8u7GTxrVk0C2PJrbCem+3xBCd5jbswvYhojVoW4ZD0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WjJ1dXe9pkIadrwUEsZ3nLCVl/sBeoO0RlerFs/2F7dsR1vqQ6h9eDUgMn+2BkJTx
	 sU+ufPnAAQlTC2n1ZqiIJ57FPvyX6d2rHwaqtdVQA2eHw9vQaKS71sYWwy+v42CegN
	 J/IlaMjSZiSqQ8sIqirJmsH1FPCrhnyLjeoSEK5x0PyTXTU4nWKrgUf0odHukYNQFB
	 OHEFn5a34TwZfn+n3rTOyQ72FOxTIW6NCsSFIYu/6tKwi/8j+t2+PmB3GBPebZHusL
	 QRsB5qRB4R0G8390g019AOKULWeZ0eKglLCCxJPRG+SUCKjYcAHVgaMAaFMht7F8gx
	 c7PaiHl78VcVw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2BFAC6037B;
	Mon, 18 May 2026 10:08:06 +0800 (AWST)
Message-ID: <7927e6edf6cbe915a66b76746436c8d19f317bd6.camel@codeconstruct.com.au>
Subject: Re: usb: gadget: aspeed_udc: list iterator used after loop in
 ast_udc_ep_dequeue
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Maoyi Xie <maoyixie.tju@gmail.com>, neal_liu@aspeedtech.com, 
	gregkh@linuxfoundation.org
Cc: joel@jms.id.au, linux-aspeed@lists.ozlabs.org,
 linux-usb@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 11:38:05 +0930
In-Reply-To: <CAHPEe=Fs223obDewRunPdTtqhVOM11AXVsLRNHx+=NP0KiFwMQ@mail.gmail.com>
References: 
	<CAHPEe=Fs223obDewRunPdTtqhVOM11AXVsLRNHx+=NP0KiFwMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: B3611564E9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37562-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,aspeedtech.com,linuxfoundation.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

On Sun, 2026-05-17 at 23:46 +0800, Maoyi Xie wrote:
> Hi all,
>=20
> (Resending from a personal address =E2=80=94 my previous attempt from
> my NTU corporate account carried an auto-appended confidentiality
> disclaimer that you've declined to accept. The content below is
> unchanged.)
>=20
> I have been running a small static check for list_for_each_entry
> past-the-end patterns, similar to Jakob Koschel's 2022 cleanup
> (commit 2966a9918df and related). The check flagged
> ast_udc_ep_dequeue() in drivers/usb/gadget/udc/aspeed_udc.c, and I
> would like to ask whether you consider this a real defect before I
> send anything formal. The same code is present in v7.0 and in
> v7.1-rc1 (the two files are byte-identical).
>=20
> The code in question is around line 691:
>=20
> =C2=A0=C2=A0=C2=A0 struct ast_udc_request *req;
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 list_for_each_entry(req, &ep->queue, queue) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (&req->req =3D=3D _req) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_d=
el_init(&req->queue);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ast_ud=
c_done(ep, req, -ESHUTDOWN);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _req->=
status =3D -ECONNRESET;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 if (&req->req !=3D _req)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D -EINVAL;
>=20
> If nothing matches, the loop exits past-the-end and req becomes the
> synthetic container_of(&ep->queue, struct ast_udc_request, queue).
> Reading &req->req after the loop is undefined per C11. The post-loop
> check works in practice only because real _req values do not collide
> with that synthetic address.
>=20
> What made me suspect this was not intentional is that 14 other UDC
> drivers in the same directory (at91_udc, atmel_usba_udc, dummy_hcd,
> fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc, max3420_udc,
> net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx) use a
> different pattern, with a separate iter cursor and a result variable.
> For example dummy_hcd.c:
>=20
> =C2=A0=C2=A0=C2=A0 struct dummy_request *req =3D NULL, *iter;
> =C2=A0=C2=A0=C2=A0 list_for_each_entry(iter, &ep->queue, queue) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (&iter->req !=3D _req) cont=
inue;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 req =3D iter;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retval =3D 0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 if (retval =3D=3D 0) { ... }
>=20
> aspeed_udc seems to be the only outlier in drivers/usb/gadget/udc/,
> which is what made me think this was probably an oversight rather
> than a deliberate idiom.
>=20
> I also tried to confirm whether it observably misbehaves. If _req
> happens to coincide with the synthetic past-the-end address, the
> function returns 0 (success) on an empty queue without removing
> anything. I attached a small userspace reproducer (poc_aspeed_udc.c
> and its output log) that arranges this collision. In normal use _req
> comes from the kernel slab and the collision is unlikely to happen
> naturally, so I am not sure whether this rises to the level of a
> real bug or just a code-quality issue.
>=20
> Two questions:
>=20
> =C2=A0 1. Do you consider the past-the-end use here a defect worth fixing=
,
> =C2=A0=C2=A0=C2=A0=C2=A0 or is it an accepted idiom in this driver that I=
 am misreading?

I don't know that it's an accepted idiom - there are only two
invocations in the driver and the other doesn't suffer the problem
you've highlighted.

list_first_entry() does note that the caller be sure that the list
isn't empty. As you note this isn't tested, so it's now a pre-condition
of ast_udc_ep_dequeue() that it's not. A bunch of gadgets test if they
have requests in-flight before invoking dequeue, so that may not be
unreasonable. However, given ast_udc_nuke(), and the implementation
admitting that the provided req might be invalid by the existence of
the test, I'm not convinced that the invariant is upheld.

Note that the (other, separate) Aspeed vhub driver avoids your concern
in its dequeue implementations, so I'd rather it's avoided in the udc
implementation as well:

 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/usb/gadget/udc/aspeed-vhub/ep0.c?h=3Dv7.1-rc4#n438
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
drivers/usb/gadget/udc/aspeed-vhub/epn.c?h=3Dv7.1-rc4#n472

>=20
> =C2=A0 2. If it is worth fixing, I already have a small patch that brings
> =C2=A0=C2=A0=C2=A0=C2=A0 the function in line with the 14 sibling drivers=
. Would you like
> =C2=A0=C2=A0=C2=A0=C2=A0 me to send it, or would you rather address it lo=
cally?

IMO send the patch. It's almost always better to be reviewing a
concrete change proposal.

Andrew

