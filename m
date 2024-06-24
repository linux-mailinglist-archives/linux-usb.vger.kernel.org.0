Return-Path: <linux-usb+bounces-11584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA6915015
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 16:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83DDF28228D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 14:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE8A19AD9B;
	Mon, 24 Jun 2024 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dd05fnfT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE1919AD78
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719239840; cv=none; b=fpddvD9ANiJch8Nfbd6LasN15VlXZgfW/QtTISBtStuKUCgKfwwQnA3wMCNdxjYHN9yPlE23f4xCWQWnmgzjUcalHmTL/cpwfnORVtLkanb0mkzsFngt2fycuCqjttyPJUXnmBYUqZ4w358fNaiQVy6EhinknS38rq9tQFJ3us8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719239840; c=relaxed/simple;
	bh=IPjzzjFT2d6gGvqkLDQRAXKFQR/gwOcRz1Sr/BoYqw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dv3NDjkNNRgrqHdP69dIpWb2esVURPcNTVvX4+doc91BZwlsNQC9t2Dj/MIE1H3o+Jo8gkXKICDQwZ8c4j3W4inPGRGPFtV+2FTNBJDKmVqXpAjqTo+4UrVE1O68g0FXzQ1N8oIt84llHBphJ1JDOv/FFYrUclgPAZC8CtboYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dd05fnfT; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-63174692a02so40452317b3.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719239838; x=1719844638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNxj2+eciL79c7ow++tEl7n5O2NiqPQ3eb3DTJmQ8vU=;
        b=dd05fnfTUZjUG2dpY3BTfuzkIPXFEIudTNhvv/9m6S0sUryPh6dwZF2an7T9+4Jc2/
         MQgdQdk6m9Lv5MTbW/2GeRdt33eXV5uSiU0i8/lUALllQVvjq0MLOoz8Ndoz5zSS6Fn3
         AtwgITHp4xbsJLUM/b36vSF/GKmX7ro8OTvni3soEO/dNozhw69iKmt06HQVAiW4OKG6
         ds2gqWnkbJy4ehk52GQ+TtLMFgoyzXfs4h1/88VFMMIemUcl64OnFjYH7EQ5+R1n3aEO
         SrIbJjKXS5V/+OywqVvsB2+rXIQG9Ao8uQNXxrPYtF0bVlZ1sMmC2Dzh3E0LZqDCGFMI
         7p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719239838; x=1719844638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNxj2+eciL79c7ow++tEl7n5O2NiqPQ3eb3DTJmQ8vU=;
        b=EG3dR3K6Lia9WSvsUiGdsh5lwS/+pP8gVSTyh8yBzGNi0GB3h6Qxr373ij3c30KKaZ
         WStsPt4t7ha1V0sOOB1HLmimHEozxWEHIMbOriPUfzdQgw2pdA8pjZJ7x0F23l3E6EGM
         j+JrsbXzKfo4eljHyYdVDwGolzw5xW2zdczc75tjs78AtjK9u447ZGik3z8dtnGomP0V
         Z4tzrNWpdLE2pWDq1HI6DNvk1dojsuKbwtJuSv+LQS+kqKJ4tXGfh6aJlibDQs7YtRuk
         Eohj8bg/22Ni2i/+iptxse4O+AA4yr8Xn2GVk+FVhbLsKesS2uk8SLVrniNLkTcngrdN
         PVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZtcbkatuSsXsjCT0yiYGRT7kEubY+b17HmTONtFebXdewZm8e4hZdnZ4oENMkqB4IJzppizJ70IIyp9gdSU0DNQ/kT7QKQwnl
X-Gm-Message-State: AOJu0Yw4NnICTw9+36eQ3aMwzm+74HJXOgRyeG/ZNgFKGSFIBp6XzyI7
	6wk4WZ2B29X3STJB6Gr8y/WY754u05tWbomc79oSfmtrRNKkt+ygxCqf+J+45U8m9G3Y4P+4T1P
	jD0H2swb6EG9UvY5i1KH4szGZG07FYjtJVB5LTNzEvGfls5zH9IkoVg==
X-Google-Smtp-Source: AGHT+IF+sGE/evhSAqjM6Wm0LvOAAGz+dKOVItg6rmaDICqHlPY4MY9o2H21baQpedhJD3M2EixIu6TdGsSKPaLLKn0=
X-Received: by 2002:a05:690c:6606:b0:630:de2f:79b8 with SMTP id
 00721157ae682-6433dd746bdmr54389477b3.13.1719239837877; Mon, 24 Jun 2024
 07:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-ucsi-yoga-ec-driver-v8-1-e03f3536b8c6@linaro.org> <2024062411-neutron-striving-f16c@gregkh>
In-Reply-To: <2024062411-neutron-striving-f16c@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:37:05 +0300
Message-ID: <CAA8EJppDtmNxfjc-f9MA1Za=jvZFqahKtM+FA66jG6Dg=zp1Cw@mail.gmail.com>
Subject: Re: [PATCH v8] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Jun 2024 at 17:25, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jun 21, 2024 at 01:21:26AM +0300, Dmitry Baryshkov wrote:
> > The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
> > the onboard EC. Add glue driver to interface the platform's UCSI
> > implementation.
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Add driver for the UCSI on the Lenovo Yoga C630 laptop, as implemented
> > by the Embedded Controlller of the laptop.
> >
> > Support for this EC was implemented by Bjorn, who later could not work
> > on this driver. I've picked this patchset up and updated it following
> > the pending review comments.
> >
> > NOTE: the patch depends on the header from the platform driver. Ilpo
> > J=C3=A4rvinen has created an immutable branch based on v6.10-rc1, pleas=
e pull
> > it before merging the patches:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driver=
s-x86.git tags/platform-drivers-x86-ib-lenovo-c630-v6.11
> >
> >   platform: arm64: add Lenovo Yoga C630 WOS EC driver (2024-06-14 12:51=
:30 +0300)
>
> I have that branch, yet when building this driver as a module I get the
> following errors:
> ERROR: modpost: "yoga_c630_ec_unregister_notify" [drivers/usb/typec/ucsi/=
ucsi_yoga_c630.ko] undefined!
> ERROR: modpost: "yoga_c630_ec_ucsi_get_version" [drivers/usb/typec/ucsi/u=
csi_yoga_c630.ko] undefined!
> ERROR: modpost: "yoga_c630_ec_register_notify" [drivers/usb/typec/ucsi/uc=
si_yoga_c630.ko] undefined!
> ERROR: modpost: "yoga_c630_ec_ucsi_write" [drivers/usb/typec/ucsi/ucsi_yo=
ga_c630.ko] undefined!
> ERROR: modpost: "yoga_c630_ec_ucsi_read" [drivers/usb/typec/ucsi/ucsi_yog=
a_c630.ko] undefined!
>
> So something went wrong :(
>
> I'll unwind that branch pull now as well and wait for a fixed up version
> to be sent.

Could you please share your .config? I could not reproduce the issue
here. The EC driver has all the necessary EXPORT_SYMBOL_GPL()
declarations.

--=20
With best wishes
Dmitry

