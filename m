Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599E063B149
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 19:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbiK1S2u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 13:28:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbiK1S20 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 13:28:26 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A743D43860
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 10:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EcTsyY5wYaEmYhstRn22iKqGEcQ2Uhxgr/x9oVxDjzQ=; b=QWas5Hyq/FsqshICJsE4BTxuMU
        2Gvgymy9jP1S1lOBlf/NEXrMj+Erxde2SJDasHngPLWwj64lThI2OXf4uZBES03llX4CViIs+UwJ4
        GhwL/8sp5KXJpqD6Xm1Pf2RfA+MVdvQvTCtqNSjFWI9ysgNeb+yvJS3w/wgP5YH405fepINmP/Meh
        RIiWmXKehTNVSZb/gPpAQv/H/wDXLJuAzUYpd5Yv4iGHXe/RlqhozixCv0dm8sSlnVCKmpKTRgh2D
        Z7eXRI3rxBiZ4kfjmhuriCiWmLgoYS/YDjzjcAqjtWcclUj+Te6tpUblqe6zoa+MIxOsRTsoqzoXY
        Eongci+A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35460)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ozikF-0008O9-8X; Mon, 28 Nov 2022 18:20:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ozikD-0000mJ-49; Mon, 28 Nov 2022 18:20:41 +0000
Date:   Mon, 28 Nov 2022 18:20:41 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Alex Henrie <alexh@vpitech.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        alexhenrie24@gmail.com, Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
Message-ID: <Y4T7+am39O2XNLZZ@shell.armlinux.org.uk>
References: <20221126035825.6991-1-alexh@vpitech.com>
 <Y4TItxxwSNy7OnMA@hovoldconsulting.com>
 <3642317.iIbC2pHGDl@demeter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3642317.iIbC2pHGDl@demeter>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 28, 2022 at 11:08:25AM -0700, Alex Henrie wrote:
> On Monday, November 28, 2022 7:41:59 AM MST Johan Hovold wrote:
> > On Fri, Nov 25, 2022 at 08:58:25PM -0700, Alex Henrie wrote:
> > > When a baud rate of 0 is requested, both the 8250 driver and the FTDI
> > > driver reset the baud rate to the default of 9600 (see the comment above
> > > the uart_get_baud_rate function). Some old versions of the NXP blhost
> > > utility depend on this behavior.
> > 
> > What exactly do you mean by "depend on" here? Setting B0 is supposed to
> > hang up a modem connection by deasserting the modem control lines, but
> > there's nothing mandating any particular line speed to be set in
> > hardware. Why would that even matter?
> > 
> > If the user space tool is thrown off by the fact that B0 isn't
> > implemented, perhaps that's what should be addressed.
> 
> Oh, it's definitely a bug in blhost. The program sets the baud rate to 0, then 
> tries to communicate over the UART assuming that the baud rate is 9600. It's 
> been fixed in the latest version of blhost, but I'm stuck on an old version and 
> there's nothing I can do about that.
> 
> I don't know why the 8250 and FTDI drivers map B0 to B9600, however it's very 
> old behavior that must have had a purpose. Maybe Russell knows?

What exactly do you think should be done when a baud rate of zero is
requested?

The fact of the matter is that at hardware level, the UART takes a
clock, and divides that down. To get to a baud rate of zero, one
would need an infinitely large divisor, which (a) is impossible to
program into the hardware and (b) would trigger a divide-by-zero
error in the kernel. So, we have to choose something.

That decision was made before my time, when Ted Ts'o was maintaining
what was the original serial.c 8250-based driver, and the behaviour
he adopted was to set a baud rate of 9600 when B0 was requested,
which is reasonable - 9600 baud is the default setting.

POSIX (which is what we use to define the behaviour of the TTY layer,
or at least what we _used_ to) doesn't specify the behaviour of B0
as the output rate, other than it shall cause the model control lines
to be deasserted. What baud rate you get on the line is unspecified,
and thus left up to the implementation.

So basically, 9600 baud for B0 is the behaviour of the 8250 driver
going back to the very early Linux versions and that has become the
standard Linux implementation shared by a great many serial drivers.
In effect, it's almost a de-facto standard.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
