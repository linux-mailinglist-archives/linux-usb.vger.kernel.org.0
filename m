Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B2A103B71
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 14:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730619AbfKTNb4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 08:31:56 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:49451 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730607AbfKTNb4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 08:31:56 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 3183A550;
        Wed, 20 Nov 2019 08:31:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 20 Nov 2019 08:31:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=kGoU8+LPVS69PgWlnUceaK0UkbL
        eHqqCU710XidawNk=; b=CsLTwXt2RImR2jJWOXBlLjqrDBixx8faeND8kOJO2NX
        OpBuddtKU5q7Z5bkTDDE+xjbz83WOwDSJTrYk7spNz9LUJy22N96qoaeg49Ww3zg
        6uN1qyJqeyw64yquUlHcTzt2vlO1r+gCXr8VvaXxYkWRGrkmWN0sVYdbe84gQNVI
        YMiVvj6ia94mjPBV6KBJ6FM6kjnWQ9cBb+DKQCAetgNjyPR4j9CzM0/rWEVfINcN
        T6lzWK4XoLssEjRyRczxJLVXUnmTUFcLklVg0LDU8P5SeS1NfkWUF/a6NsQRbctS
        JmZEXHriXCQZGyUL1XX7WN/JqRio4wKo1spBsBnce7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=kGoU8+
        LPVS69PgWlnUceaK0UkbLeHqqCU710XidawNk=; b=FxfxZw/LcvcTiBi4xZ2BDC
        rWNtClG62C2Mgxx3ATXGL+BvnU11dyQDsk3H9SYLrtOjSBmAP55LGAnjZUwe7yne
        ejnZdQqiMfPwuCY6MidNaAKkzynVQyDW6TRWWZZZXoOuJoXEhimbYl+I6HPKIyKD
        dEhbO7N+BvfrlEqcMtMoED769OMcg/fhs3WJw2E9myT7ZPYXZH1FgZdPOQUWCxvh
        Bv/Ui/DrJ6kit4Xa/sWAA3iIlM60xaQ7AoYgUlfcaxqTDch3yR1Xr7xVobfJz0uH
        Oqc7ivyTEP+3paRRJqilKzqV9AEakmiPIedDjDHQQ79UqqiIxKxSNZvie4zS5/Sw
        ==
X-ME-Sender: <xms:SkDVXdz0a9CJpFaZLUgV-_EWd6OIFfk3BE5qo5DLFtiNQcdPscN1ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehtddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehttd
    ertddtredvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucfkphepkeefrdekiedrkeelrddutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:SkDVXaJ76-dLrK-3qH_-oGuwXx3nFYsF4kI5TvkwA6Ng7ROlZ-S6ug>
    <xmx:SkDVXWFZGGvKkdMf203xw9X-HtyLtE_bb6MzuabVcmy_pzLT0nbwIA>
    <xmx:SkDVXTwzSjwRiF7Lt_lASzTppIU1BYVj-FscFWXxyhsVFkIPh3HQJQ>
    <xmx:SkDVXfM_Vhc-5D75ycpOfjOxGbX64maU-YxhYEnW67DpSpW3qL6CCQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6D4F93060062;
        Wed, 20 Nov 2019 08:31:54 -0500 (EST)
Date:   Wed, 20 Nov 2019 14:31:52 +0100
From:   Greg KH <greg@kroah.com>
To:     JH <jupiter.hce@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: kernel: Alignment trap
Message-ID: <20191120133152.GB2892197@kroah.com>
References: <CAA=hcWRrES4cpXvqBtD8-pyrUwz-BR03c-hSG-Xr4dei3AQi_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWRrES4cpXvqBtD8-pyrUwz-BR03c-hSG-Xr4dei3AQi_w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 20, 2019 at 09:28:14PM +1100, JH wrote:
> Hi,
> 
> I am running 4G LTE (USB protocol) and WiFi on IMX6 board, the kernel
> is 4.19.75 LTE. It is not clear where the kernel alignment trap came
> from, the only thing I could see is the alignment trap message
> generated immediate after USB GSM communication or mwifiex_sdio. Where
> that the alignment trap came from? Which parts of the program could
> contribute the kernel alignment trap, kernel iteself, or USB GSM or
> mwifiex_sdio? Appreciate clues how to fix it.
> 
> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
> now attached to ttyUSB0
> Nov 20 05:08:09 solar kernel: option 1-1:1.2: GSM modem (1-port)
> converter detected
> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
> now attached to ttyUSB1
> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info: trying
> to associate to 'Solar Analytics Wifi' bssid 78:8a:20:49:4b:c5
> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info:
> associated to bssid 78:8a:20:49:4b:c5 successfully
> Nov 20 05:08:10 solar kernel: IPv6: ADDRCONF(NETDEV_CHANGE): mlan0:
> link becomes ready
> Nov 20 05:23:13 solar kernel: mwifiex_sdio mmc0:0001:1: info:
> successfully disconnected from 78:8a:20:49:4b:c5: reason code 3
> Nov 20 05:23:13 solar kernel: IPv6: ADDRCONF(NETDEV_UP): mlan0: link
> is not ready
> Nov 20 05:23:18 solar kernel: Alignment trap: not handling instruction
> e8532f00 at [<b6c802b6>]
> Nov 20 05:23:18 solar kernel: Unhandled fault: alignment exception
> (0x001) at 0x38626667
> Nov 20 05:23:18 solar kernel: pgd = 34bdb7e7
> Nov 20 05:23:18 solar kernel: [38626667] *pgd=00000000

You should have a much longer tracedump after this, right?  Can you
provide that please?

And why do you think this was a USB issue?

thanks,

greg k-h
