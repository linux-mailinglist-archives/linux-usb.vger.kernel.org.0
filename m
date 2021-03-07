Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125E633031C
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 17:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhCGQ7U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 11:59:20 -0500
Received: from netrider.rowland.org ([192.131.102.5]:60661 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231380AbhCGQ65 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Mar 2021 11:58:57 -0500
Received: (qmail 105428 invoked by uid 1000); 7 Mar 2021 11:58:56 -0500
Date:   Sun, 7 Mar 2021 11:58:56 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Schwarzott <zzam@gentoo.org>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
Subject: Re: Amazon Kindle disconnect after Synchronize Cache
Message-ID: <20210307165856.GA104554@rowland.harvard.edu>
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
 <20210305191437.GC48113@rowland.harvard.edu>
 <2a1f6636-6b57-ccc5-76b3-7eae5e80e7d3@gentoo.org>
 <20210307155236.GB103559@rowland.harvard.edu>
 <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c3121a9-3d0c-60b3-ef17-993b7d2e9149@gentoo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 07, 2021 at 05:52:19PM +0100, Matthias Schwarzott wrote:
> This time Kindle is sde again:
> 
> # dmesg |tail
> [83709.973141] usb-storage 3-4:1.0: USB Mass Storage device detected
> [83709.973226] scsi host8: usb-storage 3-4:1.0
> [83711.028665] scsi 8:0:0:0: Direct-Access     Kindle   Internal Storage
> 0100 PQ: 0 ANSI: 2
> [83711.028792] sd 8:0:0:0: Attached scsi generic sg5 type 0
> [83711.031536] sd 8:0:0:0: Power-on or device reset occurred
> [83711.046604] sd 8:0:0:0: [sde] Attached SCSI removable disk
> [83713.145467] sd 8:0:0:0: [sde] 6688768 512-byte logical blocks: (3.42
> GB/3.19 GiB)
> [83713.364900] sd 8:0:0:0: [sde] Write cache: enabled, read cache: enabled,
> doesn't support DPO or FUA
> [83713.364906] sde: detected capacity change from 0 to 6688768
> [83713.368036]  sde: sde1
> # cat /sys/block/sde/device/power/control
> on
> 
> power/control reports the same value for all sd? devices on this system.

Okay.  Can you collect a usbmon trace showing the events leading up to 
and including a disconnection?

Alan Stern

PS: I suspect the SYNCHRONIZE CACHE commands are correlated with the 
disconnections but don't cause them.  That is, I suspect the 
disconnections happen when the device has been idle -- and generally the 
host computer sends a SYNCHRONIZE CACHE command before idling a 
removable drive.
