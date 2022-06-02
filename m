Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F33C53B34B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 08:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiFBGCu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 02:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiFBGCt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 02:02:49 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6917416581
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 23:02:48 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id CE8905C00CF;
        Thu,  2 Jun 2022 02:02:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 02 Jun 2022 02:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1654149767; x=1654236167; bh=uqIrpoNZaL
        MNuwgv9q9PXfD1ZXggGNxlFLf8pXo3iXM=; b=YY2+LJVtwwGPtmgna1ET1Xg/aa
        tAJ72BQXVPCMfAeGjZUIK16O93TW90b2o2tTEnFLOZDhQgiGjSBjycEPcvm+91zU
        Mpv28K3XgjlBZ0udBKa81YxJPTFSDSqNjk+2b9c8pHuKwh4TxzT7yF7t/XOfxfRL
        vvjo6gQoDIbR3B6yNnyW/VcYP+h/V8sK9Mn3MK/I5GWD6bAUHfdMijkIYRMr6KOd
        O20iAPXL5iZzUesJmcR4NK4ZabbbHa+7q78KnNLzhyF1sM4jFYCojFCGj+WKNavz
        2yWnhjvOfmAUcek+JtSRBjyfgZm58w6g9xYvUapD0HvhSe0EhZ0XPYWnajMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1654149767; x=1654236167; bh=uqIrpoNZaLMNuwgv9q9PXfD1ZXgg
        GNxlFLf8pXo3iXM=; b=zL/jB0aOiwPT3TQDtJwDxpE/VY6Zym+2iMoB0+EmYoiu
        phE5SMjIBjh9jswk78YX//G2v0+Xn2XG0mAXlSirhvLjdkZD8YTxF9D/5NdUdWQQ
        QCGHGuUuH8QqTPlCfLvtkCrKj/FxPO7o9S+gv4TcIjmW7XcwoAsXbsh8vwm7yvAl
        uKcivPZ7maPLNHphJljzQiJvLIcF6KGKr5d4hA+lOydQVNnNO/+R4gSv9EGeITiJ
        o3hKpK7kcElFuLAUy+KS2GBFb2lvrhSenO3WWcVtULbrz5LEUc8WoN0mECJuJLWC
        iQ1u+NFz56QLSKVAwZleMbFD1cr+kuBPC+92btuFbw==
X-ME-Sender: <xms:h1KYYqDGSI7wNfX23WlZXSe-u8AmeQgI0QseL2leyCJ_-r16gBlRnw>
    <xme:h1KYYkhu5hrzau2BZ-mF14psbEKSjTxGFHkvY3ttcgBxpIWuo21PLTBe4VIhIcLVB
    mjf1fIArth8JA>
X-ME-Received: <xmr:h1KYYtn88YzdBbHgzAWthKTIt5aVHC6z2hWfjIuphuqL1x0f3TF6l1JDFD60sndYKZORlNbWjBHX0yzFroZZPT8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepheeltdekueegueetgfefhfekieeiieejvdejveeuffegfe
    elieduffekleeuffeknecuffhomhgrihhnpehtohhnihgtlhgrsgdrrhhunecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:h1KYYowKI_dW2uY5EPEDlHCKmJdAzztZdcAmQOAF8CS-cMQPctBpuA>
    <xmx:h1KYYvQJuRIWpYzHB7QLPcE3zoJba9Ska0PrWtoU9IR3IWALyIlJBA>
    <xmx:h1KYYjYRkX2yKmWUr51ZsHinYXTifOF0BRoWPJoAgnS7CQ3wGqEPMg>
    <xmx:h1KYYqfhFxCWiWz56lX-smC2G4EYPCBx4CzSQYvEwgVPcdsNokpS0Q>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 02:02:46 -0400 (EDT)
Date:   Thu, 2 Jun 2022 08:02:45 +0200
From:   Greg KH <greg@kroah.com>
To:     "TonicLab.ru" <info@toniclab.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: /dev/ttyUSB0 file disappears on Ubuntu 22.04
Message-ID: <YphShbNo8cTU65Qj@kroah.com>
References: <4b9e024d14c40cba7c04d5879ae64866@toniclab.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b9e024d14c40cba7c04d5879ae64866@toniclab.ru>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 01, 2022 at 07:37:45PM +0300, TonicLab.ru wrote:
> Hi all,
> 
> This problem appeared on a freshly installed Ubuntu 22.04 desktop. Not sure
> I need to post this here.
> 
> When I'm attaching a ftdi device into usb everything looks great but there's
> no /dev/ttyUSB0 file. Seems it created and then disappeared. I tried to
> remove brltty package (as some recommends on the net) but it didn't help.
> The same ftdi device works on older Ubuntu version w/o any problems.
> 
> I'm having this in syslog:
> Jun  1 16:58:09 qgs-comp kernel: [  538.642086] usb 2-1.5: new full-speed
> USB device number 5 using ehci-pci
> Jun  1 16:58:10 qgs-comp kernel: [  538.756437] usb 2-1.5: New USB device
> found, idVendor=0403, idProduct=6001, bcdDevice= 6.00
> Jun  1 16:58:10 qgs-comp kernel: [  538.756445] usb 2-1.5: New USB device
> strings: Mfr=1, Product=2, SerialNumber=3
> Jun  1 16:58:10 qgs-comp kernel: [  538.756448] usb 2-1.5: Product: USB
> Serial
> Jun  1 16:58:10 qgs-comp kernel: [  538.756450] usb 2-1.5: Manufacturer:
> FTDI
> Jun  1 16:58:10 qgs-comp kernel: [  538.756452] usb 2-1.5: SerialNumber:
> FT0KKBIF
> Jun  1 16:58:10 qgs-comp kernel: [  538.759677] ftdi_sio 2-1.5:1.0: FTDI USB
> Serial Device converter detected
> Jun  1 16:58:10 qgs-comp kernel: [  538.759713] usb 2-1.5: Detected FT232RL
> Jun  1 16:58:10 qgs-comp kernel: [  538.760546] usb 2-1.5: FTDI USB Serial
> Device converter now attached to ttyUSB0

It was created here.

> Jun  1 16:58:01 qgs-comp colord-sane: message repeated 2 times: [
> io/hpmud/musb.c 2101: Invalid usb_open: Permission denied]
> Jun  1 16:58:10 qgs-comp mtp-probe: checking bus 2, device 5:
> "/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5"
> Jun  1 16:58:10 qgs-comp mtp-probe: bus: 2, device: 5 was not an MTP device
> Jun  1 16:58:10 qgs-comp systemd-udevd[5394]: 2-1.5: Failed to create/update
> device symlink '/dev/ttyUSB0', ignoring: File exists

See it's still there.

> Jun  1 16:58:10 qgs-comp snapd[942]: hotplug.go:199: hotplug device add
> event ignored, enable experimental.hotplug
> Jun  1 16:58:10 qgs-comp mtp-probe: checking bus 2, device 5:
> "/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5"
> Jun  1 16:58:10 qgs-comp mtp-probe: bus: 2, device: 5 was not an MTP device
> Jun  1 16:58:10 qgs-comp colord-sane: io/hpmud/musb.c 2101: Invalid
> usb_open: Permission denied

I do not see it going away.

Are you sure it is gone?  Any further log messages?

thanks,

greg k-h
