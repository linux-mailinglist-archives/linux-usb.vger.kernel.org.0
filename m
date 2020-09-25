Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92D9278CA6
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 17:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgIYP2W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 11:28:22 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47747 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728612AbgIYP2V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 11:28:21 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B15745C01E6;
        Fri, 25 Sep 2020 11:28:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 25 Sep 2020 11:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=OS7RQqHd8aywtsRZR19GCY/+8/A
        BzY62dGEqJpH5O1M=; b=q27hQg8OOlobnMo1TpD6+4tukOZXK88XWtSyV3O1HyG
        asAzKn/WWvZ0FVHUuENkqioEHIWTpOyx/AEY3p/N9hfxwool//zTpZ89iZs2L7aG
        8iWogIs0K9vIF9fZ/NPLdMXb3ylHjlVNQgkE6+ot2igtIJDwOoIOuYCkQAiJc/C0
        0b3RXU8adNBTFRajOwI2LKyP82fqQ/zVg0EkeKiBIhjqVNyf4Xeu+4jNLvvWwwvV
        FrXBCtH/stxFwsNgIyKmj/SqMnlhrvx1HDYL/KYYx1JAv4GBc/T4InWHe3+PCmWG
        cuNFhkuTFc36jjWLByouwyfUVx/3Klt126jZr1nKSOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OS7RQq
        Hd8aywtsRZR19GCY/+8/ABzY62dGEqJpH5O1M=; b=FJH6dDbbkaGG9UTVKituSy
        UJ0qy/Trm8HyhTE9Rh+/9jYH9vXCd16uXAbFirC72oGFDL8mJ6J1zwkD4q6CiUkB
        1p6m5SnlHXy+TKD79yGgxwYmDhhLlcqqvZOHH4tPWR/9vZ1ZdM1067ravRri2LUw
        5ufBMUAc27zEUuAFFzQvNxpamA1A5iinKw71jyk+up/MSyLZWnxpkJCGRT8PuBLf
        Mgm7MWP6q6nNlDllwkOmrrOBVuAU/vOrRLZWHCZqgGdajeiLnFGjEGpHmbicFaBO
        fkT31bCVgo2HwVpiH3oh/FdBzx9mClhPK1g+kzRQVZqZ06A4Npgtkx6rGlXepmPQ
        ==
X-ME-Sender: <xms:kgxuXwUkY2aVnNvSoaGYfSRnSZB12GGPKrTSAVnq9pOMcsoTJwDTVA>
    <xme:kgxuX0nwJH3VaGSo5b_BNi3-WAguJLQCDRrMG7W6l8QcN2E76paEb6Ag9L7I7uo-P
    MxeebaOfHroBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueelledthe
    ekleethfeludduvdfhffeuvdffudevgeehkeegieffveehgeeftefgnecuffhomhgrihhn
    pehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdr
    tghomh
X-ME-Proxy: <xmx:kgxuX0Y9SEH1Hza92G_KJN8oRfm_1d58Zqcquz00srmu_16v4K-jAQ>
    <xmx:kgxuX_VmOihyWxS1W_6L9897uPRp_-8aaCAViZK-4rnwVbXdEIlT8g>
    <xmx:kgxuX6m4fTWpGmupauo1Ln-8wM8OwpbDKXwPGo40UFtVMVAtKHcjYQ>
    <xmx:kwxuX-t7OZ38DaS6zT9qQXR7bBsaGWhewbe7bivIIIA0_RgV_KHfFg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8A43F3064610;
        Fri, 25 Sep 2020 11:28:18 -0400 (EDT)
Date:   Fri, 25 Sep 2020 17:28:32 +0200
From:   Greg KH <greg@kroah.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Oliver Neukum <oneukum@suse.com>, bjorn@mork.no,
        linux-usb@vger.kernel.org
Subject: Re: [RFC] fixes for hangs and error reporting in CDC_WDM
Message-ID: <20200925152832.GA3191454@kroah.com>
References: <20200922112126.16919-1-oneukum@suse.com>
 <20200925151103.GB3173449@kroah.com>
 <22e1b8f3-947a-6f15-a788-d639cbabde5c@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22e1b8f3-947a-6f15-a788-d639cbabde5c@i-love.sakura.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 26, 2020 at 12:20:57AM +0900, Tetsuo Handa wrote:
> On 2020/09/26 0:11, Greg KH wrote:
> > On Tue, Sep 22, 2020 at 01:21:19PM +0200, Oliver Neukum wrote:
> >> Stress testing has shown that CDC-WDM has some issues with hangs
> >> and error reporting
> >>
> >> 1. wakeups are not correctly handled in multhreaded environments
> >> 2. unresponsive hardware is not handled
> >> 3. errors are not correctly reported. This needs flush() to be
> >> implemented.
> >>
> >> This version makes wdm_flush() use interruptible sleep.
> >>
> >> For easier review all squashed together:
> >>
> > 
> > I have like 3 or 4 different "RFC" series here from you for this driver,
> > which one is the "newest"?
> 
> https://lkml.kernel.org/r/20200923092136.14824-1-oneukum@suse.com
> 
> is the newest series from Oliver. But
> 
> https://lkml.kernel.org/r/b27841ab-a88c-13e2-a66f-6df7af1f46b4@i-love.sakura.ne.jp
> 
> is the squashed version with updated comments and deduplicated code.
> 
> > 
> > And can you send a series that isn't RFC so that I can know you feel it
> > is good enough to be merged?
> 
> Do you want this fix as a series of patches (the former link)?
> Since I think that the changeset should be atomically applied, I posted the latter link.

A single patch would be good to send to me again, burried at the end of
a long thread is hard to dig out.

Also with proper authorship is needed, did Oliver write this, or did
you?

There is the co-developed-by: tag, which looks like it might be relevant
here, can you do that?

thanks,

greg k-h
