Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F25E22820C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 16:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729290AbgGUOXn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 10:23:43 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:50961 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726715AbgGUOXn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 10:23:43 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id BBC0F4ED;
        Tue, 21 Jul 2020 10:23:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 21 Jul 2020 10:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=m
        6PZkr/cAOzYBP0LeFtd4cumWstRM/jULtIkoXJtxGE=; b=bsJr0n93gqF2l+7jp
        KrdVMAFj4rnB/kSLfTaK85l6Ytm+suo0gfkdophZ7gY8cvNyj9LKPS20xvj/PDVu
        Z3lDVbaZmAQ+X/fpPW5iXAKTBtAkoLmss7s6NFkGhTaC53ouSVwcr7h0JvdIgaoa
        P6pCal+hv9V2ejP9ZWXCFwthH1NNXt5RGQ50UQjB6e3CrGA0DP85ili/JrQuZFmW
        hVCmGC2iZehl4yBOQF7vc2fiBab2HJuSMivyUj6RL1a4TNo+57T+evzOhnsJ9IM2
        VppeAtqqVZdnjdfXJCf88sN5JKEigiobR5iHZjhJspBjwd+ByqFIX37zKcLOGAwt
        73AWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=m6PZkr/cAOzYBP0LeFtd4cumWstRM/jULtIkoXJtx
        GE=; b=g/gWqh9tD2n5JH3w6LwNK+lCEYHI91SiipkBUmf6ufhh1EYyUnQBq6dgN
        hatStetY0S+zCIiT3jEJW9YOQTBXhYDbHHW1hsUn3PmWFk4kPU3R+1vpjNFlqYC1
        dIU/kIFHPv/HBtSDBZiZwhY1dFGr5O5k9nKlKMspX7DP9A08OHEBzxrStvsPeqTc
        HnPdG3vAj/Tvxg+jJNU+/LIsIDFGk5qAhiBSMliAnZBZs726/N6YtDVkExIANe7+
        JFsyLwfuHvknvrzqMRAqj7S9lA6Zt+rgLXxKO+XaIcJ/v1Ci/SFkT4DhUbfAEj2s
        THIn6IDXmCpyW0Bxez/3EeJjipH2w==
X-ME-Sender: <xms:bfoWX7IaNhEDN9amlFo8vBk3D5_SxbhU9D-418ZDLnOnY-fwO-aL2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrgeeigdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehhfehge
    dtleeuheetheetvdetveekteejkeehkefhudeujeeigfejgeetieejveenucffohhmrghi
    nhepghhithhhuhgsrdgtohhmpdhkohdrihhnnecukfhppeekfedrkeeirdekledruddtje
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgv
    gheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:bfoWX_JlEzAS7zJdDrEuJWTSWig1S-9kr9X3I3lNxvDOOtROe67KDA>
    <xmx:bfoWXzssUrR6pT5WhsjmOGnNOa7HqShvviNU0-rzUWh-6I8BSrsArw>
    <xmx:bfoWX0ZDAdDg3NIfOs9XsfNgcSHMqJpLD2K2UAM2cjmDci-Qr97gsg>
    <xmx:bfoWXw2lj7joBQQLSD1MehHbU9nt0Ap6yDnx9vi4zBJbeQL3QLKXIA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id AE2DC3280065;
        Tue, 21 Jul 2020 10:23:40 -0400 (EDT)
Date:   Tue, 21 Jul 2020 16:23:45 +0200
From:   Greg KH <greg@kroah.com>
To:     =?iso-8859-1?Q?SZIGETV=C1RI_J=E1nos?= <jszigetvari@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: linux usb gadget - mass storage
Message-ID: <20200721142345.GB1984873@kroah.com>
References: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
 <20200720162422.GG1228057@rowland.harvard.edu>
 <CAJK_Yh_ZAvuSBFdUitkPbzp_L69Fuew7cTKbeTH3X8aJdOJeqw@mail.gmail.com>
 <20200720172951.GI1228057@rowland.harvard.edu>
 <CAJK_Yh8rPPMkxXLAyQDN7Ux=_NKcfvHgb1iyt7bZmej0q4P-Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJK_Yh8rPPMkxXLAyQDN7Ux=_NKcfvHgb1iyt7bZmej0q4P-Qg@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 21, 2020 at 02:20:27PM +0200, SZIGETVÁRI János wrote:
> Hi Alan,
> 
> Alan Stern <stern@rowland.harvard.edu> ezt írta (időpont: 2020. júl.
> 20., H, 19:29):
> > 4.19 is a very old kernel.  You'd be a lot better off testing under a
> > recent kernel, like 5.7.  It also would be more convenient to do your
> > development on a regular PC instead of a Raspberry Pi.  You can use
> > dummy-hcd for testing gadget drivers.
> 
> Okay, I put together a Slackware-current based VM to conduct the
> development work on.
> I compiled a patched version of kernel 5.7.9 with all the necessary
> config parameters to have USB gadget support with debugging enabled,
> and also the dummy HCD.
> 
> At first loaded the g_mass_storage module with a smaller ~700 MB iso
> file, and it loaded seemingly fine, and functionality-wise it also
> seemed to work fine, although there were frequent periodical debug
> messages about the gadget returning command-failure status:
> https://gist.github.com/jszigetvari/5bc4cdc8c55588907b71832558cb00a7
> 
> After that as a test I tried to dd all the data from /dev/sr1 (that's
> the device file the gadget was assigned) to /dev/null.
> The process completed without any user-visible errors, although the
> failure status related messages kept on appearing:
> https://gist.github.com/jszigetvari/ffa19850c94f12510c0b78ed5aaba2e1
> 
> Finally I tried to load the large, 11 GB CentOS iso file as the second
> phase of the test. On the Raspberry Pi (with kernel 4.19) this was
> when the crash happened, however this time it did not.
> Originally Tiziano Bacocco's patch came around to be the time of the
> 3.x kernels. The patch needed minimal adjustments to apply to 4.19 and
> 5.4 and also to 5.7.9 (though there was a one line offset in
> f_mass_storage.c).
> https://gist.github.com/jszigetvari/5a9796c8af8a01c0edba6a8696540029
> 
> Although I have to admit that on the Pi Zero I was using the g_multi
> kernel module, and not g_mass_storage I assumed they share the same
> code base, so they should work the same way.
> On the Pi zero I need the extra serial and Ethernet interface to have
> access to the Pi Zero, as it doesn't have a wireless NIC, and that's
> why I chose g_multi.ko.
> 
> In the end I did a dd with the 11 GB iso, and to my surprise it worked
> well. dd returned without any errors and it did show the true 11 GB
> size when it finished.
> In the kernel logs most log entries were about block reads, but the
> failure status messages were still around. If there was no activity on
> the device, then they accounted for the majority of the logs
> generated:
> https://gist.github.com/jszigetvari/a9225fa3173e6c7b7b50673a494d9c37
> 
> I have to admit, I stand puzzled why it worked on an x86_64-based
> machine and crashed on the Pi Zero.
> I guess the next step will be either:
> * to try using g_multi instead of g_mass_storage on the test machine
> * upgrade the Pi Zero to run kernel 5.4.x (AFAIK that's the latest one
> can get from the Raspberry Pi Foundation's git repo), and recompile
> that kernel version with the patch applied. (This will likely take a
> few days.)
> 
> Any further suggestions would also be welcome!

One guess, the Pi Zero is running a 32bit kernel, while your desktop is
running a 64bit one?

greg k-h
