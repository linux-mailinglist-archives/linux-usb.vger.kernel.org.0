Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1D34CD6C6
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 15:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237187AbiCDOw0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 09:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236484AbiCDOwZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 09:52:25 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD32B1B84E8
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 06:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=ZpQYjJVb5Q5t4rxaTiNuxOlcx1Ws3Ns75BctvSgeJ0k=; b=UCYgiU8do0Pjso4Y1pMj/Jwpv0
        u124wJwXITlWxXi9e0iDQAFheiHVXePLsTtjdL7cDK7BLMH4CXoLMXMI3lomY7p5Ao6qbZN9crc5x
        qcqzc3iYiJJh/3aPNq1iUjQkKJnlvuXmeJyUaXoxzve9WWm2scw0Vua/D73R60WhQtpg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1nQ9HJ-009FBQ-LE; Fri, 04 Mar 2022 15:51:33 +0100
Date:   Fri, 4 Mar 2022 15:51:33 +0100
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
Message-ID: <YiIndfh0B87LRYnI@lunn.ch>
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
 <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
 <YiIeEHMc+tWE0coi@lunn.ch>
 <CAOMZO5CioYoddT0kqtf+wOTvvxArm9ipW2bAj84qKM_eQgMcjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5CioYoddT0kqtf+wOTvvxArm9ipW2bAj84qKM_eQgMcjg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>  # echo -n "2-1" > /sys/bus/usb/drivers/usb/unbind
> usb 2-1.1: USB disconnect, device number 3
> smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx' usb-ci_hdrc.1-1.1,
> smsc95xx USB 2.0 Ethernet
> smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> *********** smsc95xx_unbind: calling phy_disconnect
> smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> libphy: *********** phy_disconnect: 1
> libphy: *********** phy_disconnect: 2
> *************** phy_stop
> smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> *********** smsc95xx_stop
> smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup
> usb 2-1.4: USB disconnect, device number 4
> 
> Maybe the -19 errors should be ignored?

But why does it return ENODEV? It seems to me, ignoring it is papering
over the cracks. Why cannot we access to the PHY?

     Andrew
