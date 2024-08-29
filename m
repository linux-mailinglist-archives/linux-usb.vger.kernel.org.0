Return-Path: <linux-usb+bounces-14330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32775965255
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 23:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F88EB228B1
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 21:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0BE1BAED3;
	Thu, 29 Aug 2024 21:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ku0yb5L3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B1D14B949
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 21:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724968200; cv=none; b=YsNa9bgiRQZd6z7rb0FDSTp+hhBtdVLbjIhjwwjiQmFMxUbGeAz6eh1rspma5hKPTPoDa4NLO0aoegE8Sr4PBoF/VWOja8Uz+ix/kgfRAB3dQw/BuO1o3AczRk8c8O/m9viGn61JD5DDRxtlFm6ZYLrU6fli2dedkp2j0DfJs7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724968200; c=relaxed/simple;
	bh=vHL+iHbA3W1E2wUFQIhupWwWv9IsB9IJZAZj3Fb2uYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mduUwoRAh3DX5+2BNMIjfJSjcSs/M8OcPXnslnORjjF7qc7QVhOhfVbDca5lxklOVez24clcMz15k1tkfXknMSYXfS5dCjYFvhJGmF2yuUTn5Hlacdcjfwhh08e9spZ7JR7B2JGWAqcuTFapd5oSkHPdlO3vTGRZCsCgZlmF/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ku0yb5L3; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2702ed1056bso734715fac.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 14:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724968198; x=1725572998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJ/6FV+x2X/IpC8+QYN6nWFacrV0M8I5cGRuy8XuCpI=;
        b=ku0yb5L36NidNNWD2cGGit/MetWzt4Ep1evHnphRDqAYiIXzZnf0bX8jY8GuZLWLw5
         HlCwS6H0qNx7KCcqMegffN2MAIi0gW1UMopTYECq1mnGyuRfafkOq12cyWQwXIG3BRBL
         9v6Xqa8wcxLyCID/Ifap/Iqf3xX6uDS3IauWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724968198; x=1725572998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJ/6FV+x2X/IpC8+QYN6nWFacrV0M8I5cGRuy8XuCpI=;
        b=HCYVqzn5f2Ate1Q6QosyPPUqw+lnpMqIQe5SP4s2CHvZ6a0oD+NOA90kKDfkoAWf1T
         NdT7SSiSlgLZhTVG6vkqArtDcNs3BwUg230x3neRVHivQVnAPk/ojlv+4dAmwRwQIxzB
         VbajaoQzqlEOelyUV3tCQFa5k1seeMD3gxMvJZwRnUAhYINl/x0YAgoEDp5LJaL210cU
         MRbg4iq9jkZpAf80aiwcmI/snE6KAyHTS2xihfj6ubE0dZIGheJ5x9DfQMgWqgUEEU8T
         kbnu1puYmCpCZzfxcPw/cRxiApLfVRTJaKKP3PuudVykKDfBKaBsKZhEWiSU6kM+2zQE
         1n4w==
X-Forwarded-Encrypted: i=1; AJvYcCVc+ZyopxDSuePVM6xExr5oqpP8ubpYGbCUSwuxSWp5JAlD0dgND4brQ0RCuMTzbAhuYlpLYtCAvkY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+XHFgJzHGGuZ+PshkcihjoSb2ZGOMyZHK3A3bg3yL5aWLIIAf
	+CSVnTZscJGi8KNOz5ZkyWqYXCuQfUYkVzDuEkHWZwkMz0k2P8Bu+gCxAg1uLLi3Ke/3lYKkhvL
	9cKFTYsoh7h2Ih6Yr9gqo1G/573JQb81plvlfpAXLxGI2z0s7ow==
X-Google-Smtp-Source: AGHT+IG7J+9IWXvQ8FV8Jl7YQEq+CqzxDB8haXiqNppwFH7wuxI+oxzSKgqOShwC2wWEjBg6VEnY69tuVRY4fnNioXw=
X-Received: by 2002:a05:690c:ed2:b0:6d3:c673:e57a with SMTP id
 00721157ae682-6d40d987ad8mr187827b3.5.1724968187445; Thu, 29 Aug 2024
 14:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828161502.2774996-1-heikki.krogerus@linux.intel.com> <20240828161502.2774996-4-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240828161502.2774996-4-heikki.krogerus@linux.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Thu, 29 Aug 2024 14:49:34 -0700
Message-ID: <CANFp7mUHTNMA8XS+1K_jEstTrt8C6AcmizPChF0PVBifkzJPiA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] usb: typec: ucsi: Helpers for new
 GET_CONNECTOR_STATUS fields
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Bartosz Szpila <bszpila@google.com>, 
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 9:15=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> UCSI v2 introduced new fields to GET_CONNECTOR_STATUS.
> Adding a helper for each field. The helpers check that the
> UCSI version is v2 or above.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.h | 66 +++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.=
h
> index dfbc0f6c1b9b..adcbfc96dfcf 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -524,4 +524,70 @@ static inline void ucsi_debugfs_unregister(struct uc=
si *ucsi) { }
>  #define USB_TYPEC_NVIDIA_VLINK_DP_VDO  0x1
>  #define USB_TYPEC_NVIDIA_VLINK_DBG_VDO 0x3
>
> +/* ---------------------------------------------------------------------=
----- */
> +
> +static inline enum typec_orientation ucsi_orientation(struct ucsi_connec=
tor *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return TYPEC_ORIENTATION_NONE;
> +       return UCSI_FIELD(con->status, 86, 1) ? TYPEC_ORIENTATION_REVERSE=
 :
> +                                               TYPEC_ORIENTATION_NORMAL;
> +}
> +
> +static inline int ucsi_sink_path_status(struct ucsi_connector *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return -EINVAL;
> +       return UCSI_FIELD(con->status, 87, 1);
> +}
> +
> +static inline int ucsi_reverse_current_protection_status(struct ucsi_con=
nector *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return -EINVAL;
> +       return UCSI_FIELD(con->status, 88, 1);
> +}
> +
> +static inline int ucsi_power_reading_ready(struct ucsi_connector *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return -EINVAL;
> +       return UCSI_FIELD(con->status, 89, 1);
> +}
> +
> +static inline int ucsi_current_scale(struct ucsi_connector *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return -EINVAL;
> +       return UCSI_FIELD(con->status, 90, 3) * 5; /* mA */
> +}
> +
> +static inline int ucsi_peak_current(struct ucsi_connector *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return -EINVAL;
> +       return UCSI_FIELD(con->status, 93, 16);
> +}
> +
> +static inline int ucsi_average_current(struct ucsi_connector *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return -EINVAL;
> +       return UCSI_FIELD(con->status, 109, 16);
> +}
> +
> +static inline int ucsi_voltage_scale(struct ucsi_connector *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return -EINVAL;
> +       return UCSI_FIELD(con->status, 125, 4) * 5; /* mV */
> +}
> +
> +static inline int ucsi_voltage_reading(struct ucsi_connector *con)
> +{
> +       if (WARN_ON(con->ucsi->version < UCSI_VERSION_2_0))
> +               return -EINVAL;
> +       return UCSI_FIELD(con->status, 129, 16);
> +}
> +
>  #endif /* __DRIVER_USB_TYPEC_UCSI_H */
> --
> 2.45.2
>

I think it would be nice to be able to declare what version a field
was added when we describe the data structure rather than having to
add helper functions for every single access of it.

Using the patch I had previously attempted as reference here too:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/=
5274219

We could add a minimum version to each field definition like so:

#define UCSI_CONSTAT_SINK_PATH_STATUS \
    UCSI_FIELD_FOR(/*struct=3D*/ucsi_connector_status,
/*min_version=3D*/UCSI_2_0, /*offset=3D*/87, /*size=3D*/1)

These can default to WARN_ON + return -EINVAL when the minimum version
doesn't match.

Pros: Minimum versions are alongside the field definitions, easier to
keep track of and enforce.
Cons:
  - WARN may not easily identify which field is failing to access.
This could be fixable.
  - Version check for every field (and not just ones that need it).

