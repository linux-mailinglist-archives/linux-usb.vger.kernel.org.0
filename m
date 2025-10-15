Return-Path: <linux-usb+bounces-29314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B09BDC6EF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 06:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67CC33E554A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 04:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542682EA480;
	Wed, 15 Oct 2025 04:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iaZyFl+U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9E02DC774
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 04:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760501521; cv=none; b=gXh/DqovZK/D0XA1OLwBKe7/fCxBLQ2a1vtQYoSQbEeNihtgvJ0kjy00KSI5M6MfO6gT8JEx8yy2PqNq4y0G0UwSIZZDe4fe4aJJKz9xIiay9cRU4zjPPocC90OhM6G+00l/3UGeismr2mSGfHX0SB3JDB+zaB4Js7XrYSBGfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760501521; c=relaxed/simple;
	bh=3aezUMPvQFpq1U+cW4DsMSQzxrvfO6B4WxS2uYIK4FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0Idwc1AkCiTYb/zH5teJWTBUTiUMDZQFEppU976QvVeZJCrD29ezDCQS9M9EvMpQJZ9JF/A0ZPqnTujXneZlt/D9WnHesfi1nqeQdohiETRPI0QJD07AV+0N5ED4P+v8IWORb5ZHC2WSxH4A0lZE5p1DbuCPa3xvWetyBwGMUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iaZyFl+U; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-43f696ebf8eso1510713b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 21:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760501519; x=1761106319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee/uLZ22R8yUcyezN/3VYpGFoULdJ/79+GYW7D3DpvI=;
        b=iaZyFl+UIYoJf+194awlh4sWpviBdzbCQb0aotTbxFj0Ell4N6/f2+l0pywBoj+Ihw
         Mw6qv1/NVy/HgFqTXwgqV73el2D7RZ7wdn/Ncgvr3YWOdBhvhf/jX0nNgGBCd+2dmXWR
         oGXf+zvv8mBFNITFBlI86XZX6TbGvQj9tgRYWa74aeeXfvRziV4AgQauOIhBRjSsRmnh
         kPUf1TlAQQlSTr4ocpmF5i7eZNWrd50K1CMgr+9JBl7q+9CxSUHLrIs+9urAYUIgc3Fc
         vRpLVq/BWdI5LZ8pSTQQBcZDcWh/4tSIHx4RJ/zlnLIYOhS8nKky/j+facM5WXkkzqNK
         p1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760501519; x=1761106319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ee/uLZ22R8yUcyezN/3VYpGFoULdJ/79+GYW7D3DpvI=;
        b=EsxpPEmxCAlL/wVLySM0laWQgSQqOm5LjIbGBwXONc4auj6SsF+g4Ew2x0JOvJ2UPw
         FJ3W27CjzTJd3gxap0D1qG78WmXJ8w9h4+4FBRObcohGjKv4Hw17k/MNpPNB13tZvpV3
         gnr/vyCez7bfO0PIglUB8+J2SduU786hQmTzw/o+97uS8C+Pe5oFvJeZR03qFuO3syl1
         c+eZVNMFUs8ockhZNS2XZmPAAHtEGPHHOwstz/EXFvNLUCnMA1VUkR1rA2IhiaDFEWDA
         v+0ibpCqCZCeTgbo2X6FdaqsYms6RGF81WSVur9GGIon8SqQFxUg4R2nAI7sIrH50Oes
         cyIg==
X-Forwarded-Encrypted: i=1; AJvYcCXvcQR3+CEtrb6jhdWirvyHucO9mSHfR9Je36vIl3V7Yvte38uOsFn4BehfZXUk5OSr58c7TMmzvgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7wR00qre6SceR3EPfBwFNEId6DjgoussNiq41VJDef0nd3szA
	+OErIMYp0qtehUioZcSMYR36xZssUeKGosUYfHvwF9miu8TiqkpFHqsyZVQ8DjEXr8/EDLlGxip
	wQkrGggzpUvFoZTXn25nrazYDxoP8FlbyHVYlGxDk
X-Gm-Gg: ASbGncvUfyA60pceSOSdcUiLNO4ujesNWPx8XWeF7DFh3KakInq3nPCDdZz6Dbe958A
	x8bjYxs54+lQcCv/59rR49acironQWlfjnTr44qy9CbTz0FegtiJ/lfUwU+/vjfv52JhoWb0XrK
	iqWILxvK3PTBFI9fa7u/qKWhq4aBzKgaIwxmUoNHOcT44J0HWk8/AEdfrwBSjmmstndW05EvOcj
	YL6VkBBQ85H+vr04k2H8nkCWYKMG0hsOFQitvIk4V3nwMvpRKUAAYC0PBm+7l5495PR4BpuAA==
X-Google-Smtp-Source: AGHT+IHrprG5RaNI8hm+Vn3v7lBRDhd2kOfjtowRr+cXme5az+TAz9o3ncG95bx1kbJOhzxcWoV92MmCmJLvQdcJ0o4=
X-Received: by 2002:a05:6808:e83:b0:441:8f74:e85 with SMTP id
 5614622812f47-4418f74275fmr9422350b6e.63.1760501518921; Tue, 14 Oct 2025
 21:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015040607.3005975-1-badhri@google.com> <20251015040607.3005975-2-badhri@google.com>
In-Reply-To: <20251015040607.3005975-2-badhri@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 14 Oct 2025 21:11:22 -0700
X-Gm-Features: AS18NWCihkB7XIPGMyRBhu6dr6bKmikGXczFPtU_OQbIRiqsASJZpytv_ZIfAVc
Message-ID: <CAPTae5+sAAj+j1Ob=Xy93rbs21SiSkKm0gHLmF0kxue_HoOGuQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] usb: typec: pd: Register SPR AVS caps with
 usb_power_delivery class
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com
Cc: amitsd@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 9:06=E2=80=AFPM Badhri Jagan Sridharan
<badhri@google.com> wrote:
>
> usb_power_delivery class will now display AVS cap as
> `spr_adjustable_voltage_supply`. `maximum_current_9V_to_15V` and
> `maximum_current_15V_to_20V` shows the corresponding current limits
> in mA. `peak_current` follows the same convention as fixed_supply
> where the value reported in the capabilities message is displayed
> as is.
>
> Sample output with an SPR AVS capable PD charger:
> $cat /sys/class/usb_power_delivery/pd1/source-capabilities/5:spr_adjustab=
le_voltage_supply/maximum_current_9V_to_15V
> 4000mA
>
> $cat /sys/class/usb_power_delivery/pd1/source-capabilities/5:spr_adjustab=
le_voltage_supply/maximum_current_15V_to_20V
> 3350mA
>
> $cat /sys/class/usb_power_delivery/pd1/source-capabilities/5:spr_adjustab=
le_voltage_supply/peak_current
> 0
>
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  .../testing/sysfs-class-usb_power_delivery    | 28 ++++++
>  drivers/usb/typec/pd.c                        | 95 ++++++++++++++++++-
>  drivers/usb/typec/tcpm/tcpm.c                 |  2 +-
>  3 files changed, 119 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/D=
ocumentation/ABI/testing/sysfs-class-usb_power_delivery
> index 61d233c320ea..c754458a527e 100644
> --- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> +++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
> @@ -254,3 +254,31 @@ Contact:   Heikki Krogerus <heikki.krogerus@linux.in=
tel.com>
>  Description:
>                 The PPS Power Limited bit indicates whether or not the so=
urce
>                 supply will exceed the rated output power if requested.
> +
> +Standard Power Range (SPR) Adjustable Voltage Supplies
> +
> +What:          /sys/class/usb_power_delivery/.../<capability>/<position>=
:spr_adjustable_voltage_supply
> +Date:          Oct 2025
> +Contact:       Badhri Jagan Sridharan <badhri@google.com>
> +Description:
> +               Adjustable Voltage Supply (AVS) Augmented PDO (APDO).
> +
> +What:          /sys/class/usb_power_delivery/.../<capability>/<position>=
:spr_adjustable_voltage_supply/maximum_current_9V_to_15V
> +Date:          Oct 2025
> +Contact:       Badhri Jagan Sridharan <badhri@google.com>
> +Description:
> +               Maximum Current for 9V to 15V range in milliamperes.
> +
> +What:          /sys/class/usb_power_delivery/.../<capability>/<position>=
:spr_adjustable_voltage_supply/maximum_current_15V_to_20V
> +Date:          Oct 2025
> +Contact:       Badhri Jagan Sridharan <badhri@google.com>
> +Description:
> +               Maximum Current for greater than 15V till 20V range in
> +               milliamperes.
> +
> +What:          /sys/class/usb_power_delivery/.../<capability>/<position>=
:spr_adjustable_voltage_supply/peak_current
> +Date:          Oct 2025
> +Contact:       Badhri Jagan Sridharan <badhri@google.com>
> +Description:
> +               This file shows the value of the Adjustable Voltage Suppl=
y Peak Current
> +               Capability field.
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index d78c04a421bc..67f20b5ffdf4 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -359,6 +359,84 @@ static const struct device_type sink_pps_type =3D {
>         .groups =3D sink_pps_groups,
>  };
>
> +/* ---------------------------------------------------------------------=
----- */
> +/* Standard Power Range (SPR) Adjustable Voltage Supply (AVS) */
> +
> +static ssize_t
> +spr_avs_9v_to_15v_max_current_show(struct device *dev,
> +                                  struct device_attribute *attr, char *b=
uf)
> +{
> +       return sysfs_emit(buf, "%umA\n",
> +                         pdo_spr_avs_apdo_9v_to_15v_max_current_ma(to_pd=
o(dev)->pdo));
> +}
> +
> +static ssize_t
> +spr_avs_15v_to_20v_max_current_show(struct device *dev,
> +                                   struct device_attribute *attr, char *=
buf)
> +{
> +       return sysfs_emit(buf, "%umA\n",
> +                         pdo_spr_avs_apdo_15v_to_20v_max_current_ma(to_p=
do(dev)->pdo));
> +}
> +
> +static ssize_t
> +spr_avs_src_peak_current_show(struct device *dev,
> +                             struct device_attribute *attr, char *buf)
> +{
> +       return sysfs_emit(buf, "%u\n",
> +                         pdo_spr_avs_apdo_src_peak_current(to_pdo(dev)->=
pdo));
> +}
> +
> +static struct device_attribute spr_avs_9v_to_15v_max_current_attr =3D {
> +       .attr =3D {
> +               .name =3D "maximum_current_9V_to_15V",
> +               .mode =3D 0444,
> +       },
> +       .show =3D spr_avs_9v_to_15v_max_current_show,
> +};
> +
> +static struct device_attribute spr_avs_15v_to_20v_max_current_attr =3D {
> +       .attr =3D {
> +               .name =3D "maximum_current_15V_to_20V",
> +               .mode =3D 0444,
> +       },
> +       .show =3D spr_avs_15v_to_20v_max_current_show,
> +};
> +
> +static struct device_attribute spr_avs_src_peak_current_attr =3D {
> +       .attr =3D {
> +               .name =3D "peak_current",
> +               .mode =3D 0444,
> +       },
> +       .show =3D spr_avs_src_peak_current_show,
> +};
> +
> +static struct attribute *source_spr_avs_attrs[] =3D {
> +       &spr_avs_9v_to_15v_max_current_attr.attr,
> +       &spr_avs_15v_to_20v_max_current_attr.attr,
> +       &spr_avs_src_peak_current_attr.attr,
> +       NULL
> +};
> +ATTRIBUTE_GROUPS(source_spr_avs);
> +
> +static const struct device_type source_spr_avs_type =3D {
> +       .name =3D "pdo",
> +       .release =3D pdo_release,
> +       .groups =3D source_spr_avs_groups,
> +};
> +
> +static struct attribute *sink_spr_avs_attrs[] =3D {
> +       &spr_avs_9v_to_15v_max_current_attr.attr,
> +       &spr_avs_15v_to_20v_max_current_attr.attr,
> +       NULL
> +};
> +ATTRIBUTE_GROUPS(sink_spr_avs);
> +
> +static const struct device_type sink_spr_avs_type =3D {
> +       .name =3D "pdo",
> +       .release =3D pdo_release,
> +       .groups =3D sink_spr_avs_groups,
> +};
> +
>  /* ---------------------------------------------------------------------=
----- */
>
>  static const char * const supply_name[] =3D {
> @@ -368,7 +446,8 @@ static const char * const supply_name[] =3D {
>  };
>
>  static const char * const apdo_supply_name[] =3D {
> -       [APDO_TYPE_PPS]  =3D "programmable_supply",
> +       [APDO_TYPE_PPS]      =3D "programmable_supply",
> +       [APDO_TYPE_SPR_AVS]  =3D "spr_adjustable_voltage_supply",
>  };
>
>  static const struct device_type *source_type[] =3D {
> @@ -378,7 +457,8 @@ static const struct device_type *source_type[] =3D {
>  };
>
>  static const struct device_type *source_apdo_type[] =3D {
> -       [APDO_TYPE_PPS]  =3D &source_pps_type,
> +       [APDO_TYPE_PPS]     =3D &source_pps_type,
> +       [APDO_TYPE_SPR_AVS] =3D &source_spr_avs_type,
>  };
>
>  static const struct device_type *sink_type[] =3D {
> @@ -388,7 +468,8 @@ static const struct device_type *sink_type[] =3D {
>  };
>
>  static const struct device_type *sink_apdo_type[] =3D {
> -       [APDO_TYPE_PPS]  =3D &sink_pps_type,
> +       [APDO_TYPE_PPS]     =3D &sink_pps_type,
> +       [APDO_TYPE_SPR_AVS] =3D &sink_spr_avs_type,
>  };
>
>  /* REVISIT: Export when EPR_*_Capabilities need to be supported. */
> @@ -407,8 +488,12 @@ static int add_pdo(struct usb_power_delivery_capabil=
ities *cap, u32 pdo, int pos
>         p->object_position =3D position;
>
>         if (pdo_type(pdo) =3D=3D PDO_TYPE_APDO) {
> -               /* FIXME: Only PPS supported for now! Skipping others. */
> -               if (pdo_apdo_type(pdo) > APDO_TYPE_PPS) {
> +               /*
> +                * FIXME: Only PPS, SPR_AVS supported for now!
> +                * Skipping others.
> +                */
> +               if (pdo_apdo_type(pdo) !=3D APDO_TYPE_PPS &&
> +                   pdo_apdo_type(pdo) !=3D APDO_TYPE_SPR_AVS) {
>                         dev_warn(&cap->dev, "Unknown APDO type. PDO 0x%08=
x\n", pdo);
>                         kfree(p);
>                         return 0;
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 6e6c27df3c2e..c65aa8104950 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -831,7 +831,7 @@ static void tcpm_log_source_caps(struct tcpm_port *po=
rt)
>                                 scnprintf(msg, sizeof(msg),
>                                           "EPR AVS %u-%u mV %u W peak_cur=
rent: %u",
>                                           pdo_epr_avs_apdo_min_voltage_mv=
(pdo),
> -                                         pdo_epr_avs_apdo_min_voltage_mv=
(pdo),
> +                                         pdo_epr_avs_apdo_max_voltage_mv=
(pdo),

Hi all,

Apologies, kindly disregard the v1. I incorrectly squashed a fix.
Sending out v2.

Regards,
Badhri

>                                           pdo_epr_avs_apdo_pdp_w(pdo),
>                                           pdo_epr_avs_apdo_src_peak_curre=
nt(pdo));
>                         else if (pdo_apdo_type(pdo) =3D=3D APDO_TYPE_SPR_=
AVS)
> --
> 2.51.0.858.gf9c4a03a3a-goog
>

