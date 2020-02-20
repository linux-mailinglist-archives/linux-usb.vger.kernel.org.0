Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A5D165860
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 08:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgBTH1y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 02:27:54 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:36847 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726766AbgBTH1x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 02:27:53 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id B1D3564D;
        Thu, 20 Feb 2020 02:27:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 20 Feb 2020 02:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=P
        9nTo82GvmMPWkvzvqjGoqf17+pTxb4/Zx9dv9FMaQU=; b=FEKQfhlF8dg9BSLmb
        3Zr/HstFmWedtfhMzUCCRFlfjt8Ghd8+FSDHzBXmZ1GnA0ro2NNgG3VX1j7A9A/w
        PKCH74qiD80zmI9O6i/AVTIL8fRGQ4Uw7TVKYL0QoSLJ0xLwSnf2HgHSxj4Y4HhX
        hp5IcwrgR+QuUE/eWP6lAqI1g1XswrJ7Kxn7Zr+ZOsCGqDkBbNXS46SAJ69TXLAE
        oBdCmjeB+qJYEc3M0rE4dpts99GLsb2RqIN0G49B6WyT6iliNAQrqOCkZVoWaeoI
        pqY5G9pR6UvBu9UfB+9PYqsmUSv8MbhBvY1SaqrM3PaQv3GCC6f27uzU0/EywzeB
        /iPqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=P9nTo82GvmMPWkvzvqjGoqf17+pTxb4/Zx9dv9FMa
        QU=; b=X6/gN7uiicsiRF2U7qD9+2ez5onV8UFw8J3mBfFu87bKYGZIr5NVsYu7T
        Yohz5gT8flrpxcDCfUheGLE9p8BqGez45crwtGOErxDHd7qXkvOGMHOYDgilIN9x
        7n3uE1HcoXnaDwbeMlW6wbQs58U+nN9U3vA5d5rRp5SkYoWVeuQifiaD75RtujnM
        McMBt94ywT0PeoAtEpdC+hU1U+mWo2j8Q0y8XyCViAxy/056qc/pMwSvP78m40mT
        Y9AVKK3rfBsg3b+CLs0f0ofTctvBAPaAbrpN2wstsZlD9FRaltK21aeJrWpLiXnY
        cYFtQ30A4v4orzARCSHYqkLuZShjA==
X-ME-Sender: <xms:-DROXivbqG03biipcm3KyjS3zLBXIXtol6HIPpZOaj22tg8nLY6ZGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedugddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggugfgjsehtke
    ertddttddunecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucffohhmrghinheprghsrhhotghkrdgtohhmnecukfhppeekfedrkeeirdekledrud
    dtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
    rhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:-DROXrvollz2aU9M6sGHppcOM09bvMB7QvbKh3O5qr0M54jgdtsngw>
    <xmx:-DROXowGaHnTU3gZcL2yETE2fUeZ73f5bOcVo3y1yz-t2vDoiwiOXA>
    <xmx:-DROXhibO6cysGQSopdFkR2ZP2aselz0Ja1LIE1UvkMDyeQFrktMuA>
    <xmx:-DROXl4TwEaenWDVvVpwm6OIu12iMTlCfunM43FQYYVc5fpfcATerg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id C3AB93280062;
        Thu, 20 Feb 2020 02:27:51 -0500 (EST)
Date:   Thu, 20 Feb 2020 08:27:45 +0100
From:   Greg KH <greg@kroah.com>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB questions
Message-ID: <20200220072745.GA3240818@kroah.com>
References: <eaab70b2-e95f-0ea8-bddc-995c1bde3b5d@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eaab70b2-e95f-0ea8-bddc-995c1bde3b5d@lockie.ca>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 19, 2020 at 04:55:28PM -0500, James wrote:
> https://asrock.com/MB/AMD/B450M%20Pro4/index.us.asp#Specification
> - 2 x USB 2.0 Ports (Supports ESD Protection)
> - 1 x USB 3.1 Gen2 Type-A Port (10 Gb/s) (Supports ESD Protection)
> - 1 x USB 3.1 Gen2 Type-C Port (10 Gb/s) (Supports ESD Protection)
> - 4 x USB 3.1 Gen1 Ports (Supports ESD Protection)
> 
> $ lsusb
> Bus 004 Device 002: ID 13fe:6300 Kingston Technology Company Inc. USB DISK
> 3.0
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 004: ID 051d:0002 American Power Conversion Uninterruptible
> Power Supply
> Bus 003 Device 003: ID 04a9:190f Canon, Inc. CanoScan LiDE 220
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 002: ID 0bc2:2321 Seagate RSS LLC Expansion Portable
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 006: ID 1bcf:0005 Sunplus Innovation Technology Inc. Optical
> Mouse
> Bus 001 Device 005: ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
> Bus 001 Device 004: ID 1a40:0101 Terminus Technology Inc. Hub
> Bus 001 Device 003: ID 046d:082c Logitech, Inc. HD Webcam C615
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> $ lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>     |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 480M
>     |__ Port 4: Dev 4, If 0, Class=Human Interface Device, Driver=usbfs,
> 1.5M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>     |__ Port 2: Dev 2, If 0, Class=Mass Storage, Driver=uas, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>     |__ Port 5: Dev 3, If 0, Class=Audio, Driver=snd-usb-audio, 480M
>     |__ Port 5: Dev 3, If 1, Class=Audio, Driver=snd-usb-audio, 480M
>     |__ Port 5: Dev 3, If 2, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 5: Dev 3, If 3, Class=Video, Driver=uvcvideo, 480M
>     |__ Port 6: Dev 4, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 3: Dev 6, If 0, Class=Human Interface Device,
> Driver=usbhid, 1.5M
>         |__ Port 1: Dev 5, If 1, Class=Human Interface Device,
> Driver=usbhid, 1.5M
>         |__ Port 1: Dev 5, If 0, Class=Human Interface Device,
> Driver=usbhid, 1.5M
> 
> 
> 1. Does this mean the installer used the USB2 connections on the motherboard
> even though it looks like USB3.1 Gen ones were available?

No, why do you say that?

> 2. What is the number after the slash (4p) on xhci_hcd/4p?

ports.

> 3. Shouldn't "Linux Foundation 3.0 root hub" be "Linux Foundation 3.1 Gen 1
> root hub"?

No, we don't say that from within the kernel.

thanks,

greg k-h
