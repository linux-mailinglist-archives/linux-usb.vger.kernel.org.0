Return-Path: <linux-usb+bounces-21691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D2A5E3C1
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 19:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADEFC3BC31A
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 18:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A86257450;
	Wed, 12 Mar 2025 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DRt50Gpe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B7F1E2823
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741804741; cv=none; b=S+Rwt2CbrQqPGemcJN3f1bv2aETGpTOuFFCN0/EqMdRd+mE6HRy/jo+CRALRFaGqDe2Q1LvyDlIL+VfgyhtuQCQsl2HBbszrGrIp0E/E0+AFSARyQWSYy6kwGorkmFkTnqQ5MvzBIMcJnNj9OYzbj0JXkVK5fiiLpEDW3hOokHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741804741; c=relaxed/simple;
	bh=CLMgVqyOT0i+H9rQsHK05ZXsd9MqAU6KXohodkkMyY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KU9WxjWLU9G3GjFV8wZp3KmzbKrPHmnUD9toOyhDIJvL0l2cFCWYCrbpSdQvgoJ0LM+NyFAvnsNygrsquk0q2OVoArikO3+xQ7JLVlODB+4rbhVD+r1uV+G5k37n3DuN881yHjhn8oZ0EmKFLshUsOSKGZrikiyWbtyOisI60Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DRt50Gpe; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6dd01781b56so2649726d6.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 11:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741804738; x=1742409538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9eDTRmveeftlzdwnQM78EcvmMZWZ3IJwIxihtK2Uy4=;
        b=DRt50GpeAcdmM8VS74pt1ccf+un1HeM/WInifA9ICjUX5Pz4ITDMcpiL5jlhCid3/T
         iyp/ypWtbhPxZ9IBfchENl2aoK757X6/XHb3412Excls0wKI8Ff5gYG4d5wirkN1Cf/N
         /C8yKfQ69/9ohRfNqBl0oi4cit7LcDZHHmBdu6ynZdrcExs/2rWezKywp62fPXsci7QW
         SZufVSPavvtIrO+75N8ORcaPh8lfan6a+wum30L3e7C74cQJMIFrM3M+V77LfrSgsbyD
         LFRE5VdvgN9N5Ymb9RwshiRciI4pzpjWkvcQEQBRfZqQmeGRNU2rUDZRPbIV+ueNp+G/
         KF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741804738; x=1742409538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9eDTRmveeftlzdwnQM78EcvmMZWZ3IJwIxihtK2Uy4=;
        b=qqYWleu9URu45fpzr2h3HtLlB6GM4Cxrp6e0SUliM+m666hEdOH00BTA0xZJqOOolJ
         NjsTBxaMGCczWndqOrNeIRLVEBrxsojdPyHlU0wByr//IedUnS6hb/hQIzPC648QhAE+
         xcMvRg2aVFO1nvEqsD3mJPdcFT+vevcvQuBRZz3LW55h2IxKER3/N5+x/zY1vwDvZK3D
         2jzv57/05ZZ665BhQBwhcE34WRyurhzBDCXGnkmErHDRI4mYbgMQXBBNzFmzlskvZhjY
         BaLpy2/l+wPqO+JJqvldvvIQmXUfcvR7S9SYjRixwaHEpOrKXYQbKQZioDkuHNeaWhiA
         Vy8A==
X-Forwarded-Encrypted: i=1; AJvYcCUPc7+vIE4HsutHuwzQ4eFWxiwHJjJyu3Sy9DI8npZG65FKJixKZI9YlamUbuYFGbUSWHyGVdQJqRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7pcJPsXVXIl5oTGTisDHT/mNIBJGQq33ASHLbjVDDZbsY4D/E
	gjNx9kRNi47QevGFXOFP97dRKg2HeygVYWPLKVaJwzNEGdFJSUFAYf0j6LyOGYWhzt8LcdLDa41
	CxJzfK0PwWZ078MJtBKLpZJSEh/1AWVflMZDGYuu4ub2gJUwsIg==
X-Gm-Gg: ASbGncvK5ldy4FSbqawYdBaxKDTfjYYe7MbiPCRzroEJ/PyYNqdvvP72vBG/1Q0jANy
	2dqo8ivJXJsI6WNDkN4eyF/UZlEhvZjfa1pgYha7kTNLoQibhiEeQFdlu6HsHxwyCnld/B68iYF
	0wkwwLBnca0kTPtQ7iuheEyDawJdl0ijpEne7WnUJ/9iw0MH4b1zHAuYZkr22aatfUQA==
X-Google-Smtp-Source: AGHT+IEZW+IQU8C8ccEmFiiK4dy4yOLgd2WhpSx8zYGYEihrinEdZP2gSQUG2r7ZGKNmwPk346O5Z8kAh95oCdlgXMM=
X-Received: by 2002:ad4:5aa2:0:b0:6e4:42c2:dd91 with SMTP id
 6a1803df08f44-6e900691fb0mr399690546d6.37.1741804737883; Wed, 12 Mar 2025
 11:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304000458.1826450-1-royluo@google.com> <20250308010409.n55ivdubj7ylkr7j@synopsys.com>
 <CA+zupgzB2aKRn_KDcqSLctqmvnEW1923XQPDwDzfDVZxU70ORg@mail.gmail.com>
 <CA+zupgzw0Fr-PHzj0PPRQGuvxB+py0EMseiToq5iPKe=iRNtgg@mail.gmail.com> <20250311234436.dtpkfvnwuwqhw5jr@synopsys.com>
In-Reply-To: <20250311234436.dtpkfvnwuwqhw5jr@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 12 Mar 2025 11:38:21 -0700
X-Gm-Features: AQ5f1JprQvoM-iGZfRi7eO-R4Gm04cmK1rf5VvBgfMgAVbIUHRKik85GGyuGp4U
Message-ID: <CA+zupgwV3f9gkyFtZLK7H5Li5WW_HuDd5zwKSo4fh6h8xqW6EQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: dwc3: core: Avoid redundant system suspend/resume callbacks
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 4:44=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Tue, Mar 11, 2025, Roy Luo wrote:
> > On Fri, Mar 7, 2025 at 5:04=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synop=
sys.com> wrote:
> >
> > > I'm also a bit concernt about moving pinctrl_pm_select* to the
> > > suspend/resume_common function. Is your device using pinctrl? If not,
> > > how did you validate this?
> > >
> > > Thanks,
> > > Thinh
> > >
> >
> > I couldn't find any device node that's actually utilizing the pinctrl "=
sleep"
> > state in upstream. I digged into the patch that introduced pinctrl to d=
wc3, i.e.
> > https://urldefense.com/v3/__https://lore.kernel.org/all/9dd70870cfee401=
54a37186d4cf3ae0e9a452cbd.1441029572.git.nsekhar@ti.com/__;!!A4F2R9G_pg!chK=
bE4OVWBGIEQnHmj7n-VFIKaiyjgdJSmP7lqMx1N4pT1gpIz_qYMiI_vSwCRa6IzMHJ41eq9wkN3=
N8HE4$
> > The intention was to control DRVVBUS pins using the pinctrl API so
> > that VBUS can be turned off to conserve power when device is suspended
> > (which also implies this is only relevant in host mode, at least in the=
 initial
> > patch). Since there was no runtime PM support in dwc3 at that time, the
> > code was only added in the system suspend/resume path. Yet I don't see
> > why this cannot be extended to the runtime suspend/resume path,
> > ultimately it should be safe to turn off VBUS once the controller is
> > completely torn down with dwc3_core_exit() regardless of which suspend
> > path it's taking.
>
> If this pin drives the VBUS, changing this will also change how often we
> turning on/off VBUS. Unfortunately, I don't know enough about these
> platforms to know whether this change may impact its timing and
> stability.
>
> >
> > Besides looking at how pinctrl in dwc3 is intended to be used, I did
> > an inventory on how it actually is used. There are 3 major players:
> > ti, qcom and socionext that has pinctrl property set in their dwc3 devi=
ce node.
> > 1. ti/omap
> > The pinctrl property is only set when dr_mode is host or otg.
> > Only the "default" state is defined, none of boards has "sleep" state
> > defined, not even the first user
> > arch/arm/boot/dts/omap/am437x-gp-evm.dts
> > that introduced the API to dwc3.
> > (https://urldefense.com/v3/__https://lore.kernel.org/all/4a8a072030c2a8=
2867c6548627739146681b35a5.1441029572.git.nsekhar@ti.com/__;!!A4F2R9G_pg!ch=
KbE4OVWBGIEQnHmj7n-VFIKaiyjgdJSmP7lqMx1N4pT1gpIz_qYMiI_vSwCRa6IzMHJ41eq9wkf=
d77zMg$ )
>
> Hm... this link to the patch above seems never made it upstream.
>
> > Setting pinctrl "default" state seems to be pretty common in ti/omap,
> > and the usage is aligned with the original intention: control DRVVBUS.
> > It's unclear why "sleep" state is no longer used though.
> >
> > 2. qcom
> > The following 2 boards have pinctrl property defined, dr_mode are all
> > host and also only the "default" state is defined.
> > - sa8155p-adp.dts  &usb_1_dwc3 {
> >                                dr_mode =3D "host";
> >                                pinctrl-names =3D "default";
> >                                pinctrl-0 =3D <&usb2phy_ac_en1_default>;
> >                                };
> >                                &usb_2_dwc3 {
> >                                dr_mode =3D "host";
> >                                pinctrl-names =3D "default";
> >                                pinctrl-0 =3D <&usb2phy_ac_en2_default>;
> >                                };
> > - sm8350-hdk.dts  &usb_2_dwc3 {
> >                               dr_mode =3D "host";
> >                               pinctrl-names =3D "default";
> >                               pinctrl-0 =3D <&usb_hub_enabled_state>;
> >                               };
> > It seems the pinctrl is used to control phy and perhaps downstream usb =
hub.
> > Nothing is turned off explicitly during sleep as "sleep" state isn't de=
fined.
> > It's more like setting the required pins for host mode to work.
> >
> > 3. socionext
> > The pinctrl property is set on controllers with dr_mode peripheral or h=
ost.
> > Still, only the "default" state is defined.
> > The pin is assigned according to its dr_mode, controllers with dr_mode
> > host will be assigned with pinctrl_usb* pin, while controllers with dr_=
mode
> > peripheral will get pinctrl_usb*_device pin.
> >         pinctrl_usb0: usb0 {
> >                 groups =3D "usb0";
> >                 function =3D "usb0";
> >         };
> >         pinctrl_usb0_device: usb0-device {
> >                 groups =3D "usb0_device";
> >                 function =3D "usb0";
> >         };
> > Again, these pins are not related to power management, it's tied to dr_=
mode.
> >
> > To summarize the current pinctrl usage in dwc3:
> > 1. No user of "sleep" state, meaning it's unlikely to cause any impact
> > on suspend flow.
> > 2. Typically, the default pin state reflects the controller's dr_mode,
> > acting as a pre-configuration step to set the operational mode.
>
> Thanks for the investigation.
>
> >
> > Based on the above observation, the code change on the pinctrl is
> > unlikely to introduce a regression as it aligns with the original inten=
tion
> > of the pinctrl property, and the pinctrl_pm_select_sleep_state() is
> > essentially an NOP in upstream as of now. Besides,
> > pinctrl_pm_select_default_state() is called whenever we try to
> > re-initialize the controller.
> > I hope this addresses your concern.
> >
>
> This still doesn't sit easy for me. I would prefer a change to the
> pinctrl logic be a separate commit.
>
> For the particular intention of your patch, can you just do a check if
> dev->pins exists and leave that alone. Create a separate patch should
> you think pinctrl logic be set somewhere else.
>
> Thanks,
> Thinh

SGTM, will do it in v2.
Thanks a lot for the suggestion!

Thanks,
Roy

