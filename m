Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87E738B3C0
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 17:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhETPxk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 11:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbhETPxk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 11:53:40 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2F8C061574
        for <linux-usb@vger.kernel.org>; Thu, 20 May 2021 08:52:17 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id a7so625413plh.3
        for <linux-usb@vger.kernel.org>; Thu, 20 May 2021 08:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et4Y9oDwBfZPSJIkobIdERmduN5tDbataYzAvTYU2PY=;
        b=BCVv0pd4nAmeI+5bWyUVRJaJy3FgrY85SkTMeC+lgVcLhgFZ4tRLQSouhqM3mnWImU
         NEAQtBm4Cw4snbFI7JjhZFDxcpirRizhSD3v9IIY25LyEQHlMcfkuls3kPkXXwkadHQO
         6z1fx/gwt/D+qn/Mvty0czYMycp8CoRSY0XmR8oPK3AglkaWF6Y7IypNYiHYINHnwlYs
         /U4kf/AKZz0hV9FBUKSoqQyBQIQeekQwdKN4LMC5G3xyriUu+/cKFHDODGbNr1Z8Zirm
         zu8FtrwoBH7YkmXf7rs/aT4HoWCac/qjmYmQMScdsEYzL939MZy+1eD+svEEYzFJbI9p
         dEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=et4Y9oDwBfZPSJIkobIdERmduN5tDbataYzAvTYU2PY=;
        b=EA72odBdNKHcAyXrGGhnCOGLtUPeGMHlJJrGvbl7W2M0MrcRkuISvlPLgAO7b11fcm
         i+i8M+LDMd7FPhjFvTlMYBfiKls+r8Z6CqZFfl19/81PjiaI6A5rYkeaSntP/DJZm+Ly
         QJWpsvJt8KScdaS13yjUnpmqy68trBSwLsfgeWXAlA3ZwMuMAseaXrmWi8MsySYAXgXg
         i6TWRVI8C8aSsIU/yxQHLV8ACJHKAI3Yly8tDWjnQsGg4U45pEwMTh25VKuJDdpJVS5u
         L035tjgpPya2sWfVLAj2YjxKrfZypyhblZZJIhXGQZEta9HyZ41ify9wJN3l5mgmagQa
         mU5Q==
X-Gm-Message-State: AOAM531Yzg6PDFyCfIcjpBtWzqo1efIs4l/4j7EGmziBBLflI3M2YuUD
        /tfdcJT+rzUnze6M5TD6PLHuGGT3J202LN+d8bQJUQ==
X-Google-Smtp-Source: ABdhPJzlGXK4gw/ppubxQvbs1HN3MmWw2v/sExbp6XD0V3xabqGLH61Kzs0STh1qpcBaqJm5STnIQX6xaFNwgt8TWjY=
X-Received: by 2002:a17:902:a405:b029:f4:6975:14a8 with SMTP id
 p5-20020a170902a405b02900f4697514a8mr6557945plq.49.1621525936907; Thu, 20 May
 2021 08:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210520134210.1667580-1-weiyongjun1@huawei.com>
In-Reply-To: <20210520134210.1667580-1-weiyongjun1@huawei.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 20 May 2021 18:00:38 +0200
Message-ID: <CAMZdPi_GBhF7Dk0vxUu3YoPTEs=BXAEzTE+rtFN2hRbfXke=rQ@mail.gmail.com>
Subject: Re: [PATCH -next] usb: cdc-wdm: fix build error when CONFIG_WWAN_CORE
 is not set
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        USB <linux-usb@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Wei,

On Thu, 20 May 2021 at 15:32, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fix build error when CONFIG_WWAN_CORE is not set:
>
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_disconnect':
> cdc-wdm.c:(.text+0xb2a): undefined reference to `wwan_remove_port'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_in_callback':
> cdc-wdm.c:(.text+0xf23): undefined reference to `wwan_port_rx'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_stop':
> cdc-wdm.c:(.text+0x127d): undefined reference to `wwan_port_get_drvdata'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_tx':
> cdc-wdm.c:(.text+0x12d9): undefined reference to `wwan_port_get_drvdata'
> x86_64-linux-gnu-ld: cdc-wdm.c:(.text+0x13c1): undefined reference to `wwan_port_txoff'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_start':
> cdc-wdm.c:(.text+0x13e0): undefined reference to `wwan_port_get_drvdata'
> x86_64-linux-gnu-ld: cdc-wdm.c:(.text+0x1431): undefined reference to `wwan_port_txon'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_tx_complete':
> cdc-wdm.c:(.text+0x14a4): undefined reference to `wwan_port_txon'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_create.cold':
> cdc-wdm.c:(.text.unlikely+0x209): undefined reference to `wwan_create_port'
>
> Fixes: cac6fb015f71 ("usb: class: cdc-wdm: WWAN framework integration")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/class/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/class/Kconfig b/drivers/usb/class/Kconfig
> index d3f5162bd67e..7e502c046031 100644
> --- a/drivers/usb/class/Kconfig
> +++ b/drivers/usb/class/Kconfig
> @@ -30,6 +30,7 @@ config USB_PRINTER
>
>  config USB_WDM
>         tristate "USB Wireless Device Management support"
> +       depends on WWAN_CORE
>         help
>           This driver supports the WMC Device Management functionality
>           of cell phones compliant to the CDC WMC specification. You can use

Thanks for fixing this. Some *optional* code in cdc-wdm.c is flagged
with CONFIG_WWAN instead of CONFIG_WWAN_CORE. would it be possible to
change that flags in the code instead of adding a dependency?

Regards,
Loic
