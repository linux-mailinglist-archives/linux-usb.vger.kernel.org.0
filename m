Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CE643348F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 13:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235309AbhJSLUy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 07:20:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:53590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230281AbhJSLUy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 07:20:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1615C60EFF;
        Tue, 19 Oct 2021 11:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634642321;
        bh=m7/TU6tsys8Z48fYR4T1Ntgnf6sAopDPJvkYB2AmNos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MCcTuJoCIbpwopiLjD5WcKG06bAzxb7pBo4yaSfjI1almMVY3vTjdlrdIOPqXbfrt
         ZJiTWOBb0Hb14ijtnFg6Dy4nLr7OfO0NZ1gjx0XnvmiifkjSz7Y5k6T05xVh+Nv0VV
         R4ag377tpX88kd/HOpCRgzMru9jEz06+6XDp9ItY=
Date:   Tue, 19 Oct 2021 13:18:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     mark_k@iname.com
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 Link USB-SCSI converter and LUNs
Message-ID: <YW6pjieI5UwOM9LW@kroah.com>
References: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
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

Why do you need any quirk at all for this?

> However in order to access multiple targets and LUNs, the USB2 Link uses
> byte 13 of the command block wrapper in a special way.
> 
> Normally CBW byte 13 has bCBWLUN in bits [3:0] with bits [7:4] reserved.
> The USB2 Link expects the target ID in bits [3:0] and LUN in bits [7:4].
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
> 
>  - "LUN" 0 is not present. E.g. where the connected SCSI devices have IDs 1
>    and 3.
> 
>  - When different "LUNs" are completely different devices (e.g. one a
>    CD-ROM, another a hard disk, another a tape drive).
> 

That should all be up to the scsi layer in the kernel.  If this device
is not following the standard, how is it supposed to work at all?

Does it require custom drivers for other operating systems?

thanks,

greg k-h
