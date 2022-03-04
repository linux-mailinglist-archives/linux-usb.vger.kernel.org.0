Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F323F4CD5FC
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 15:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237781AbiCDOMW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 09:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbiCDOMV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 09:12:21 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D651BAF07
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 06:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=+wHP+VzMi8lo/E0MU9BeOepvLGvONJ4Z2LYgBSUb2jE=; b=fcSHxqieKrjZ1alEXiDx42J8Xp
        NQRmMqO9fUyxXHLst0cHgK4wBvOflyP+69a3GmAatgvcQgaMDgGzgsj6dWe+8QL0l/cAIp/TdFhnc
        q5/z/xl5V+TzpeFBpgvVbVjro3kHyOw5aAQSfmd3pb6eIh3UjPh5nmrtApjkae43TaA8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1nQ8eW-009Ewt-BF; Fri, 04 Mar 2022 15:11:28 +0100
Date:   Fri, 4 Mar 2022 15:11:28 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Martyn Welch <martyn.welch@collabora.com>,
        Marek Vasut <marex@denx.de>,
        USB list <linux-usb@vger.kernel.org>, oneukum@suse.com,
        Adam Ford <aford173@gmail.com>, peter.chen@kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        fntoth@gmail.com
Subject: Re: smsc9511: Register access happens after unregistration
Message-ID: <YiIeEHMc+tWE0coi@lunn.ch>
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
 <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 04, 2022 at 10:58:47AM -0300, Fabio Estevam wrote:
> Hi Martyn,
> 
> On Thu, Mar 3, 2022 at 10:14 AM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Hi,
> >
> > On a imx8mm-iotgateway board running kernel 5.17-rc6 I am getting the following
> > smsc95xx errors after a 'reboot' command:
> >
> > ci_hdrc ci_hdrc.1: remove, state 1
> > usb usb2: USB disconnect, device number 1
> > usb 2-1: USB disconnect, device number 2
> > usb 2-1.1: USB disconnect, device number 3
> > smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx' usb-ci_hdrc.1-1.1,
> > smsc95xx USB 2.0 Ethernet
> > smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> > smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> > smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> > smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> > smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> > smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> > smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup
> 
> The same error has been previously reported by Ferry Toth on Intel
> Edison-Arduino:
> https://lore.kernel.org/netdev/5cd6fc87-0f8d-0b9b-42be-8180540a94e7@gmail.com/
> 
> It happens after commit a049a30fc27c ("net: usb: Correct PHY handling
> of smsc95xx")
> 
> A simple way to reproduce it:
> 
> echo -n "2-1" > /sys/bus/usb/drivers/usb/unbind
> 
> It is not clear to me why register 0x114 (MII_ADDR) is accessed after
> smsc95xx unregistration.

I suggest you look at the call sequences. When does phy_stop() and
phy_disconnect() get called? phylib has a work queue which runs once
per second to poll the PHY and get its status. That polling is stopped
by calling phy_stop(). It is also assumed you can still talk to the
PHY while performing phy_stop().

    Andrew
