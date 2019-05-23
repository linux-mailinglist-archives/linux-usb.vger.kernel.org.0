Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBA328438
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 18:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730899AbfEWQuV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 12:50:21 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:34422 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730867AbfEWQuU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 12:50:20 -0400
Received: (qmail 24157 invoked by uid 2102); 23 May 2019 12:50:19 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 23 May 2019 12:50:19 -0400
Date:   Thu, 23 May 2019 12:50:19 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Crash/hung task in usb-storage thread
In-Reply-To: <dca3ea08836e475894bdebc7eb28acff@SVR-IES-MBX-03.mgc.mentorg.com>
Message-ID: <Pine.LNX.4.44L0.1905231245510.1553-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 23 May 2019, Schmid, Carsten wrote:

> Hi USB maintainers,
> 
> we recently have seen a problem with usb-storage when trying to read from a device.
> This happened on a 4.14.86 kernel.
> 
> The kernel's dmesg shows: (log has been submitted via DLT)
> 1200.862250 kernel: usb 1-3.1: reset high-speed USB device number 10 using xhci_hcd
> 1285.466289 kernel: usb 1-3.1: reset high-speed USB device number 10 using xhci_hcd
> 1291.911286 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1292.018079 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1292.043073 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1292.069078 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1292.093066 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528

Since there haven't been any substantive change to usb-storage since 
4.14 was released, there's a good chance this is a problem with 
xhci-hcd.

Is this problem repeatable?  Can you collect a usbmon trace showing 
what happens when the problem occurs?

> There has been a similar bug being fixed in 3.17 kernel series, maybe the bug has been re-introduced?
> https://bugzilla.kernel.org/show_bug.cgi?id=88341

That is _extremely_ unlikely.

> As USB seems to be the causing subsystem, i submit this query here.
> 
> Any idea what could cause this?

The particular error message you got means that the SCSI layer asked 
usb-storage to send a command to the device before the previous command 
was completed.  But without more information there's no way to tell why 
it did this.

Alan Stern

