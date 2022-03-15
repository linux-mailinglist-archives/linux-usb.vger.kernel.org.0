Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C75E44D923F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Mar 2022 02:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344258AbiCOBYw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 21:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344279AbiCOBYw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 21:24:52 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23FB2E690
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 18:23:40 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o6so24467539ljp.3
        for <linux-usb@vger.kernel.org>; Mon, 14 Mar 2022 18:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ycg68JWggm8R5/cpmdXFZeL6URm/Rkv3477RNhm/0C8=;
        b=GFre3+DPuFuapEe5GDzCpX/I8zdh122rkg/s4M/uiEXXSU3pa0x5Pfik6bYF5/8inQ
         sIVpQ7aBDEvF26o+MfSKz/nU3TAukrY3wlDva9VJki/7Cc8Wlx4nEkSKeppirEyhhb2K
         cqNTeojtCT5ae8BE/SoHFVEcR7TVQ8PTQCyZyAyJtQ2a+HjoTH4yf3I0wT7kY8+lcRdM
         KfkcR0fhwxJi7WmKGOVgPQ0qwUJgVdJK4rDYW4gnEFdqCD7SZ6b7loMqTCjgiDA7FR0a
         /X1Ukf9OpRf5PBS5Q+j1dix1QCfFnxskp+byQX9W0cpYdqiWjcT1z5iIuZeZQSmw2bU+
         5oxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ycg68JWggm8R5/cpmdXFZeL6URm/Rkv3477RNhm/0C8=;
        b=tStcuRWLJgsK/fv5rrL9x/J7GgMcqLcb+0+3enoM+m59sf/sMrF1XIoUZaVrcpJJmz
         sQ/SsKghdEieYoPevZLzDwpG7pSDXFNU4z5/su6B73oWwEO+3OySm/WxbhcYRA/NYrlc
         StE8PdzoJzojKbAOAciuoyXGCzLa3ZQ4VLG24y6l1Jl6UDpiKfKxQySzSDHwK1XSySNu
         H6s8E1U8N97OiN8ixNYYQXvHXgJrIkbEZxBnf2fEqzdxGXLgTkXigUvdOFsj+2Xw1JfZ
         DUi9HsnZjBRoJmV2vgTzf5k9JIcShvLrDIZjjya34wa8pxAmGsuLReMLDaSTJN0FQaJD
         foPw==
X-Gm-Message-State: AOAM530W43GO5zVDFrqtDwXHv+RQwAZsiy+UYKAeqLF7mn85KKjiz1H2
        mplC5S31F4f5b67ayS5z7Ty9bkQl1KPImfdiaG4=
X-Google-Smtp-Source: ABdhPJyvL9MRm5b5/g2V5XXXE79zNl2oFnPARyEn0vJpu/vkRutRwvzQ6AtfU95fC2r4RqHz9IYSVV0o5ml4akiCfrw=
X-Received: by 2002:a2e:9d86:0:b0:247:da0e:7c59 with SMTP id
 c6-20020a2e9d86000000b00247da0e7c59mr15773580ljj.127.1647307419211; Mon, 14
 Mar 2022 18:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220302094239.3075014-1-alexander.stein@ew.tq-group.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Tue, 15 Mar 2022 09:23:23 +0800
Message-ID: <CAL411-o8TPNv8vAfdPtzTaFkOGc7EmwNJv1Jxc-YUv1wc_vq0g@mail.gmail.com>
Subject: Re: [RFC 1/1] usb: chipidea: ci_hdrc_imx: disable runtime pm for HSIC interface
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 2, 2022 at 5:42 PM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> With the add of power-domain support in commit 02f8eb40ef7b ("ARM: dts:
> imx7s: Add power domain for imx7d HSIC") runtime suspend will disable
> the power-domain. This prevents IRQs to occur when a new device is attached
> on a downstream hub.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Our board TQMa7x + MBa7x (i.MX7 based) uses a HSIC link to mounted USB HUB on
> usbh device. Cold plugging an USB mass storage device is working fine. But
> once the last non-HUB device is disconnected the ci_hdrc device goes into
> runtime suspend.

Would you please show the difference between cold boot and runtime
suspend after disconnecting
the last USB device?

- Power domain on/off status for HUB device
- Runtime suspend status at /sys entry for HUB device
- "/sys/..power/wakeup" /sys entry  for HUB device

Peter

> This will eventually also disable the 'pgc_hsic_phy' power
> domain. Results is that no more updates from USB hub is handled, neither HUB
> on HSIC link or HUB on that's downstream link. USB tree looks like this:
>
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ci_hdrc/1p, 480M
>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 1: Dev 3, If 0, Class=Hub, Driver=hub/4p, 480M
>             |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
>         |__ Port 2: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage, 480M
>
> I noticed once the power domain is disabled, no IRQs appear if I attach a new
> mass storage, essentially preventing any runtime resume.
> I do not know if this is specific to i.MX7 only or if this is a general USB
> HSIC problem, so this diff might be too much.
>
> BTW: An udev rule with the same effect is:
> ACTION=="add", SUBSYSTEMS=="platform", DRIVER=="ci_hdrc",
> KERNELS=="30b30000.usb", TEST=="power/control", ATTR{power/control}="on"
>
> But I would like to get this fixed on driver level.
>
> Regards
> Alexander
>
>  drivers/usb/chipidea/ci_hdrc_imx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 097142ffb184..e5c22b70431c 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -344,6 +344,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>         if ((of_usb_get_phy_mode(dev->of_node) == USBPHY_INTERFACE_MODE_HSIC)
>                 && data->usbmisc_data) {
>                 pdata.flags |= CI_HDRC_IMX_IS_HSIC;
> +               /* Runtime suspend is not supported for HSIC interface */
> +               pdata.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
>                 data->usbmisc_data->hsic = 1;
>                 data->pinctrl = devm_pinctrl_get(dev);
>                 if (PTR_ERR(data->pinctrl) == -ENODEV)
> --
> 2.25.1
>
