Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 395494CD5BD
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 14:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239611AbiCDN7t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 08:59:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239590AbiCDN7s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 08:59:48 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6079F4BBA9
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 05:59:00 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qa43so17607129ejc.12
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 05:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v7Z048Fg1MLEEnzImA0ckswqu74FEZc8woDEqzOfgBY=;
        b=Cvhijw5GDwNz8ZEqb6SR/kh1cc+uMvz2EAvODVNJam1ywavnxnq/ZZElCYQdEVCFaN
         Nfepzgx8HkBb8Y6HgDcI5Xx6c7HglltKMkTUztCk8+ZxyNOIvhXlItSYKX85MFasjE/r
         0CPvpIKTAFwsLGUjpqdmuJDLvt2qgm5XtWMsfbi4EJ5DsYdXdxYqo9NuBBAxfg04ri5A
         wlit2ZYomhCizDpxQHtSQ2swEjCGaYl6vdzRQaq/GjWEtwwVwRrZIuuDvLgQhRWWUDCl
         wfjCfoV9hmdTpsGrCI7dFqiRyYOzliWRIMaE3XaXUVrPP/0elVLxovZibGgEMunn94Ql
         ugZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v7Z048Fg1MLEEnzImA0ckswqu74FEZc8woDEqzOfgBY=;
        b=hZ7cvepguGJPGR9SNyTUeqSosAkZa8WzmrEK+JXYbyYNe+KWFOo4kbdvi1gM+DVOB/
         PW63nTh9v3Duk5QLLjlUmAQCosNvm4pCZXxk+mH4FUHT9B2E4uiZBIQMvOrYVnngaeon
         yDsrZqSJTQp22Uqkw7FN1KMKIoUZUjAEQeQMmZ/L4vUWxV9ol4U5VP2q3w418Nqr0SEC
         dZxxEH22cKMnXkQembCZLHddH65El3hzy5TcAqj5KqnXK6DXIBGPMBavwlf4IYWOaWsS
         1Vqp8PD0SXMRhraQAf4tr07YMOzAHy/B7/XepJLxGyBewjf+MYvPzDss+KP9dgwMCaGm
         6RYg==
X-Gm-Message-State: AOAM533G9BkyYX9SKGWHay/D3bSYKGJbskyHGvdHTCd/a9EEXWiLPFLi
        X66EahVZ/P3B8sxxoaE/gMbsMbZ7yT+xg11/nC0=
X-Google-Smtp-Source: ABdhPJxlCUSQ4fnO3yACp9sOcPs2VN7k6+zN7uBCLAQR8zCgEhg20Rt6Oj8twcGTsIDizTnGMSbT7DI2mQdFDUXI5fc=
X-Received: by 2002:a17:907:72c3:b0:6da:c277:8c62 with SMTP id
 du3-20020a17090772c300b006dac2778c62mr1548151ejc.492.1646402338800; Fri, 04
 Mar 2022 05:58:58 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
In-Reply-To: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 4 Mar 2022 10:58:47 -0300
Message-ID: <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
Subject: Re: smsc9511: Register access happens after unregistration
To:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Martyn Welch <martyn.welch@collabora.com>
Cc:     Marek Vasut <marex@denx.de>, USB list <linux-usb@vger.kernel.org>,
        oneukum@suse.com, Adam Ford <aford173@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, peter.chen@kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        fntoth@gmail.com
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

Hi Martyn,

On Thu, Mar 3, 2022 at 10:14 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> On a imx8mm-iotgateway board running kernel 5.17-rc6 I am getting the following
> smsc95xx errors after a 'reboot' command:
>
> ci_hdrc ci_hdrc.1: remove, state 1
> usb usb2: USB disconnect, device number 1
> usb 2-1: USB disconnect, device number 2
> usb 2-1.1: USB disconnect, device number 3
> smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx' usb-ci_hdrc.1-1.1,
> smsc95xx USB 2.0 Ethernet
> smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup

The same error has been previously reported by Ferry Toth on Intel
Edison-Arduino:
https://lore.kernel.org/netdev/5cd6fc87-0f8d-0b9b-42be-8180540a94e7@gmail.com/

It happens after commit a049a30fc27c ("net: usb: Correct PHY handling
of smsc95xx")

A simple way to reproduce it:

echo -n "2-1" > /sys/bus/usb/drivers/usb/unbind

It is not clear to me why register 0x114 (MII_ADDR) is accessed after
smsc95xx unregistration.

Any ideas?

Thanks
