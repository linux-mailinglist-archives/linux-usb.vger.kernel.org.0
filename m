Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C661B301A7C
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jan 2021 09:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbhAXIP6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jan 2021 03:15:58 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36203 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726551AbhAXIP1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jan 2021 03:15:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 3A133CB4;
        Sun, 24 Jan 2021 03:14:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 24 Jan 2021 03:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=Ku8zBaTMjNK7m3gXD+e3f56Hm66
        AYnfWb8o3mq0cm90=; b=CysJUSGeyPxXHST1QpLRXY7MAaDcbPMIUCP4dlNJDUy
        7RO+670rcbw08Hkx1sjtJFrdN/v7IvBPwAtYKskqXWyQfYikDVPZSaGgV/YRpHTD
        +1BkkdTmv17uj93KOLHAhI4piU4JlU3AQRjcxfs+d6gt6ooNBhpAenolTMLZQKx8
        8Hvpa/eJsbMA82vUVAmZw1Vp5eJpNFvevnYWD1HNHeL9ZBUoS4mxORNL/zX2NAFt
        YX9+BKhbp0So5zqjjKeWp7vs4ziQ9kdR3wauU+PEY76PYXU2C2WvKiXRtK+LWbbs
        Zav+YsiAmMACOR80A/RKzc35jE8pPjnpH2Xrq7lJRsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ku8zBa
        TMjNK7m3gXD+e3f56Hm66AYnfWb8o3mq0cm90=; b=ScZfTxXrfL0ZtAdV9jEFvt
        hZiYOWmFzbUupg36Z6D/GZxTzK/XPt6JfkEveaOhKDVpuMdmo7WrR/eWJ8VVU60s
        1YrqTOOyBjuInW85Ti82wY+wkYPXLqNkUHamMGIsVKqrmg/vPKkmm6JtdkwPjHIs
        xVnEQGz7/4zq3fCKJf2E4BNdDcabtRwBLoeA6EiosJAywckpvfKwvUwtXQYZ3aV4
        w1yFKb6U1/Iopv5YNkWF79yNHYThi6PP4cGOfhUhDJzZU5raZilaCXrlunrjE3cD
        yj86HhSdMqTeEtI34TP+Ki18i8nCddWi2HPNsuf3SrLt+OCxYnoRi9mkmroXyvSA
        ==
X-ME-Sender: <xms:VSwNYFhBVoahOTMxPbEHKLEZ-0VwNKL14yjC1SmNs1RswcoZ3L4lEQ>
    <xme:VSwNYKD-hIYIcDI5qGkRnBOhdEMgGFSBp2vbJWHtp7HFbNt1g7A4rDJkj__QUnu3c
    ZhBF3Qj3pvizg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveegheekge
    eiffevheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:VSwNYFGCRDZWMSrVl5S6NTDdWNrrsHBnMVHzDftD_oS5MzFfhdrbmA>
    <xmx:VSwNYKSuz01kLGZ4C7Ff7L5LTkoOzKQpCuJXfOl4fe0bYKCBkr66iQ>
    <xmx:VSwNYCx4yCv2QjFgkUNwv2fVxuKsmJcsGfF1HIOW9h-BiGx3gtIpjg>
    <xmx:VSwNYHtlLo5rOb9bZQhr07kgaaqgEP5YIhQ3PLQabLfgjy1kMrC6kg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 46A171080059;
        Sun, 24 Jan 2021 03:14:13 -0500 (EST)
Date:   Sun, 24 Jan 2021 09:14:11 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 211325] New: usbhid.mousepoll kernel cmd option not working
Message-ID: <YA0sU+5gxO7oTy45@kroah.com>
References: <bug-211325-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-211325-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 24, 2021 at 04:35:13AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=211325
> 
>             Bug ID: 211325
>            Summary: usbhid.mousepoll kernel cmd option not working
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.11-rc3
>           Hardware: ARM
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: low
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: mathias.steiger@gmail.com
>         Regression: No
> 
> It doesn't matter what value I use, it is treated as if unset (i.e. "0").

Please email the linux-input@vger.kernel.org list about this.
