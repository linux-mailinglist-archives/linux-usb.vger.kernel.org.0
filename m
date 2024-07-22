Return-Path: <linux-usb+bounces-12338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD199396DB
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 01:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02A44B2179F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 23:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCD8481B1;
	Mon, 22 Jul 2024 23:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DRan4rlj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4583CF74
	for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 23:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721690286; cv=none; b=GJxWmD1S7jBl4X5tg0qdTIKSYM3UlNeSHME/GDVNp7B6SlYe8TQogE4lU+QuUATpQ8KL1TGqnPQf02SzonZBSPRnSlx1LMUM1H/tzrrBhTN4IQM1cUJqbGbhEqjBuS9QtHfab5Od8wHNFShB5jX39hIlRVbx5dtfsiX8H/4AyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721690286; c=relaxed/simple;
	bh=DmIIHuUQCjlkkZry8zDj6dQ7vfShV3rdWGIiNox0SEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cw89o17a3AZNtQinZYUp5k9WING8IRGQThrSMvnxRisfW4trX9jhxsEWT0ydzc/aYPSf/4X0aSpKIX6hXpQ2apfOpY1YrsPzxLkISZvP2u4gUjhX8TUocBDBsglVo9RMx6J4fwHubxGgo0qXTkdDBPJc+gX8c8l3FBr6VneCMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DRan4rlj; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eeec60a324so63429301fa.2
        for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 16:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721690283; x=1722295083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiWHyJ2ym2jDbo57Utcb9QnSYoGtY6PCh0PZmq3/R9Q=;
        b=DRan4rljthHUKgZSAuZUgxf+7mg/M8HRoX+3BogF4YfNAez/UCkowykaHJdm+WSy3g
         zfNlCF2VtPLSCYdT3+ZklfuhUdLaSPHDAzIhcFUoko8CDgjK0zWDoepEB7idESsyjRWD
         vsIiaylZGODWeyCI2i3WhHhSPV1dSO/q9kUKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721690283; x=1722295083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiWHyJ2ym2jDbo57Utcb9QnSYoGtY6PCh0PZmq3/R9Q=;
        b=DAunN9oFtRS6FZ0Z5w63bKOqQ5X+VK2KArjHplrW0dvebTLGZllYzjCHjJR7VJGE6Y
         Epe/1Kw8K+98pwZS+kZymB0oGFFcThdsk4mr7tZ4UOiFFww/KwtTVZG2OsfL2smKZXSz
         62CgwTzedCGDiSjihRJjFV3wBWTmyd2sKfXRh/xguDkLtW7QKu9mcYiIUaU7fkOCOoat
         PEC72nYb06YPjuPxa6DWk1oa+y9ammeSiQJ28naYqk9BgqbcwpjSKAlMkNbJbbKl28ot
         B7+OBSNRGNHlq46XzvHf0gXRWsvZm9FrBsBr5zyXSnwEK5FlROjckb01h3GKRPllxHmc
         hwJw==
X-Forwarded-Encrypted: i=1; AJvYcCVSaOIHVUgcc8pBRfJc9nOYzo8ivRLWU6BcxrFwm1x+O1VgjdzZLfBapsEAnyrzBVe4Gzj4aE1Y9GwDoYITZSGG1YJWQkwHZDDh
X-Gm-Message-State: AOJu0YxJ+AFzYb9ZayzOL9r32xGMBSPJ6Pwr0ohV7p+hKKcB2k42sNw2
	XJzn6sEiiGhcPWlR/Rd6ekbKXHI6ZLmlHGtOB3G6zuS9BOTZbFpGkoWbc6+JcbPGzMM9Oq0BUkI
	xDVKoCGlbkWtneXY0yWU//fBI2nLrr4XbU9ECrE4fG4RI/vP2kK88qw==
X-Google-Smtp-Source: AGHT+IH6PLQZz+BhVAPS6nqCboY4r+mLJdAiMnAKT9e+p9LOnsQjWy6rrmUzIa5KmSZ0Yv7mx7YIdr315csqlWWnKWI=
X-Received: by 2002:a05:651c:543:b0:2ef:2e98:9718 with SMTP id
 38308e7fff4ca-2ef2e989979mr48563831fa.15.1721690282743; Mon, 22 Jul 2024
 16:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722150738.61486-1-ukaszb@chromium.org> <2024072255-grass-monastery-c7db@gregkh>
In-Reply-To: <2024072255-grass-monastery-c7db@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 23 Jul 2024 01:17:51 +0200
Message-ID: <CALwA+NZDFSk7pvbM_FbTq=Hd1+dLn7bZJGO-_uh8i11W6vDSeg@mail.gmail.com>
Subject: Re: [PATCH v1] xhci: dbc: fix handling ClearFeature Halt requests
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 6:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 22, 2024 at 03:07:38PM +0000, =C5=81ukasz Bartosik wrote:
> > DbC driver does not handle ClearFeature Halt requests correctly
> > which in turn may lead to dropping packets on the receive path.
> >
> > Below is a trace capture where due to incorrect handling of
> > ClearFeature Halt packet gets dropped on the receive path.
> >
> > /sys/kernel/debug/tracing # cat trace
> > 1) kworker/10:3-514   [010] d..1.  2925.601843: xhci_dbc_handle_event:
> >       EVENT: TRB 000000019588c0e0 status 'Stall Error' len 0 slot 1 ep =
2
> >       type 'Transfer Event' flags e:C
> >
> > 2) kworker/10:3-514   [010] d..1.  2925.613285: xhci_dbc_handle_event:
> >       EVENT: TRB 000000019588bc80 status 'Stall Error' len 1024 slot 1
> >       ep 3 type 'Transfer Event' flags e:C
> >
> > 3) kworker/10:3-514   [010] d..1.  2925.619024: xhci_dbc_handle_transfe=
r:
> >       BULK: Buffer 0000000244b49800 length 1024 TD size 0 intr 0 type
> >       'Normal' flags b:i:I:c:s:i:e:C
> >
> > 4) kworker/10:3-514   [010] d..1.  2925.619025: xhci_dbc_giveback_reque=
st:
> >       bulk-in: req 00000000a70b5ad2 length 0/1024 =3D=3D> -6
> >
> > 5) kworker/10:3-514   [010] dNs2.  2925.623820: xhci_dbc_gadget_ep_queu=
e:
> >       BULK: Buffer 0000000244b49800 length 1024 TD size 0 intr 0 type
> >       'Normal' flags b:i:I:c:s:i:e:c
> >
> > 6) kworker/10:3-514   [010] dNs1.  2925.623823: xhci_dbc_queue_request:
> >       bulk-in: req 00000000a70b5ad2 length 0/1024 =3D=3D> -115
> >
> > 7) kworker/10:3-514   [010] d..1.  2925.629865: xhci_dbc_handle_event:
> >       EVENT: TRB 000000019588bc80 status 'Short Packet' len 1000 slot 1
> >       ep 3 type 'Transfer Event' flags e:C
> >
> > 8) kworker/10:3-514   [010] d..1.  2925.635540: xhci_dbc_handle_event:
> >       EVENT: TRB 000000019588bc90 status 'Short Packet' len 763 slot 1
> >       ep 3 type 'Transfer Event' flags e:C
> >
> > 9) kworker/10:3-514   [010] d..1.  2925.635540: xhci_dbc_handle_transfe=
r:
> >       BULK: Buffer 0000000244b49c00 length 1024 TD size 0 intr 0 type
> >       'Normal' flags b:i:I:c:s:i:e:C
> >
> > 10) kworker/10:3-514  [010] d..1.  2925.635541: xhci_dbc_giveback_reque=
st:
> >       bulk-in: req 00000000b4ec77d7 length 261/1024 =3D=3D> 0
> >
> > 11) kworker/10:3-514  [010] dNs2.  2925.635561: xhci_dbc_gadget_ep_queu=
e:
> >       BULK: Buffer 0000000244b49c00 length 1024 TD size 0 intr 0 type
> >       'Normal' flags b:i:I:c:s:i:e:c
> >
> > 12) kworker/10:3-514  [010] dNs1.  2925.635562: xhci_dbc_queue_request:
> >       bulk-in: req 00000000b4ec77d7 length 0/1024 =3D=3D> -115
> >
> > Lines 1 and 2 are Endpoints OUT and IN responses to receiving ClearFeat=
ure
> > Halt requests.
> >
> > Line 7 notifies of reception of 24 bytes packet.
> >
> > Line 8 notifies of reception of 261 bytes packet
> >
> > In Lines [9, 12] 261 bytes packet is being processed.
> >
> > However 24 bytes packet gets dropped. The kernel log includes entry whi=
ch
> > is an indication of a packet drop:
> > [  127.651845] xhci_hcd 0000:00:0d.0: no matched request
> >
> > This fix adds correct handling of ClearFeature Halt requests
> > by restarting an endpoint which received the request.
> >
> > Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> >  drivers/usb/host/xhci-dbgcap.c | 29 +++++++++++++++++++----------
> >  drivers/usb/host/xhci-dbgtty.c |  5 +++++
> >  2 files changed, 24 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbg=
cap.c
> > index 872d9cddbcef..b7af3a5ac98a 100644
> > --- a/drivers/usb/host/xhci-dbgcap.c
> > +++ b/drivers/usb/host/xhci-dbgcap.c
> > @@ -173,7 +173,7 @@ static void xhci_dbc_giveback(struct dbc_request *r=
eq, int status)
> >       spin_lock(&dbc->lock);
> >  }
> >
> > -static void xhci_dbc_flush_single_request(struct dbc_request *req)
> > +static void xhci_dbc_flush_single_request(struct dbc_request *req, int=
 status)
>
>
> So now we need to look up what "status" is here for every place this is
> called?  That's going to be a pain, as you didn't even document it :(
>

The xhci_dbc_flush_single_request is called only in the function
xhci_dbc_flush_endpoint_requests which follows
xhci_dbc_flush_single_request but I will document it.

Thanks,
Lukasz

> thanks,
>
> greg k-h

