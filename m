Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE7EF1394B1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 16:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgAMPVl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 10:21:41 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:56062 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727286AbgAMPVl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 10:21:41 -0500
Received: (qmail 1669 invoked by uid 2102); 13 Jan 2020 10:21:40 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Jan 2020 10:21:40 -0500
Date:   Mon, 13 Jan 2020 10:21:40 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     EJ Hsu <ejh@nvidia.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: uas: fix a plug & unplug racing
In-Reply-To: <1578908680.2590.10.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.2001131018320.1502-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 13 Jan 2020, Oliver Neukum wrote:

> Am Sonntag, den 12.01.2020, 19:30 -0800 schrieb EJ Hsu:
> 
> Hi,
> 
> first, thank you for diagnosing this unusual bug.
> 
> > When a uas disk is plugged into an external hub, uas_probe()
> > will be called by the hub thread to do the probe. It will
> > first create a SCSI host and then do the scan for this host.
> > During the scan, it will probe the LUN using SCSI INQUERY command
> > which will be packed in the URB and submitted to uas disk.
> > 
> > There might be a chance that this external hub with uas disk
> > attached is unplugged during the scan. In this case, uas driver
> > will fail to submit the URB (due to the NOTATTACHED state of uas
> > device) and try to put this SCSI command back to request queue
> > waiting for next chance to run.
> 
> Isn't that the bug? A command to a detached device should fail.
> Could you please elaborate? This issue would not be limited to uas.

> It is not enough to do this in disconnect()
> We are guarded against runtime PM, but not against system sleep.
> You'd need to handle this in suspend() and resume(), too.
> And, unfortunately, the device could be reset from another interface.

This is more or less a copy of the way usb-storage works.  That driver
doesn't have any protection here against suspend/resume or reset, and
it's not clear that any such protection is needed.

> Is this approach really necessary? It solves the problem, but
> if you want to get it right, the corner cases are ugly.

Minimizing the amount of time spent running in the context of the hub 
thread is generally a good thing to do.

Alan Stern

