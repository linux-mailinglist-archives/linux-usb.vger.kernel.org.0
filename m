Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C583B43386C
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 16:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhJSOeo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 10:34:44 -0400
Received: from netrider.rowland.org ([192.131.102.5]:35673 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229524AbhJSOeo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 10:34:44 -0400
Received: (qmail 1082743 invoked by uid 1000); 19 Oct 2021 10:32:29 -0400
Date:   Tue, 19 Oct 2021 10:32:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     mark_k@iname.com
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 Link USB-SCSI converter and LUNs
Message-ID: <20211019143229.GA1082114@rowland.harvard.edu>
References: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 12:15:09PM +0200, mark_k@iname.com wrote:
> Hi,
> 
> I have a Core Micro Systems USB2 Link USB-SCSI converter (07B4:0380).
> 
> Adding an entry to unusual_devs.h should get it to work, just needing
> USB_PR_BULK. That should at least allow the connected device with SCSI ID 0
> to be accessed.
> 
> However in order to access multiple targets and LUNs, the USB2 Link uses
> byte 13 of the command block wrapper in a special way.
> 
> Normally CBW byte 13 has bCBWLUN in bits [3:0] with bits [7:4] reserved.
> The USB2 Link expects the target ID in bits [3:0] and LUN in bits [7:4].

Why on earth does it use such a non-standard protocol?  After all, the 
USB mass-storage specifications have been available since 1999 or 
earlier!  And they haven't exactly been kept secret during all that 
time.

> The advantage of that is, it should be possible to access multiple targets
> without needing to modify the USB mass storage driver. (It returns 0x06 to
> a Get Max LUN request since its SCSI ID is hard-coded to 7.)
> 
> Being able to access non-zero actual LUNs would of course require changes
> to the driver.
> 
> I'm just wondering, how does the usb-storage driver handle these cases:
> 
>  - (What it thinks are) LUNs are not contiguous. Suppose the user has two
>    SCSI devices in the chain, one with ID 0 the other with ID 3. Would it
>    scan LUNs (which map to separate targets) 1, 2, 4, 5 and 6? Or would it
>    give up on getting no response from LUN 1?

This is not handled by usb-storage at all; it is handled by the SCSI 
core.  My memory of what the SCSI core does is old (so a little 
unreliable) and possibly out of date, but here it is:

The handling of non-contiguous LUNs may depend on which SCSI level the 
device claims to support.  However, in many cases the LUN scan does stop 
when no response is received.

>  - "LUN" 0 is not present. E.g. where the connected SCSI devices have IDs 1
>    and 3.

If there's no LUN 0 then the SCSI layer will give up on the target 
entirely.

>  - When different "LUNs" are completely different devices (e.g. one a
>    CD-ROM, another a hard disk, another a tape drive).

No matter.  Each LUN can have its own individual device type.

Alan Stern
