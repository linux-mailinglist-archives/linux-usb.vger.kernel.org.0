Return-Path: <linux-usb+bounces-3062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151147F249A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 04:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 754FEB2169B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 03:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286571641F;
	Tue, 21 Nov 2023 03:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IY8XEzmS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F52DC
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 19:26:21 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ce5b72e743so67685ad.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 19:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700537181; x=1701141981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDqHkFfcJHn3oaEi3V9nfZPghbl+qBf+g18uag6L/K0=;
        b=IY8XEzmS+9ksm3kcpzS2mQag9ICVOBAhw1MnBV67Ca+WQFr/TezG5W+vXfhffPmTGA
         rbei5iikZyqR+V2ethD9iYOztXcbvhYIHkWjhg61mn1CgFhNr79RAN/HuXlAkBnrDM6z
         4M1JrsvFaXV+AmyrvXHaBXN1MGnS8ppajIRhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700537181; x=1701141981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDqHkFfcJHn3oaEi3V9nfZPghbl+qBf+g18uag6L/K0=;
        b=nHw9+N5lsHTdG/sSeTNND+OC/nz8bFONC5PQR74e5jeLG/tsbZozblyDVAF9Yt7rYL
         qw6qhlff7uHIzYS7ZHQOnvT8pkfBCAS7w99Zy1UaH6Us7CIVOCXyKsWuEGqe3ngkarK0
         U8BtNo0+QsJO5ZABK400V49mTVuJ7XUmC/BcnUINkRwc8dVXaHRU/N10x744AwymaS2S
         qufBfQluyul6y9Uw9aU52rKvVtOpyqOF4BuuX1o/xPKc7JHh1H6nT357QY7VZGYyHSip
         A0Ut9j8RWrmfmjPi3af4sAC4zuR8dzQngAj65Kw/uKJIv7u+z9FbJBL4BVsqoK4dYqcB
         rMkw==
X-Gm-Message-State: AOJu0YxNAAXiinO7k81wO94lA55G2+dyaiem84BcG2G+6hUadajLTXPg
	a1+xSoRN+WayNNuxrGcD9pEwoheuWobu3mFkgaTFoQ==
X-Google-Smtp-Source: AGHT+IFMmnulfcKAR9a+hLgTra7C1d3J7eiroPT/NIW1TBY9eFiMyBHCjiwLmAWOaX8RInlhfGzBwzczb+7897HnLh0=
X-Received: by 2002:a17:902:ceca:b0:1cf:669b:6176 with SMTP id
 d10-20020a170902ceca00b001cf669b6176mr287186plg.16.1700537180719; Mon, 20 Nov
 2023 19:26:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117130836.1.I77097aa9ec01aeca1b3c75fde4ba5007a17fdf76@changeid>
 <20231117130836.2.I79c8a6c8cafd89979af5407d77a6eda589833dca@changeid>
In-Reply-To: <20231117130836.2.I79c8a6c8cafd89979af5407d77a6eda589833dca@changeid>
From: Grant Grundler <grundler@chromium.org>
Date: Mon, 20 Nov 2023 19:26:09 -0800
Message-ID: <CANEJEGsDwvUQZsowJwVkE9qHSoYt3x26bN4yo0y7C-zheY3zsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] r8152: Add RTL8152_INACCESSIBLE checks to more loops
To: Douglas Anderson <dianders@chromium.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Hayes Wang <hayeswang@realtek.com>, 
	"David S . Miller" <davem@davemloft.net>, Grant Grundler <grundler@chromium.org>, 
	Simon Horman <horms@kernel.org>, Edward Hill <ecgh@chromium.org>, linux-usb@vger.kernel.org, 
	Laura Nao <laura.nao@collabora.com>, Alan Stern <stern@rowland.harvard.edu>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 17, 2023 at 1:10=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> Previous commits added checks for RTL8152_INACCESSIBLE in the loops in
> the driver. There are still a few more that keep tripping the driver
> up in error cases and make things take longer than they should. Add
> those in.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Grant Grundler <grundler@chromium.org>

I've checked all the return paths and believe these changes don't
break any of them.

cheers,
grant

> ---
>
>  drivers/net/usb/r8152.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index d6edf0254599..aca7dd7b4090 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -3000,6 +3000,8 @@ static void rtl8152_nic_reset(struct r8152 *tp)
>                 ocp_write_byte(tp, MCU_TYPE_PLA, PLA_CR, CR_RST);
>
>                 for (i =3D 0; i < 1000; i++) {
> +                       if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                               return;
>                         if (!(ocp_read_byte(tp, MCU_TYPE_PLA, PLA_CR) & C=
R_RST))
>                                 break;
>                         usleep_range(100, 400);
> @@ -3329,6 +3331,8 @@ static void rtl_disable(struct r8152 *tp)
>         rxdy_gated_en(tp, true);
>
>         for (i =3D 0; i < 1000; i++) {
> +               if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                       return;
>                 ocp_data =3D ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL=
);
>                 if ((ocp_data & FIFO_EMPTY) =3D=3D FIFO_EMPTY)
>                         break;
> @@ -3336,6 +3340,8 @@ static void rtl_disable(struct r8152 *tp)
>         }
>
>         for (i =3D 0; i < 1000; i++) {
> +               if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                       return;
>                 if (ocp_read_word(tp, MCU_TYPE_PLA, PLA_TCR0) & TCR0_TX_E=
MPTY)
>                         break;
>                 usleep_range(1000, 2000);
> @@ -5499,6 +5505,8 @@ static void wait_oob_link_list_ready(struct r8152 *=
tp)
>         int i;
>
>         for (i =3D 0; i < 1000; i++) {
> +               if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                       return;
>                 ocp_data =3D ocp_read_byte(tp, MCU_TYPE_PLA, PLA_OOB_CTRL=
);
>                 if (ocp_data & LINK_LIST_READY)
>                         break;
> @@ -5513,6 +5521,8 @@ static void r8156b_wait_loading_flash(struct r8152 =
*tp)
>                 int i;
>
>                 for (i =3D 0; i < 100; i++) {
> +                       if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                               return;
>                         if (ocp_read_word(tp, MCU_TYPE_USB, USB_GPHY_CTRL=
) & GPHY_PATCH_DONE)
>                                 break;
>                         usleep_range(1000, 2000);
> @@ -5635,6 +5645,8 @@ static int r8153_pre_firmware_1(struct r8152 *tp)
>         for (i =3D 0; i < 104; i++) {
>                 u32 ocp_data =3D ocp_read_byte(tp, MCU_TYPE_USB, USB_WDT1=
_CTRL);
>
> +               if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                       return -ENODEV;
>                 if (!(ocp_data & WTD1_EN))
>                         break;
>                 usleep_range(1000, 2000);
> @@ -5791,6 +5803,8 @@ static void r8153_aldps_en(struct r8152 *tp, bool e=
nable)
>                 data &=3D ~EN_ALDPS;
>                 ocp_reg_write(tp, OCP_POWER_CFG, data);
>                 for (i =3D 0; i < 20; i++) {
> +                       if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> +                               return;
>                         usleep_range(1000, 2000);
>                         if (ocp_read_word(tp, MCU_TYPE_PLA, 0xe000) & 0x0=
100)
>                                 break;
> --
> 2.43.0.rc0.421.g78406f8d94-goog
>

