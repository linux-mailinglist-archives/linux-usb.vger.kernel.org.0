Return-Path: <linux-usb+bounces-19366-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC533A118B4
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 06:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF9A1681D1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 05:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0A022E3EB;
	Wed, 15 Jan 2025 05:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qx1HNMcU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5B84C6C
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736917635; cv=none; b=PI4aXf9CRdMoi800eCAAZScMTXJGReVota3C9s8Jhji1BVtBiZsYfYwBedt1Ur0hdVHMGUXtJUEKWzKSHybUbPl3ztOrw32TalVwrPVinSFgjYAypHdK/sA+mkYTKzji1RglaynQj7gf3sRKtpvbgIKwRkZr2pugLHXyUyLzFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736917635; c=relaxed/simple;
	bh=U/3dvKicTjVdHLgjVjdLEw6qGwvtuHmXP0uVt0lHY/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWNcsSEfRBcyvu/zdUmppxnyqxaS31HOtM2Ig27H1asdB93mv5D/oitFeIyMWhrM+sLOnR/OHk9+M0liaF1bTClZEjZVHvI4FxqsXnI3GgiohU2+DqOW3SgEvigORfDDpHR8xCIIWUHhneu4piI06NwsC7NLHvEXxsI6SIQ/eWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qx1HNMcU; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3eb7f3b1342so3073592b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 21:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736917632; x=1737522432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xM1Ve2YJE7q58SDdN4e+TtoaNYzChTjYwh8nien4Rw=;
        b=qx1HNMcUYS/PhG64H44o33bfaHKrtH3KK4FaE7xKFnknl5i21C5pKlM3KkA0Gy6E4J
         yIMDNg9NwYJq+5zlDekcjE1upcIJCTM3nJ/bCTrtvyA8F0fG1P/6TkPlwYdAW/EXZNTD
         SbqukSctrEryrRpFDgPzLgKz8h8lU4ad20yTIvUAFa0Y2PnTAzUl+/NFXg4JkbgpSLp3
         qwITRJ/8nYWqZmUeIViM6tmiZT6kgJysa0SlT7AVLQKK8soM3WPUB1g3OrFeUqsVDh9F
         HvP16BivQ+PSso2bBCVSDBGs14sTUAOKdrPYKRuvWopK0c49UKeeBJtz4FCpScvvC/AS
         8v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736917632; x=1737522432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xM1Ve2YJE7q58SDdN4e+TtoaNYzChTjYwh8nien4Rw=;
        b=FDzocTtCnE0h0/Kgon1YfhS+Zt5ueEvNv6upgVJ5rSHj1AA40WJFYIUYaZKssql1W4
         9HKcaO+/TZpaoot7z4TiJyypDelxzUOtVNFW++ddyZGnYd1MuPdKYRVLhoZUWz9Ef9k9
         TgI690RCveTiVdrMp7B901uX4KpgFoyKrW9mYA1yuxgu1NH8fw0OwCZjK7rvUzchAlTz
         9YJoBYC2cyMbcnu2yAp2omerjHcAymakQdArDuGRIi48ZAjQkXob7cVpNkcUW3VksXLI
         KV2DKoHdQnP4eg1IMjDNgp6Sw5WggjL2yTcpJwsTsdXj8RYP9cV1EyvZKoUkJMwPef84
         oYpA==
X-Forwarded-Encrypted: i=1; AJvYcCV254Ihc4pzmr2anRNsaG6lqL+5O1ET8qMkdANg3C61z3+e8s6ZMi+W9pn4ogbzLi0yjoQQWlxxOsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1MSSdbcVqIuJDkD39LqjcVgk1zQ+IvgsgZ6zqiaYQmVxKhLO6
	2Ct4LTh5JtVEVrK/JPEkfxjouwpuFEpgyqDjJRsZhhrbTpB9/THsGfmhr4+DB8m3PjHmkYL9bWa
	Ea+tKJFwbWgtWuwVoq+Q9zK2vXf/KhJrbqKEd
X-Gm-Gg: ASbGnctxC4DN5MxDUWrcEeSjB4lzQITKxCaod13gtj9V45LjUMoUYOAJ97MEkfhOKr5
	T+nSU7KIdsP4clELp1KG0MHmIVUBo80gROZ5o9hurkWz9ngN8whJOlGq7hp+rNfbfxDtGRw==
X-Google-Smtp-Source: AGHT+IHOb5ajRCj8WakZngtfBwzUlxpwlgl1eIux/m1iB1flNOYPfls5a8rhGHk1yDv81LEoy6COoyDYUr0A/r0bq4w=
X-Received: by 2002:a05:6808:2b0d:b0:3f0:3f53:c4ed with SMTP id
 5614622812f47-3f03f5402f0mr12252598b6e.11.1736917632291; Tue, 14 Jan 2025
 21:07:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114142435.2093857-1-kyletso@google.com>
In-Reply-To: <20250114142435.2093857-1-kyletso@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 14 Jan 2025 21:06:36 -0800
X-Gm-Features: AbW1kvaqZDVW2gpNSJynLjIVbZBVdfM2UF4TLP55_jXA0GQjW2pSlCHtwLUhrVg
Message-ID: <CAPTae5JRDA5UVdk0Y-Z6VistV_y7kcCZYgqYTbuuZAO+znWHvg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpci: Prevent Sink disconnection before
 vPpsShutdown in SPR PPS
To: Kyle Tso <kyletso@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	andre.draszik@linaro.org, rdbabiera@google.com, m.felsch@pengutronix.de, 
	xu.yang_2@nxp.com, u.kleine-koenig@baylibre.com, emanuele.ghidoli@toradex.com, 
	amitsd@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 6:25=E2=80=AFAM Kyle Tso <kyletso@google.com> wrote=
:
>
> The Source can drop its output voltage to the minimum of the requested
> PPS APDO voltage range when it is in Current Limit Mode. If this voltage
> falls within the range of vPpsShutdown, the Source initiates a Hard
> Reset and discharges Vbus. However, currently the Sink may disconnect
> before the voltage reaches vPpsShutdown, leading to unexpected behavior.
>
> Prevent premature disconnection by setting the Sink's disconnect
> threshold to the minimum vPpsShutdown value. Additionally, consider the
> voltage drop due to IR drop when calculating the appropriate threshold.
> This ensures a robust and reliable interaction between the Source and
> Sink during SPR PPS Current Limit Mode operation.
>
> Fixes: 4288debeaa4e ("usb: typec: tcpci: Fix up sink disconnect threshold=
s for PD")
> Cc: stable@vger.kernel.org
> Signed-off-by: Kyle Tso <kyletso@google.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 13 +++++++++----
>  drivers/usb/typec/tcpm/tcpm.c  |  8 +++++---
>  include/linux/usb/tcpm.h       |  3 ++-
>  3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index 48762508cc86..19ab6647af70 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -27,6 +27,7 @@
>  #define        VPPS_NEW_MIN_PERCENT                    95
>  #define        VPPS_VALID_MIN_MV                       100
>  #define        VSINKDISCONNECT_PD_MIN_PERCENT          90
> +#define        VPPS_SHUTDOWN_MIN_PERCENT               85
>
>  struct tcpci {
>         struct device *dev;
> @@ -366,7 +367,8 @@ static int tcpci_enable_auto_vbus_discharge(struct tc=
pc_dev *dev, bool enable)
>  }
>
>  static int tcpci_set_auto_vbus_discharge_threshold(struct tcpc_dev *dev,=
 enum typec_pwr_opmode mode,
> -                                                  bool pps_active, u32 r=
equested_vbus_voltage_mv)
> +                                                  bool pps_active, u32 r=
equested_vbus_voltage_mv,
> +                                                  u32 apdo_min_voltage_m=
v)
>  {
>         struct tcpci *tcpci =3D tcpc_to_tcpci(dev);
>         unsigned int pwr_ctrl, threshold =3D 0;
> @@ -388,9 +390,12 @@ static int tcpci_set_auto_vbus_discharge_threshold(s=
truct tcpc_dev *dev, enum ty
>                 threshold =3D AUTO_DISCHARGE_DEFAULT_THRESHOLD_MV;
>         } else if (mode =3D=3D TYPEC_PWR_MODE_PD) {
>                 if (pps_active)
> -                       threshold =3D ((VPPS_NEW_MIN_PERCENT * requested_=
vbus_voltage_mv / 100) -
> -                                    VSINKPD_MIN_IR_DROP_MV - VPPS_VALID_=
MIN_MV) *
> -                                    VSINKDISCONNECT_PD_MIN_PERCENT / 100=
;
> +                       /*
> +                        * To prevent disconnect when the source is in Cu=
rrent Limit Mode.
> +                        * Set the threshold to the lowest possible volta=
ge vPpsShutdown (min)
> +                        */
> +                       threshold =3D VPPS_SHUTDOWN_MIN_PERCENT * apdo_mi=
n_voltage_mv / 100 -
> +                                   VSINKPD_MIN_IR_DROP_MV;
>                 else
>                         threshold =3D ((VSRC_NEW_MIN_PERCENT * requested_=
vbus_voltage_mv / 100) -
>                                      VSINKPD_MIN_IR_DROP_MV - VSRC_VALID_=
MIN_MV) *
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 460dbde9fe22..e4b85a09c3ae 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2973,10 +2973,12 @@ static int tcpm_set_auto_vbus_discharge_threshold=
(struct tcpm_port *port,
>                 return 0;
>
>         ret =3D port->tcpc->set_auto_vbus_discharge_threshold(port->tcpc,=
 mode, pps_active,
> -                                                           requested_vbu=
s_voltage);
> +                                                           requested_vbu=
s_voltage,
> +                                                           port->pps_dat=
a.min_volt);
>         tcpm_log_force(port,
> -                      "set_auto_vbus_discharge_threshold mode:%d pps_act=
ive:%c vbus:%u ret:%d",
> -                      mode, pps_active ? 'y' : 'n', requested_vbus_volta=
ge, ret);
> +                      "set_auto_vbus_discharge_threshold mode:%d pps_act=
ive:%c vbus:%u pps_apdo_min_volt:%u ret:%d",
> +                      mode, pps_active ? 'y' : 'n', requested_vbus_volta=
ge,
> +                      port->pps_data.min_volt, ret);
>
>         return ret;
>  }
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index 061da9546a81..b22e659f81ba 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -163,7 +163,8 @@ struct tcpc_dev {
>         void (*frs_sourcing_vbus)(struct tcpc_dev *dev);
>         int (*enable_auto_vbus_discharge)(struct tcpc_dev *dev, bool enab=
le);
>         int (*set_auto_vbus_discharge_threshold)(struct tcpc_dev *dev, en=
um typec_pwr_opmode mode,
> -                                                bool pps_active, u32 req=
uested_vbus_voltage);
> +                                                bool pps_active, u32 req=
uested_vbus_voltage,
> +                                                u32 pps_apdo_min_voltage=
);
>         bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
>         void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool e=
nable);
>         void (*check_contaminant)(struct tcpc_dev *dev);
> --
> 2.47.1.688.g23fc6f90ad-goog
>

