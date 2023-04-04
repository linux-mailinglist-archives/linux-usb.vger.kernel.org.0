Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472946D6554
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 16:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbjDDO3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 10:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbjDDO3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 10:29:33 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1EC68E75
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 07:29:32 -0700 (PDT)
Received: (qmail 364615 invoked by uid 1000); 4 Apr 2023 10:29:31 -0400
Date:   Tue, 4 Apr 2023 10:29:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Johan Hovold <johan@kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <f11fc9b8-db9b-495b-9b95-b9ae67e288d5@rowland.harvard.edu>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <58eaa062-4857-4704-5d5d-ff6ea069e899@suse.com>
 <ZCwYYb/GkE8x6snr@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCwYYb/GkE8x6snr@hovoldconsulting.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 04, 2023 at 02:30:25PM +0200, Johan Hovold wrote:
> On Tue, Apr 04, 2023 at 02:07:22PM +0200, Oliver Neukum wrote:
> > 
> > 
> > On 04.04.23 13:43, Johan Hovold wrote:
> > 
> > > The device is being used; by the driver and ultimately by a user telling
> > 
> > I am afraid that is just an assumption we cannot make. The user may just as
> > well be reading a device state before a device is being used as that may matter.
> 
> It's a perfectly valid assumption to make, and it is was all drivers do
> for debugfs (as well as sysfs). You are the one arguing for making an
> exception, which I don't think is warranted.
> 
> > > the driver to do something on their behalf. The fact that the user is
> > > initiating an action through an interface which intended for debugging
> > > should not matter (and the user always has the option to check the
> > > runtime pm state before initiating the action if that matters at all).
> > 
> > 1. That is a race condition.
> 
> Sure, but you can't have it both ways. Your proposed inverted logic is
> racy as you may or may not get any data.
> 
> > 2. Quite a lot of bugs we are looking at involve power transitions.
> > You just cannot assume that a device will react the same way if it was
> > waken up between events.
> 
> Then just don't use the interface if you for whatever reason don't want
> to wake the device up.

For what it's worth, the ehci-hcd driver tests (under its private 
spinlock) whether the hardware is accessible -- i.e., not suspended -- 
before trying to carry out any debugfs operations that would use the 
device registers.  If not, all you get is something like:

	bus <buspath>, device <devname>
	<description>
	SUSPENDED (no register access)

Alan Stern
