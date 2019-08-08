Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE1686604
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 17:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733288AbfHHPhO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 11:37:14 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:50461 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728380AbfHHPhO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 11:37:14 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 82878447;
        Thu,  8 Aug 2019 11:37:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 08 Aug 2019 11:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=4ex3c4h0E8jpnEKC/wfItoI+aaM
        e2/EFph/b/bQe57c=; b=Gu0FgkZMIfp2ifnnPQNZKALI4PYOzu5XvI9LCVJMvea
        M5zl+6rBchWxctl3oH+xelkHKlTvCo2Dc41nQEG+Wbvm9DfzMENj8gYpxRYqUTTM
        Sgv6vUgThYhIXwj4oYn7CfibL8j0TI+LQM1eXmdlbB5GWEIXLdfTMVIYboQpZzWM
        lYuU43fSFGzteWiRYNUKxedyuE7b35Hjgo3T0Dt+MO0u3grFQIoeQtHIY1KqEaZt
        ZzbjpGCCMODHlgd9Oa/oJO2QEdzGK8wrxemisFtZW2XU1UlQOBQ/9rIMNnBlde2b
        Lvshwfq3RjczwsQfyLCez9sH4NtG1eUW8bF2N5dKYNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4ex3c4
        h0E8jpnEKC/wfItoI+aaMe2/EFph/b/bQe57c=; b=GXOZOXNJtW6qGUG4enZl0m
        6ErcnqtzDzIKJssAGYNVASEizzYanJuWZz4AxkdcEvK2jFjhtNCX11+46hfOGKLc
        VA3/ttp/bjmfqbRoJzhmeIhZyYucxsLGsirL6n/MaZk/cvuWE+ACDWgJf1ZL1Wfc
        dn9W4kJ4r+hERhEAxTjEneFL2E8PKan50uJKErc1BFnUZEbsNNkyDpcYojBWYRsO
        wCEdIAixSjorLz3whchCWmAx2rbpnMTVieZ6foLEIZtaND2DsfHKwU1x+fK/0lVG
        YlT4quI8LHnW5pr2LUNDQvOB32Jat3uigACsl7zxjgPbBul081vqGkFIckjLwE2w
        ==
X-ME-Sender: <xms:pUFMXZ8RiUqDpCZlCIVg4PSSm7X9-R4a-ll3fRGZlgitATuXv1hfFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduhedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:pUFMXR9Q6qPBjwe-m3LVSRscIWjAFvICr3NY6gulEL13_GE8Cp0U-Q>
    <xmx:pUFMXSDk_s5E-fgX3TB-5uy-v7CDKHh032oskzkFRUpMTWszGhH9Iw>
    <xmx:pUFMXRzr-j80wD2e_8bNq8ibDMGOKQQMwabESKQjYM9AmLKG0y3tmw>
    <xmx:pkFMXazV1vfwk4Po_KTUB06D8NyFG9955EaFaG6JJ_-taf5ThvHS0Q>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1E149380085;
        Thu,  8 Aug 2019 11:37:09 -0400 (EDT)
Date:   Thu, 8 Aug 2019 17:37:07 +0200
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usbfs: Add ioctls for runtime power management
Message-ID: <20190808153707.GA15091@kroah.com>
References: <1565163465.8136.36.camel@suse.com>
 <Pine.LNX.4.44L0.1908071013220.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1908071013220.1514-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 07, 2019 at 10:29:50AM -0400, Alan Stern wrote:
> It has been requested that usbfs should implement runtime power
> management, instead of forcing the device to remain at full power as
> long as the device file is open.  This patch introduces that new
> feature.
> 
> It does so by adding three new usbfs ioctls:
> 
> 	USBDEVFS_FORBID_SUSPEND: Prevents the device from going into
> 	runtime suspend (and causes a resume if the device is already
> 	suspended).
> 
> 	USBDEVFS_ALLOW_SUSPEND: Allows the device to go into runtime
> 	suspend.  Some time may elapse before the device actually is
> 	suspended, depending on things like the autosuspend delay.
> 
> 	USBDEVFS_WAIT_FOR_RESUME: Blocks until the call is interrupted
> 	by a signal or at least one runtime resume has occurred since
> 	the most recent ALLOW_SUSPEND ioctl call (which may mean
> 	immediately, even if the device is currently suspended).  In
> 	the latter case, the device is prevented from suspending again
> 	just as if FORBID_SUSPEND was called before the ioctl returns.
> 
> For backward compatibility, when the device file is first opened
> runtime suspends are forbidden.  The userspace program can then allow
> suspends whenever it wants, and either resume the device directly (by
> forbidding suspends again) or wait for a resume from some other source
> (such as a remote wakeup).  URBs submitted to a suspended device will
> fail or will complete with an appropriate error code.
> 
> This combination of ioctls is sufficient for user programs to have
> nearly the same degree of control over a device's runtime power
> behavior as kernel drivers do.
> 
> Still lacking is documentation for the new ioctls.  I intend to add it
> later, after the existing documentation for the usbfs userspace API is
> straightened out into a reasonable form.
> 
> Suggested-by: Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> ---
> 
> v2: Return -EINTR instead of -ERESTARTSYS when proc_wait_for_resume()
> is interrupted by a signal.

Looks great, thanks for doing this.  Now queued up.

greg k-h
