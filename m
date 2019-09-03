Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2B8A6A1B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 15:39:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbfICNjh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 09:39:37 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53799 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727667AbfICNjh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 09:39:37 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id BAC84220A7;
        Tue,  3 Sep 2019 09:39:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 03 Sep 2019 09:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=gt6jXD9kW6hjVEToMQvMVQFYZbf
        ruSfRmUGV9CJbQus=; b=kaP5BkUevrHPOiTMJYYEUQuxrd8gVewPxJqPk19uF6U
        3B48P0I3c+tCOlXPiyFTYATnBepjRAh49Sjj2jSh+96tLm0QuQzkQ9VcWJ1t1CCf
        AWlP+Afb732PU894nB/+fVie+z8X51/DrAcnMCjCdQine5mUePrli/VeK93dpY6V
        napVX02WkXRX+QtjdR3pqSDouqgYZYXDRcd7jAKT2ySXZaTzr4Yc/3oUOTgCqgaT
        1oNpvf+AYwUg2Xz7vUE6SXj8ljTLjoDo0yRABftgALirbI3VLNGARai3JLEl2F4G
        Hd6Vt9FIM5LQY5w4dm1Uf43F91DoRhQKxUKTGMxIewA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gt6jXD
        9kW6hjVEToMQvMVQFYZbfruSfRmUGV9CJbQus=; b=fEfUxuMfITZ+MX76xHhQuG
        aNM/04PVtAPSzcRvd2Kls/5ZVh+vXXCGjdWvrEXhe7fJL2rMZ1qmRX6DDFHrUwyU
        jNJ7sgGGqd0b2Ij2NgWmUCqwquOEMDZS0OrPgyt95exw9GYH+/ST++4xxtWdloQM
        kWW9He4cb3pwv0exqVlUjeNczZlrx6/InldTxUp8azQlWpJh4ZtG2/lUEyfzNpCF
        XaQnHSzcxnmpOKMxfIAxnWZbT8wcJKb3/9BOM8Y+bnye8DJXTR4N8QHyONdoYHUA
        Kf2VikDYL5HLkH8+n1UGQ/4UM0CRS0Pv7uLwO6fmasSoPqgi/xfPtUSe6L2k0YEw
        ==
X-ME-Sender: <xms:F21uXTYCjL79J324_ECMEeezL_vMSO2ssCmZJlarXMpHgwZrlRCI7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejfedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehttd
    ertddtredvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucfkphepkeefrdekiedrkeelrddutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:F21uXWpqhmrunVA_snQs8b565pA2fwfYAjX_-0d7rPnPrVwCUcKY0g>
    <xmx:F21uXQ94OeZhT6PWFaCaKwAKm_D8mO6b55IZINLHvr2FNGwZP0D4AQ>
    <xmx:F21uXd-hKGfrRhnWQ19OXfULW4NE0UP6eJClRVeGZuOeEffiUUkdDA>
    <xmx:F21uXcnw3kKu346oFvy3sNmu-I5fKx7uerZFwgYLc3webRZ79QfwCg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2D3C880069;
        Tue,  3 Sep 2019 09:39:35 -0400 (EDT)
Date:   Tue, 3 Sep 2019 15:39:33 +0200
From:   Greg KH <greg@kroah.com>
To:     Nathan Stratton Treadway <vgerlists@nathanst.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Adding "UAS" protocol line to usb.ids file?
Message-ID: <20190903133933.GA9435@kroah.com>
References: <20190817220145.GJ1403@nathanst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190817220145.GJ1403@nathanst.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 17, 2019 at 06:01:45PM -0400, Nathan Stratton Treadway wrote:
> I noticed that when I use "lsusb -v" on a UAS-enabled drive enclosure,
> the bInterfaceProtocol line for #80/0x50 has a "protocol name" label but the
> one for #98/0x62 does not:
> 
> 
> ========
> # lsusb -v -s2:15 | grep Interface
>   bDeviceClass            0 (Defined at Interface level)
>     bNumInterfaces          1
>     Interface Descriptor:
>       bInterfaceNumber        0
>       bInterfaceClass         8 Mass Storage
>       bInterfaceSubClass      6 SCSI
>       bInterfaceProtocol     80 Bulk-Only
>       iInterface              0
>     Interface Descriptor:
>       bInterfaceNumber        0
>       bInterfaceClass         8 Mass Storage
>       bInterfaceSubClass      6 SCSI
>       bInterfaceProtocol     98
>       iInterface              0
> ========
> 
> 
> 
> So...I was wondering if there was any particular reason that protocol
> 98 isn't included in the usb.ids file?

No one got around to it?  Feel free to submit a patch to the web site
that handles these to upate it.

thanks,

greg k-h
