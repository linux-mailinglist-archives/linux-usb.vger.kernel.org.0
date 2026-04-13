Return-Path: <linux-usb+bounces-36216-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHfRHqdC3WkubQkAu9opvQ
	(envelope-from <linux-usb+bounces-36216-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 21:23:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF213F2A1D
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 21:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB411306B08E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 19:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66F6C3612EE;
	Mon, 13 Apr 2026 19:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRyJlnQM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9A533F5A6
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776108056; cv=pass; b=d/R9oPqAm674iYWzGIYrWuO6vaRdxmNXKCUczRsDyKcCCE+95s15SIn95RAuUBvUfnQ2j+qz0/pGmSO2pKuE19hyB62G20ECpXSVYQj7wagc4e9OY+H8vOpBQ7pfpP1HRJX6Sk8eBfjdaW0D2Uf6nISYns8i2Eihy5OE2brN0ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776108056; c=relaxed/simple;
	bh=gOZHoGsfMHU8YEyRDbAh79rI/Dyzjr9SzF5coRCsLPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EE4HTP4+G2WM1DMJ3c5qb9A6yNaLg2r3iHqLehgMMscCkGrBVD75crURUnRLXXZ6MFaipQFGiOqv1HwS5tyyGtqIUpjXDUFtWUY7KCLDWYtLNdjTuab8WImrudm+NjZPTWdfQb3S5V8LdKibk/JD3wX10fuFLs0Az79En0OLjjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRyJlnQM; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f9568e074so769326466b.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 12:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776108053; cv=none;
        d=google.com; s=arc-20240605;
        b=TuEDGS0WGg7ZGXrowlcIiKC7iib5G05jsJjVlHEL+qdXvUpyUjzalDbEh8N6xq4sGv
         T48npNfjSEtn4vzEaH57eyZHVaNqnBitOT1Bu1MAYQSbF4WqLP/vAZVm9lSHcWjlWHxM
         kEFGyNyPfCAGf8R8AJzl754UK1WC3Iw02eXMzc0Xf7cv4fM6hqyXCXdDTAmuxaM/WYfh
         7OpW/SU/rhgh2r7pS1H2sEzSg3FjTlG6+0QzzZ/B34WZ/uVR/ASsQYIGtuqaVCarGF9a
         llUoNXWO/RiWOiFaqoa1dJBOmAy3ZuYKwMRJd8Rluxb2tD9Ac6idmaPNC2bx57svHN7a
         OWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6j2DEXG/4irDMZVc5XFysACYZ5vdAPgoKfQ75xHiNk8=;
        fh=pD2JYrZcSSAuTrMk8oYm4EgWqn5RgNX2Ss7Gp53u84E=;
        b=lQFHZh7x8EcW7XHmQhy5huhxeABeyA5foG3eDGLOjgWr5cmuKbN0vE3DxtfcMIgJzR
         o9X2nc661jSFJSCeRsbkpYCV7xqshGS/CzdKkOTChh6oMxkIwf3FT6xq2V7abzXzx7JU
         s5JN+sZcfPY6x/aZhcGZmsKGefqGE272aX7x6qwUoVQHkwSPzinAatoSJgp1PjBeqvRG
         V6QrW8NkMehoBxZONFnYVDxyjDVDFcTdyiVnhpUGOBRfbs2VwiNAqJjwiaTKtEivybbw
         zBBkEZ/ocwvRb3kIm+9DSw0XCqvSYA8Y65HcOtkvlAFdvLRA5o+DDgcfTKKFFYAz3Dh/
         iBOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776108053; x=1776712853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6j2DEXG/4irDMZVc5XFysACYZ5vdAPgoKfQ75xHiNk8=;
        b=LRyJlnQMFPoHrVT0lHiyOmwo6kPeAWNdjjVGAvwCeMyVfC7CJruGFSZ7NPaO4Q6hLQ
         InW6K30P8CQiusXjEqyKULqlwZcu61/cYeYDw61WoAsNfpg6GGE68AAabIqvxpm7BQ0w
         9KJsPA98oLrgm1Whs7jsaFd9GoIjQgufEbyl69VeIm4sFREGz9J5i8TEc+BrxYSp9SO7
         dPvrQz9sdw8g3K0BI8Q4Y6QHlvwpS2LajlQ48/Y27RBJdv7FcG8U6mw2Zq4voX+6Ttub
         U9YgFSqHQvyPgf4bxz6YgUWLP3dt7bWWVeSXPO1Q4GCAVXTDgVbNKKJrn4dWueW1kUNz
         JKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776108053; x=1776712853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6j2DEXG/4irDMZVc5XFysACYZ5vdAPgoKfQ75xHiNk8=;
        b=O9LQGnrErzpZF48GX9iQOksVzHSxhD58NlIsf05TCDDge7+Fd/vq70vd/UOBcD+mRJ
         WUky4TrwOlRqQczoW1rvY26Qq2tCfZK7aiee1EuWok/F7r1nmtprmE4ctgKptUtBj5j4
         zNPwnDqfuAMNZ2htbVLXOgnHQ5pxMJ49P+EWeYmlzODm17qJNn6zHFt5s3xJ6EwbiYK8
         xMM3NWRGvpYWAMnX7te+4ths2CdctTlWjDGp2cfQhV1dgPP2MecvUuWqPoiVnUrKhZNR
         0g8IqYKigPYqPUpCO4hp5cJ7bQsSWvIdxZNoPvj79PkeCKgox0kQ+y1+K6os9E+wEyZ4
         5MIw==
X-Gm-Message-State: AOJu0Yxf5Yg+N5S7mH5+P/JSRgUa3GJ7KIh1hz7npqT+kUWSzKwpdqGh
	FzM5WeRdCd9MtVzRmFpP02JcUVoxb3lQH5eBvxrfkz6LW9rRJfW09q7JZaolYPuxVAkcvHf6f8j
	8As0MwTxLj9zXq5ocdWEi6M1Pfp93F8Bjkg==
X-Gm-Gg: AeBDieuBv1PZgsTsSRyWXsCbBayunMQ2H2g39Y2AVK+Q7VE4QaRk3QSS9NgE8K3prgt
	aLtkEF98BUJAKI9TrT2mKAS+48nJh219hbwVfHmOAO8LmdQSvHOZemJDd7/3A45LkF87UhMU8Yz
	kFFMsZOQZDGzHERILH5wol09AVvxpOImCxajePVzm1js6mVCvNH++fp37DbtmsSKHKjNHDi+2AZ
	tVCwoI+u1tXfva8eknqfv1dw0DFy8o0xgQTfo2zr6e9VhVknAL4FrMCgKgbVe2T0iaKJmcyu8VR
	MFyK6aCkdQOizXPBnKH35fXtRe3oftDuXZzjZjCXX9yMDRypo/ubKGFNyh9Gio2BSRVLJ/A/fPg
	+NmR6+Q==
X-Received: by 2002:a17:907:1c84:b0:b97:992b:8806 with SMTP id
 a640c23a62f3a-b9d724361dbmr886354866b.11.1776108052561; Mon, 13 Apr 2026
 12:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411041252.166816-1-rosenp@gmail.com> <f8ea0484-6f6f-4426-aea6-fc45f566f692@broadcom.com>
In-Reply-To: <f8ea0484-6f6f-4426-aea6-fc45f566f692@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 13 Apr 2026 12:20:41 -0700
X-Gm-Features: AQROBzDPyJ7FUAtzKiOWMEu6eQr26UUe0KIXBelmHSjDVPDSI80zsIbF6CykwyY
Message-ID: <CAKxU2N_xvpo-vzsffPHUuNDW+Ew0gBVBupmmOts3WXJO=0D9Mw@mail.gmail.com>
Subject: Re: [PATCH] usb: bdc: allocate phys with main struct
To: Justin Chen <justin.chen@broadcom.com>
Cc: linux-usb@vger.kernel.org, Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36216-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,linuxfoundation.org,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BBF213F2A1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:51=E2=80=AFAM Justin Chen <justin.chen@broadcom.=
com> wrote:
>
>
>
> On 4/10/26 9:12 PM, Rosen Penev wrote:
> > Use a flexible array member to combine allocations and simplify code
> > slightly. No need for a branch deciding whether to allocate or not.
> >
> > Add __counted_by for extra runtime analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/usb/gadget/udc/bdc/bdc.h      |  2 +-
> >   drivers/usb/gadget/udc/bdc/bdc_core.c | 20 +++++++-------------
> >   2 files changed, 8 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/=
bdc/bdc.h
> > index 2f4abf6f8f77..cc961161eb46 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc.h
> > +++ b/drivers/usb/gadget/udc/bdc/bdc.h
> > @@ -409,7 +409,6 @@ struct bdc {
> >       spinlock_t      lock;
> >
> >       /* generic phy */
> > -     struct phy      **phys;
> >       int num_phys;
> >       /* num of endpoints for a particular instantiation of IP */
> >       unsigned int num_eps;
> > @@ -453,6 +452,7 @@ struct bdc {
> >        */
> >       struct delayed_work     func_wake_notify;
> >       struct clk              *clk;
> > +     struct phy              *phys[] __counted_by(num_phys);
> >   };
> >
> >   static inline u32 bdc_readl(void __iomem *base, u32 offset)
> > diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget=
/udc/bdc/bdc_core.c
> > index 438201dc96ca..4b16b85da450 100644
> > --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> > +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> > @@ -487,14 +487,20 @@ static int bdc_probe(struct platform_device *pdev=
)
> >       int irq;
> >       u32 temp;
> >       struct device *dev =3D &pdev->dev;
> > +     int num_phys;
> >       int phy_num;
> >
> >       dev_dbg(dev, "%s()\n", __func__);
> >
> > -     bdc =3D devm_kzalloc(dev, sizeof(*bdc), GFP_KERNEL);
> > +     num_phys =3D of_count_phandle_with_args(dev->of_node,
> > +                                             "phys", "#phy-cells");
> > +     bdc =3D devm_kzalloc(dev, struct_size(bdc, phys, num_phys), GFP_K=
ERNEL);
> >       if (!bdc)
> >               return -ENOMEM;
> >
> > +     bdc->num_phys =3D num_phys;
> > +     dev_info(dev, "Using %d phy(s)\n", bdc->num_phys);
> > +
>
> This feels like a step sideways instead of an improvement IMHO. And we
> are also moving the allocation and dev_info() print. Is there a reason
> to change the ordering?
Of the allocation, yes since we need the size.

Of the dev_info, no. I can move it back.
>
> Justin
>
> >       bdc->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >       if (IS_ERR(bdc->regs))
> >               return PTR_ERR(bdc->regs);
> > @@ -508,18 +514,6 @@ static int bdc_probe(struct platform_device *pdev)
> >       bdc->dev =3D dev;
> >       dev_dbg(dev, "bdc->regs: %p irq=3D%d\n", bdc->regs, bdc->irq);
> >
> > -     bdc->num_phys =3D of_count_phandle_with_args(dev->of_node,
> > -                                             "phys", "#phy-cells");
> > -     if (bdc->num_phys > 0) {
> > -             bdc->phys =3D devm_kcalloc(dev, bdc->num_phys,
> > -                                     sizeof(struct phy *), GFP_KERNEL)=
;
> > -             if (!bdc->phys)
> > -                     return -ENOMEM;
> > -     } else {
> > -             bdc->num_phys =3D 0;
> > -     }
> > -     dev_info(dev, "Using %d phy(s)\n", bdc->num_phys);
> > -
> >       for (phy_num =3D 0; phy_num < bdc->num_phys; phy_num++) {
> >               bdc->phys[phy_num] =3D devm_of_phy_get_by_index(
> >                       dev, dev->of_node, phy_num);
>

