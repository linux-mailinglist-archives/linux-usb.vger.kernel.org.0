Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B90631517
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2019 21:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfEaTLh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 May 2019 15:11:37 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36779 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726807AbfEaTLg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 May 2019 15:11:36 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id C2BC921FE5;
        Fri, 31 May 2019 15:11:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 31 May 2019 15:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=fFrJ9WhhoB5tODw+08R+U4E9cLg
        kwCeuZ+ZWqNKkCvs=; b=npzV7/ZT0WA6+9DVGxaHacyjhJOlSYj/gN/lyDD7ANw
        2X1XEGQbtz8EQ1CO6idhZ24UiGZeuw1r5ho5CzjGVuj3BAeKrivb1n2LFskBjFZq
        lOsVmkDAfLwXl9SEII1ICFRemwSftOu923YMyqamNDABnJk7zDA72/L4R6JLlS8g
        TohpKz4y0bngKTq93mt0OJar20xdz4CnqWCo0b38ifjhnU3Y6hmVMqTQyEROr+bZ
        1r2Wx/eUq3o2nvUGSpdLrnmggHn2ly7b7nOSGjhoXiy7R3xuDV5e4ulyKmC5AHfA
        ySNwYGdS5bxjC63L+JIjcd9htDM+0l6kskFbV2W3Qlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fFrJ9W
        hhoB5tODw+08R+U4E9cLgkwCeuZ+ZWqNKkCvs=; b=NC4it6J8i3A0nIBrTOUl+0
        zjlvP508SQTSpHDpfSx2urwct5BdxGtsdbSF1SgQ9l/0ZXSyeCcAxRyBy3Dhk0he
        WdedMh8jbuOIh+EZCf9zmRf/ff6wCmGBVPKjc9j9UFWn5MmWiEs8y2c3dYdr16SY
        XrxQCa3ttuupIZlp1u/awpCjwasbgcP+9Hr8THy2uNF2rScSJar9P2RxkWlngNsY
        lP6RXh74Jn1myi8VXVs+SNZIViFTETJlAsO8Rs4ssMYYh2T2wIstW0hL3vxIEqNt
        sXhV41OlNv57N7iUu4gIpUL/e00CgHqjUUp6zoWC5K0T+0hosC6y1B22KTuAeLwg
        ==
X-ME-Sender: <xms:ZXzxXFZZ_P8SE6W1oItEcR1pJUMmOYfTvflVwQKnfbMNCokA4TA0OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefuddgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepieehrdduheekrdduke
    eirddvgedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtgho
    mhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ZXzxXApDIkdxfw_cfVurzmAWJZd1yUJc95luIiA0BVxRp8f8tWz8cQ>
    <xmx:ZXzxXC90tEz65O7-CaBnnevqyaB7DK1hB6LfY6ZMNOlhLrAIRTXG0g>
    <xmx:ZXzxXH-7irXhlR7SMDqHjPGxqW3QrdkTD_6yvHtu2eFX35KuN5u2fA>
    <xmx:ZXzxXOkLF_AAmNhq-EPbVRhF01tskfpZzF-AdU_N6Cqe22CPBdjruw>
Received: from localhost (unknown [65.158.186.241])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9EE8A380087;
        Fri, 31 May 2019 15:11:32 -0400 (EDT)
Date:   Fri, 31 May 2019 12:11:28 -0700
From:   Greg KH <greg@kroah.com>
To:     Geoff Winkless <geoff@defgeoff.co.uk>
Cc:     Linux-USB <linux-usb@vger.kernel.org>
Subject: Re: ehci support on old VIA vt82xxx disappeared around kernel 3.8.
Message-ID: <20190531191128.GA25230@kroah.com>
References: <CAEzk6fe0+LHFbZgN4t8_NVS_fysj7wHFGerMB1fhoHmXsCogVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEzk6fe0+LHFbZgN4t8_NVS_fysj7wHFGerMB1fhoHmXsCogVw@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 31, 2019 at 05:40:23PM +0100, Geoff Winkless wrote:
> Hi
> 
> Apologies if this is the incorrect place to post this, if so please
> feel free to call me names and then suggest somewhere more appropriate
> :)
> 
> We have an embedded device on an old EPIA Mini-ITX board that runs
> Linux 2.6. There are features in more recent (>3.10) kernels that
> would be useful to us, so I tried to build them for it; however while
> the kernel runs perfectly fine, ehci support simply fails, which is
> catastrophic for the device's use - we need USB2 speeds.
> 
> I worked backwards and found that it runs normally on 3.7.9, but on
> 3.7.10 it starts throwing up errors:
> 
> usb 1-5: new high-speed USB device number 3 using ehci_hcd
> usb 1-5: device descriptor read/8, error -110
> usb 1-5: device descriptor read/8, error -110
> usb 1-5: new high-speed USB device number 4 using ehci_hcd
> usb 1-5: device not accepting address 4, error -110
> usb 1-5: new high-speed USB device number 5 using ehci_hcd
> 
> By 3.8.0 ehci simply doesn't work, as if someone decided these errors
> were too hard to deal with and just disabled the device support.
> 
> Chipset is VIA vt82xxx; the ID of the offending bus is 1106:3104
> 
> I tried every combination of loading ehci before and after etc,
> setting the old_scheme_first value, disabling acpi/apm, basically
> anything I could find on the web that seems related to ehci problems,
> but nothing seems to make the ehci driver even recognise the device.
> 
> /proc/bus/pci/devices shows
> 
> 0000 11063123 0  e6000008        0   0   0    0 0     0  400000
> 0 0 0  0 0     0 agpgart-via
> 0008 1106b091 0         0        0   0   0    0 0     0       0
> 0 0 0  0 0     0
> 0080 11063038 c         0        0   0   0 d001 0     0       0
> 0 0 0 20 0     0 uhci_hcd
> 0081 11063038 c         0        0   0   0 d401 0     0       0
> 0 0 0 20 0     0 uhci_hcd
> 0082 11063038 5         0        0   0   0 d801 0     0       0
> 0 0 0 20 0     0 uhci_hcd
> 0083 11063104 9  e6400000        0   0   0    0 0     0     100
> 0 0 0  0 0     0
> 0088 11063177 0         0        0   0   0    0 0     0       0
> 0 0 0  0 0     0
> 0089 11060571 0       1f0      3f6 170 376 dc01 0     0       8
> 0 8 0 10 0     0 VIA_IDE
> 008d 11063059 5      e001        0   0   0    0 0     0     100
> 0 0 0  0 0     0 snd_via82xx
> 0090 11063065 c      e801 e6401000   0   0    0 0     0     100
> 100 0 0  0 0     0 via-rhine
> 0100 11063122 c  e0000008 e4000000   0   0    0 0 c0002 4000000
> 1000000 0 0  0 0 20000
> 
> (apologies for the long lines, I cut down the spacing as much as I could).
> 
> So you can see that the 11063104 line doesn't even have the ehci-hcd
> driver associated; on earlier kernel versions the line reads
> 
> 0083 11063104 9  e6400000 0 0 0 0 0 0 100 0 0 0 0 0 0 ehci_hcd
> 
> Output from lsmod, just in case you're thinking I just haven't
> inserted the ehci driver...
> 
> usbnet 10726 0 - Live 0xcfb4f000
> ohci_hcd 15520 0 - Live 0xcfad9000
> uhci_hcd 15679 0 - Live 0xcfa94000
> ehci_hcd 30853 0 - Live 0xcfa49000
> pl2303 6016 0 - Live 0xcf979000
> ftdi_sio 25410 0 - Live 0xcf940000
> option 18882 0 - Live 0xcf8e7000
> usb_wwan 4082 1 option, Live 0xcf8a2000
> 
> I'm happy to dig for myself - I appreciate this is a fairly niche
> problem; I have getting on for 30 years' development experience in
> various platforms, including low-level hardware access in assembly
> when I was young, but all I've ever done with the kernel is modify in
> a very small way a few device drivers and I don't even know where to
> start with this so could do with some pointers.
> 
> I tried running a diff on drivers/usb between 3.7.9 and 3.7.10, but
> other than a few changes around usbserial there doesn't seem to be
> much, which seems odd given that the behaviour clearly changed. The
> 3.7.10 changelog only lists some usb-audio changes, a change for
> memory allocation for some urb blocks, and some fixes for usb-serial,
> so I guess something else changing has modified the way the USB core
> interacts with the hardware.

Can you run 'git bisect' to determine the exact commit that caused this
problem?  That would be most helpful.

> Did we intentionally simply drop support for this chipset in 3.8?

That kernel was released in 2013, that's a long time ago to try to
remember something as specific as that :(

greg k-h
