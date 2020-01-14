Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7C813AD03
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 16:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgANPEv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 10:04:51 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:50472 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726450AbgANPEv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jan 2020 10:04:51 -0500
Received: (qmail 1702 invoked by uid 2102); 14 Jan 2020 10:04:49 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 14 Jan 2020 10:04:49 -0500
Date:   Tue, 14 Jan 2020 10:04:49 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     EJ Hsu <ejh@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: uas: fix a plug & unplug racing
In-Reply-To: <1579012899.15925.7.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.2001140956040.1593-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 14 Jan 2020, Oliver Neukum wrote:

> Am Dienstag, den 14.01.2020, 03:28 +0000 schrieb EJ Hsu:
> > Oliver Neukum wrote:
> > 
> > > Am Sonntag, den 12.01.2020, 19:30 -0800 schrieb EJ Hsu:
> > > 
> > > Isn't that the bug? A command to a detached device should fail.
> > > Could you please elaborate? This issue would not be limited to uas.
> > > 
> > 
> > In the case I mentioned, the hub thread of external hub running 
> > uas_probe() will get stuck waiting for the completion of scsi scan. 
> > 
> > The scsi scan will try to probe a single LUN using a SCSI INQUIRY.
> > If the external hub has been unplugged before LUN probe, the device 
> > state of uas device will be set to USB_STATE_NOTATTACHED by the 
> > root hub thread. So, all the following calls to usb_submit_urb() in 
> > uas driver will return -NODEV, and accordingly uas_queuecommand_lck() 
> > will return SCSI_MLQUEUE_DEVICE_BUSY to scsi_request_fn().
> 
> And that looks like the root cause. The queue isn't busy.
> It is dead.

No.  The discussion has gotten a little confused.  EJ's point is that
if SCSI scanning takes place in the context of the hub worker thread,
then that thread won't be available to process a disconnect
notification.  The device will be unplugged, but the kernel won't 
realize it until the SCSI scanning is finished.

> > scsi_request_fn() then puts this scsi command back into request queue.
> > Because this scsi device is just created and during LUN probe process, 
> > this scsi command is the only one in the request queue. So, it will be picked
> > up soon and dispatched to uas driver again. This cycle will continue until
> > uas_disconnect() is called and its "resetting" flag is set. However, the 
> > hub thread of external hub still got stuck waiting for the completion of
> > this scsi command, and may not be able to run uas_disconnect(). 
> > A deadlock happened.
> 
> I see. But we are working around insufficient error reporting in the
> SCSI midlayer.

No, the error reporting there is correct.  URBs will complete with
errors like -EPROTO but no other indication that the device is gone, so
the midlayer believes that a retry is appropriate.

Perhaps uas should treat -EPROTO, -EILSEQ, and -ETIME as fatal errors.

Alan Stern

