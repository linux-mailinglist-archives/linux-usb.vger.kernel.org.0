Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8D91E680F
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 19:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405293AbgE1RFL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 13:05:11 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60531 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2405191AbgE1RFK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 13:05:10 -0400
Received: (qmail 17452 invoked by uid 1000); 28 May 2020 13:05:09 -0400
Date:   Thu, 28 May 2020 13:05:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Zebediah Figura <zfigura@codeweavers.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
Subject: Re: Bug 207877: ASMedia drive (174c:55aa) hangs in ioctl
 CDROM_DRIVE_STATUS when mounting a DVD
Message-ID: <20200528170509.GC14188@rowland.harvard.edu>
References: <7d0b20b9-4735-bbed-bb50-72764aefd6d8@codeweavers.com>
 <20200528075440.GA2881385@kroah.com>
 <465eaae3-fa60-f37e-1d62-c52236720798@codeweavers.com>
 <20200528160420.GA14188@rowland.harvard.edu>
 <232b68f8-9a5c-89fd-2e12-bf63f49dbe38@codeweavers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <232b68f8-9a5c-89fd-2e12-bf63f49dbe38@codeweavers.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Thanks, I've attached a usbmon trace to the bug. It seems the kernel submits
> a bulk input transfer that never receives a response. I hope my drive isn't
> broken...

Did you wait for thirty seconds after that final bulk input transfer 
started?  It should have been aborted at that point, just like the two 
previous transfer attempts.  There might be a bad sector on the disc you 
were trying to read; all three attempts seem to have failed at the same 
place.

I get the impression that the SCSI error handler may have tried to reset 
the device without first aborting the current transfer.  But it's not 
easy to tell if that's what really happened.  You might be able to get 
more information by enabling CONFIG_USB_STORAGE_DEBUG and rebuilding the 
usb-storage driver, or by turning on SCSI debugging.

Alan Stern
