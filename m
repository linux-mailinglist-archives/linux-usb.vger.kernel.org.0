Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B223F1470A3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 19:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgAWSUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 13:20:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:36046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727278AbgAWSUA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jan 2020 13:20:00 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B098022522;
        Thu, 23 Jan 2020 18:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579803600;
        bh=eCbmFWhr09fdl4lcnriyADrYbS8yDrcUUn4Zzsq6B60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ITVNho+fK4cgtcd/XSxOU7RomUWP+4+hIxvGaDep7bZd94ynRLjdbF8XyZQQtvZ6J
         17cpGnD9nsvBFR4Ph/UzhoH4rU1FdXyabNg6fvFXVLRC/k9xWFwAfB9n+xp66ig60B
         h36Ia6foDl3xeb7KZvcVPFyn9/b3+3WGevETu1wg=
Date:   Thu, 23 Jan 2020 19:19:58 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     EJ Hsu <ejh@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: uas: fix a plug & unplug racing
Message-ID: <20200123181958.GA1930162@kroah.com>
References: <20200122074302.69790-1-ejh@nvidia.com>
 <1579762922.2841.0.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579762922.2841.0.camel@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 23, 2020 at 08:02:02AM +0100, Oliver Neukum wrote:
> Am Dienstag, den 21.01.2020, 23:43 -0800 schrieb EJ Hsu:
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
> > 
> > In normal case, this cycle will terminate when hub thread gets
> > disconnection event and calls into uas_disconnect() accordingly.
> > But in this case, uas_disconnect() will not be called because
> > hub thread of external hub gets stuck waiting for the completion
> > of this SCSI command. A deadlock happened.
> > 
> > In this fix, uas will call scsi_scan_host() asynchronously to
> > avoid the blocking of hub thread.
> > 
> > Signed-off-by: EJ Hsu <ejh@nvidia.com>
> Acked-by: Oliver Neukum <oneukum@suse.com>

EJ can you resend this with Oliver's ack as I lost the original patch in
my archives now as it was so long ago...

thanks,

greg k-h
