Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A9B27B396
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 19:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgI1Rtl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 13:49:41 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60777 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbgI1Rtl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 13:49:41 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 5BAF8E0B;
        Mon, 28 Sep 2020 13:49:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 28 Sep 2020 13:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=K95a35zUOzXPWOHXmL6CrTvKBCo
        fYdnFeqjm0WTkpg0=; b=LkTOdUQvTS2ARFYiDqVAtUvuIcoW4DcsC6ZmQAAhuvu
        urfkMTP6ao4qLLHF2JYcFgcqptv+fd3D0aRKf12Zpn7cbJMhQLWKiElnjdr/43W0
        N9PYe+igZlgiENuCoqw+G0KXuln7z5UPXNoNFhaLRcmV5h4AMeYiAubIB4EgShUf
        caDbUjwFUGeWygqFLTEhroxuGb5mXrDLwH23SXXXCXzkldJZmLEZKHWmnciexQUD
        VR1ncz/BsgL2XXrrNsbWYispNqdWPWW46GJgnqGqQdT/GGGGoHstrC8oSBxue1uS
        cv+ZmLwOPXO516zSMUXNrSF6xIXF7t7UhpWXTWOfmFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=K95a35
        zUOzXPWOHXmL6CrTvKBCofYdnFeqjm0WTkpg0=; b=nVk39BHai55/TWcjTBIpcO
        lR6/SWCtxdr2+VRj8yFt8GjAvJ71QPnT3ucHUjo98nagh5rhdxE9CAJdEJMyZX0d
        sp8p1vm1wKj+Qv6H0dwTYqUCP9451HudtRkFrP0MGPqcuN5qwvgOHX2sE8yAWSI7
        SRl9is/wbXI2jf3JmlB7WW6SNHP+7diMLNQX56drzik0uzyL2qLedTBoWJ8CfrFq
        ciPf6KTeyhSVJcgpaOg/57FHa5IejdX4x/mOet0h/ulh22uUrK5ZoY8Fg7FtSjG4
        ANVx3o3Slc2wvYzSHmsYSkxp7zweZEchvGwcYHdBmgF2CeQIT49Ypz0MJez6Jn/Q
        ==
X-ME-Sender: <xms:MyJyX43vBEKeJQCvMNWk4YWZlb2fITnv8zjQtOcX1OZn36FxpXTnsg>
    <xme:MyJyXzHJRO-oHY2_KN_MgYcxQpek4mEqN92VqvmLkBglsDV0o_U5f_c4XCdJaVMRw
    ncLcsf4LcjWxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeigdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveegheekge
    eiffevheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:MyJyXw4ImJs4rVDbaHOElGKAjskX_byJVvB8jQc-RGm7bShFt3EMdQ>
    <xmx:MyJyXx1uw6xp8_V7d6Xxy21bRM7JsteivgAiMd68g2cOW2w0TtXuww>
    <xmx:MyJyX7G0Iwm9qDpp8EQnPgf1UDcFpU0xiXh4qIY8oAqeEQ61jLBXdg>
    <xmx:NCJyXyyRrINkcCuIUA_W-FPMTKqb1O0L4wdWDw-ajrVuviZulXn8NA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 74CA6328005E;
        Mon, 28 Sep 2020 13:49:39 -0400 (EDT)
Date:   Mon, 28 Sep 2020 19:49:44 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 209411] New: When retrieving string descriptor from mobile
 device returns eproto error
Message-ID: <20200928174944.GB2172556@kroah.com>
References: <bug-209411-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-209411-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 27, 2020 at 05:51:20PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=209411
> 
>             Bug ID: 209411
>            Summary: When retrieving string descriptor from mobile device
>                     returns eproto error
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 4.19
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: rachithas104@gmail.com
>         Regression: No
> 
> I am trying to get get string descriptor from mobile phone,however when trying
> to retrieve one particular index it returns EPROTO,
> 
> dev->fd, USB_DIR_IN,USB_REQ_GET_DESCRIPTOR,DESCRIPT_STRING * 256 + index,       
>                                               languageid, sizeof buf, buf);
> 
> Return value is -1 for  ioctl(fd, USBDEVFS_CONTROL, &ioctl_ctrl);
> 
> kernel: [ 7084.327097] usb 1-1.2: reset high-speed USB device number 12 using
> ehci-pci
> kernel: [ 7084.831056] usb 1-1.2: device not accepting address 12, error -71
> kernel: [ 7085.119075] usb 1-1.2: reset high-speed USB device number 12 using
> ehci-pci
>  kernel: [ 7085.431054] usb 1-1.2: reset high-speed USB device number 12 using
> ehci-pci
> [ 7085.935069] usb 1-1.2: device not accepting address 12, error -71
> [ 7086.227132] usb 1-1.2: reset high-speed USB device number 12 using ehci-pci
> S[ 7087.321929] usb 1-1.2: usbfs: USBDEVFS_CONTROL failed cmd ctxusb rqt 128 rq
> 6 len 255 ret -71
>   kernel: [ 7087.607093] usb 1-1.2: reset high-speed USB device number 12 using
> ehci-pci
> 
> My URB request and without my program in picture request is same

Not all strings are readable from the device, are you sure that is a
valid string descriptor index to be requesting?


