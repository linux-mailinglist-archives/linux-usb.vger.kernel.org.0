Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C18E1433D71
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 19:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbhJSR1q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 13:27:46 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56753 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234524AbhJSR1p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 13:27:45 -0400
Received: (qmail 1088844 invoked by uid 1000); 19 Oct 2021 13:25:31 -0400
Date:   Tue, 19 Oct 2021 13:25:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     mark_k@iname.com
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: USB2 Link USB-SCSI converter and LUNs
Message-ID: <20211019172531.GA1088438@rowland.harvard.edu>
References: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
 <YW6pjieI5UwOM9LW@kroah.com>
 <trinity-7db5ef0c-99a3-4fa0-a1d7-1e57c80cc4ff-1634648008985@3c-app-mailcom-lxa13>
 <YW7BtIHwVH3n13yH@kroah.com>
 <trinity-5eaf7ea7-ff39-498d-b5cc-844177c47b48-1634661477272@3c-app-mailcom-lxa06>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-5eaf7ea7-ff39-498d-b5cc-844177c47b48-1634661477272@3c-app-mailcom-lxa06>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 06:37:57PM +0200, mark_k@iname.com wrote:
> I rebuilt the usb-storage module after adding an entry for the USB2 Link to
> unusual_devs.h.
> 
> With one SCSI device set to ID 0, the kernel detected the drive and I could
> access it:
> 
> [ 2219.761126] usb-storage 2-1:1.0: USB Mass Storage device detected
> [ 2219.762033] scsi host5: usb-storage 2-1:1.0
> [ 2219.762163] usbcore: registered new interface driver usb-storage
> [ 2220.769695] scsi 5:0:0:0: Optical Device    HP       C1113M           1.19 PQ: 0 ANSI: 2
> [ 2221.156254] usb 2-1: reset high-speed USB device number 5 using ehci-pci
> [ 2221.712223] usb 2-1: reset high-speed USB device number 5 using ehci-pci
> [ 2222.268262] usb 2-1: reset high-speed USB device number 5 using ehci-pci
> [ 2222.824239] usb 2-1: reset high-speed USB device number 5 using ehci-pci
> [ 2222.981475] sd 5:0:0:0: Attached scsi generic sg2 type 7
> [ 2222.987240] sd 5:0:0:0: [sdb] Attached SCSI removable disk
> 
> 
> Note the extra "reset high-speed..." lines, probably due to the kernel
> trying to access LUNs 1 to 5 (which the USB2 Link maps to accesses to non-
> existent SCSI targets 1-5). Is that harmless?

To really find out what's going on, you should collect a usbmon trace 
showing what happens when the device is plugged in.

> [As mentioned before, the USB2 Link reports its Max LUN as 6.]
> 
> 
> > > It could/should be possible to properly support multiple targets and LUNs
> > > by using a similar method to the SCM USB-SCSI converters. (Those, after a
> > > special intitialisation request, take the target ID from the *upper* 4 bits
> > > of CBW byte 13.)
> >
> > Are you sure this device actually supports this?  If so, what operating
> > system does it work on?
> 
> It does definitely support that. I installed the manufacturer driver on
> (32-bit) Windows and looked at USBpcap captures. I also disassembled the
> driver.
> 
> Do you think it would be worthwhile submitting a patch adding the USB2
> Link to unusual-devs.h? If those reset... lines aren't acceptable I could
> add US_FL_SINGLE_LUN, but that would only allow it to work with a single
> SCSI device (set to ID 0).
> 
> Or should I try and get proper/full support (multiple targets and LUNs)
> working first?

Either approach would be acceptable.  If you do implement the 
full-support approach, you should imitate the scheme used for the 
US_FL_SCM_MULT_TARG flag.  But you may find it's not worth the trouble.  
After all, how often will people want to chain together more than seven 
devices to one of these things?

Alan Stern
