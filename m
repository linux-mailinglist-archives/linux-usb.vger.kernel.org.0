Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0220413AC7E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2020 15:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgANOln (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 09:41:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:56086 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbgANOln (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 09:41:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3E417BED6;
        Tue, 14 Jan 2020 14:41:41 +0000 (UTC)
Message-ID: <1579012899.15925.7.camel@suse.com>
Subject: Re: [PATCH] usb: uas: fix a plug & unplug racing
From:   Oliver Neukum <oneukum@suse.com>
To:     EJ Hsu <ejh@nvidia.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Tue, 14 Jan 2020 15:41:39 +0100
In-Reply-To: <MN2PR12MB4126334FBC97B5AC4CC442AECF340@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <20200113033035.50875-1-ejh@nvidia.com>
         <1578908680.2590.10.camel@suse.com>
         <MN2PR12MB4126334FBC97B5AC4CC442AECF340@MN2PR12MB4126.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 14.01.2020, 03:28 +0000 schrieb EJ Hsu:
> Oliver Neukum wrote:
> 
> > Am Sonntag, den 12.01.2020, 19:30 -0800 schrieb EJ Hsu:
> > 
> > Isn't that the bug? A command to a detached device should fail.
> > Could you please elaborate? This issue would not be limited to uas.
> > 
> 
> In the case I mentioned, the hub thread of external hub running 
> uas_probe() will get stuck waiting for the completion of scsi scan. 
> 
> The scsi scan will try to probe a single LUN using a SCSI INQUIRY.
> If the external hub has been unplugged before LUN probe, the device 
> state of uas device will be set to USB_STATE_NOTATTACHED by the 
> root hub thread. So, all the following calls to usb_submit_urb() in 
> uas driver will return -NODEV, and accordingly uas_queuecommand_lck() 
> will return SCSI_MLQUEUE_DEVICE_BUSY to scsi_request_fn().

And that looks like the root cause. The queue isn't busy.
It is dead.

> scsi_request_fn() then puts this scsi command back into request queue.
> Because this scsi device is just created and during LUN probe process, 
> this scsi command is the only one in the request queue. So, it will be picked
> up soon and dispatched to uas driver again. This cycle will continue until
> uas_disconnect() is called and its "resetting" flag is set. However, the 
> hub thread of external hub still got stuck waiting for the completion of
> this scsi command, and may not be able to run uas_disconnect(). 
> A deadlock happened.

I see. But we are working around insufficient error reporting in the
SCSI midlayer.

> > > +static void uas_scan_work(struct work_struct *work) {
> > > +     struct uas_dev_info *devinfo =
> > > +             container_of(work, struct uas_dev_info, scan_work);
> > > +     struct Scsi_Host *shost = usb_get_intfdata(devinfo->intf);
> > > +
> > > +     dev_dbg(&devinfo->intf->dev, "starting scan\n");
> > > +     scsi_scan_host(shost);
> > > +     dev_dbg(&devinfo->intf->dev, "scan complete\n");
> > > +
> > > +     usb_autopm_put_interface(devinfo->intf);
> > 
> > scsi_scan_host() does runtime PM on the SCSI level. There is no need for us to
> > duplicate that.
> > 
> 
> In my opinion, if scsi_scan_host() will be run asynchronously, this interface 
> needs to be guarded against runtime PM between uas_probe() & uas_scan_work().

Yes it does. But it has a child, the SCSI host, which has an elevated
count. It is already guarded.

	Regards
		Oliver

