Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ECF413BC75
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 10:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729463AbgAOJb3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 04:31:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:51784 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729396AbgAOJb3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 04:31:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 96366AE78;
        Wed, 15 Jan 2020 09:31:27 +0000 (UTC)
Message-ID: <1579080683.15925.24.camel@suse.com>
Subject: Re: [PATCH] usb: uas: fix a plug & unplug racing
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     EJ Hsu <ejh@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 15 Jan 2020 10:31:23 +0100
In-Reply-To: <Pine.LNX.4.44L0.2001140956040.1593-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.2001140956040.1593-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 14.01.2020, 10:04 -0500 schrieb Alan Stern:
> On Tue, 14 Jan 2020, Oliver Neukum wrote:
> 
> > Am Dienstag, den 14.01.2020, 03:28 +0000 schrieb EJ Hsu:
> > > Oliver Neukum wrote:
> > > 
> > > > Am Sonntag, den 12.01.2020, 19:30 -0800 schrieb EJ Hsu:
> > > > 
> > > > Isn't that the bug? A command to a detached device should fail.
> > > > Could you please elaborate? This issue would not be limited to uas.
> > > > 
> > > 
> > > In the case I mentioned, the hub thread of external hub running 
> > > uas_probe() will get stuck waiting for the completion of scsi scan. 
> > > 
> > > The scsi scan will try to probe a single LUN using a SCSI INQUIRY.
> > > If the external hub has been unplugged before LUN probe, the device 
> > > state of uas device will be set to USB_STATE_NOTATTACHED by the 
> > > root hub thread. So, all the following calls to usb_submit_urb() in 
> > > uas driver will return -NODEV, and accordingly uas_queuecommand_lck() 
> > > will return SCSI_MLQUEUE_DEVICE_BUSY to scsi_request_fn().
> > 
> > And that looks like the root cause. The queue isn't busy.
> > It is dead.
> 
> No.  The discussion has gotten a little confused.  EJ's point is that
> if SCSI scanning takes place in the context of the hub worker thread,
> then that thread won't be available to process a disconnect
> notification.  The device will be unplugged, but the kernel won't 
> realize it until the SCSI scanning is finished.

OK, I think we have two possible code paths at least

First:
uas_queuecommand_lck() -> uas_submit_urbs() -> -ENODEV -> return
SCSI_MLQUEUE_DEVICE_BUSY

That looks wrong to me.

Second:
The submission actually works and we eventually terminate the URB
with an error. In that case nothing happens and eventually SCSI core
retries, times out and does error handling. 

> > > scsi_request_fn() then puts this scsi command back into request queue.
> > > Because this scsi device is just created and during LUN probe process, 
> > > this scsi command is the only one in the request queue. So, it will be picked
> > > up soon and dispatched to uas driver again. This cycle will continue until
> > > uas_disconnect() is called and its "resetting" flag is set. However, the 
> > > hub thread of external hub still got stuck waiting for the completion of
> > > this scsi command, and may not be able to run uas_disconnect(). 
> > > A deadlock happened.
> > 
> > I see. But we are working around insufficient error reporting in the
> > SCSI midlayer.
> 
> No, the error reporting there is correct.  URBs will complete with
> errors like -EPROTO but no other indication that the device is gone, so
> the midlayer believes that a retry is appropriate.
> 
> Perhaps uas should treat -EPROTO, -EILSEQ, and -ETIME as fatal errors.

They could happen due to bad cables.

Now, another work queue would solve the second error case, but I think
the first error case still exists and we would paper over it.

	Regards
		Oliver
 
