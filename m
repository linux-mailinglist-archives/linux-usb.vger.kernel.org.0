Return-Path: <linux-usb+bounces-20151-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C58A285BB
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 09:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3403C1888690
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 08:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0110622A1EB;
	Wed,  5 Feb 2025 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2/GIsUA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2B222A1E6
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744838; cv=none; b=mc23AjX+DE5YNwmkbZI/yHh22+GHCXTpr8RiGkbo14/bGXnH47mnJ7FvM14d4bVd1ieVOZ/YuKz5jGCgE7C6yoYBo9am+xW7nZwpefTAFkbilzryIu4IMVcldmRLv3m7aeQIS4qfbVjvHkFUoAM+k0oSyuXtKQkCWQAAlnJuwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744838; c=relaxed/simple;
	bh=nc9vtekczR3AzqE+YNS3FhR33YVnADkRT4pnQITnIO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXcB2CMUB5If8MPXhqtzoR5XhiFIl4r//mbaSh/tIDK4vm63mJkyxEEqZ0vxsm0pXhzp548MPDzJg4Tbz7kTKufIcSd/o+0bcKFoDWP7PCRxUaG0+rCHB8TLvg/wn7rKU1wzDidTkAg2kZHY26aX3JOKcH8p87HdtETWQra6Tes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2/GIsUA; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-724f4d99bc7so1490817a34.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2025 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738744836; x=1739349636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHvpzKGRstKu7+Rdf4MnzMEr2y24O/yubCCOtQf+0ro=;
        b=H2/GIsUAkikzJ8hJcem3jsv/2QmsfZBSwjKpwHp5N/iajjFddAKgJwlU9iox6l943S
         XJPeTCh4F20+thhHWXu6JwzargczBv4mQW/1Fi3JO4tjmKBfSrq4qLihatkni1Y1C5W0
         W4WkaRGB5KZkk2lHrYRkYlsImEhHV9bU4ltE0Ai0yHDzfpG/xw0BRv5rpTOtI50SbMMo
         6l69fwT0u4VC5FL31C7BACjc0A5ih+KFPXmq1bEpq4qydOj8j09yG907F/Y+S79LAQOf
         wEc9nXZEtZBqV9mz1pA0S8s+JhMx415PIFLWvFqtJezIX1DpQh+fzrBI8mGkj8z57Np/
         RzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738744836; x=1739349636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHvpzKGRstKu7+Rdf4MnzMEr2y24O/yubCCOtQf+0ro=;
        b=rcVI/uGSwBGj7H5aj9rlZMcJV1eYjlas2orp2Ht6bHcPg4DTOOEjWeQkjb6pBj6cRz
         LeOMzWT9UNb3yu8vZLUaK0Zipi753yQ2PBLPtDIXK+TkIKlTiSGcnbYmOVr1U+RpRdx/
         giIBmM5Ehpk74EVeUwIG9ffCuUIihA0jgrHhy6WFX4cc45JioVjyAslY4cMoWkhwwJbZ
         +7FuRtO4ZFp80pbeiqjyWXoPMwSYuip0TBgKYbJ8c5En1YIrFbpTpBJjqRCU5BYMVIBD
         cPIfZTkJs3Su42pNlP5TByXL3gYBzU3jxyseKvFXBV70Jkq6aqFcr62IlDufMEbwpB23
         K8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXH8W7doXAgHtie6i6TdN8xqnE1gAJXRDzIxgQwgXEyR4zjHY5FeeZdi9HoFrwj9AF7rvdXGc2ZCdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJj2GrMvjZVSxWmKyf5cXOFtcPieiksRchqDx9jE9Q6icfYytq
	nD/qgV9zZJKzZOiVctH6rOSm3t/Iw0HHf+Hq9qZQ5i5iN3P32EbcU9FJplvvhI724zSrMb5j1zJ
	sg86dvXARQtcpgb60tmourUzZlrmpzJ44k8fi
X-Gm-Gg: ASbGncsPyWvloLDOdUtlMM2JoN7g5o8zKw8eIXOEqpCQ/6aRuXqW9ssPMcYR7StPSS4
	JH6brUoopbhW7HB3n5bO/dFHaiYkP/AbeMybi/W8ayjT8CTs6aPEmaclbSyXUi0/qZwA7i2UGGS
	BLq26nR+bJiznS6ddpj/OGTk8F9Rtg
X-Google-Smtp-Source: AGHT+IGHMEE4ziJA3O5Dv0ZwsMrxWkRsD8+UATY8NrtcImvYml3tNs2ZcrcpS1j3JPSXB8nR9Ja83CWGnhZ3uVusCVQ=
X-Received: by 2002:a05:6830:3698:b0:703:7827:6a68 with SMTP id
 46e09a7af769-726a414a4dcmr1477342a34.6.1738744835695; Wed, 05 Feb 2025
 00:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202035100.31235-1-badhri@google.com> <20250202035100.31235-2-badhri@google.com>
 <20250204004638.cacmapvsp5vlewir@synopsys.com>
In-Reply-To: <20250204004638.cacmapvsp5vlewir@synopsys.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 5 Feb 2025 00:39:59 -0800
X-Gm-Features: AWEUYZnhrHhXAL0UCg7Qlui2rzLw0o6ZthpFr2dzKgv9dQAZnbdyhhEQ_fdnjvc
Message-ID: <CAPTae5JJ11DFA=HT0xaxQXzNjO_ne0U6T43EowTRRToCKc7GxA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: core: Obtain imod_interval from device tree
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	John Youn <John.Youn@synopsys.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jameswei@google.com" <jameswei@google.com>, 
	"stable@kernel.org" <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:46=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Sun, Feb 02, 2025, Badhri Jagan Sridharan wrote:
> > Although commit cf40b86b6ef6 ("usb: dwc3: Implement interrupt
> > moderation") adds support for interrupt moderation in device
> > mode, it does not add an option to enable interrupt moderation
> > unless the version of the controller is 3.00a where the
> > interrupt moderation is automatically enabled. This patch
> > reads the interrupt moderation interval counter value from
> > device tree so that the interrupt moderation can be enabled
> > through the device tree.
> >
> > The explicit initialization to 0 can be avoided as the dwc3
> > struct is kzalloc'ed.
> >
> > Cc: stable@kernel.org
> > Fixes: cf40b86b6ef6 ("usb: dwc3: Implement interrupt moderation")
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> > ---
> >  drivers/usb/dwc3/core.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index dfa1b5fe48dc..be0d302bbab7 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1818,6 +1818,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >       dwc->dis_split_quirk =3D device_property_read_bool(dev,
> >                               "snps,dis-split-quirk");
> >
> > +     device_property_read_u16(dev, "snps,device-mode-intrpt-mod-interv=
al",
> > +                              &dwc->imod_interval);
> > +
>
> This value will get overwritten in dwc3_check_params() for DWC_usb3
> v3.00a.
>
> >       dwc->lpm_nyet_threshold =3D lpm_nyet_threshold;
> >       dwc->tx_de_emphasis =3D tx_de_emphasis;
> >
> > @@ -1835,8 +1838,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >       dwc->tx_thr_num_pkt_prd =3D tx_thr_num_pkt_prd;
> >       dwc->tx_max_burst_prd =3D tx_max_burst_prd;
> >
> > -     dwc->imod_interval =3D 0;
> > -
> >       dwc->tx_fifo_resize_max_num =3D tx_fifo_resize_max_num;
> >  }
> >
> > --
> > 2.48.1.362.g079036d154-goog
> >
>
> Do you need a property to adjust the IMOD interval? If not, just enable
> it for all capable devices (dwc3_has_imod) with IMODI of 1 for now. It
> should be good to have it enabled for all capable devices by default.
>

Yes, IMHO it would make sense to have a property to adjust IMOD
interval for two reasons:
1. This would be then identical to the "imod-interval-ns" property
that's used for XHCI based host mode controllers.
2. Also, potentially allowing the controller to interrupt once every
250ns might not be desirable for all platforms and should be left as
platform tunable to fully realize the capability of interrupt
moderation which the controller offers again similar to
"imod-interval-ns" property in host mode.

Along with this I will also set the default value to 1 in my v2 which
I will send out shortly.

Thanks,
Badhri

> BR,
> Thinh

