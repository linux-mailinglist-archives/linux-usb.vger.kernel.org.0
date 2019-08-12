Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BAC18A8A8
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 22:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbfHLUwM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 16:52:12 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48139 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726707AbfHLUwM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 16:52:12 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 0D68621C24;
        Mon, 12 Aug 2019 16:52:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 12 Aug 2019 16:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=oUvvoBRuQndmCXcg4PLkeOXQwgs
        GaxiCNpGM6pvY34Q=; b=CizSUJ+KVuJ9P/ujZ+81B4AqKudZsGGdlGVZAnWMAEe
        kHg9fJA4w2vs+ExQj+Tm4i0dl1bLfWrouxXCjw/YhHtm4k1ZaBoGe3C5n+26hQ2d
        Ox/4ddib+c41D3/AtNP+v+atvHY8rQA/2+S5EFdALwf8+76VwxIfYe0V5Myb7O8T
        ENBLQwVCVkXtNVmCH2C2DqvI1ZVDF6/CC8KI6waAYuHoWvk698Zftv8/NqajkbMO
        UNb3iUTy2AeBP8nXOiAoMoyImwRZW2VI9gKnfZf16u7hbrfHfEl5zamlkYLgHBia
        tSy+Q2ikmHGdgOcB7b7fUi5ClmRYZr828RmWkOy6iYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oUvvoB
        RuQndmCXcg4PLkeOXQwgsGaxiCNpGM6pvY34Q=; b=UxtQXuMVtlNqof/Sghqepf
        r4T3H4S+nIyTDwhYi3ckWdsJeUTo1zo/rLglqrejIZuBIwqRNrZ0khtpqLixTQIU
        MBnYnwfa3CO8P8ikzJqFkyTMwoqDScs5txShfW4f50UQ+uzlRAObKaa+pnvqVyAD
        MhITIKhdzPsCi9yWQvNUppmHdFJmRmjB/3s+7rfgOs4BmmeojZEAr9N6C8j0RewV
        s+U4OpW8kMw4sm/B8SjXj0Qb2Un2qVKxpBjtM73ddYGW+3iiSqasWFKTIGt3Dofy
        IMDL8KE92rTbwoz940KxtNVpdFyvY8S3FWZRjcX3q4PD+oBgEgcMKU0uBpSGdJtg
        ==
X-ME-Sender: <xms:etFRXQj-bgQ93hOzZI6arg251uNcXHi43C_arLeszq3Aum5i5yXxoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvgedgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrd
    dutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:etFRXVc-S-3lDcr158c1kUzY9z_kEELj-EO7wdB11kTT0OBbVqwfLA>
    <xmx:etFRXW96oHAkY31ORyo8gFlOXdn7SkcygNH2z9yB7RqG34Lr1oHQUA>
    <xmx:etFRXXbn7yfGK2_azHPzQxozMgOSjlL0QmShmnFzOfcLRvXQO7QEkw>
    <xmx:e9FRXfp9XLkL09Cumt0A_38IwK26w0btHiSSCYLkTZXB0NQOrCEyPg>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9CC2E80061;
        Mon, 12 Aug 2019 16:52:09 -0400 (EDT)
Date:   Mon, 12 Aug 2019 22:52:08 +0200
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>, andreyknvl@google.com,
        bhelgaas@google.com, kirr@nexedi.com, linux@roeck-us.net,
        lkundrak@v3.sk, logang@deltatee.com,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: core: Fix races in character device registration
 and deregistraion
Message-ID: <20190812205208.GA12789@kroah.com>
References: <Pine.LNX.4.44L0.1908091229540.1630-100000@iolanthe.rowland.org>
 <Pine.LNX.4.44L0.1908121607590.1659-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1908121607590.1659-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 12, 2019 at 04:11:07PM -0400, Alan Stern wrote:
> The syzbot fuzzer has found two (!) races in the USB character device
> registration and deregistration routines.  This patch fixes the races.
> 
> The first race results from the fact that usb_deregister_dev() sets
> usb_minors[intf->minor] to NULL before calling device_destroy() on the
> class device.  This leaves a window during which another thread can
> allocate the same minor number but will encounter a duplicate name
> error when it tries to register its own class device.  A typical error
> message in the system log would look like:
> 
>     sysfs: cannot create duplicate filename '/class/usbmisc/ldusb0'
> 
> The patch fixes this race by destroying the class device first.
> 
> The second race is in usb_register_dev().  When that routine runs, it
> first allocates a minor number, then drops minor_rwsem, and then
> creates the class device.  If the device creation fails, the minor
> number is deallocated and the whole routine returns an error.  But
> during the time while minor_rwsem was dropped, there is a window in
> which the minor number is allocated and so another thread can
> successfully open the device file.  Typically this results in
> use-after-free errors or invalid accesses when the other thread closes
> its open file reference, because the kernel then tries to release
> resources that were already deallocated when usb_register_dev()
> failed.  The patch fixes this race by keeping minor_rwsem locked
> throughout the entire routine.
> 
> Reported-and-tested-by: syzbot+30cf45ebfe0b0c4847a1@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>
> 
> ---
> 
> [as1907]

Thanks for this, now queued up.

greg k-h
