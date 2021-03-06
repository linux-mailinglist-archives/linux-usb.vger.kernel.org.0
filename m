Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5451C32FC88
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 19:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhCFSyK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 13:54:10 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:53159 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230390AbhCFSyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 13:54:10 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id F037D5C00CC;
        Sat,  6 Mar 2021 13:54:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 06 Mar 2021 13:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=lrmSb+0AHL6QaseT41wA5F18q43
        qsJCTEVpWSqet1MM=; b=QwgmmmLPIumySLZTw1Ll6rzAek1/1N+7bU2oziaLOAd
        wLlFsJ6Qy0U4BVSKHDHKDahwsl37bZThXj1+I2s/xxidLajuLwbuwMem7R8BTWMZ
        xDS/qPVSDcffNlwsClR0htpzBrPY32zD4MnsjDoDsdkqy+N6TWDTvTLS6sv3UROc
        X3gt3H5KHl7sYAq9mc8YsHOkj2ge5WyTygS2St8W4W5a2w/fyEsc1/2tJKxC1FcR
        zHHV244gYzJkYKD0qh/DYhtwKX4smQ5BZGkbsEExyys9PEq/iXBn/HnqFGVTQb7+
        m95goeDhkIR6ELJGW7Lj39ONXdTWuXFlXTnBQ/y7ZCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=lrmSb+
        0AHL6QaseT41wA5F18q43qsJCTEVpWSqet1MM=; b=UuKD0AqrsQxaZJlGcjL+5e
        p1Xtgqx7HhXimj7ijvIyX6Mzx6Xy5C8qMj+vuLwpK9oqqmBtEV9JQZ10VFn5pjfU
        pcKNlHDE0Ebzx1SMl8eVCN/lj10Jindi1JshtbT9/j7vlSRB0TqGwBdvWrKRC0cP
        ZtCEkbxtknBE/UAfwjZukoIIj90EKzyfJGiBBWdf2A0gGNhiSsyTs+azK6EnPRVR
        Ztu5RXPnmenXsPvAX1Sb8qNGHLznIpg9gKw/8s4jK44iYSlYPcG477YTuX5DKne6
        kOPp8kVRXHX3KRJ2T1fzUxRIMLAMl0Q5W9+9L0w93xiKQXfitsnncFxucXJDRr8g
        ==
X-ME-Sender: <xms:0c9DYKJJebQypNBobgT6GwlUAbPMOv0DmnmfN30EWmADTWyROCW43g>
    <xme:0c9DYCICGnXi-do2LkekXnQy_uXTRgJg5kaejc-bISRd6cbYje8znwk3-CKUFHA2P
    IweuNW7FQgeYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtkedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:0c9DYKvMtaSQatRXNgCEKIC__-AM9s4wrZbJfnUBm9pFCtMZW8pSLA>
    <xmx:0c9DYPYy0bNKnrGuZYD1EEHj0HcK5A_ilRezyxtEI8RtqBVrp6ncBw>
    <xmx:0c9DYBZ75w6cNBxlHb_i_-0S6DTdHAr_EoipAyjGL2SCJavokOmK2g>
    <xmx:0c9DYD2XWxxbWkik7Y5PbpPTtIRE5RZ8Cz_GQ0gebrFvpeSpdgkY1w>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 593311080063;
        Sat,  6 Mar 2021 13:54:09 -0500 (EST)
Date:   Sat, 6 Mar 2021 19:54:07 +0100
From:   Greg KH <greg@kroah.com>
To:     Aaron Dewes <aaron.dewes@web.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: A question about UAS
Message-ID: <YEPPz6vXMnhT9DYZ@kroah.com>
References: <2ad0d2f9-0ef1-05b5-76db-b178107bfccb@web.de>
 <YEO1t63SQw1Ui4ce@kroah.com>
 <e5c24520-bc6d-8eec-4e51-6cbc30dd59a6@web.de>
 <20210306182531.GA77074@rowland.harvard.edu>
 <1e60a591-7b7e-ca80-41cf-16fa440d7248@web.de>
 <e903b8b3-e381-c6d9-248d-a0cee02a5a01@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e903b8b3-e381-c6d9-248d-a0cee02a5a01@web.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 06, 2021 at 07:39:09PM +0100, Aaron Dewes wrote:
> 
> > On Sat, Mar 06, 2021 at 06:27:06PM +0100, Aaron Dewes wrote:
> > > > On Sat, Mar 06, 2021 at 05:34:32PM +0100, Aaron Dewes wrote:
> > > > > Hello!
> > > > > 
> > > > > Sorry if this suggestion/question sounds stupid, I don't have experience
> > > > > with the kernel code and this mailing list.
> > > > > 
> > > > > I'm a contributor to Umbrel (getumbrel.com), and we provide a software
> > > > > that allows to run a bitcoin node easily, and we've run into many people
> > > > > having UAS issues
> > > > What specific UAS issues?  And why not just fix those instead?
> > > Sorry, I should've been more specific. When I said UAS issues, I meant
> > > that we've had many users who used drives that were incompatible with
> > > UAS, and that script is our way to detect that and fix it, because the
> > > kernel apparently often doesn't detect that, and I think that way would
> > > be a way to actually automatically detect such issues.
> > The kernel _does_ autodetect drives that don't claim to support uas.
> > Are you saying that your users have drives which claim to support uas
> > but don't actually support it?  If that's so, can you tell us what
> > drives they are so we can put this information into the kernel?
> 
> This is what we added to cmdline, but the list was too large, so we had
> to remove a few for our latest release:
> 
> usb-storage.quirks=152d:1561:u,152d:1576:u,152d:0578:u,125f:a76a:u,04e8:61b6:u,174c:55aa:u,04e8:61f5:u,04e8:4001:u,1058:082a:u,2109:0711:u,152d:0562:u,7825:a2a4:u,04e8:4001:u
> 
> I don't remember all the drives, these were mostly reports from users
> who had issues.
> 
> A few ones I could look up in our commit history:
> 
> - JMicron JMS578 and JMS579
> 
> - Samsung M3 Portable
> 
> - ADATA ED600
> 
> - PA023U3
> 
> - A SATA-to-USB adapter sold by "BerryBase", a German RPi-related shop
> 
> This is on kernel 5.4, so some might have already been added.
> 
> To me, it seems like most, if not all devices with the vendor id "152d"
> have UAS issues.

Care to make up a patch for this so that we can properly blacklist them
in the kernel?

thanks,

greg k-h
