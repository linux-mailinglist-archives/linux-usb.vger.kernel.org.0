Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF89C4CD693
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 15:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239854AbiCDOlx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 09:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237280AbiCDOlv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 09:41:51 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420431BD043
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 06:41:03 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id w4so8500940edc.7
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 06:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FtDWxUue9aeboZ6Jc8TQjbFp8OHOB5sIsWa7uu6j7r0=;
        b=FsydzRpUw0KGMxT4BBiuq0YJYf8A8Qr6AaNNky5DkcTDCpZP8TYU7EIjYj/v1lSGuJ
         laq90JDSV+8MY0+ynS4V/z9APvM4gOmbHtd2rW6o9DmQChgdg31TbCrOHBil66nzqoW3
         0N/zoIjOTY5VUgWJr3rfeNq7VC0nRm+AH8nYZtsNkJgKIvwG2zMtAiHF2ScUTYDQjqxb
         CXoG03kejOg4jf7bbLqOonZUcfpzUy9YTTu4OTE6RAKHdx6KXhgpuIlAmgPGdmUDjtUE
         0xVb8Rhr+/wCczoozv0T56wvs9PnMDWUEdXrEc2p6eP7syiYTpxqIngiWAqlRSf+koMo
         pPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FtDWxUue9aeboZ6Jc8TQjbFp8OHOB5sIsWa7uu6j7r0=;
        b=QD7CjAIcELNZS4+WhEO016GBecnv77YMO26mzXsR8oRS2bmak/Ux8uTkwpCPqwYhhi
         ENskK91pNGuYkGIS+Er/HM3RSoE78pKET+dS3OSbnhr0gAyMNy2c4eEXLD408ZhLB8gc
         GeqyhXPthktA5m/b8rLVtm0bwNEAAGw/nPq5PVevU9LW4RgqEL3hvNS0VTk+Q4Ah8sZK
         /FWwGSSpRfhj+jYNUV2jJpOFDSF2ZARwR0D5KNSZ+bOxTD1RSX15ZnpeRTIipBxXVk+k
         8cKtb6YDRVYfrwkfIyh4QV53lWIj6rsUB16FZz+3S+dVXpDHmWCrH8TR1wXyJZHNRpHF
         /e/w==
X-Gm-Message-State: AOAM532ocTO56Tq9HIQVjQk+YLKbSGzhFudHFdNuPMwOnfc9lGtd4eus
        suvaAfTWWPN3ZBhcfZQfN4IO6CsIGjc07090UYo=
X-Google-Smtp-Source: ABdhPJxTTRFCuDwFtG+znMu2vFd84ajQoGW9WPA3wYLTSnr71x5f1dZPQmrMwEvIBkX17jv/Qm3Pog5y/f5zVChWrL8=
X-Received: by 2002:a05:6402:26c1:b0:415:eeb0:ffa5 with SMTP id
 x1-20020a05640226c100b00415eeb0ffa5mr5595980edd.356.1646404861691; Fri, 04
 Mar 2022 06:41:01 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
 <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com> <YiIeEHMc+tWE0coi@lunn.ch>
In-Reply-To: <YiIeEHMc+tWE0coi@lunn.ch>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 4 Mar 2022 11:40:49 -0300
Message-ID: <CAOMZO5CioYoddT0kqtf+wOTvvxArm9ipW2bAj84qKM_eQgMcjg@mail.gmail.com>
Subject: Re: smsc9511: Register access happens after unregistration
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Martyn Welch <martyn.welch@collabora.com>,
        Marek Vasut <marex@denx.de>,
        USB list <linux-usb@vger.kernel.org>, oneukum@suse.com,
        Adam Ford <aford173@gmail.com>, peter.chen@kernel.org,
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

Hi Andrew,

On Fri, Mar 4, 2022 at 11:11 AM Andrew Lunn <andrew@lunn.ch> wrote:

> I suggest you look at the call sequences. When does phy_stop() and
> phy_disconnect() get called? phylib has a work queue which runs once
> per second to poll the PHY and get its status. That polling is stopped
> by calling phy_stop(). It is also assumed you can still talk to the
> PHY while performing phy_stop().

With this debug patch:

--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1034,6 +1034,8 @@ void phy_stop(struct phy_device *phydev)
 {
        struct net_device *dev = phydev->attached_dev;

+       pr_err("*************** %s\n", __func__);
+
        if (!phy_is_started(phydev) && phydev->state != PHY_DOWN) {
                WARN(1, "called from state %s\n",
                     phy_state_to_str(phydev->state));
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index ce0bb5951b81..e26d9edf32f3 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1108,8 +1108,11 @@ EXPORT_SYMBOL(phy_connect);
  */
 void phy_disconnect(struct phy_device *phydev)
 {
-       if (phy_is_started(phydev))
+       pr_err("*********** %s: 1\n", __func__);
+       if (phy_is_started(phydev)) {
+               pr_err("*********** %s: 2\n", __func__);
                phy_stop(phydev);
+       }

        if (phy_interrupt_is_valid(phydev))
                phy_free_interrupt(phydev);
diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index bc1e3dd67c04..6ed674636961 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1190,6 +1190,7 @@ static void smsc95xx_unbind(struct usbnet *dev,
struct usb_interface *intf)
 {
        struct smsc95xx_priv *pdata = dev->driver_priv;

+       pr_err("*********** %s: calling phy_disconnect\n", __func__);
        phy_disconnect(dev->net->phydev);
        mdiobus_unregister(pdata->mdiobus);
        mdiobus_free(pdata->mdiobus);
@@ -1206,6 +1207,7 @@ static int smsc95xx_start_phy(struct usbnet *dev)

 static int smsc95xx_stop(struct usbnet *dev)
 {
+       pr_err("*********** %s\n", __func__);
        if (dev->net->phydev)
                phy_stop(dev->net->phydev);

The result is:

 # echo -n "2-1" > /sys/bus/usb/drivers/usb/unbind
usb 2-1.1: USB disconnect, device number 3
smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx' usb-ci_hdrc.1-1.1,
smsc95xx USB 2.0 Ethernet
smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
*********** smsc95xx_unbind: calling phy_disconnect
smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
libphy: *********** phy_disconnect: 1
libphy: *********** phy_disconnect: 2
*************** phy_stop
smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
*********** smsc95xx_stop
smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup
usb 2-1.4: USB disconnect, device number 4

Maybe the -19 errors should be ignored?
