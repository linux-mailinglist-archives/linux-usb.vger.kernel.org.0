Return-Path: <linux-usb+bounces-29346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B439DBDFE8D
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 19:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4415918815F1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 17:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1C527E05F;
	Wed, 15 Oct 2025 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fj2vMLZC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863BA2FDC40
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760550033; cv=none; b=Fc+iIdlSnS18QqWg6nBoWcrpWLXh8dvus7gJ9iorHyxDHMnJp2KVz8c1s1RFUj+pTM+c1UM3RQmCyXpzBISf0X11kSypOa9suJ5CCpQh8SBfQvyZR0dqvOOYchPbzE7Uwuy+sKn2LdguQmQJmIHIa66TVOxvY3IPyrtGLEHd7HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760550033; c=relaxed/simple;
	bh=S1FtdcUcmIeQ998wpbQfLf/uCQbI5Kp2wTYdVUeqhYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/pMKLe1rDJaIiiw0LhvTtsY/eLQBvN8hfORewyOfEDihvmRiepFRQIxIdgFQuPerbL31RR5IGaXccbb9hczN2UFdlkIl0JYMrTWgFwyn3srujtEKuK9IeUprZ0oOk8WGUIKsQKDzMMl3i2sMOR3l3caOIQlYCjshhu9HZwE+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fj2vMLZC; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b55517e74e3so7639905a12.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760550031; x=1761154831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkp4QiQO+ZGOJJIskGqlgSdH1DbycxG+pl4uWz6LL4o=;
        b=Fj2vMLZCnTOp+ubOpX09XI3jLcZ90M5IVrMZVpZkEyUltJy/M/XYqI9uK4b0koX94U
         6qXBvyWXH/79qgI3wRcJeADYvR+beO+R2NULk8xTWbjlurBRrUnGfBgdxKwEYnXQOgXk
         R5SapVE7kWDiL2HFrpFkfNumIY96e95PZBt+iI4HlqjKVwTK7/gzuTtkTloAbL8qOMfu
         KsQUotmLq+hDI0B8RpTonoNDPlTTjoVH5MrYX3oMsasHQwPCODhugld5ZAuYORYAJtxk
         QdTWnpgygHP5MEz9RPAOTuZQsNW1GxwuSISGZU8xGn9J+/L5RYVctcvd07Cxag/0608O
         K9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760550031; x=1761154831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkp4QiQO+ZGOJJIskGqlgSdH1DbycxG+pl4uWz6LL4o=;
        b=uKyinzZDgN3U4MukcbZ1n3h60QvkbBVy1qCE/D2mIgDjF9af+VfusT3eUsCa1DYyax
         Jhx909+LmMuWBkw+wEtQOtSo9zTR5Clta+4qVZxsKVQRG/+vO5N7dYGxBhLRNpifS/0q
         7XmkDt9U3B8af8A3UQtumNcB/Ojn8SVECZ4fUK5TWhTo4pffVbH6wS1v5FbjaJy1xm8D
         u2t/oz3RxSBnHjS0WaQYXCw7XINGTu2Vt/ceKWxEc6K8Ef/ijLIAWnuC79NpInFFz9sG
         BIqYtv9K7MXoDn+qRwDxeprJlkIwKV2ULWSGnu6Nxe1BrRbW4PPLkGIOX6h3g+M9+/5t
         c+Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWedXnAVYKC4Ag+74szBYUrAhE4bx2izbDgWpyF2/cxsS1ljIiD3g0JjOMAhQeJA5YRhOctur+Z2fE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pEclI3q7HQ7n1duOjvDn77IyajVLHO/LTr9TVrxaWX/8iA9i
	vCOnwVlWpehgRTRL5/I4SnlkTQcIy+kVvibhX1XjYGFr9lZHiO1eCHsle5YnchSdSEiitfw1jkd
	aWlcTxTJ8x6dF/hXXy6okVPUwxnYnyZeuOaFqW1Dw
X-Gm-Gg: ASbGncsg+l7bNlNXwzq/MRu0q/x9E0RXrT9xnfkMs/FLmRNnaqdt384B/yRlrqoWZJK
	0eX6pcv27NeoFNH9SS9kqdK5Cs8szNPhcmvSntxsm8An5ndgmPGTx3i221wc1sy6q2r9vHlyfUH
	DGcFtDAsq+YyLgNzGycdN4dsHC6JLKexo4MxQNEknccj5RW4ob/AIPMRBeke3Kj6vDrsHTPZh6V
	nAfRI4dhl3rA6dFvSPrNnR513NdY6qQXLmeGiucYBkTRwzt9FYXQLRuw7Tn0VPw/Q==
X-Google-Smtp-Source: AGHT+IGtM8hvN4lqZlO0WHIvTbL3D48lIHd91NHDkSwH6JM5GHtQa8Pa5RXv0ZasuodiKcuODGfruyjdLC0lq/iK870=
X-Received: by 2002:a17:902:e94e:b0:279:daa1:6780 with SMTP id
 d9443c01a7336-2902741cf99mr376217665ad.52.1760550030102; Wed, 15 Oct 2025
 10:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010201607.1190967-1-royluo@google.com> <20251010201607.1190967-3-royluo@google.com>
 <20251015002744.sntua4kqidgusafo@synopsys.com>
In-Reply-To: <20251015002744.sntua4kqidgusafo@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 15 Oct 2025 10:39:53 -0700
X-Gm-Features: AS18NWDkbrVxIDG8dAIZI0TtKFaXgEljVUvTQC724DiczltW9oPtD4sVlkXhIBk
Message-ID: <CA+zupgxbGjU_01JSFR_-2humZAyxwcVT5JR6h6mTVUT=3fFQ6Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 5:28=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> Hi,
>
> On Fri, Oct 10, 2025, Roy Luo wrote:
> > +#endif /* CONFIG_PM */
> > +
> > +static const struct dev_pm_ops dwc3_google_dev_pm_ops =3D {
> > +     SET_SYSTEM_SLEEP_PM_OPS(dwc3_google_pm_suspend, dwc3_google_pm_re=
sume)
> > +     SET_RUNTIME_PM_OPS(dwc3_google_runtime_suspend, dwc3_google_runti=
me_resume,
> > +                        dwc3_google_runtime_idle)
>
> Can we use the new pm_ptr() and *_PM_OPS macros to get rid of the ifdef
> CONFIG_PM guards?

Yes, will replace it with pm_ptr in the next patch.
P.S. The kernel test robot is also complaining about it. [1]

[1] https://lore.kernel.org/linux-usb/202510111335.oyOAs9MB-lkp@intel.com/

>
> > +     .complete =3D dwc3_google_complete,
> > +     .prepare =3D dwc3_google_prepare,
> > +};
> > +
> > +static const struct of_device_id dwc3_google_of_match[] =3D {
> > +     { .compatible =3D "google,gs5-dwc3" },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, dwc3_google_of_match);
> > +
> > +static struct platform_driver dwc3_google_driver =3D {
> > +     .probe          =3D dwc3_google_probe,
> > +     .remove         =3D dwc3_google_remove,
> > +     .driver         =3D {
> > +             .name   =3D "google-dwc3",
> > +             .pm     =3D &dwc3_google_dev_pm_ops,
> > +             .of_match_table =3D dwc3_google_of_match,
> > +     },
> > +};
> > +
> > +module_platform_driver(dwc3_google_driver);
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("DesignWare DWC3 Google Glue Driver");
> > --
> > 2.51.0.740.g6adb054d12-goog
> >
>
> Give me some time, and I'll review the rest of this patch.

Thanks Thinh! and a heads up, I'm splitting this patset into
two separate series as Krzysztof suggested; one for the
controller and one for the phy, so the series title might
change in the next version.

Regards,
Roy Luo

>
> Thanks,
> Thinh

