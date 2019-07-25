Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2B175383
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 18:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389341AbfGYQF3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 12:05:29 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:52367 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388481AbfGYQF2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jul 2019 12:05:28 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id E65312220E;
        Thu, 25 Jul 2019 12:05:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 25 Jul 2019 12:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=/W/ebthvX3d1TMPS55JSsqpduvL
        BrcCQjSeh6WV0rJ0=; b=XodKD2DCf7mKyy0NYKA41TjUd8lncklYyvOnk0cH80a
        PUowOgIXxW1TnHNigthUmleMROD+Th8KSuIpywT+LZwZl4WizRkgF1gZtXHivdkm
        EY7Ay9/r33guN7en/0S6m4nSaNWT2YqstS84QdaDZWu+pY9j2yYzsi7kk306p3pL
        ZV8W/zkPhI/Yv8qcZFU+GX3kG21r/rvFYEMbgdlIA/vwuxfeAjdIWB9LIJ+X0jmk
        Tw+Z3FJmrHLCTjKCvC5NBvuOeOX0mZCdBGOYAlibYsYdOysvH6VvcvHEvtRHdy8w
        7pmG32AYs2XSAa5BI8DCPp50fi48j7OlfEWhudexmtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/W/ebt
        hvX3d1TMPS55JSsqpduvLBrcCQjSeh6WV0rJ0=; b=fcj+nD1B+9UbvMvvCw5uxP
        OZbwLLmz24p0/7HPBCx4PTdK4+A8iPApepreQ6lp6/5sCP8gug1jwtZtAXmIXRbN
        ToxHIDldMxVI+Lf8sATwDyBYNmaJByIGL9PHBLoRCRQX0E57SQyRofB1YNr5m2Se
        cWxDDlE/Ru3M3SlN5grYmobN/Zk1WXd0OyCcXtAmlEgIfJxZxx1BVohAZqvNI7WS
        2AX8iB8UhLk8aCsH9mRYq7gZ9eYJM6xbtfIWS1edlNdg3swkqXauiX+ATj938Stc
        CXhwu8W9p5II40Jvp8Pa/YkYGE3i1OU+8c51E/9n0WAw48zSP5dhJwoFvTOLc2YA
        ==
X-ME-Sender: <xms:RdM5XfJCjNaq-Za9Mcj7QxKor5iijNUAlnc1C63mE6ozwn_iHHLwmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkedvgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecukfhppeekfedrkeeirdekledruddtjeenucfrrghrrghmpehmrghilhhfrhho
    mhepghhrvghgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:RdM5XaIU5hf7e_6Az423hdGoIspQgq8m-ZsyGLkDWb5tOM3uUPWvWw>
    <xmx:RdM5XUCSRIJX9TV9FRQLAzmOcd_ghmBsesHVlEaQRxw4gQrFaYIPFg>
    <xmx:RdM5XfRbFUTPdBYjoBxzcbjVfYVI0MHgkPiHT9wVd3CRS1vVLVZcTQ>
    <xmx:RdM5XQklk9zovu2ayOK4m8X5wUqX3zE0LK-_5T-R5GO1WchisysBjg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9F2E3380079;
        Thu, 25 Jul 2019 12:05:24 -0400 (EDT)
Date:   Thu, 25 Jul 2019 18:05:21 +0200
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usbfs: Add ioctls for runtime suspend and resume
Message-ID: <20190725160521.GA8015@kroah.com>
References: <20190725091844.GA18907@kroah.com>
 <Pine.LNX.4.44L0.1907251112390.1343-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1907251112390.1343-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 25, 2019 at 11:18:09AM -0400, Alan Stern wrote:
> On Thu, 25 Jul 2019, Greg KH wrote:
> 
> > > > Still to do: Write up the documentation.??In fact, the existing
> > > > description of usbfs in Documentation/driver-api/usb/usb.rst is sadly
> > > > out of date.??And it deserves to be split out into a separate file of
> > > > its own -- but I'm not sure where it really belongs, considering that
> > > > it is an API for userspace, not an internal kernel API.
> > > > 
> > > > Greg, suggestions?
> > > 
> > > Hi Greg,
> > > 
> > > Did you got a chance to look into the above documentation query by Alan?
> > > How should we go about documenting these new IOCTLs?
> > 
> > Not yet, sorry, dealing with the backlog of patches after the merge
> > window closed.
> > 
> > Give me a week or so...
> > 
> > But if you want to try your hand at it first, it's always easier to
> > review a patch than it is to come up with a new one.
> 
> Would Documentation/userspace-api/ be the right place to put this 
> information?  It looks like we could take a large chunk of 
> driver-api/usb/usb.rst (most of it, in fact) and move it over there.

Sounds reasonable.

> By the way, do you know anything about how the information in
> Documentation/userspace-api gets presented to users in general?  Is
> there anything comparable to the Linux man-pages project?  Or are
> people just supposed to get hold of the kernel source from somewhere
> and read the files there?

No idea, but we do build it on every kernel release and put it up on
kernel.org to be easily indexed by search engines:
	https://www.kernel.org/doc/html/latest/userspace-api/index.html

thanks,

greg k-h
