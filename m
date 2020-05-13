Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625161D061F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 06:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgEMEn7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 00:43:59 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34031 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725898AbgEMEn7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 00:43:59 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 294745C00CA;
        Wed, 13 May 2020 00:43:58 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Wed, 13 May 2020 00:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=Ggbt/fQFrhsCmdhJgoMbJy1JMtm5Jie
        xAOorWCfySvc=; b=cnltLC+Tt8pq9Vrg3YZpbfHCTO+1zckKXlfks3DnzamBZqn
        Iuk0fk+S27aArrO+QuHQdRfDqVnlb2c4KdYfwvbC0MlnnXd4MbwiAN01YUgqW5NK
        7jgMLl6GsMwR92gnJNCflWOzGkwS1pd5+vsanmOVBruYAtN6b8qiwxvkbPa1x7pZ
        RjIUuqDrAHgjSzu1dKpDrLZ5znsLO5aWwqA87uAsfml63re6QOTqCLQ88aLiJVgA
        H+M4UPsPZ2F+Gb3DfJX+te5HR8OWuwr5rL12xtcb8jEHU+DhWLf857GRZWapRJPc
        f4ZgUVCFIpWWiSvxHSqZyQB+oItBWmt6ezYtRHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ggbt/f
        QFrhsCmdhJgoMbJy1JMtm5JiexAOorWCfySvc=; b=pF6OooUQJGQ5yqkZZ1a2HU
        ISOGiMzz6tMlDV7Gw/HRGHbDCd+jvQLe4pOJx5Aq49L+Jq1ROp0/3dmc0bx/yBO0
        2nNENjzpiM7xq7nEYENszq4O5mRb6SvEbIRnebaV2rKJyTb4yKgGD8jzAmsVmjpx
        UXAGw0WHF8fNsyzKB/0iWU6yngLT576QfHGMU9U9P7+FdZDjvWmCVnhD4aLva6WW
        kmsMHBBB4G/98ubcL+VjAlfFlzWCMc1UJuxHL5XI/0/CZiX6R4b79kQqdrYVKj7/
        U49lLoIJqwtm0FcV3Q6a6Zfcv7KvzEGEXYwR6OMi6joibzvWHpSdxmn9hLFN0eGQ
        ==
X-ME-Sender: <xms:DXu7XhtXrYE_8vdqy2OwrPDsFtNOYuvZep3dpP1UcwbM9yuz9i3ryw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleefgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevgefhve
    evteetfeetkeejjeehudffffffhfeuffelhfeuffdufeduleejfeeugfenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruh
    hs
X-ME-Proxy: <xmx:DXu7Xqd06vHzSU3AhaZE1P6P0Zj_p6vPnG1cm7I9Z70u_KthSutwcw>
    <xmx:DXu7XkwN9vibHtSlfQOF8zt3CgzXrcP2mvUMRWe0FqndZYhviYNAsQ>
    <xmx:DXu7XoNdqX-axGQyq9P5PjSKJyNUdRZQpZPlBcWy9tg3PM2fjVI-7g>
    <xmx:Dnu7XmL1k9Kw97rcB54Ch-BdLCfMZpt54I1HSvwwtC7GWpIdh71G1A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BF97F660082; Wed, 13 May 2020 00:43:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <e89456b5-20db-48c1-814b-075e84ca8b8b@www.fastmail.com>
In-Reply-To: <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com>
References: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com>
 <20200512195231.GA26080@rowland.harvard.edu>
 <6d19d49dcfe7467556b0462b16e76677c1999875.camel@gmail.com>
Date:   Tue, 12 May 2020 23:43:12 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Claus Stovgaard" <claus.stovgaard@gmail.com>,
        "Alan Stern" <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Options for forcing dwc3 gadget to only accept superspeed
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Have you tried only providing a SS configuration? If that fails for some reason I suspect the next course of action would be to see why, and patch the driver so it does not.

Out of curiosity, which SoC are you using?

On Tue, May 12, 2020, at 3:08 PM, Claus Stovgaard wrote:
> On tir, 2020-05-12 at 15:52 -0400, Alan Stern wrote:
> > On Tue, May 12, 2020 at 09:25:38PM +0200, Claus Stovgaard wrote:
> > > 
> > > In a certain scenario I would like to force the dwc3 to only
> > > connect
> > > via superspeed and not fall back to USB2.
> > > 
> > > What options exist for forcing the dwc3 to keep retry?
> > 
> > The USB-3 spec forbids devices from operating only at SuperSpeed. 
> > Devices must be able to connect at high speed, although possibly
> > with 
> > reduced functionality.
> > 
> > Alan Stern
> > 
> 
> I understand the requirement from the USB 3 specification. Though in
> the scenario for this specific device, it is not about comply with the
> USB 3 specification, but my question is rather what options I have for
> not comply with the specification here, and then force retry of USB 3,
> using the dwc3 as device.
> 
> The device is in a fixed mounting with a fixed host. Sometimes when the
> host and device is powered up, it ends in high-speed instead of super-
> speed. I would like the option for "I will not be compliant with USB,
> but rather retry super-speed".
> 
> Regards
> Claus
> 
> 
