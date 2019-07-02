Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39C65CF59
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 14:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfGBMYi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 08:24:38 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:56405 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726418AbfGBMYh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 08:24:37 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 5D010333;
        Tue,  2 Jul 2019 08:24:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 02 Jul 2019 08:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=r71Da2XXMo8899fCN5pyLHypfoU
        YFitPms3DC0y7yAg=; b=XH6sPmzu+57I8iY46Tp9B45Soikar+iKVzzxuoWPJAj
        1yaiTk9lAl3YTe4uCH886w4NZpIDLTuDYc6YPSI8Xvd02mtPFSZ03uATU4QrpIXy
        8pTCCQ7uCCzgNW+48etmy2E8/JC3NTAPXjwZwd74xfkw9PV9V9jeyVaA+jKJzXM9
        hIVraVtlpr6zyhvCMWkXTTfZSkR+HWG+iLICm6GdvPZMV15Hbpcg5nXfkoCmHZlP
        CeQA9moaKDf3kXFuXY2B8wLZsX9NVucuxLrRnLE23wnc3DvJAMzD33ea3xANUpoo
        OzGUc//0QTmCgfDGIhendoF0vpqcBiqzBDYHaI/medQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=r71Da2
        XXMo8899fCN5pyLHypfoUYFitPms3DC0y7yAg=; b=a5Z4CME5TRxEzKLHbc/Zmz
        zNyh+TtbuTz1oa/uCiu4xoSvWAU874DIsrhNbtKKYVGop6cKHQQMOrrZKnEXJVfQ
        SU8hGj6ZlFLV45v/2bmShS2QHkKpDzp3V2ZhZ9QmurS2V39iksED3c97hN/8Qle2
        V9ObUIgV5fI/uOcnrH1c6oth/RYUY9M0RLtUam3WD5DSrqlu72nxjU9lRZ9svC7n
        bLnfZbHjgjUvwLv3uSFMRCqrkGvyG7bg6VgQ183zmVNbhVxhGk/iXVTbzmNbp8RQ
        h8mdRNLbIzJdmAGWmwHyusBtQkMiUn6I1u6YH1dGZpL2sgshpuYdZ9/fe7mEOvpg
        ==
X-ME-Sender: <xms:AU0bXXZKgSK0BvJ01vd_78kNgYnWJ-GKI_53JY1ZZBHGK_w6UE2UlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrvdekgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
    lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:AU0bXWgH3TUBsdWINwZUt6OJ9bBvVIorO03uu_D5M8GYNccaEncJ6w>
    <xmx:AU0bXeFjNQn8VdX5-Nh3U6Xm5_boG1H2Ly3d0HTIL2757oGh_D2Jaw>
    <xmx:AU0bXWH1GGRwkUedyieLoilzBzKZWFh1yWs4mCnsuAkI3o7YXbz4cA>
    <xmx:AU0bXdbqVRJqxXYKbbfBtU5kiKQfnmk0fn8X4DgmFcXfWKXP-7czfQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id E14328005B;
        Tue,  2 Jul 2019 08:24:32 -0400 (EDT)
Date:   Tue, 2 Jul 2019 14:24:30 +0200
From:   Greg KH <greg@kroah.com>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: Aspeed vhub configuration
Message-ID: <20190702122430.GC12019@kroah.com>
References: <44bb150fb8b283a3036a382fa7e821b045554c15.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44bb150fb8b283a3036a382fa7e821b045554c15.camel@kernel.crashing.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 02, 2019 at 09:33:11PM +1000, Benjamin Herrenschmidt wrote:
> Hi folks !
> 
> The Aspeed USB gadget "vhub" implements a hub emulation with a number
> of UDCs representing the hub slots. It's working ok now and has been
> upstream for a bit, however, one thing that's been annoying to some
> users is that I've just hard coded the hub's device descriptor. IE, the
> vendor/product ID, strings etc...
> 
> Various BMC SW stack vendors want to customize that, also possibly the
> number of ports etc...
> 
> I originally thought about configfs but after more thoughts I don't
> think it's really a good fit. The vhub is a fixed thing. When you have
> the HW, you have that hub, it's not like you can create different
> things, and populate differently.
> 
> That leaves me with two approaches, that aren't mutually exclusive, but
> I'd like to run them past the folks here before I start coding:
> 
>  - The defaults, currently hard coded, could be replaced with Kconfig
> options.
> 
>  - The device-tree node could contain optional override of those
> defaults, allowing a vendor to customize the hub for a given board.
> It's not per-se a HW description, but the device-tree is also fairly
> commonly used for HW configuration, even if some people disagree with
> me on that one (hint: they are wrong :-)
> 
>  - I could add sysfs properties underneath the vhub device instance to
> customize it. This would also allow userspace to control whether the
> hub is "connected" to the host or not, which could be useful, some
> systems don't want it to always be there. Today there's no choice.
> 
> Any other option ? If somebody says netlink I will scream :)

DT seems like the logical choice, I'll not object to that.

thanks,

greg k-h
