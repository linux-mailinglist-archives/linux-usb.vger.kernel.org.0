Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B390129EACC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 12:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgJ2LiN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 07:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgJ2LiI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 07:38:08 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8506C0613CF
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2020 04:38:07 -0700 (PDT)
Date:   Thu, 29 Oct 2020 12:38:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1603971486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MfHAzxVstrafM2LbnhqcV9N5QFZGA0srIT5Crst4usE=;
        b=t4/xbBHIvgIbb0jHa3lq0baqD/BEFyrlg+eSCBLjTy8txmxO8UmuMwito6ALwhOOXoqKkC
        35P9FQXQZxhd1mdS3TPlBZB/AgUWWs6E7zcTD4RYAsxvGoGBgoEl6Ph52ahDtTKdt1mRo9
        atJKkGu6RcgoGYxeBRN+nfT6Iy6Q1ITmd1TKqdkNICr/sbr5bZYocGAvS3laOUQj8xPqkm
        iZEyH4epG4xFmg1IQfSORTIeiQZaX+y9iAnrxTv4hOWYRHq1ttx/OgM7FZ+0r9UYWvc3gm
        wIXR/PAk/e4YX9UyIATJ6ngx1vCZr571hkgfjlp9aJYcJcBB/Sgz+yDWKqkdfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1603971486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MfHAzxVstrafM2LbnhqcV9N5QFZGA0srIT5Crst4usE=;
        b=jz5qNYtDCGBD5OkGTk27jmGOsz00SnhvLEaAn7rl8zAWygW9tJX+9QiYdDgl88DFA2I7NK
        tmsaGMkw/KabxXCg==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mike Galbraith <efault@gmx.de>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Li Jun <jun.li@nxp.com>
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
Message-ID: <20201029113805.tdsissnjq4acemle@linutronix.de>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
 <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
 <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
 <c8a67a65091404e528297ef5c6b9c59cdc03a2c9.camel@gmx.de>
 <a5d5a21c-d6ff-1097-b9ca-e0147658c8c6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a5d5a21c-d6ff-1097-b9ca-e0147658c8c6@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-10-29 13:22:20 [+0200], Mathias Nyman wrote:
> On 29.10.2020 13.11, Mike Galbraith wrote:
> > On Thu, 2020-10-29 at 11:41 +0200, Mathias Nyman wrote:
> >> Can you check if this can be reproduced with 5.9 kernel?
> > 
> > Nope, 5.9.2 didn't reproduce.
> > 
> 
> Very odd.
> It might be hard to reproduce as it requires xhci ring expansion to trigger it,
> meaning at some point there is so much data queued to a device the current ring buffer
> can't fit it.
> 
> Other possibility is that there were some radix tree changes in 5.10-rc1, haven't looked into those.

This came with commit
   673d74683627b ("usb: xhci: add debugfs support for ep with stream")

which is appeared in v5.10-rc1. This hunk below works around it:

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 482fe8c5e3b47..699777fb523b6 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3533,11 +3533,13 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
 		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
 			 udev->slot_id, ep_index);
 		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
-		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
 	}
 	xhci_free_command(xhci, config_cmd);
 	spin_unlock_irqrestore(&xhci->lock, flags);
 
+	for (i = 0; i < num_eps; i++)
+		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
+
 	/* Subtract 1 for stream 0, which drivers can't use */
 	return num_streams - 1;
 
This makes the warning go away here, I'm not 100% sure that this okay.
One thing I noticed: free_streams() does not remove the debugfs file so:
| $ cd /sys/bus/usb/drivers/uas
| $ echo 2-1:1.0 > bind
| $ echo 2-1:1.0 > unbind

and the kernel log shows:
|sd 7:0:0:0: [sdb] Synchronizing SCSI cache
|sd 7:0:0:0: [sdb] Synchronize Cache(10) failed: Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK
|debugfs: File 'stream_id' in directory 'ep07' already present!
|debugfs: File 'stream_context_array' in directory 'ep07' already present!
|debugfs: File 'stream_id' in directory 'ep07' already present!
|debugfs: File 'stream_context_array' in directory 'ep07' already present!
|scsi host7: uas
|scsi 7:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
|sd 7:0:0:0: Attached scsi generic sg2 type 0
|sd 7:0:0:0: [sdb] 262144 512-byte logical blocks: (134 MB/128 MiB)
|sd 7:0:0:0: [sdb] Write Protect is off
|sd 7:0:0:0: [sdb] Mode Sense: 63 00 00 08
|sd 7:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
|sd 7:0:0:0: [sdb] Attached SCSI disk

> -Mathias

Sebastian
