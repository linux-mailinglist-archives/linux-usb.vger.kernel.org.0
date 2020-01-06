Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 459DB131868
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 20:13:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgAFTNC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 14:13:02 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:40339 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726683AbgAFTNC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 14:13:02 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 466605EC;
        Mon,  6 Jan 2020 14:13:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 06 Jan 2020 14:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=N7FOi0xO7UoaUaiaxDe/pM4LSbg
        0AHzDiD7DL1qw2EY=; b=dk0dJcL3s3f4t5WHbtzVBUy/y8DvgczXeRR4tFeFjCy
        k0xnlnqqAMrYnThKYJ17y0hK1G1mJxB5tU8qu4JC590Je2OQzVXQDj/oGXAo/1uG
        3U3ummxlvBCClp+AO8U91rdwpDXwbIA1dsm5BBs6PJIfg6zTP1tzmNCf+OuLijVj
        eEVQJaD7fv/NXQknspW8j0cTx7hfcf8wyQL5xUSaC846YLUIcZLv7RhFnz4McK9y
        I0rd94o3oxaoulSO4HwGpsTsdZJcfgRjVY05nLGOcPO+XxW89YfaeLgkXxW0dWgA
        VClX9JKpBbGaMs5aUqEN25Y0d8HFIZt/7HoXmoycsDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N7FOi0
        xO7UoaUaiaxDe/pM4LSbg0AHzDiD7DL1qw2EY=; b=OlBfkODD2ZgKKswfKpjlGL
        er6YU4Zk2o6PkaQC00opWBnceUwQecuur0tEAlWl/cXQt56vi+2yw2pRb+APS1jl
        rF7PyTAEONezJFEKuLuTMXgBKegAnWJ8ySHqv/OJAzWMP+KLA7bt0z81zoKObOdm
        0xYnZw20q2zXukX9ZHaYgLP4DgtZaVo5s1sRJE1i09GyldSvhi2soCUgQUB5h1uH
        Qm7wIY7MEyhxfQXs1gzR6qHPqi6yjhsC+ZdGqVawSFWw/MGxPrAAy5UAnsZb8x4i
        kC1PjsUwKltppZNXtnDkfK6Mgi7z1FJhA7Tv5q+ClVfRxOI/sh8gadNWScj7AVTQ
        ==
X-ME-Sender: <xms:vIYTXh-PpICzq_cKmk71-VFEueSpnGk_o-5dUsR4QYIz1_MCHrY6UA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuffhomhgrihhnpehmrghrtgdrih
    hnfhhonecukfhppeekfedrkeeirdekledruddtjeenucfrrghrrghmpehmrghilhhfrhho
    mhepghhrvghgsehkrhhorghhrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:vIYTXoxg5PAMECX_GSl3RDWbHOcmAaSjReNQ3JGnAGKYKM_1N8K6_w>
    <xmx:vIYTXuSpp-xVa-B9YcZLfrMYK8XEYVhrDoqYXBE7p23sVyt0p0C9xg>
    <xmx:vIYTXjKFan3YnaGAsqas9NtvLfcHT_nRsQXtVx-Qql_4cyHqV4NH4A>
    <xmx:vIYTXiClsOa057kvYmLkgrXjEXM6HmwU--DnHOddpCHNQXdEU7zMzA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1BD5280064;
        Mon,  6 Jan 2020 14:13:00 -0500 (EST)
Date:   Mon, 6 Jan 2020 20:12:58 +0100
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Johan Hovold <johan@kernel.org>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Takashi Iwai <tiwai@suse.de>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: Fix: Don't skip endpoint descriptors with
 maxpacket=0
Message-ID: <20200106191258.GA714484@kroah.com>
References: <20200106160315.GA30908@localhost>
 <Pine.LNX.4.44L0.2001061116320.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001061116320.1514-100000@iolanthe.rowland.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 06, 2020 at 11:17:12AM -0500, Alan Stern wrote:
> On Mon, 6 Jan 2020, Johan Hovold wrote:
> 
> > On Mon, Jan 06, 2020 at 10:43:42AM -0500, Alan Stern wrote:
> > > It turns out that even though endpoints with a maxpacket length of 0
> > > aren't useful for data transfer, the descriptors do serve other
> > > purposes.  In particular, skipping them will also skip over other
> > > class-specific descriptors for classes such as UVC.  This unexpected
> > > side effect has caused some UVC cameras to stop working.
> > > 
> > > In addition, the USB spec requires that when isochronous endpoint
> > > descriptors are present in an interface's altsetting 0 (which is true
> > > on some devices), the maxpacket size _must_ be set to 0.  Warning
> > > about such things seems like a bad idea.
> > > 
> > > This patch updates an earlier commit which would log a warning and
> > > skip these endpoint descriptors.  Now we only log a warning, and we
> > > don't even do that for isochronous endpoints in altsetting 0.
> > > 
> > > We don't need to worry about preventing endpoints with maxpacket = 0
> > > from ever being used for data transfers; usb_submit_urb() already
> > > checks for this.
> > > 
> > > Reported-and-tested-by: Roger Whittaker <Roger.Whittaker@suse.com>
> > > Fixes: d482c7bb0541 ("USB: Skip endpoints with 0 maxpacket length")
> > > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > > CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Link: https://marc.info/?l=linux-usb&m=157790377329882&w=2
> > 
> > Acked-by: Johan Hovold <johan@kernel.org>
> > 
> > We also need
> > 
> > Cc: stable <stable@vger.kernel.org>
> > 
> > as d482c7bb0541 ("USB: Skip endpoints with 0 maxpacket length") ended up
> > being (auto- ?) selected for stable.
> 
> Absolutely -- I had intended to add that CC: but it slipped my mind 
> when the email was being prepared.

I'll catch this when it hits Linus's tree.

thanks,

greg k-h
