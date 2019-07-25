Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A22F749AD
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 11:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390326AbfGYJSr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 05:18:47 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:52173 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390290AbfGYJSr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jul 2019 05:18:47 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id AC90A2205C;
        Thu, 25 Jul 2019 05:18:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 25 Jul 2019 05:18:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=O
        bqs0WSs2OPBt8uz9YzMgzuXEa7xrbpTWIYr6KmFCoc=; b=OjSr7JkQyyc+lkPbI
        xW7dBKP1vxYfxFM0zqcmS7s5CGlrKVa8IbfAsb67ZHdd8hkznSJVNKZWfzUzmtuj
        zcTAxbnn4l68T/2EpQC//OkmyZmyX5cOvH8ddPEk+ouemwylgqLFm+cAV9w7Ar/t
        cNX7BUEzhosdNGV8gCpnGLVv0x8lebAxwfZx5y74Rd1uozIOxtKJDgZ7GFgZJz8d
        5nzlY5UCebJhAaIj670iDFW/PygsGdeQMDFMyZ9TaerIGrNApYLSuKYzk+FrtbA4
        ABv7ibuuy3Yu2XpZCJxbD75dyZMhs7G+gKBVxB8cRU2xL+L0sTA6BH+/SLhdpWfL
        PJ6zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Obqs0WSs2OPBt8uz9YzMgzuXEa7xrbpTWIYr6KmFC
        oc=; b=Mo6z81AmrDSzAFQ12NBj7Ih0o7TCKFsZPXDAJOrgopi07lQZyg0jxtxFm
        b5JUoUEDMXphxslNyrZA4EqvxDXC1N8U+hdW8Zdfx8Shp/EHhEWWSWqDJUjcstEd
        Q1wSdKSLXlgnaXHU/YQoOYE5I7pwhxf+yEKD2wI5SccAanGLmSP3r6R+hawcyOMl
        wMnTwmYMotMcqEElM875dhB2ff4VdSdq2qL/feb0nlDAY0nz2RNa6CR0aQZDuhBU
        p0vOUnTOsvWaHTPY8TXNOSQv2YHW6g2eluaZe3+znC9o2+788dQpj1T4KS6O4fRK
        X0SvLCTs1yqhkRHVgywnz6B1f6Q8A==
X-ME-Sender: <xms:9nM5XTB-afSrn4vVfJgxm2S5gZSxupTdfKVfD2WjWjoQRdMldHh9Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkedvgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjfgesthekredttderudenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehkvghrnhgvlh
    drohhrghenucfkphepkeefrdekiedrkeelrddutdejnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehgrhgvgheskhhrohgrhhdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:9nM5XebN2s6ASqVjcyYRr-DO1_SyBWy5EGbf3rmwGondE505pMxHsQ>
    <xmx:9nM5XcJfWkQAdE6VC5LmKbONzxTmJojw-yFOjkHBhIvrNFCGx2Dhqg>
    <xmx:9nM5XX3h_dvKr0KQ2BX95UvqZLV0UjUfsyJ6c24WOQVF3U5J96j-xg>
    <xmx:9nM5XdlcT0FMi5EvxAcnyPVdG3jIbqEB4reaAQ_MWwNuMbq6H-hGGg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 07040380074;
        Thu, 25 Jul 2019 05:18:45 -0400 (EDT)
Date:   Thu, 25 Jul 2019 11:18:44 +0200
From:   Greg KH <greg@kroah.com>
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usbfs: Add ioctls for runtime suspend and resume
Message-ID: <20190725091844.GA18907@kroah.com>
References: <Pine.LNX.4.44L0.1907051433420.1606-100000@iolanthe.rowland.org>
 <1564045827.5612.1.camel@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564045827.5612.1.camel@opensource.cirrus.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 25, 2019 at 10:10:27AM +0100, Mayuresh Kulkarni wrote:
> On Fri, 2019-07-05 at 14:51 -0400, Alan Stern wrote:
> > On Wed, 3 Jul 2019, Mayuresh Kulkarni wrote:
> > 
> > > 
> > > As you had mentioned in one of the comment before, the only addition
> > > to
> > > the patch I have locally is -
> > > usbfs_notify_resume() has usbfs_mutex lock around list traversal.
> > > 
> > > Could you please send the patch for review? Please note, I think I
> > > am
> > > not a part of linux-usb mailing-list, so probably need to be in cc
> > > to
> > > get the patch email. Do let me know if something else is needed from
> > > me.
> > Here it is.  There are two changes from the previous version:
> > 
> > 1.	This is rebased on top of a separate patch which Greg has 
> > 	already accepted:
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit?
> > id=ffed60971f3d95923b99ea970862c6ab6a22c20f
> > 
> > 2.	I implemented Oliver's recommendation that the
> > WAIT_FOR_RESUME
> > 	ioctl should automatically do FORBID_SUSPEND before it returns, 
> > 	if the return code is 0 (that is, it wasn't interrupted by a 
> > 	signal).
> > 
> > Still to do: Write up the documentation.  In fact, the existing
> > description of usbfs in Documentation/driver-api/usb/usb.rst is sadly
> > out of date.  And it deserves to be split out into a separate file of
> > its own -- but I'm not sure where it really belongs, considering that
> > it is an API for userspace, not an internal kernel API.
> > 
> > Greg, suggestions?
> 
> Hi Greg,
> 
> Did you got a chance to look into the above documentation query by Alan?
> How should we go about documenting these new IOCTLs?

Not yet, sorry, dealing with the backlog of patches after the merge
window closed.

Give me a week or so...

But if you want to try your hand at it first, it's always easier to
review a patch than it is to come up with a new one.

thanks,

greg k-h
