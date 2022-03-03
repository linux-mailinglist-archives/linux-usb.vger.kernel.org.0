Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0DD84CBE9C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Mar 2022 14:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbiCCNP0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Mar 2022 08:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbiCCNPZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Mar 2022 08:15:25 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A383170D79
        for <linux-usb@vger.kernel.org>; Thu,  3 Mar 2022 05:14:39 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id f8so6543942edf.10
        for <linux-usb@vger.kernel.org>; Thu, 03 Mar 2022 05:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=EUK6NPBCiJT8JljhlizLOrrAFU6l0YsQk/x4uEHm0Wo=;
        b=Xz+lmbqCmoWf1j+WgekCUxnrNu+rH//t8qnPnvW2+7RY/pKATo3twOF7+JBV4MHgRw
         4pRzHwqAgUnS/Nh93Ten0pQrGU9uvF97RkOXvZJvPgQgb7+7E6wqJ+XoQDOiGWUQbQv+
         jWv+XIxCdDf/J84r2v+XXBV4gvdx0bosw80Gr0KuetS44u0yMDo420KzNOqmY8X1sLa0
         bAhGPMiXMMOv9QTeBIWpmuQ4GSb95wTBBy2ATo7sRCd5J1pvXZW0O96M7ULPGR1+BX+w
         N3QIPJyclPVT5srW3V8tG1+WdAk4eULsivnOnC7yleVLnsdC3WP9fncpJiS7+3x/mN6F
         MuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=EUK6NPBCiJT8JljhlizLOrrAFU6l0YsQk/x4uEHm0Wo=;
        b=icAo0QiytRQm5XNnN5J1cEyiHdXwJppC/QeADPAPZJGJ3Cvd2CO43qNzypjfjDFuKU
         yAwdnueRpAU5eA3d5ZaJrHvIqrnMSJL+gLZqdjMTQ0McOVDBBjeA7IWDKhgdvIDDMFFL
         tsVG06SN04/4lq+JR6ENmnOgslYTV+Cpn0ffouTqzqU9ekHXm2yJudJHGI//AC5mMqQ2
         5RVkWK4KTOU5ak6bfbiRl+GhEeyP1K0V6TEQ/vj38UhcaYx2Fs5dgK5h8nBEIPyDw+fZ
         +7pqHWEYSCWhcedCUUsXz6DH1J4/pG/gZcgLhmBQCM6WhBtKuaA7d7EcquhLTlSOVLG4
         wNVg==
X-Gm-Message-State: AOAM530VaXhekxIW+4jYMbpk9+o9wWHHWT3gqNwkdeEuHIJgMIVbn1s7
        o4MMAmxnEbVt4xXQkraKRXqdDJjmZ9+doG9WAss=
X-Google-Smtp-Source: ABdhPJx5FtEZd+yoWak6vcDm4RZfkd/APQ0+f990Giq1Cg+UjVJd+ZfVsgQuIKIKa9/iHPNjnpcAorFYcUEvtgzjNUE=
X-Received: by 2002:a05:6402:26c1:b0:415:eeb0:ffa5 with SMTP id
 x1-20020a05640226c100b00415eeb0ffa5mr493538edd.356.1646313277858; Thu, 03 Mar
 2022 05:14:37 -0800 (PST)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 3 Mar 2022 10:14:25 -0300
Message-ID: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
Subject: smsc9511: Register access happens after unregistration
To:     Schrempf Frieder <frieder.schrempf@kontron.de>
Cc:     Marek Vasut <marex@denx.de>, USB list <linux-usb@vger.kernel.org>,
        oneukum@suse.com, Adam Ford <aford173@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Martyn Welch <martyn.welch@collabora.com>,
        peter.chen@kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>
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

Hi,

On a imx8mm-iotgateway board running kernel 5.17-rc6 I am getting the following
smsc95xx errors after a 'reboot' command:

ci_hdrc ci_hdrc.1: remove, state 1
usb usb2: USB disconnect, device number 1
usb 2-1: USB disconnect, device number 2
usb 2-1.1: USB disconnect, device number 3
smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx' usb-ci_hdrc.1-1.1,
smsc95xx USB 2.0 Ethernet
smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup
usb 2-1.4: USB disconnect, device number 4
ci_hdrc ci_hdrc.1: USB bus 2 deregistered
ci_hdrc ci_hdrc.0: remove, state 4
usb usb1: USB disconnect, device number 1
ci_hdrc ci_hdrc.0: USB bus 1 deregistered
imx2-wdt 30280000.watchdog: Device shutdown: Expect reboot!
reboot: Restarting system

smsc95xx register accesses are happening after the device is unregistered.

What would be the correct way to prevent such smsc95xx register accesses
to happen?

Hi Frieder,

I see that imx8mm-kontron-n801x-s.dts also uses an SMSC9514 device.

Do you also see such errors after running "reboot"?

Thanks,

Fabio Estevam
