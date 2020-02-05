Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 760CD1530B7
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 13:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbgBEM3Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 07:29:24 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:49273 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726810AbgBEM3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 07:29:24 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 661B9658;
        Wed,  5 Feb 2020 07:29:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 05 Feb 2020 07:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=33WMJLpGhJq3SKkRM5sz/RRyXUH
        pRDIq2N+iYcxaWyg=; b=T61Xpn/k/FpjDbtHxEacR/3nqHOsPv3Zbr86ohjG3YK
        7E+xqcp5BfjC3tftytfz+gQFcNLTmt7/utt017DCsgIi5gROkMwskl6BHdooktPI
        OVktICvSQiDZApe6lZr32fTQgbpuL1uaNXxkmcz9ALlHI8MqpBHHNrnQ7HvpDtPA
        mazhP2S2ONAX56nmlAQjEkdj9xuPkbkGPZKwT9xTK56KporTnOaekUpZ2OHQBoVv
        QIo5EWfpwmtByDMSyX5BBmjknzBJUhCwncMq2YjrgCI8or7Ecx/ntmZZAboMk56O
        QjlwuqHyvyGlggMW+B0XI89L3kJBaiwr8Hbb2kdL6mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=33WMJL
        pGhJq3SKkRM5sz/RRyXUHpRDIq2N+iYcxaWyg=; b=w0JWq3kVKuERyI5ns5YOXf
        vHk/T2HprC5skXevrJfuCToGXBeAjp6VqAMtGW9bIb8oezm7lizpwTLx2kyJ+9km
        nkAXAmiTJ2CbAkGX8AYg9IsYbrZWQrbgfyFm/FhFLYEqI5dkSu+P5cYF1cf3E1qz
        AhbLG5Fm7sPPk+FORi8KXl97sVOOkpJqGd3hwXhQ6+OFhoLwghdJQudWNuGbpuO+
        P4HHxeJMRNbk9E5wdxV9XQ/0pYTpL/0gb8InNvcqJcbcp0LCzvfJ76RmtswKZPji
        Mamlppy815vDm1SMM9+tifwdQ9EVpsjamb9ZM1WmVMMIANT/NWz/tuX3kgW6xEXg
        ==
X-ME-Sender: <xms:IrU6XntLBqf7HWqNtuYi0gR5Xx142d9xZTZnobzTX2RI0rGwz_R1dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrhedugdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvuddvrddukeejrddukedvrd
    duieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    ghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:IrU6Xs5J2EzW8doImx5Z5ZsyG5tiGJsGi2ktmSrTXcZyJQB4cpTHQw>
    <xmx:IrU6Xni4MH5YXIp65nPOslo5DLN8N1glq301rJq5SoMiTJGdk0BAKw>
    <xmx:IrU6XoIu3i7ndPMvADuGGHg2E7Cl-hEDagoZSG9uk1HvAQEYPa3-7Q>
    <xmx:I7U6XqblL7bck1eE_UgWH3umNB1guXUZBWpVAfiMK7SkiRFPB3tjDg>
Received: from localhost (unknown [212.187.182.165])
        by mail.messagingengine.com (Postfix) with ESMTPA id A87AC3060272;
        Wed,  5 Feb 2020 07:29:22 -0500 (EST)
Date:   Wed, 5 Feb 2020 12:29:21 +0000
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 206427] New: go7007 driver fails to handle interrupt
Message-ID: <20200205122921.GA1186249@kroah.com>
References: <bug-206427-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-206427-208809@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 05, 2020 at 12:24:50PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=206427
> 
>             Bug ID: 206427
>            Summary: go7007 driver fails to handle interrupt
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.3.18
>           Hardware: x86-64
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: josef.moellers@suse.com
>         Regression: No
> 
> Created attachment 287141
>   --> https://bugzilla.kernel.org/attachment.cgi?id=287141&action=edit
> Kernel trace shown when error is reported.
> 
> When connecting a Plextor ConvertX M402U video converter, a "BOGUS urb xfer" is
> reported and a Call Trace is dumped.
> I assume that the go7007 driver has not been fully supported in newer kernel
> versions as it definitely used to work in 2.x kernels!

Can you provide the full kernel log message here please?

And can you try the 5.5 kernel, 5.3.y is old and obsolete.

thanks,

greg k-h
