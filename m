Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EAC4270B07
	for <lists+linux-usb@lfdr.de>; Sat, 19 Sep 2020 07:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgISF7p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Sep 2020 01:59:45 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:52863 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726054AbgISF7o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Sep 2020 01:59:44 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id B95769EF;
        Sat, 19 Sep 2020 01:59:43 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sat, 19 Sep 2020 01:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=KpwAQqu9rVzwclCBareEUxPEJ9ZL5tM
        EWD8m/APp4As=; b=nQvlEB+Ing/zEY4M+iWIoMTnQNezP+h6x+W5s5HVusts3IG
        ytKkVaZGSeNn8FUYp2cI7FAMqgJN8SAB2NQFVE6kigEYE5bF68EqIlF5zkKvyp+O
        Pb5FPih08eZlvdYSKWJVI5HN/SUUeklKUzXy2ltOhVzsBTkq3TMq7KNELOmLo0cn
        Te60FaJsYom4kLel/07kf2PAuHKcTYG6gadt9ZRd0fSiFYXMjclrHl01qULkVf/J
        IQTU018RskDt/niowNH+KUohbcaKLPjf47LYqmvilMHkOOJKxgwMgDPKhbHkfpOu
        qjE915j0/UvFb2oI8jzUvlkaRXVGRXm0LWocRuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KpwAQq
        u9rVzwclCBareEUxPEJ9ZL5tMEWD8m/APp4As=; b=qxW9nTulbiN0rO+D+uXpTQ
        irybOUVwqW6XxszDySQEezKz8wQZJzY5viCkYNl0HtupT8q8/Pk3ifI8HCpkvx/n
        v2ZBeFfGC8KZch97zKGJqjs6y4KWeW+orqifEpx70uCmbSqnHQ+08DOY2A2wSmqY
        kJvoMOGrXW1b9q5yGmLFjcasslHi2f9di7FMkkb4oYdtzuzwI21sPlc24LUgm5eM
        YAlNtMfGHoA0j3ROq8EYQCZPNq9Ut2FAvH1oLwlfrUH6tcFQQKvybJeDrN9HZPLc
        Yt+MKgj+L6xfZ16Y/94IxKCsM64dbYCVC6ZfKw3428ZNwsMVaATBDrugEoxz0EjQ
        ==
X-ME-Sender: <xms:Tp5lXx3slfllNrNYfEETZi-Vt1dVhfTSCD39_AefSQWgpfjHxqDt8g>
    <xme:Tp5lX4GyqQ89yDV97cURZuwx24s-9h4xg9xfbtZ3PeaFPslsdRqBNF1eZBleTrPhH
    2y_vs1wRRo6vjS5_lY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdejgddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhs
    qeenucggtffrrghtthgvrhhnpeevgefhveevteetfeetkeejjeehudffffffhfeuffelhf
    euffdufeduleejfeeugfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:Tp5lXx4_7YWk2qesY__G_oirToV9pb-Xw6MHDRmlBjXAYH74TW14jw>
    <xmx:Tp5lX-0_RKXkP8r8hVb_Pf-E1wP7-fMGBJL5eYihMGafBv_ptR7HhQ>
    <xmx:Tp5lX0HqPWA2vicb7wqw2o2CQaPe6Hfu3q5XUUxORZkUQOTayq6CLw>
    <xmx:T55lX3xUJ8bBkYXnR-llpVmO6Rj3lZWiPYXsM2oe9a_8wp1f1KVzLg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4B4BA660069; Sat, 19 Sep 2020 01:59:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-325-g8593b62-fm-20200916.004-g0f995879-bis
Mime-Version: 1.0
Message-Id: <0aa35d4b-50f0-41e3-b12d-c59b1263a5cf@www.fastmail.com>
In-Reply-To: <AM6PR04MB5413A79BF32C07041B1B7B70F13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
 <AM6PR04MB541315E1AF4DB7DEF9F3D2BBF13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <63692cc0-4df0-41d7-8889-a83eca7fd806@www.fastmail.com>
 <AM6PR04MB5413A79BF32C07041B1B7B70F13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
Date:   Sat, 19 Sep 2020 00:59:22 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Ran Wang" <ran.wang_1@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Enabling Device DWC3 Device Mode
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello list and Ran, I've some more observations. Firstly, I have to set the dwc3
mode to peripheral directly. Checking the code I was unable to find what actually
allows you to select the mode if specifying OTG.

I have devices in /sys/class/udc and they function properly via configfs when
plugged into a USB2 only port. If I plug them into a superspeed port I get
nothing in dmesg on the host side. At first, I did get a response on the host, in
the form of:

[591550.770819] usb 1-1.2: new full-speed USB device number 76 using xhci_hcd
[591550.870962] usb 1-1.2: device descriptor read/64, error -32
[591551.078865] usb 1-1.2: device descriptor read/64, error -32
[591551.286875] usb 1-1.2: new full-speed USB device number 77 using xhci_hcd
[591551.386873] usb 1-1.2: device descriptor read/64, error -32
[591551.594859] usb 1-1.2: device descriptor read/64, error -32
[591551.703160] usb 1-1-port2: attempt power cycle

However now I get no driver activity when binding the UDC in configfs or
loading or unloading the respective modules. Kernel is 5.7.15 w/ patches.

It doesn't seem like a fried the port or tripped a polyfuse, the port still works
after attempting USB3 device mode.

On Thu, Sep 17, 2020, at 10:42 PM, Ran Wang wrote:
> Hi Sid,
> 
> > -----Original Message-----
> > From: Sid Spry <sid@aeam.us>
> > Sent: Friday, September 18, 2020 11:08 AM
> > To: Ran Wang <ran.wang_1@nxp.com>
> > Cc: linux-usb@vger.kernel.org
> > Subject: Re: Enabling Device DWC3 Device Mode
> > 
> > Thanks Ran. I took a look at the document, if you or anyone else can weigh in
> > I'd appreciate it. The platform devices seem to be active, see below.
>
> So you want to use 'otg' or 'preripheral'? The SW flows is a little bit 
> different (in dwc3/core.c)
> If you want otg, I guess module solution would not be good. But I have 
> no idea how to enable
> mass storage gadget in build-in way, to be honest. So you could try 
> ethernet gadget which
> doesn't require passing parameters, it works on my part.
> 
> > Starting at line 767. It's a lot sparser, but the dr_mode is there. I feel I should
> > note that despite the lack of devices in /sys/class/udc I have nodes in
> > /sys/bus/platform/drivers/dwc3:
> > 
> > # ls /sys/bus/platform/drivers/dwc3
> > bind  fe800000.usb  fe900000.usb  module  uevent  unbind
> > 
> > > One of the example in DTS is
> > > arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
> > > and arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts, and you need to
> > > manually update it by following above doc to enable device mode.
> > >
> > 
> > The document linked is relevant beginning page 445. The above dts settings
> > seem appropriate and I have the necessary kernel configuration enabled. Any
> > relevant drivers are modules.
> > 
> > I'm not really sure how to diagnose it from here. Any help is appreciated.
> 
> Parsing property 'dr_mode' is the key to control driver logic path.
> 
> I think you could begin with drivers/usb/dwc3/core.c, see what happen 
> in dwc3_core_init_mode()
> which handling role switching (host/peripheral/otg) in calling 
> dwc3_probe()
> if you have made sure all kernel configuration had been done correctly, 
> such as (ethernet gadget):
> CONFIG_USB_DWC3=y
> CONFIG_USB_DWC3_DUAL_ROLE=y
> CONFIG_USB_GADGET=y
> CONFIG_USB_CONFIGFS=y
> CONFIG_USB_ETH=y
> 
> With dr_mode=peripheral (or otg), it should work (if above dwc3_probe() 
> encountered no error).
> 

I will pursue this in more detail so I don't need to reboot to change dwc3 mode
but didn't find any relevant code path for otg -> device from userspace. I'll try
debugging later.

Sid.
