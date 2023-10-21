Return-Path: <linux-usb+bounces-2042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E40097D1DC6
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 17:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3AE21C20B4F
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 15:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5881D171B5;
	Sat, 21 Oct 2023 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QNlNBCBo"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD3814F9A
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 15:03:41 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4F5DA
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 08:03:33 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c9c145bb5bso86395ad.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 08:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697900613; x=1698505413; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuPSmAl7Gc08Rh/pvJ8sfj5/IRqjGMuojTRoU/8OXYE=;
        b=QNlNBCBoy05xt0KD1KD48HNlwcuASk5aj32NtGTPpc15s/53yLCT3H/+qOymWQdT8e
         /aeIe0PiyL0Ik9lD/65yusPh6GjlnGe0llonlYvpXBQMS902bcHdcY+FZltZbqQAU+n7
         veCP4VjbZ4C/ym9Ud5QlUcb6xgRfNSPYp9sn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697900613; x=1698505413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuPSmAl7Gc08Rh/pvJ8sfj5/IRqjGMuojTRoU/8OXYE=;
        b=sgNoXsH+JpLa++9VakZw6B64QZNW9qg3M8J7YVrltyndw/mv6+Jh+TN0sBrNUf2FPM
         SjIJr6lo5aYqgSRbibNtAVwRHIrPV0QsTEBtdiFhyTTWvfZNX1cj+KZAAR9x5IFB15R2
         y8ZY8GcKIe16noCVcK2GrRztNFUrhhxJ4qE2IRI4Qa9yUgHw/ObgPeLXZQoSacixp9xr
         zRwLSf4nSocZY1hv/ghe/D33Gix3z8BW1gtKaPqH02euou/oMVXGh6tk/utUrqEney+0
         zKUMt0ta9CwYrQk76kpOoo31agfi7nTvpC/4LKYorIAuNvkhXQBQRdw54q8zHS76etm8
         P1VA==
X-Gm-Message-State: AOJu0YzpzCieGzk6RaT4Ccfb7KM229EU3uT7RAKbetMVB0RA17x5aL6f
	3wDoPmB5cRtvdAvTayRkW8E47DjfDB1bCrWwwb0L0g==
X-Google-Smtp-Source: AGHT+IEUrjQpbqzmBCjf5tVoCSi89bnrApkE030h0X34HlZN2zt0Z3EiPkzND/i5smqKbYe58V947QrGj8SmVsPevu8=
X-Received: by 2002:a17:902:d551:b0:1c7:47ca:f075 with SMTP id
 z17-20020a170902d55100b001c747caf075mr408500plf.15.1697900612332; Sat, 21 Oct
 2023 08:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020210751.3415723-1-dianders@chromium.org> <20231020140655.v5.5.I300ed6c3269c77756bdd10dd0d6f97db85470186@changeid>
In-Reply-To: <20231020140655.v5.5.I300ed6c3269c77756bdd10dd0d6f97db85470186@changeid>
From: Grant Grundler <grundler@chromium.org>
Date: Sat, 21 Oct 2023 08:03:21 -0700
Message-ID: <CANEJEGsrJvss-MGfGwV+M5kgTokrF+HX_nZb+ASoEKuUKV7gGg@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] r8152: Check for unplug in rtl_phy_patch_request()
To: Douglas Anderson <dianders@chromium.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Hayes Wang <hayeswang@realtek.com>, 
	"David S . Miller" <davem@davemloft.net>, Edward Hill <ecgh@chromium.org>, 
	Laura Nao <laura.nao@collabora.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Simon Horman <horms@kernel.org>, linux-usb@vger.kernel.org, 
	Grant Grundler <grundler@chromium.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 2:08=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> If the adapter is unplugged while we're looping in
> rtl_phy_patch_request() we could end up looping for 10 seconds (2 ms *
> 5000 loops). Add code similar to what's done in other places in the
> driver to check for unplug and bail.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Grant Grundler <grundler@chromium.org>

> ---
>
> (no changes since v2)
>
> Changes in v2:
> - ("Check for unplug in rtl_phy_patch_request()") new for v2.
>
>  drivers/net/usb/r8152.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 656fe90734fc..9888bc43e903 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -4046,6 +4046,9 @@ static int rtl_phy_patch_request(struct r8152 *tp, =
bool request, bool wait)
>         for (i =3D 0; wait && i < 5000; i++) {
>                 u32 ocp_data;
>
> +               if (test_bit(RTL8152_UNPLUG, &tp->flags))
> +                       break;
> +
>                 usleep_range(1000, 2000);
>                 ocp_data =3D ocp_reg_read(tp, OCP_PHY_PATCH_STAT);
>                 if ((ocp_data & PATCH_READY) ^ check)
> --
> 2.42.0.758.gaed0368e0e-goog
>

