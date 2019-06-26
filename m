Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0582C55EE0
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 04:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfFZCfY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 22:35:24 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52821 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726376AbfFZCfY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 22:35:24 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 1B1C6214DB;
        Tue, 25 Jun 2019 22:35:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 25 Jun 2019 22:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=jIHvX6C3uy/LO1APr38oWz1pKsZ
        oM8Lka5+8kS66nWo=; b=JiKHurGtVB14zeUNzn6zusvJbkfDl4zZ7gHTCVCPgyF
        lmtPvIWG9MNDCtedgeTO9bK8axCY3FhOmb884OJRQGUAZnjUqPXVVoxqWwsTrIXX
        UHN6RLu/Y89vc7U+Nx+J2IXfQr0IWuhCAu5O3PM1foeKYooPEVcICqFtOWpXGpFN
        ayGDKkHYwK6RxnEW8jzPUTgFBHSSKvAjmdxh541W4zQfur8dn3CXcgLHxLR6+ItT
        zGr+GTonNjRInJAcJWfxFHE2YUd1PPjzjlaYp4ze9bzK8+xO4hnFUdF66qX8bGeP
        BW/Mwf9Q/kXNe4Q5ZuWINt6tWKdYBmxCTXvtZz0+7jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jIHvX6
        C3uy/LO1APr38oWz1pKsZoM8Lka5+8kS66nWo=; b=BoDp4+mDPdqDUMkIwqElb1
        2N86hc/xv98WbdIt3V4MCHTD/JEtLctKxZuXboe3zVKjVgxuutO1PBg2Tja1nBLt
        95LxLrR9bKzp9Zq4po5sz8y9f2rKKbGOiviy1wsIq08ovKUmEjrxNHHN6aeAlRIc
        JVDKutNFBZ00AxEQINYcoxSTv7xrMvTiDwzPjD1ATbEoSNpTY2/1AWHYwpmcqPq1
        MUjG5GAPyuBj6N1kNaj6YCHrxDE1MKfdoKax+n6m2z3SMy6JpyafvofRBNe8YS6+
        yuPde0mRcv2AT/VS9dxF78dgMdNrgpUbBowjZ5SQO9k/xPiX8Db332JpCTqksidw
        ==
X-ME-Sender: <xms:6tkSXTtNoz_WM7F_3aaeFZoTbLSqWG9hNVfISR6ljVEA-IsUdAkjdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgdehjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepudejvddruddtgedrvdegke
    drgeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:6tkSXaeD4gR_WHqe3_uSfUdFaWtcUYhUbL5Hd4cAIIn0HzVeocWnsA>
    <xmx:6tkSXUYO9_qg3DH6NWSI4We9qmCstYIZiBBMt_82XLuK9Iyc15pl7Q>
    <xmx:6tkSXdVAZtYkKycCGGRnvZSUVAMZy3u-fMWa1somrNY1QQswAEdjPA>
    <xmx:69kSXZqTCM1lyGD_Fo5XcKaRAyEZQ46nOgxXAiZO9yjQfKGK3XevQA>
Received: from localhost (li1825-44.members.linode.com [172.104.248.44])
        by mail.messagingengine.com (Postfix) with ESMTPA id 66FA18005A;
        Tue, 25 Jun 2019 22:35:19 -0400 (EDT)
Date:   Wed, 26 Jun 2019 10:30:58 +0800
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Remove usbfs_mutex
Message-ID: <20190626023058.GA18819@kroah.com>
References: <Pine.LNX.4.44L0.1906251600270.1493-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906251600270.1493-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 25, 2019 at 04:03:58PM -0400, Alan Stern wrote:
> Commit 4a2a8a2cce86 ("usbfs: private mutex for open, release, and
> remove") is now obsolete.  The commit was created back when we had
> to handle both usbfs device nodes and the old usbdevfs filesystem
> (/proc/bus/usb/), but usbdevfs no longer exists.
> 
> This means there's no longer any need to hold a mutex during two
> separate removal operations (and thus during an entire notifier chain
> call).  Furthermore, the one remaining remove/release pair doesn't
> race with open thanks to the synchronization provided by the device
> model core in bus_find_device().  Remove and release don't race with
> each other because they both run with the device lock held.
> 
> The upshot is that usbfs_mutex isn't needed any more.  This patch
> removes it entirely.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 

Ah, nice, I forgot all about this mutex, thanks for removing it!

greg k-h
