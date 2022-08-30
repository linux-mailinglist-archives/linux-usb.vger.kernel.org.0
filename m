Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04EA05A6B66
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 19:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbiH3R4J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 13:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbiH3Rzl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 13:55:41 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33022876A9
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 10:53:44 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id h11-20020a17090a470b00b001fbc5ba5224so12587363pjg.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 10:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=kx3QMApec5L1A/kJjq+NRNfAaAm3kYhF5kN0XuMgkn4=;
        b=X8ZCuWBv89RQu/4ryrySIIp8KEnqAX7pc8bX7DIeUFi1scKtiGmOsFYmx7H0ZLJpnO
         E1bF9PWP4D24pOcqEe09ZJWQAl/DE+xfjsQK/0WZiw+XmK+Zu5FWzSorguXNQkjqEeC1
         JMqWQyXTgOMw6J1X0RLHre4954g3h1/FGHtRi3mULd/xVSvfUzQE7lnqjk8d9aEXWs7v
         2tJNRzVkWkjtoHVBlGrzkg40sf16hiHH1A145hyFxX03wKw5kP2BkB+wZDhs5ruVAhEn
         yETPdl/GQ5Gpv7jGLAlph+BYRX14YjZ+HV/vu1ysdXhzPxnN+3eOWT8QvfTXexMDA1+s
         t7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=kx3QMApec5L1A/kJjq+NRNfAaAm3kYhF5kN0XuMgkn4=;
        b=s3ADMEOIYXl9VHN0yBKNVULMf2r3zc6AWReM8VqzBFIhSb4t46xEvVK9dhot80IyiJ
         aXibpksmArFi2sh5yqN9HlEhMbX1rQr+odTHJIWGe36663sGdrUW6knzuVAcI8QKYsTg
         NlEjeF+1VuLk1ei8dYt5CAYOm7TvUmkY9Rkt5nCQPbMccAUdSmQxQNKoptokFoT6FlV6
         Is7YKuUxhCijzm8CKlwz0Y/z4vjcI6BtNRMm83L8L7MdxZeDnSZAY78ZDWg4PKIdiR1t
         5bmu4aH3vQ/VgFTV2WY/+p+SPqRlGYQvmsBTAgW9mg7/u8GgK9JdZmtRWV/nkOUWUcS1
         jOqA==
X-Gm-Message-State: ACgBeo03WVqY1Ud0IAhpFmZY97HMapZPWDt0Zg5QktUbKVA7o6Xey0/p
        z4Qun/6O3/nQKZKewTvBhzQVrSGB5hgiITVs6/PI1IUM9bJyCzv1
X-Google-Smtp-Source: AA6agR4LMxeVzSbHbrBCfoW9nkhiokhP34fYeiwTkSjSnnHyPMkVZmOKyBSU6gWtfJHV/5B/ltB3B957xplg7fRue9A=
X-Received: by 2002:a17:902:9887:b0:172:7090:6485 with SMTP id
 s7-20020a170902988700b0017270906485mr22096257plp.63.1661882014306; Tue, 30
 Aug 2022 10:53:34 -0700 (PDT)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 30 Aug 2022 10:53:23 -0700
Message-ID: <CAJ+vNU2bLPAta6GpDn_dGSrCnCRuBtxvLZ-g01h1jGwQuruBuA@mail.gmail.com>
Subject: imx8mp USB OTG/dual-role
To:     linux-usb@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Li Jun <jun.li@nxp.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Felipe Balbi <balbi@kernel.org>,
        Fabio Estevam <festevam@denx.de>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings,

I have an imx8mp board (imx8mp-venice-gw74xx) which has a DWC3 USB
host controller using imx8mp PHY
(drivers/phy/freescale/phy-fsl-imx8mq-usb.c fsl,imx8mp-usb-phy) and
DWC3 host controller core (drivers/usb/dwc3/core.c snps,dwc3) with
imx8mp glue (drivers/usb/dwc3/dwc3-imx8mp.c fsl,imx8mp-dwc3).

One of the 2x USB 3.0 hosts is connected to a USB Type C connector
using a TPS25821 USB power switch and config controller which handles
the CC pins on and VBUS enable as well as drives the mux sel pin of a
USB3 mux to route the USB SS pairs to the appropriate half of the Type
C connector. This device has no I2C or other management bus - only
VBUS, FAULT#, SINK#, and POL# outputs based on CC pins.

I'm not clear how to describe this in the device-tree in order for it
to function as a dual-role controller for host vs device mode.

The TPS25821 has a FAULT# signal that routes to IMX8MP GPIO1_IO13
pinmuxed as MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC and a SINK# signal
that routes to IMX8MP GPIO1_IO10 pinmuxed as
MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID. Additionally the VBUS output of
the TPS25821 also connected to the TypeC VBUS pin routes to the IMX8MP
USB1_VBUS pin.

I've noticed there are currently only 2 other IMX8MP boards in Linux
mainline that specify dr_mode="otg"; the DH electronics i.MX8M Plus
DHCOM SOM (imx8mp-dhcom-som.dtsi), and the Toradex i.MX8M Plus Verdin
SOM (imx8mp-verdin.dtsi). I'm not clear how these are hooked up or if
USB dual-role work on these currently. I did notice that
imx8mp-verdin.dtsi looks like it does not enable the phy or core via
status prop and uses invalid 'over-current-active-low' and
'disable-over-current' dt props.

I am currently using the following with imx8mp-venice-gw74xx:

/* USB1 - Type C front panel */
&usb3_phy0 {
        status = "okay";
};

/* USB1 dwc3 glue */
&usb3_0 {
        fsl,over-current-active-low;
        status = "okay";
};

/* USB1 dwc3 core */
&usb_dwc3_0 {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_usb1>;
        dr_mode = "otg";
};

&iomuxc {
        pinctrl_usb1: usb1grp {
                fsl,pins = <
                        MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC    0x140
                        MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID    0x140
                >;
        };
};

And currently v6.0-rc2 enumerates the host controller even without a
Type-C to host cable attached which tells me that OTG_ID isn't doing
its job. I vaguely recall some confusing statements on the IMX
community forum that these pins might not even be used on the IMX8MP.

How should I be describing the device-tree for this scenario in order
to get dual-role behavior?

Best Regards,

Tim
