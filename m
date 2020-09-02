Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B3D25A809
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 10:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgIBIt4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 04:49:56 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:36415 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgIBIty (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 04:49:54 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MVaQW-1k3SJP27Hw-00RV2f for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020
 10:49:51 +0200
Received: by mail-qk1-f182.google.com with SMTP id f2so3634150qkh.3
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 01:49:51 -0700 (PDT)
X-Gm-Message-State: AOAM533aLqcsdrf7QE50DV1zkOSgCf2Xe2/0S3pDoVUeXv4utBxsgd9L
        Gd4OCH8+cCDUWBnGfYirBk+eGPdkWLRpZiWw0HM=
X-Google-Smtp-Source: ABdhPJzAH2tcVQaAs7oo9+Kf6pOin8x7+gC1xDsFFV/x7pDgouHnLU2HdIz7fZ3/nEKOta7o0uVaUfoWdvEscokRBTY=
X-Received: by 2002:a37:8405:: with SMTP id g5mr5873472qkd.286.1599036590315;
 Wed, 02 Sep 2020 01:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200902003018.4870-1-festevam@gmail.com> <20200902003018.4870-5-festevam@gmail.com>
In-Reply-To: <20200902003018.4870-5-festevam@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 2 Sep 2020 10:49:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3dND41JAVNRrQacuTXg2TJ+kTC1oCE5wBs+xGsUDCDKg@mail.gmail.com>
Message-ID: <CAK8P3a3dND41JAVNRrQacuTXg2TJ+kTC1oCE5wBs+xGsUDCDKg@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: imx: Remove ehci board files
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        gregkh <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4fmFrQSxvHaxu53iFQMmbNe6CoZLnHmXlysOfGNuUyKRN59x9KZ
 wWWzaUbxpZmtbgXueHWNdahhoieNoqCm9omTJ6+TSdhGNQowpbkGWhmO3fwAx1EdY/QEtaq
 SLfXfDVbIEUY9qd27IpGlWXmVsRTj9BJkbZ9IZicDcfS1AARRRlo53v7u9YmN/oKg776yNE
 Ic2w48zsDfOiSdyKAyEmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TDCIlPW30f4=:w2APQqeDGSKOoUGSSdQ6YT
 MhtkqZ5Rrv3QGq8qc0/loUL1Cg6dcl8CoukVQA/QUOoMDvzQ0PVvBEoKRdmqBGnK+jahlHtjD
 OS2xLlzdoVbB6+LF+bOwHkBchK7SbT9UtbNhu09DdE7bXt+56/GCA24OsKeadFHiGdz/JuD0u
 j4vOOSotYHWcgZWZeqhFdLIHMBgvJw0JvKCtjsza9oDpEQg+BnmJuDq3VOIIaD7ulIYrWUg7n
 QphixG0AbhYg3784DCDYsrXhHtBSRCOdNuClSxCe70F7rBtjXhGtdaXDGzcCM4Cc7C1+lOva2
 6d3AD/UEu9Rfh1iEtARnMlUw7rGJ0r1T5pBkeW05OI3ieMLVO/EkjplrQG8uuOukyfgNYPAcK
 6ZWP8FF5AtexRBju1kid57WPpkl9xu39rZ+CuT1YLT1O2fTtFjo0Wbm4jphlUR+qeODlQWtWf
 td19vQAqmL9WQS/Dx2Spt6BQ7Y85M/w9QD9acB5gWnkSxbtdin38imxzp7sbVKZ2WqWYvc7Hx
 HRFqQnK2NkgMr54k+ywjV0N5qgKtM8dnH99FLuGLRJwLGyFYuQY+9LVIVF0RIrTKOe9fUsPYN
 esL8oUI5B7QuGNAWzHQORkGjgEzmloXs/4p42Tpop7ujT8LYzfzQeLUGsuR9Lxw7K9RmxKZ1g
 WlHZyUpsvIV6Z4A/0IY+t9U9dH/87yoQ/cDKz4xZZZQB3qRdTavwbpHnDZSxh74JnzyYRhb8s
 KjTC6W7iG9a6Ey0mu6fDzZ+Hr6rSez8aZdt6ZrMGrTYabhvoTewf0OMCU+hZj2p+MRq5czbYE
 OYXN7Z2vR+NUHBezjCSKBY8jRX3VfTZwdVhAG8/dsPQppge79ULku9aZT7gRtObcGbUAsb0wQ
 GYh9A6Blz7+sWTRIty+XzA1MXc/rRSvrKCdu9KlIfwD7VjKc6AQHHOg4A2c6xGQUvr9iIBLZY
 q1LEJ25hdNyb/x6cJONIDHn/nsK7ZEud/ptE39Kn2NKP0i0nqyFaG
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 2, 2020 at 2:32 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Now that the i.MX board files have been removed, there
> is no need for keeping the ehci related files, so just
> remove them.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  arch/arm/mach-imx/Makefile     |  7 ++-
>  arch/arm/mach-imx/ehci-imx27.c | 74 ----------------------------
>  arch/arm/mach-imx/ehci-imx31.c | 74 ----------------------------
>  arch/arm/mach-imx/ehci-imx35.c | 89 ----------------------------------
>  arch/arm/mach-imx/ehci.h       | 44 -----------------
>  5 files changed, 3 insertions(+), 285 deletions(-)
>  delete mode 100644 arch/arm/mach-imx/ehci-imx27.c
>  delete mode 100644 arch/arm/mach-imx/ehci-imx31.c
>  delete mode 100644 arch/arm/mach-imx/ehci-imx35.c
>  delete mode 100644 arch/arm/mach-imx/ehci.h

Do you plan to send another patch to remove linux/platform_data/usb-ehci-mxc.h
and parts of drivers/usb/host/ehci-mxc.c, to get merged by the USB maintainers?
I suppose we could merge that at the same time through the soc tree, or
separately, but it would make sense to get it done.

      Arnd
