Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7F151DFB03
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 22:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbgEWUdu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 16:33:50 -0400
Received: from netrider.rowland.org ([192.131.102.5]:36425 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2387883AbgEWUdu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 May 2020 16:33:50 -0400
Received: (qmail 14328 invoked by uid 1000); 23 May 2020 16:33:49 -0400
Date:   Sat, 23 May 2020 16:33:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Till =?iso-8859-1?Q?D=F6rges?= <doerges@pre-sense.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
Message-ID: <20200523203349.GA12853@rowland.harvard.edu>
References: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
 <20200523154817.GA7091@rowland.harvard.edu>
 <34933b01-e4b0-10da-c935-9e6a9a6ae427@pre-sense.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34933b01-e4b0-10da-c935-9e6a9a6ae427@pre-sense.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 23, 2020 at 10:05:48PM +0200, Till Dörges wrote:
> Hi Alan,
> 
> thanks for the really quick response!
> 
> Am 23.05.20 um 17:48 schrieb Alan Stern:
> 
> >> I'm trying to get external HDDs from Sony to work under Linux with USB 3.0.
> [...]
> >>  - PSZ-HA2T: idVendor=054c, idProduct=087d
> >>  - PSZ-HA1T: idVendor=054c, idProduct=087d
> >>  - PSZ-HA50: idVendor=054c, idProduct=087d
> >>  - PSZ-HC1T: idVendor=054c, idProduct=0c4f
> [...]
> >> I've also tried several of the quirk settings
> >> (https://github.com/torvalds/linux/blob/ead751507de86d90fa250431e9990a8b881f713c/drivers/usb/storage/usb.c#L527).
> > 
> > Unfortunately, the uas driver ignores those settings.

Whoops.  I was wrong about this; uas does indeed use the quirk settings.

> [...]
> > Try adding an entry to the unusual_uas.h file for the device, specifying 
> > the USB_FL_NO_REPORT_OPCODES flag.
> 
> I'm not sure I understand correctly. Do I have to compile the uas Kernel module
> myself if I want to test a flag?
> 
> Because with setting the f flag (via options usb-storage quirks=054c:087d:f) the
> PSZ-HA*1*T starts behaving nicely.
> 
> --- snip ---
> $ cat /sys/module/usb_storage/parameters/quirks
> 054c:087d:f,054c:0c4f:f
> --- snip ---
> 
> 
> The PSZ-HA*2*T, however, still doesn't work with that.
> 
> dmesg shows:
> --- snip ---
> [613960.192066] scsi host5: uas
> [613960.192179] usbcore: registered new interface driver uas
> [613960.195028] usb 6-2: cmd cmplt err -71
> [613980.764509] scsi 5:0:0:0: tag#12 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
> [613980.764513] scsi 5:0:0:0: tag#12 CDB: Inquiry 12 00 00 00 24 00
> [613980.780506] scsi host5: uas_eh_device_reset_handler start
> [613980.910565] usb 6-2: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> [613980.940879] scsi host5: uas_eh_device_reset_handler success
> [613984.957905] scsi 5:0:0:0: Direct-Access     Sony     PSZ-H            320: PQ: 0
> ANSI: 6
> [613990.960817] sd 5:0:0:0: Attached scsi generic sg3 type 0
> [613990.961028] sd 5:0:0:0: [sdb] Spinning up disk...
> [613991.984560] .ready
> [613999.987984] sd 5:0:0:0: [sdb] 281474976710656 512-byte logical blocks: (144
> PB/128 PiB)
> [613999.987988] sd 5:0:0:0: [sdb] 4096-byte physical blocks
> [614001.988698] sd 5:0:0:0: [sdb] Write Protect is off
> [614001.988702] sd 5:0:0:0: [sdb] Mode Sense: 67 00 10 08
> [614005.989956] sd 5:0:0:0: [sdb] Write cache: enabled, read cache: enabled, supports
> DPO and FUA
> [614007.990627] sd 5:0:0:0: [sdb] Optimal transfer size 524287 logical blocks > sd
> driver limit (65535 logical blocks)
> [614008.004886] sd 5:0:0:0: [sdb] Spinning up disk...
> [614009.040540] .ready
> [614056.540501] sd 5:0:0:0: [sdb] tag#13 uas_eh_abort_handler 0 uas-tag 1 inflight:
> CMD IN
> [614056.540507] sd 5:0:0:0: [sdb] tag#13 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00
> 00 00 00 08 00 00
> [614056.556501] scsi host5: uas_eh_device_reset_handler start
> [614056.686376] usb 6-2: reset SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> [614056.716509] scsi host5: uas_eh_device_reset_handler success
> [614066.768485] sd 5:0:0:0: [sdb] tag#13 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD
> [614066.768490] sd 5:0:0:0: [sdb] tag#13 CDB: Test Unit Ready 00 00 00 00 00 00
> [614066.768493] scsi host5: uas_eh_device_reset_handler start
> [614072.144648] xhci_hcd 0000:06:00.0: Timeout while waiting for setup device command
> [614072.353271] usb 6-2: Device not responding to setup address.
> [614072.354062] debugfs: Directory '01' with parent 'devices' already present!

...

> --- snap ---
> 
> 
> Do you have any idea what to try there?

That device seems to be behaving so badly, it's hard to tell what the 
underlying problem is.

I'd start by blacklisting the device for UAS, so forcing it to use 
usb-storage, which is a somewhat simpler protocol.  Next, you should 
collect a usbmon trace showing what happens when you plug in the 
PSZ-HA2T.  That will tell us what's going on, even if it doesn't suggest 
a way to work around the problems.

(The instructions for usbmon are in the kernel source file 
Documentation/usb/usbmon.rst.)

Alan Stern
