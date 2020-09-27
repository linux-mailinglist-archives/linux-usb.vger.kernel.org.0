Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66874279DB5
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 05:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgI0DXb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 23:23:31 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51145 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726478AbgI0DXb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 23:23:31 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 8AB2C5C00C1;
        Sat, 26 Sep 2020 23:23:29 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sat, 26 Sep 2020 23:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=DeVDL/kOm49g8T3SPRG0WslljJ8t17w
        k+TsKwgHs264=; b=nSPmMq7+Qqy5Go6/vZ472HkjgUC7mlIUogXAVdt+vcb1lxi
        ix+8H6/Zmyb53ncyGdeUP/7YP9zatbZrGP8UBt6HtN6RAeT3JQHI975gbUyrwrSA
        rVUVZQddq4gNSvPR0BZvnN/IbppnglIr/BmMsFOjMZqtHsZy/7Scdn9TLqZztEt5
        Zq0ToAgbiYpK54RgEGdkVOXmhMA4f1J3og0Szfr1jiqTs7nvItQqM5rXLa8Zy+hg
        slkey4p8M0cvcPs2M2HVgzC6zwK3KxkxXcAPzvWcIUJ7Yn3x6sv2PWObwVwESMlh
        banPTuhyFU6RiyjkAyr505ysKblDobk++zT9oTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DeVDL/
        kOm49g8T3SPRG0WslljJ8t17wk+TsKwgHs264=; b=iVrdzGICkENaP/BG18ffC1
        47PPlaC+78YqupqbL7I/Sny5/H5z2FuYhUBYREfCT2LY8cIsHobEU4Cxf8HjtPvb
        39RDQGRd2tJnM7gh4drqvmI7jlR+mL8ixHnxseH7kp2yZi/tm8m9qzBeUMFLNBz8
        njtkh1vOSShmSfZ15O1vggcmfXv4aYrQ+4KYKQBQN0W2Ow/WnfRu59A8o3iqaon8
        W3h3eNiHcRkTMIrUQrKkUXCYl0nnEe5ghkHKY3SfDh6zedLmHIH0pdJC3/eC3NxZ
        o5VonG64feKXJr8TC3qnzqIdneaDNVQXqmsnWMPh14wUc5kw9dloD5Hb8fwP0vMQ
        ==
X-ME-Sender: <xms:sAVwXw9gJt5JEUjEB0tbI-VoUVmKH4IIN8_ximU32XbRcXBI4yGvRw>
    <xme:sAVwX4t8builx8S_hi8m4fEIX5Ql5q6UrQMowPddJnNSq2yWrTCyNr1Y_Wipi3osy
    jXBV3I8z4BUBAtmzV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
    dtreertdenucfhrhhomhepfdfuihguucfuphhrhidfuceoshhiugesrggvrghmrdhusheq
    necuggftrfgrthhtvghrnhepveeghfevveetteefteekjeejhedufffffffhuefflefhue
    ffudefudeljeefuefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:sAVwX2BBdIx4UNBTwP9Rm2EZs6JhIVwK_XMh56ZXJ-4LK3ECcUj1oA>
    <xmx:sAVwXweCnwn1_Q955Y98fmM-qiWf24BS5dSbVu37eq4ezvuttDHARA>
    <xmx:sAVwX1NrdJTzibPiyCkFBegnj4eKOQIwJZx_osDn0QGP4DBZ61e6Pg>
    <xmx:sQVwX8aVc1rt5dckSsOkU7q_ZzK8hc3wVOML5Xlg-tJJ4sd2f1XTDQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AD8E1660069; Sat, 26 Sep 2020 23:23:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-355-g3ece53b-fm-20200922.004-g3ece53b9
Mime-Version: 1.0
Message-Id: <37409492-9881-4cd2-a4d3-a0e3bea91c36@www.fastmail.com>
In-Reply-To: <AM6PR04MB5413410663D6DA1551718833F13A0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
 <AM6PR04MB541315E1AF4DB7DEF9F3D2BBF13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <63692cc0-4df0-41d7-8889-a83eca7fd806@www.fastmail.com>
 <AM6PR04MB5413A79BF32C07041B1B7B70F13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <0aa35d4b-50f0-41e3-b12d-c59b1263a5cf@www.fastmail.com>
 <AM6PR04MB5413410663D6DA1551718833F13A0@AM6PR04MB5413.eurprd04.prod.outlook.com>
Date:   Sat, 26 Sep 2020 22:23:07 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Ran Wang" <ran.wang_1@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Enabling Device DWC3 Device Mode
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello list and Ran,

Well, the error I saw in dmesg about an unassignable address is something
I had only seen one other time when a device was miswired. I flipped the
USB-C connector over and it started working in USB3 ports, but at USB2
speeds. I thought of this days ago but figured the port should be handling it...

On Windows the system reports a bad setup, so I think my SS descriptors
are malformed. I'm using functionfs. I'll start a separate thread on this. On
Linux the device connects as USB2 instead of reporting an error.

If I use the NCM/ECM configfs driver debugging tools in Windows show me
that the port is superspeed capable though registered as HS. Patches hit the
list to fix this only a few days ago. Hooray!

It seems I may be able to select device mode by writing to nodes in
/sys/class/typec/port0. But I am still not sure.

On Sun, Sep 20, 2020, at 8:20 PM, Ran Wang wrote:
> Hi Sid,
> 
> > -----Original Message-----
> > From: Sid Spry <sid@aeam.us>
> > Sent: Saturday, September 19, 2020 1:59 PM
> > To: Ran Wang <ran.wang_1@nxp.com>
> > Cc: linux-usb@vger.kernel.org
> > Subject: Re: Enabling Device DWC3 Device Mode
> > 
> > Hello list and Ran, I've some more observations. Firstly, I have to set the dwc3
> > mode to peripheral directly. Checking the code I was unable to find what
> > actually allows you to select the mode if specifying OTG.
> 
> Yeah, I also think debugging on peripheral firstly would be easier than OTG.
> 
> > I have devices in /sys/class/udc and they function properly via configfs when
> > plugged into a USB2 only port. If I plug them into a superspeed port I get
> > nothing in dmesg on the host side. At first, I did get a response on the host, in
> > the form of:
> 
> So the gadget registration for DWC3 UDC encountered no error, right?
> dwc3_core_init_mode()->dwc3_gadget_init()->usb_add_gadget_udc() return 0?
> If yes, it looks like SoC internal configuring has no big issue, I think.
> 
> > [591550.770819] usb 1-1.2: new full-speed USB device number 76 using
> > xhci_hcd [591550.870962] usb 1-1.2: device descriptor read/64, error -32
> > [591551.078865] usb 1-1.2: device descriptor read/64, error -32
> > [591551.286875] usb 1-1.2: new full-speed USB device number 77 using
> > xhci_hcd [591551.386873] usb 1-1.2: device descriptor read/64, error -32
> > [591551.594859] usb 1-1.2: device descriptor read/64, error -32
> > [591551.703160] usb 1-1-port2: attempt power cycle
> 
> For the speed issue (expect SS but got FS), you could try adding below 
> property to dwc3 node,
> On our platform this is necessary (see dwc3_gadget_set_speed()):
> 
> maximum-speed = "super-speed";
> 

For anyone following along I did implement this. It may be necessary. I will
see later.

> If the get descriptor read issue still happen with above change, maybe 
> you need to check PHY status,
> or using protocol-analyzer to see what happen on bus.
> 
> > However now I get no driver activity when binding the UDC in configfs or
> > loading or unloading the respective modules. Kernel is 5.7.15 w/ patches.
> > 
> > It doesn't seem like a fried the port or tripped a polyfuse, the port still works
> > after attempting USB3 device mode.
> 
> How about dr_mode="host"? Does it work? I think it would help to verify 
> your HW is good to go (such as PHY at least).
> 

It seems to work, the issue is that the hardware isn't handling the reversible
connector properly.

Cheers.
