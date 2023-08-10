Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBAC776D9F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 03:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbjHJBrS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 21:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbjHJBrR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 21:47:17 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 980531982
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 18:47:15 -0700 (PDT)
Received: (qmail 217443 invoked by uid 1000); 9 Aug 2023 21:47:14 -0400
Date:   Wed, 9 Aug 2023 21:47:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] USB: core: Don't overwrite device descriptor during
 reinitialization
Message-ID: <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 10, 2023 at 12:28:27AM +0000, Thinh Nguyen wrote:
> Hi Alan,
> 
> On Fri, Aug 04, 2023, Alan Stern wrote:
> > An outstanding syzbot bug report has been traced to a race between the
> > routine that reads in the device descriptor for a device being
> > reinitialized and the routine that writes the descriptors to a sysfs
> > attribute file.  The problem is that reinitializing a device, like
> > initializing it for the first time, stores the device descriptor
> > directly in the usb_device structure, where it may be accessed
> > concurrently as part of sending the descriptors to the sysfs reader.
> > 
> > This three-part series fixes the problem:
> > 
> > 	The first patch unites the code paths responsible for first
> > 	reading the device descriptor in hub.c's old scheme and new
> > 	scheme, so that neither of them will call
> > 	usb_get_device_descriptor().
> > 
> > 	The second patch changes usb_get_device_descriptor(), making
> > 	it return the descriptor in a dynamically allocated buffer
> > 	rather than storing it directly in the device structure.
> > 
> > 	The third patch changes hub_port_init(), adding a new argument
> > 	that specifies a buffer in which to store the device
> > 	descriptor for devices being reinitialized.
> > 
> > As a result of these changes, the copy of the device descriptor stored
> > in the usb_device structure will never be overwritten once it has been
> > initialized.  This eliminates the data race causing the bug identified
> > by syzbot.
> > 
> > It would be nice at some point to make a similar change to the code
> > that reads the device's BOS descriptor; reinitialization should not
> > overwrite its existing data either.  This series doesn't attempt to do
> > that, but it would be a good thing to do.
> > 
> 
> Testing from Greg's usb-next branch, this series causes problem with
> device enumeration:
> 
> [   31.650759] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 2 using xhci_hcd
> [   31.663107] usb 2-1: device descriptor read/8, error -71
> [   31.952697] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 3 using xhci_hcd
> [   31.965122] usb 2-1: device descriptor read/8, error -71
> [   32.080991] usb usb2-port1: attempt power cycle
> [   34.826893] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 5 using xhci_hcd
> [   34.839241] usb 2-1: device descriptor read/8, error -71
> [   35.129908] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 6 using xhci_hcd
> [   35.142264] usb 2-1: device descriptor read/8, error -71
> [   35.257155] usb usb2-port1: attempt power cycle
> [   37.258922] usb 1-1: new high-speed USB device number 5 using xhci_hcd
> [   38.115053] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 8 using xhci_hcd
> [   38.127407] usb 2-1: device descriptor read/8, error -71
> [   38.417066] usb 2-1: new SuperSpeed Plus Gen 2x1 USB device number 9 using xhci_hcd
> [   38.429428] usb 2-1: device descriptor read/8, error -71
> [   38.545315] usb usb2-port1: attempt power cycle
> [   43.347312] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 11 using xhci_hcd
> [   43.359659] usb 2-2: device descriptor read/8, error -71
> [   43.649323] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number 12 using xhci_hcd
> [   43.661681] usb 2-2: device descriptor read/8, error -71
> [   43.777566] usb usb2-port2: attempt power cycle
> 
> I was testing with our host along with other common vendor hosts with a
> few 3.x devices. Reverting this series resolves the issue. I didn't do
> extensive tests for various speeds or debug it. I just want to notify
> this first perhaps you can figure out the issue right away.
> 
> I can look into it and provide more info later this week. If you want to
> print any debug, let me know and I can provide later this week.

Thanks for the notification.  The problem is almost certainly caused by 
the first patch in the series, which changes the way that the initial 
read/8 thing is done.  However, I have no idea what part of the patch 
could be causing these errors.  I would appreciate anything you can find 
out.

You should concentrate your initial investigation on the new 
get_bMaxPacketSize0() routine.  In particular, does the -EPROTO error 
value arise as the return value from the usb_control_msg() call, or does 
it happen because of the values stored in buf?  In the first case, how 
does this call differ from the one that used to be made by 
usb_get_device_descriptor()?  And in the second case, what are the 
values of rc, buf->bMaxPacketSize0, and buf->bDescriptorType?

Alan Stern
