Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2769275F08
	for <lists+linux-usb@lfdr.de>; Wed, 23 Sep 2020 19:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgIWRqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Sep 2020 13:46:40 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:34797 "EHLO
        forward1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726130AbgIWRqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Sep 2020 13:46:39 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id 73CF01940517;
        Wed, 23 Sep 2020 13:46:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 23 Sep 2020 13:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xgAZbC
        oQoNirkiRWp+iZJurkXrxYqX3CLo9LqvidP9A=; b=TKue7ip3GIo4YV9FrBetEW
        BRxLGqoqirYmM/gqFuarrMSQ1f9qbQJbLaYw3x1wdhnmfePoe8Q0cJve/kdooG4K
        TlFihg0Rn5ZTltlhhR/OVbv8gDR7fAKJI9HvQ4Wr8IYd+lOHmR4vBywgHKOyGtJ8
        7qVFqnkQIpElYbl676bWCYRvAMcckYGGwrygIrbJ9A2KKk5mzNdUxjKfgqPH0P55
        eKORilbGnjSPyvqH4XM4shcETgXLJkHFAxzXCRVXvKtRGiN0UqWNt406YUvpz7/n
        iJKyeq1QkvLVs7i4tHT7l3zGzGucEMX5Q85E+RloO417gLTQgX2LU15IZ8CZxk3g
        ==
X-ME-Sender: <xms:_olrX0V-byX20ox6nACe2R3XXmy3q9HFk0LObcMQRt0Mzd0z3FYxOg>
    <xme:_olrX4ndfKHgD0n3M9sUV6uWpwaMBlI7q83_3N_IT2L5QZD0aNP8OcaNl1rHth96R
    eewjrKxiH6j2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgmffjsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgqeenucggtf
    frrghtthgvrhhnpeetvdelgeffgfdutdelvddvtdetffejtefgveevueeggfellefhveev
    feduueduvdenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:_olrX4bB3_BK9qwPDD02heIMlatGgoof6LpDBb3Oy_QgSzg8J4K6uQ>
    <xmx:_olrXzU2j3cQi-YN7gxBxcJ8TNivrdHtXVg5lkBpzlhziqssY64CEg>
    <xmx:_olrX-l2zb0DtnR_dxbVmhrQCTeXKB4E7uvJQ2jVi1v3q4Ure4mbSg>
    <xmx:_olrXyvzIDjCJGsqETWrMeksa08uSXy79bUItbPIUvUHr5l_Iai-yA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id EC256306467E;
        Wed, 23 Sep 2020 13:46:37 -0400 (EDT)
Date:   Wed, 23 Sep 2020 19:46:57 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     himadrispandya@gmail.com, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Subject: Re: [RFC] change the new message to provide for memory allocations
Message-ID: <20200923174657.GA104361@kroah.com>
References: <20200923134348.23862-1-oneukum@suse.com>
 <20200923172103.GC3732240@kroah.com>
 <1600882331.29329.0.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600882331.29329.0.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 23, 2020 at 07:32:11PM +0200, Oliver Neukum wrote:
> Am Mittwoch, den 23.09.2020, 19:21 +0200 schrieb Greg KH:
> > On Wed, Sep 23, 2020 at 03:43:34PM +0200, Oliver Neukum wrote:
> > > Control messages have to work in situtaions where you need to
> > > use GFP_NOIO. Hence wrappers for them that allocate memory must have
> > > an API that allows for that.
> > > 
> > > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > > 
> > 
> > So you unwind my mess and then fix it back up, nice, no objections from
> > me, thanks for doing this.
> > 
> > You sent this as "RFC", but it seems sane, want me to take this as-is or
> > do you want to wait to send a "real" set of patches?
> 
> Hi,
> 
> this is a fairly fundamental API. If we overlooked something the first
> time I would hate to see it happen twice. Are you in a hurry?

No, I just don't want to see more people build on this as-is :)
