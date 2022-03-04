Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4F54CD634
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 15:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238729AbiCDOT1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 09:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235026AbiCDOT0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 09:19:26 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C4A424B5
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 06:18:38 -0800 (PST)
Received: from [IPv6:2a00:23c6:c31a:b300:4f30:f04:5040:b889] (unknown [IPv6:2a00:23c6:c31a:b300:4f30:f04:5040:b889])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: martyn)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C53A01F4681D;
        Fri,  4 Mar 2022 14:18:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1646403517;
        bh=aS6wpjKssBwcn1kIHCk8tK9weqyKPhZljaq9CMNyruU=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=XxokYc1zs7kkIdyzy1kxthN9mrgV6r3pK6Os/uX2Hnikjk8bOqBYXLyW3ffikh5Ag
         LgegCBSgRCe4ULFYUMOKrW3p54ske06Gj7O0GGqiPSg2+B5Ip2j/SJS8G3nmqT72HC
         nA7R7w8ZtG56Vh8b9YNf1oNovZ+OOqmkc1dB1fccKr7xqyVaaDQJhNwMtC4HHrOTs0
         4mX5YAikowqptlwSN9bDiTiXNWMmaNB4kSRKVz/y2HjlHNYjGLujaG4d5C2sbs+bbN
         qqpHFRC3wlC6ZEvQlCJRAdsF8J+4ITo/ukhEe7U55ZFzMaj/3Ji9N1B6EfmoVojSiG
         hyPGBPU/itrxQ==
Message-ID: <8412ed8895e8ef59d4a1789635b670f21601a6c4.camel@collabora.com>
Subject: Re: smsc9511: Register access happens after unregistration
From:   Martyn Welch <martyn.welch@collabora.com>
To:     Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Marek Vasut <marex@denx.de>,
        USB list <linux-usb@vger.kernel.org>, oneukum@suse.com,
        Adam Ford <aford173@gmail.com>, peter.chen@kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        fntoth@gmail.com
Date:   Fri, 04 Mar 2022 14:18:34 +0000
In-Reply-To: <YiIeEHMc+tWE0coi@lunn.ch>
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
         <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
         <YiIeEHMc+tWE0coi@lunn.ch>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.43.2-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2022-03-04 at 15:11 +0100, Andrew Lunn wrote:
> On Fri, Mar 04, 2022 at 10:58:47AM -0300, Fabio Estevam wrote:
> > Hi Martyn,
> >=20
> > On Thu, Mar 3, 2022 at 10:14 AM Fabio Estevam <festevam@gmail.com>
> > wrote:
> > >=20
> > > Hi,
> > >=20
> > > On a imx8mm-iotgateway board running kernel 5.17-rc6 I am getting
> > > the following
> > > smsc95xx errors after a 'reboot' command:
> > >=20
> > > ci_hdrc ci_hdrc.1: remove, state 1
> > > usb usb2: USB disconnect, device number 1
> > > usb 2-1: USB disconnect, device number 2
> > > usb 2-1.1: USB disconnect, device number 3
> > > smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx' usb-ci_hdrc.1-1.1,
> > > smsc95xx USB 2.0 Ethernet
> > > smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> > > smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> > > smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> > > smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
> > > smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
> > > smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
> > > smsc95xx 2-1.1:1.0 eth1: hardware isn't capable of remote wakeup
> >=20
> > The same error has been previously reported by Ferry Toth on Intel
> > Edison-Arduino:
> > https://lore.kernel.org/netdev/5cd6fc87-0f8d-0b9b-42be-8180540a94e7@gma=
il.com/
> >=20
> > It happens after commit a049a30fc27c ("net: usb: Correct PHY
> > handling
> > of smsc95xx")
> >=20
> > A simple way to reproduce it:
> >=20
> > echo -n "2-1" > /sys/bus/usb/drivers/usb/unbind
> >=20
> > It is not clear to me why register 0x114 (MII_ADDR) is accessed
> > after
> > smsc95xx unregistration.
>=20
> I suggest you look at the call sequences. When does phy_stop() and
> phy_disconnect() get called? phylib has a work queue which runs once
> per second to poll the PHY and get its status. That polling is
> stopped
> by calling phy_stop(). It is also assumed you can still talk to the
> PHY while performing phy_stop().
>=20
>=20

I was just trying to remember the details from when I looked at this
driver. IIRC, that's broadly the conclusion I came to and couldn't
really see a way around it. Access to the phy was being lost before
phy_stop() was called.

Martyn

> =C2=A0=C2=A0=C2=A0 Andrew

