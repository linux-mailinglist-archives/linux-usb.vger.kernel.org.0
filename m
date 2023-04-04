Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0AD6D66A8
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 17:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbjDDPBy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 11:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbjDDPBk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 11:01:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F7ED49C9
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 08:01:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 75E7F635A0
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 15:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D06BCC433D2;
        Tue,  4 Apr 2023 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680620442;
        bh=UUzm1zfHKa4YG9s4Iv8D2pUxtmacVnmfdrM6lljr+XQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=asU3SPMFcR5i0sITjUIe1c5FYxrsnAjC2KBcNnExQzylnu1lSD/+jguOYIGKtLaPm
         bxMw0h4l9js8VQUdqncSa9xojJM1yvBVYJuUwuCC5vSV8TFOG7KqplZAniwuwTaD+E
         dGs+N8dYjzUCE43AjvaOq+5ja0AFCMWb1lGQtajBLVRd/YBpeZ7ZZ8azXtJJmrHxc2
         t/o9qSv+82CRqjCCPCnaQ7FF4qX8CXIgsVHlxqIv8RAm/IkLIsP/Q9wuWLmTdSxD9M
         O+MSWeWMwH/JiqHVW+qfFqIyl6z2EZoycZptwO6VsFkFMlnXxhkAsdCtAopJ4ulTfA
         U5y47/wcldWbA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pji9m-0001FS-MV; Tue, 04 Apr 2023 17:01:10 +0200
Date:   Tue, 4 Apr 2023 17:01:10 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZCw7tgI+1rxqnEeY@hovoldconsulting.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <58eaa062-4857-4704-5d5d-ff6ea069e899@suse.com>
 <ZCwYYb/GkE8x6snr@hovoldconsulting.com>
 <f11fc9b8-db9b-495b-9b95-b9ae67e288d5@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f11fc9b8-db9b-495b-9b95-b9ae67e288d5@rowland.harvard.edu>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 04, 2023 at 10:29:31AM -0400, Alan Stern wrote:
> On Tue, Apr 04, 2023 at 02:30:25PM +0200, Johan Hovold wrote:
> > On Tue, Apr 04, 2023 at 02:07:22PM +0200, Oliver Neukum wrote:
> > > On 04.04.23 13:43, Johan Hovold wrote:
> > > 
> > > > The device is being used; by the driver and ultimately by a user telling
> > > 
> > > I am afraid that is just an assumption we cannot make. The user may just as
> > > well be reading a device state before a device is being used as that may matter.
> > 
> > It's a perfectly valid assumption to make, and it is was all drivers do
> > for debugfs (as well as sysfs). You are the one arguing for making an
> > exception, which I don't think is warranted.
> > 
> > > > the driver to do something on their behalf. The fact that the user is
> > > > initiating an action through an interface which intended for debugging
> > > > should not matter (and the user always has the option to check the
> > > > runtime pm state before initiating the action if that matters at all).
> > > 
> > > 1. That is a race condition.
> > 
> > Sure, but you can't have it both ways. Your proposed inverted logic is
> > racy as you may or may not get any data.
> > 
> > > 2. Quite a lot of bugs we are looking at involve power transitions.
> > > You just cannot assume that a device will react the same way if it was
> > > waken up between events.
> > 
> > Then just don't use the interface if you for whatever reason don't want
> > to wake the device up.
> 
> For what it's worth, the ehci-hcd driver tests (under its private 
> spinlock) whether the hardware is accessible -- i.e., not suspended -- 
> before trying to carry out any debugfs operations that would use the 
> device registers.  If not, all you get is something like:
> 
> 	bus <buspath>, device <devname>
> 	<description>
> 	SUSPENDED (no register access)

Thanks, I only grepped the tree for drivers using runtime pm directly in
their debugfs callbacks so I missed this. Apparently, ohci and uhci do
the same. And when resources are not managed using runtime PM, I guess
there is no other good alternative.

The xhci driver on the other hand, do appear to call
pm_runtime_get_sync() before accessing registers through debugfs (e.g.
see debugfs_regset32_show).

Johan
