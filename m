Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E432974938
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 10:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389701AbfGYIgz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 04:36:55 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34337 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388546AbfGYIgz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jul 2019 04:36:55 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 8E8B722012;
        Thu, 25 Jul 2019 04:36:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 25 Jul 2019 04:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=q1B4YqRHqxAqJsoppSSVvVKK6nq
        KFK1exda0rvarrZo=; b=WPfdRxOxlWuDgeJz086PquShwDfBDRl94sdKCWN6OR8
        3IcboDoSEV6meuBIXFfAzyqCryqH0aLFCfGEeSyxkN9OSdRYFOciXpn43rT/qnRd
        RL8tjuCldTu9xt9w8ghaP+ScEjQwUdfnlEKmA1zUzZrzLZaqODYEV7QYHpF+vwoC
        O0YB0OALln8cSM9lqePHeV96KuGGvVRlFXdqmPIuW1YJqnZuYlxuRcpE2XUTQyad
        Lz1XVmJnE/eeIa2rQ5U1q9/4BYN0x3gsQUvida77nHYNF5DpLYkgq2rbVsPaG9s7
        zpOgfclGg/47axaY+DBEpcOQG+1Mk+5AuO8NJpcgIVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=q1B4Yq
        RHqxAqJsoppSSVvVKK6nqKFK1exda0rvarrZo=; b=zrgmM9XiuziynM97+bRU5B
        BV3lpzSsGUGzwGVrfhxuTvHv5nKoOEpFsJGwZTbMsZ1BY0yeXRSYDfeQEttEGkls
        RW1e7Z8y/uiAETkrAOItWCZvZgsGntJSTa6nFLxL7Vd+h1o8mfoSdBsijEIvDk0e
        l/5+gHHUX1Xw4u6YFL+4p8lLazoSxlvGZqCqn56tEXes4JJUp3aa92Q0dP82wzcB
        xgdj0wVvvuqSPvNGXyG3fVX6T0fE3qAgtCSEHI/NybzTPlCGdOt6Had3Mcuebvyh
        XzZ3VXkgeCra3rmUxZNfXxDoj3u/v645R5QXPYGDhfKuRHxFVLYI5N5xCIejoMNQ
        ==
X-ME-Sender: <xms:I2o5XaU8ZnHmKLpg0EvjYJnv02uP6lbwdu5sFQNb_nmfSzVqT3zkBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkedvgddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgpdhmrghrtgdrihhnfhhonecukfhppeekfedrkeeirdekledruddtjeenucfrrghr
    rghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptd
X-ME-Proxy: <xmx:I2o5XVYc53JOHAQ4fpt6X9qU0ncComzcwuNobbeVBil5_P_zESGQgQ>
    <xmx:I2o5XZHPF7BwbKPxH4A9gZCg_zktH2DFSHkMQOygF0vIwRGQe2Vo3A>
    <xmx:I2o5XYYZpnUeHdPlD8KayWAK0Ywg4oaY82s5i9R6Je9i2hRjIf68lg>
    <xmx:I2o5XcZ7006tzFdwAbtalFHAwbgyzxtcDZy006JtBbjguWVg-LENYQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id C197280061;
        Thu, 25 Jul 2019 04:36:50 -0400 (EDT)
Date:   Thu, 25 Jul 2019 10:36:49 +0200
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     John Yost <alleytrotter@gmail.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        bugzilla-daemon@bugzilla.kernel.org,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [bugzilla-daemon@bugzilla.kernel.org: [Bug 204095] New: freeze
 while write on external usb 3.0 hard disk]
Message-ID: <20190725083649.GA18695@kroah.com>
References: <84b75d5f-b636-2f6e-3292-8133854bd6dd@gmail.com>
 <Pine.LNX.4.44L0.1907151345200.1465-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1907151345200.1465-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 15, 2019 at 01:47:44PM -0400, Alan Stern wrote:
> On Mon, 15 Jul 2019, John Yost wrote:
> 
> > On 7/15/19 11:16 AM, Alan Stern wrote:
> > > On Sun, 14 Jul 2019, Theodore Y. Ts'o wrote:
> > > 
> > >> This bug was initially (and wrongly) assigned to the ext4 component,
> > >> when it's very clearly a regression in the USB mass storage driver in
> > >> the 5.2.0 kernel.
> > >>
> > >> For people who hate bugzilla, you can also see the full thread at:
> > >>
> > >> https://lore.kernel.org/linux-ext4/bug-204095-13602@https.bugzilla.kernel.org%2F/T/#ra57c95759df5bee542d85f2541bda87735c09f16
> > > 
> > > I'm not so sure it's a regression in the USB mass-storage driver, but
> > > in any case, it looks very much like the problem fixed by this patch 
> > > (not yet merged):
> > > 
> > > 	https://marc.info/?l=linux-usb&m=156044081619171&w=2
> > > 
> > > Maybe the original bug reporters can try it out and tell us if it 
> > > works.
> > > 
> > > Alan Stern
> > > 
> > 
> > 
> > Thanks for the patch
> > It works for me on 5.2.1
> > John
> 
> Okay, good.
> 
> Greg, it looks like we need to expedite getting this patch into the 
> mainline.

Am working on it now...
