Return-Path: <linux-usb+bounces-2038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCDD7D1D92
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 16:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2788281C51
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 14:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A0D101C4;
	Sat, 21 Oct 2023 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bQpwkWZJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96960D528
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 14:49:16 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B452D7
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 07:49:12 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c9d4f08d7cso121845ad.0
        for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697899751; x=1698504551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyLPGEgSgRLGHS320ryZpZAtQHgBe1tEJpa9w8HoNtg=;
        b=bQpwkWZJmA7EbWbzOLHu6uDMR7R+l9SfpBsW5fi+bjxDk20zK+5sr4NofIRyA6AktG
         1uuxfHsOuQIwkcODOoRYcC28V12FA7OEMNNuzU6cvN/xXtfDshFTOrefmZSW+ZMlaGdq
         06rTvm1Xvxrff5nHe73s3pQk9a20ZB+Y2lBrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697899751; x=1698504551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyLPGEgSgRLGHS320ryZpZAtQHgBe1tEJpa9w8HoNtg=;
        b=bAZ2UP7dynA/nx9zaSDi/ZyoO6R9zz5bFgshZEXLNgPqxxDknV/Zide5sp+7ait0j/
         ZPg09czCnDyZO3nNiYEitmglMocQicIKvt1LEJQUssqcJOqr3GhDHPpaJHLuUNwZLLaC
         wQ0/qWadIlQ+LVGlKmqV/33vevjY0/jyQtSQw6T/OsyBnvqdAh/GSrYdU6N6Ua5bXzlU
         9Y+gfvg0gat0im5sGZKOzWOJqzkjwiBfftBkW/UBDB0mKKxYxaE4NqfteIlUiyNlHnrH
         yx2AUNTR5xukEmFQbP2eJQlvWwk3F4Ow9/u9rEp8h+Ng1g3ULsbqKVG6frTk+Utxtm2s
         y9Qg==
X-Gm-Message-State: AOJu0YwOB+LOhF1wgsAmCFLeEcCEz6AhYU/OBvF4cins/ZJxyauXCZHb
	xZ3mX0MbOGijOHHriLcFEPctHbMTLu3gTA9uIeAjww==
X-Google-Smtp-Source: AGHT+IGx45bKoTmSOmzU5whM53/iKa3jjAyv96uOcz7czttM7eEekfroNUFJNHD+RLt3Q47QRGLttyuWy2+TAUUop3E=
X-Received: by 2002:a17:903:24a:b0:1c4:65d5:34c5 with SMTP id
 j10-20020a170903024a00b001c465d534c5mr391892plh.23.1697899751177; Sat, 21 Oct
 2023 07:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020210751.3415723-1-dianders@chromium.org> <20231020140655.v5.1.I6e4fb5ae61b4c6ab32058cb12228fd5bd32da676@changeid>
In-Reply-To: <20231020140655.v5.1.I6e4fb5ae61b4c6ab32058cb12228fd5bd32da676@changeid>
From: Grant Grundler <grundler@chromium.org>
Date: Sat, 21 Oct 2023 07:48:59 -0700
Message-ID: <CANEJEGt4HwnPDyO=R0uRju5NtZDfXYd1G0_Tzu7ioNcFVz7cZA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] r8152: Increase USB control msg timeout to 5000ms
 as per spec
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
> According to the comment next to USB_CTRL_GET_TIMEOUT and
> USB_CTRL_SET_TIMEOUT, although sending/receiving control messages is
> usually quite fast, the spec allows them to take up to 5 seconds.
> Let's increase the timeout in the Realtek driver from 500ms to 5000ms
> (using the #defines) to account for this.
>
> This is not just a theoretical change. The need for the longer timeout
> was seen in testing. Specifically, if you drop a sc7180-trogdor based
> Chromebook into the kdb debugger and then "go" again after sitting in
> the debugger for a while, the next USB control message takes a long
> time. Out of ~40 tests the slowest USB control message was 4.5
> seconds.
>
> While dropping into kdb is not exactly an end-user scenario, the above
> is similar to what could happen due to an temporary interrupt storm,
> what could happen if there was a host controller (HW or SW) issue, or
> what could happen if the Realtek device got into a confused state and
> needed time to recover.
>
> This change is fairly critical since the r8152 driver in Linux doesn't
> expect register reads/writes (which are backed by USB control
> messages) to fail.
>
> Fixes: ac718b69301c ("net/usb: new driver for RTL8152")
> Suggested-by: Hayes Wang <hayeswang@realtek.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Grant Grundler <grundler@chromium.org>

> ---
>
> (no changes since v1)
>
>  drivers/net/usb/r8152.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 0c13d9950cd8..482957beae66 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -1212,7 +1212,7 @@ int get_registers(struct r8152 *tp, u16 value, u16 =
index, u16 size, void *data)
>
>         ret =3D usb_control_msg(tp->udev, tp->pipe_ctrl_in,
>                               RTL8152_REQ_GET_REGS, RTL8152_REQT_READ,
> -                             value, index, tmp, size, 500);
> +                             value, index, tmp, size, USB_CTRL_GET_TIMEO=
UT);
>         if (ret < 0)
>                 memset(data, 0xff, size);
>         else
> @@ -1235,7 +1235,7 @@ int set_registers(struct r8152 *tp, u16 value, u16 =
index, u16 size, void *data)
>
>         ret =3D usb_control_msg(tp->udev, tp->pipe_ctrl_out,
>                               RTL8152_REQ_SET_REGS, RTL8152_REQT_WRITE,
> -                             value, index, tmp, size, 500);
> +                             value, index, tmp, size, USB_CTRL_SET_TIMEO=
UT);
>
>         kfree(tmp);
>
> @@ -9494,7 +9494,8 @@ static u8 __rtl_get_hw_ver(struct usb_device *udev)
>
>         ret =3D usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>                               RTL8152_REQ_GET_REGS, RTL8152_REQT_READ,
> -                             PLA_TCR0, MCU_TYPE_PLA, tmp, sizeof(*tmp), =
500);
> +                             PLA_TCR0, MCU_TYPE_PLA, tmp, sizeof(*tmp),
> +                             USB_CTRL_GET_TIMEOUT);
>         if (ret > 0)
>                 ocp_data =3D (__le32_to_cpu(*tmp) >> 16) & VERSION_MASK;
>
> --
> 2.42.0.758.gaed0368e0e-goog
>

