Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60214CE14B
	for <lists+linux-usb@lfdr.de>; Sat,  5 Mar 2022 01:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiCEAAu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 19:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiCEAAt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 19:00:49 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB361E5016
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 16:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=7cUS/FaEbbEn+LJiNBAGPf1DKiPMT+Cp2ZaW8VzdnJA=; b=2+Dp9JYC1hgwi4R2jhxPLFokYq
        rTrtXVurniEfiz9bGjb8Id4FYIKwKnFJBOh1mO081C8hEqDglwxPAbO2Z/FnBvwepWQwECBtSv5Vy
        Aq09W1maPDrwKMlXS1bcTbgwuBbOEnllE+y5IOfbu1UQdMkHo4fRFZrfcm+ZuekMEPZ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1nQHpz-009Jis-RE; Sat, 05 Mar 2022 00:59:55 +0100
Date:   Sat, 5 Mar 2022 00:59:55 +0100
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
Message-ID: <YiKn+yJlaovkEGTR@lunn.ch>
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
 <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
 <YiIeEHMc+tWE0coi@lunn.ch>
 <CAOMZO5CioYoddT0kqtf+wOTvvxArm9ipW2bAj84qKM_eQgMcjg@mail.gmail.com>
 <YiIndfh0B87LRYnI@lunn.ch>
 <CAOMZO5BOREQcH9e5oL=QQsH2VsijQTPPA=pEX0KCjjnveaVppg@mail.gmail.com>
 <CAOMZO5D_875KnWVK+P+-D8zOQyCTzwKDfoXbZWfi01fSKRSSew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5D_875KnWVK+P+-D8zOQyCTzwKDfoXbZWfi01fSKRSSew@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 04, 2022 at 03:01:28PM -0300, Fabio Estevam wrote:
> On Fri, Mar 4, 2022 at 12:57 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > On Fri, Mar 4, 2022 at 11:51 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > But why does it return ENODEV? It seems to me, ignoring it is papering
> > > over the cracks. Why cannot we access to the PHY?
> >
> > The -ENODEV is returned by usb_control_msg():
> >
> > __smsc95xx_read_reg: -19
> >          usbnet_read_cmd: -19
> >               usb_control_msg: -19
> 
> I added a WARN_ON() inside usb_control_msg() that triggers when
> usb_control_msg() returns -ENODEV.

https://elixir.bootlin.com/linux/v5.17-rc6/source/include/linux/usb.h#L1126

say:

 * @disconnect: Called when the interface is no longer accessible, usually
 *	because its device has been (or is being) disconnected or the
 *	driver module is being unloaded.

So i guess the USB core has disconnected the device, and is blocking
further control messages. I guess it handles shutdown the same as hot
unplug. So there are a couple things that can be done to make this
better.

Make __smsc95xx_phy_wait_not_busy(), __smsc95xx_mdio_read() and
__smsc95xx_mdio_write() not print a message on -ENODEV. I would
continue printing the warning for other error codes. The phylib and
phy drivers should be O.K. if they get -ENODEV.

Non-USB Ethernet drivers follow one of two patterns:

1) The PHY is connected in probe, started in open, stopped in close,
   and disconnected in remove.

2) The PHY is both connected and started in open, and stopped and
   disconnected in close.

Depending on what userspace you are using, i think it is normal for
userspace to ifdown interfaces during shutdown. So if you make use of
2) the PHY should be disconnected by the time the USB subsystem calls
the USB disconnect callback. However, for hot unplug, there will not
be an ifdown, so the disconnect callback needs to look at state
information and stop and disconnect the PHY if it is currently
connected and started.

	Andrew
