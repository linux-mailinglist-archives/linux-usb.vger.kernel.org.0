Return-Path: <linux-usb+bounces-13589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE261956049
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 02:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24A3DB20CAA
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 00:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AA81FDD;
	Mon, 19 Aug 2024 00:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VTLBkDet"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FF1A48
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 00:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724025762; cv=none; b=oB2Tmfc5OP7bdyYLe9Uhw04dQASDYg13XP6KRt02bmy1kNEaIQa9095Z63QnvSB8AMIHTznq06rHXP0vz5pFDB7VWuJwopA2PB2BqL4rChSgi63QlM1fRZtA8jWWE5fA3prWrlkq2gYnh6ru5bezupzZ65z0E+viaMGEanzWUh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724025762; c=relaxed/simple;
	bh=x14Id8lC6ks4RYbN7OtITZMWe6+BnSXIAUDf9gAVfd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQ/E9atZrEcwpWfDDl8af8rSvJBcXWMPCkkuXXCx88IUDhgZlZvJucR+NV01zQzkaluz/feNCVqhleLbfEqathuLGYoXiIzYpb9Ho24mTiDlr10YdtxR2rp2dXoEgBVheglBO4nHIAOOLCWi/kqE5y6pxmaZGijWQXmzgOKdV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VTLBkDet; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-690aabe2600so31740647b3.0
        for <linux-usb@vger.kernel.org>; Sun, 18 Aug 2024 17:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724025760; x=1724630560; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=De003JcrlmEIaJZr4Lsdm62lzXadwy02n1BsrVzsXwQ=;
        b=VTLBkDetKv7a81n7HxzpTK43kJLRvZLo5vkIKNpz7X2JVQC66zoFUyJBHC9Nh+k9Em
         u2BlxdmwSQyISrwVybFLq9eLomBawTtc4ruIusOXXi699uoRuyPgMgJJM8lFQJ1K7n8/
         oUKG/jTu2pwsONlij/fo763KLbOiiHjo4jOmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724025760; x=1724630560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=De003JcrlmEIaJZr4Lsdm62lzXadwy02n1BsrVzsXwQ=;
        b=stiXA7FEMYtiW6MhGiyioMB+derAfe1vQJF3i9W2MHNTiSUPcMFWaProLs4ufj3X8d
         RcqY0ZzXE/rZ9uD8up1uK+BF4NZckyKsH50oW+byE66dBd3ukuZAj8KAuA7uqX0R5dTn
         jCZXtKkBgDJgTP6plcYWzGCw0VGKYoll+caRhw/3B+mlAJdZWP42LqHNd9VLgBv7vaDY
         NjyTz+IgMG16T6b4V4lvuMrHWSeqYPT/iO5MyHB8a/eChxr0w9Uk7FsPWBvdRunLBrY3
         S5Z3UK3kwTN3ipVFXMhqGKwDVKk7AL7neSRkKAVEblM4KV2b9pEdlqluv2yi4MkdtCiF
         /BHA==
X-Forwarded-Encrypted: i=1; AJvYcCXB0ew1o9yh1/33BbIjSs3WEuIKu3TUISkFdBoSU+VVyvwIxqWzCXUUbLlMwRBPKdgWjysYsZWbs9DZcVZtTo2HqSrLJSWkM6JR
X-Gm-Message-State: AOJu0YwlkIqKB9gAnOZS48ow+x7DHOqd4C5HoHjUF7falPRV/BgpuUG2
	zPn/zNRWTPvmOuzk+j673wM0afftQopWQRwcPWTsvdhsnSkF69Cfx8CbaeWBYzyeydRfb3925xq
	/MrlB6Ldg1sADaYzf4kVpm/8g4/V3SpTGHwWT
X-Google-Smtp-Source: AGHT+IE6hF3UhPjN25FJWnCgPrReONRyUeu8hkgmoUGyInpup8gMzBKbVGQ+KdUyiMQi11k/S+jENGKl74x9Ru7lIgY=
X-Received: by 2002:a05:690c:380d:b0:6b0:beef:2e80 with SMTP id
 00721157ae682-6b1ba7e7b79mr93456247b3.17.1724025759915; Sun, 18 Aug 2024
 17:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com> <20240816135859.3499351-2-heikki.krogerus@linux.intel.com>
In-Reply-To: <20240816135859.3499351-2-heikki.krogerus@linux.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Sun, 18 Aug 2024 17:02:28 -0700
Message-ID: <CANFp7mUDm9Ya9Gjv9Bv_neL22SuDocmz_8HCGVbnd8y-0gd7tA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] usb: typec: ucsi: Remove unused fields from struct ucsi_connector_status
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jameson Thies <jthies@google.com>, 
	Benson Leung <bleung@chromium.org>, Prashant Malani <pmalani@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-usb@vger.kernel.org, 
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@google.com>, Bartosz Szpila <bszpila@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 6:59=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> The new fields are valid only with the new UCSI versions.
> They are at offsets that go beyond the MAX_DATA_LENGTH (16
> bytes) with the older UCSI versions. That has not caused any
> problems before because nothing uses those new fields yet.
> Because they are not used yet, dropping them for now.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.h | 27 ++-------------------------
>  1 file changed, 2 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.=
h
> index 57129f3c0814..7bc132b59027 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -344,35 +344,12 @@ struct ucsi_connector_status {
>  #define   UCSI_CONSTAT_PARTNER_TYPE_AUDIO      6
>         u32 request_data_obj;
>
> -       u8 pwr_status[3];
> -#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_[0]) & GENMASK(1, 0)=
)
> +       u8 pwr_status;
> +#define UCSI_CONSTAT_BC_STATUS(_p_)            ((_p_) & GENMASK(1, 0))
>  #define   UCSI_CONSTAT_BC_NOT_CHARGING         0
>  #define   UCSI_CONSTAT_BC_NOMINAL_CHARGING     1
>  #define   UCSI_CONSTAT_BC_SLOW_CHARGING                2
>  #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING     3
> -#define UCSI_CONSTAT_PROVIDER_CAP_LIMIT(_p_)   (((_p_[0]) & GENMASK(5, 2=
)) >> 2)
> -#define   UCSI_CONSTAT_CAP_PWR_LOWERED         0
> -#define   UCSI_CONSTAT_CAP_PWR_BUDGET_LIMIT    1
> -#define UCSI_CONSTAT_PROVIDER_PD_VERSION_OPER_MODE(_p_)        \
> -       ((get_unaligned_le32(_p_) & GENMASK(21, 6)) >> 6)
> -#define UCSI_CONSTAT_ORIENTATION(_p_)          (((_p_[2]) & GENMASK(6, 6=
)) >> 6)
> -#define   UCSI_CONSTAT_ORIENTATION_DIRECT      0
> -#define   UCSI_CONSTAT_ORIENTATION_FLIPPED     1
> -#define UCSI_CONSTAT_SINK_PATH_STATUS(_p_)     (((_p_[2]) & GENMASK(7, 7=
)) >> 7)
> -#define   UCSI_CONSTAT_SINK_PATH_DISABLED      0
> -#define   UCSI_CONSTAT_SINK_PATH_ENABLED       1
> -       u8 pwr_readings[9];
> -#define UCSI_CONSTAT_REV_CURR_PROT_STATUS(_p_) ((_p_[0]) & 0x1)
> -#define UCSI_CONSTAT_PWR_READING_VALID(_p_)    (((_p_[0]) & GENMASK(1, 1=
)) >> 1)
> -#define UCSI_CONSTAT_CURRENT_SCALE(_p_)                (((_p_[0]) & GENM=
ASK(4, 2)) >> 2)
> -#define UCSI_CONSTAT_PEAK_CURRENT(_p_) \
> -       ((get_unaligned_le32(_p_) & GENMASK(20, 5)) >> 5)
> -#define UCSI_CONSTAT_AVG_CURRENT(_p_) \
> -       ((get_unaligned_le32(&(_p_)[2]) & GENMASK(20, 5)) >> 5)
> -#define UCSI_CONSTAT_VOLTAGE_SCALE(_p_) \
> -       ((get_unaligned_le16(&(_p_)[4]) & GENMASK(8, 5)) >> 5)
> -#define UCSI_CONSTAT_VOLTAGE_READING(_p_) \
> -       ((get_unaligned_le32(&(_p_)[5]) & GENMASK(16, 1)) >> 1)
>  } __packed;
>
>  /*
> --
> 2.43.0
>
>

I'm working on a patch series that depends on the sink path status so
I would prefer we don't remove it:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/=
5784952

Since GET_CONNECTOR_STATUS is the only command that exceeds 16 bytes
for MESSAGE_IN, can we just add a wrapper that checks the UCSI version
for that command only and limits the size sent to ucsi_run_command?

