Return-Path: <linux-usb+bounces-12605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8F9401EF
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 02:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9278E1C21AB7
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2024 00:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C8510E3;
	Tue, 30 Jul 2024 00:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k1TxTIUF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A119184E
	for <linux-usb@vger.kernel.org>; Tue, 30 Jul 2024 00:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722298651; cv=none; b=CXS0TyPxxRJwq68HJZT1B5vZb9wxR9mLx9ijMzRKXomNQVUkERU8ZBbWGna1OGhVQe/9MPmaNmdSGsj4+rbvaUd9ZHQz+/5d5pNIafncw8CcCohgtW6+G1JwqCU0AF8/zGeYkUXqsdTXtOmoPAQtQHyV0jQnAH3xU1OKTCfuAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722298651; c=relaxed/simple;
	bh=cz9A4Yw6RKrxM/Q9k3vxfHxVNHQBoltxIzAzm/oT55k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7wzBQjZHp5tprzAEF/lKjE6wJK6HrZC5Y4ewZXvK/WCvQPDQS39IsPBY3CaXxk23sYPTY+A6IBKS/XIcxFLypGEaYPwf6jomxDkDeXxkOKZunQdxIraL1brzbypXJmJ8FCoN9M4OGBUdmKsthbVK/3XS5teqBCbukZCw0wCRqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k1TxTIUF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f040733086so45545011fa.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 17:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722298648; x=1722903448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+UXJ1O0iC+78A9Q5yUHWRHGRDV4P0vjBM31p58dt/A=;
        b=k1TxTIUFlmptlVRE3wpw5ojS3vVz1+9NH8a9J3RZmx/yhocLSvlpIbvUgF7cw3VZhn
         ZGcoGKeOIHwCNQVtzDlGdpbsiUd7s/acnk/VtEWTlNPRLR9CYQPmNFp3iUqFHZcgweqS
         fMV9d6ggWzU0dufPg5DR8AyipwYI0k2kqQo2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722298648; x=1722903448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+UXJ1O0iC+78A9Q5yUHWRHGRDV4P0vjBM31p58dt/A=;
        b=unl9D1UsQ8UMypi19Wm6YA7n7a7FkojwkpBudYrce4mZqqrM+1zIGyBzutLCg+skPf
         gUwM/3J1mYZEg+4kSgxujLg7SwuEvSgEgC45H6dvNLaggEXcVde7BOg94ppA2g9UxCTq
         DyBcj/271oaImNGWhTf/q7VDi9AB2FA7aulKBT5EN0PkFCHU4UDYW6e/L4Tr1435yV85
         QmWNynfINjzt6WO+ljcHhAlSKPiwdB/Y4v8tW7BxGBfwA1fitsTD99Ps2XXBmTD/JGDe
         y7gg1E+20E4AU3b6yxlYa6+mS6nDIUgrYKtwML19InMWNZYOdO5DKEt/wgeayImIdFx9
         EtOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBSBwhZds0D+Fhycx4gMIyHoNXivOocMaJE5nw2/0RSTAx/d+i+myHkFcTfdYGyzLRXdG1wbCnCJI5nrIeOaybGG9cXKeTmeJk
X-Gm-Message-State: AOJu0YyDzSQMezdmgXXT/8AYbjuOq2o99glpMY3VGqZgrObicWsYjudN
	IaApsjJIHRyMVHTu+4lWJKZdt9H43bUjw1TbxEzoo2pCJCoYc8hMeT5SrutaTdJicEh43bD2bzr
	gBpq0a4yXj/nTv7Lk5zUextGv/nuOrWKCutxDp6672rvqkhD4ZJo=
X-Google-Smtp-Source: AGHT+IFMGQyRRj4QqPMCUYOWYLkr14SFSAmq8c8OffW0I+k7Pgj6bbYfL4yyjeXfE2/XiWkLRsf0NsJtAYGAEEBTPfQ=
X-Received: by 2002:a2e:9949:0:b0:2ee:7a3e:4721 with SMTP id
 38308e7fff4ca-2f12ee422admr56783801fa.39.1722298647804; Mon, 29 Jul 2024
 17:17:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725074857.623299-1-ukaszb@chromium.org> <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
In-Reply-To: <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Tue, 30 Jul 2024 02:17:15 +0200
Message-ID: <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com>
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 4:11=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> Hi
>
> On 25.7.2024 10.48, =C5=81ukasz Bartosik wrote:
> > DbC driver does not handle ClearFeature Halt requests correctly
> > which in turn may lead to dropping packets on the receive path.
>
> Nice catch.
> Looks like a halted endpoint is treated almost as a disconnect.
>
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
>
> Stall errors (Line 1 and 2) events are probably issued already when endpo=
int halts,
> before the host responds with a ClearFeature(Halt) request.
>

I observed these stall errors are the result of calling
libusb_clear_halt() function which results
in sending ClearFeature(Halt) requests to a device. I should have
mentioned it in the commit
message because this is a vital piece of information.

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
> > Changes v2->v1:
> > - Documented both xhci_dbc_flush_single_request and
> > xhci_dbc_flush_endpoint_requests functions.
> > ---
> >   drivers/usb/host/xhci-dbgcap.c | 48 +++++++++++++++++++++++++++------=
-
> >   drivers/usb/host/xhci-dbgtty.c |  5 ++++
> >   2 files changed, 43 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbg=
cap.c
> > index 872d9cddbcef..36ec3242e096 100644
> > --- a/drivers/usb/host/xhci-dbgcap.c
> > +++ b/drivers/usb/host/xhci-dbgcap.c
> > @@ -173,7 +173,17 @@ static void xhci_dbc_giveback(struct dbc_request *=
req, int status)
> >       spin_lock(&dbc->lock);
> >   }
> >
> > -static void xhci_dbc_flush_single_request(struct dbc_request *req)
> > +/**
> > + * xhci_dbc_flush_single_request - flushes single request
> > + * @req: request to flush
> > + * @status: 0 or -ERESTART - after the request is flushed it will be q=
ueued
> > + *          back to the endpoint
> > + *
> > + *          -ESHUTDOWN - after the request is flushed it won't be queu=
ed back
> > + *          to the endpoint and if it was last endpoint's request the =
endpoint
> > + *          will stay shut
> > + */
>
> Hmm, I need to dig into this.
>
> I don't think we should push this problem up to the request completion ha=
ndler.
> Maybe we are flushing requests that should not be flushed?
>

Section 7.6.4.3 "Halted DbC Endpoints" in Intel's xHCI specification
says the endpoint can
be halted by HW in case of error. Also it can be halted by software
through HIT or HOT flags for DbC.
I wonder how to recover properly from the Halted state caused by HW
error ? Does it make sense to continue with
the requests or just restart the endpoint (flush all requests) as this
patch does ?

> Do you have an easy way to reproduce the stall error case?
>

Yes I can easily reproduce the case with the stall errors.
Would you like me to run any specific scenarios ?

Thanks,
Lukasz

> Thanks
> -Mathias

