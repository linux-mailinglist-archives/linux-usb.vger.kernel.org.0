Return-Path: <linux-usb+bounces-19196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45024A0927A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 14:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38DE53A9A9D
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2025 13:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E0D20E717;
	Fri, 10 Jan 2025 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fBT9S7Y3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7061520E329
	for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516875; cv=none; b=sQ1Fd2wxikAM+2+jkknJvLs1TPFHFwavFenXDq2/1CQXazyrnTQfmZHVCwHuijBC/xIApfgZ0vBlPsF6WrTzBbKeuF1iryfwt7yo7M6JDHrMzsiojn14OuCbNL6BOaNPzRGgaLvE3FLAXCX86vsfZxxYGetaLPpzTiERwO9UedY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516875; c=relaxed/simple;
	bh=aDTw+7KqPH57qr+Z1WA9s91f21YqkgHFyt/CjUdJlX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFVlydgH4yPbWUX65VEHZert8hkN6mHMNACdnAWbxdqcs2LreXU37kF7ViJNP/XiQ5VIKDB97Fqkbb56okrAlfMiYww8donRRRM1x39kDqrM2iy9CzOlQR/Hs6R+a1Mt5U2te0U+0XelYKpVWYrl5dNdnrJcSFzpzPvUgjOb7go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fBT9S7Y3; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso23722481fa.1
        for <linux-usb@vger.kernel.org>; Fri, 10 Jan 2025 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736516871; x=1737121671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr2wfavfSfNnPmYAAFKmMn2ii0c2pxJsS7pMf0bJLM4=;
        b=fBT9S7Y34bILhtSp+ZraqLJLJYxP5+7O+JOSNtXCwDkRMMsakxzFGf3Q8MKgzT5UVN
         9Oj59pdZkUHwaxh2KYosA64uUHYNgme4Rb7ZE5nfH1lqHKR56f77/vdh/qS+yeUgpuLi
         goxXkSLcMB8gjheEPB0jmiKEaxLwBV8AfCrjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736516871; x=1737121671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gr2wfavfSfNnPmYAAFKmMn2ii0c2pxJsS7pMf0bJLM4=;
        b=m4rgRXZQgvqv9g3/o1rEPocCMd52DM1QoIODY4xgnTp1G23EhHBBtU+kUBxveAPYcA
         5SrPUhCnP1xcgKcqIYT0kuIvArVrXaYUTjLyhEEQXI5X6g984giHMupu5dpQ8/L6Kgxc
         rKdYpJo8Zd4HzDBFM8oLA55TrkmkOLZXngbi/BcXqgd4MyE1Xl1+oU/cq3mD/SBxMqG6
         /tU+Pi1GZtASOAaBRlN7Oj4e/vDkboULuFRxAnujCIXvvxnK5rTsvc9sphfCJ/ii0qt/
         oG2won0nYe0maCuTNzoW5kfVAcJxNGVtsu571WBM4opvOnFa0mUuATO3H/kHQmpJLNrJ
         19IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLHeP1+EgY2Ovn+og4u3MkpGRmEeAo+pDRWo7YoeFGL33JUKrdflHvM84+0w7qI/pirvz/LTSo9H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyLCCS3aLuTN4spQkqd+eE3VCE6cIolcMWYRgwdahb5Ove5ULj
	9x2P36cpNdPuWqeeb8K+FpjO9TgjGb9CZg9IbVavRCQ1+17+6lRSWoXj6eXaPa7n9uqBKVcg7uX
	Hfofx+Lt0INUBccV9n15G0KjuRsiceLUiuJM=
X-Gm-Gg: ASbGnctTEi6cJzBo9BZfNVnRqFhswmd/MuLsf/IwqLcx7ccwji2BQ/epslVT2AaW1Pf
	XatgtVk7sjFNUOsEobOKp0q5byjjUckTPNITRgnjqAD4wOdgVqI0XndoYmm6Jf4FZhA==
X-Google-Smtp-Source: AGHT+IF3H5SI1TKiLAmal+ispYzXyWV8+NPtp22j5q1S/ciVF9AwBNTgh6t4GFtuhi8cw28f+2A0Awxcjjra529Z1e8=
X-Received: by 2002:a2e:a98f:0:b0:304:4cac:d8ef with SMTP id
 38308e7fff4ca-305f455e963mr33126731fa.7.1736516871581; Fri, 10 Jan 2025
 05:47:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109220655.1677506-1-swboyd@chromium.org> <20250109220655.1677506-3-swboyd@chromium.org>
In-Reply-To: <20250109220655.1677506-3-swboyd@chromium.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Fri, 10 Jan 2025 14:47:39 +0100
X-Gm-Features: AbW1kvbx6mEflbFtCpHpxeCzWFCNH6Kt4EYxLetWYdg4-wwJH_evg1qw966XxCg
Message-ID: <CALwA+NYD_0JqAByT73j2_nW3jJfb1RdBdSnQ-xAQV8HYf=LGSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	Pavan Holla <pholla@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:07=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> This structure isn't used outside this file and can be marked const so
> that it gets moved to read-only memory.
>
> Cc: Pavan Holla <pholla@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/uc=
si/cros_ec_ucsi.c
> index 75646a8d55be..c605c8616726 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -133,7 +133,7 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, =
u64 cmd)
>         return ret;
>  }
>
> -struct ucsi_operations cros_ucsi_ops =3D {
> +static const struct ucsi_operations cros_ucsi_ops =3D {
>         .read_version =3D cros_ucsi_read_version,
>         .read_cci =3D cros_ucsi_read_cci,
>         .read_message_in =3D cros_ucsi_read_message_in,
> --
> https://chromeos.dev
>

