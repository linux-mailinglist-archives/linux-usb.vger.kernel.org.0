Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CD4396E35
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 09:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhFAHvu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 03:51:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:60732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232963AbhFAHvu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Jun 2021 03:51:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39E556124B;
        Tue,  1 Jun 2021 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622533809;
        bh=uMwpfeoAsGx1wfEnEmBUJZON7Ze4FXkDpcfa3Dsl+7E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gx8KcOq96q6TuBbmeVNEYEFy4N8Kn7w55+DB6eu6fKfCDkuCS7Q/b2urJ+noLsXe0
         1xXKsXRA/jZChUwsF397uwfbAeWfpO0xZWvVy8th4LTpvlpaQWQ/Am9/0Vf58lMRJR
         hJQ5HxZGvT/cz2N/lSYewcE2jdesBHIX15N3oabpte6pLY6Fma1EmJQrQWkoosMzlX
         3zbOUVwWAEZQ/FmWf/QD17hQG2k+yH8WZQ+YbLF2WNCCQGAjKVvOujGQ8ghW82Ru06
         JLYsCAT36JwrgKpbvbUuaoHMrYvbR7grhIsLMcChV+pBhn0lNF9a3cTCWxW29CwVog
         BMQbNWj4KsGoA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lnzA6-00007o-5u; Tue, 01 Jun 2021 09:50:06 +0200
Date:   Tue, 1 Jun 2021 09:50:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 31, 2021 at 12:38:19PM -0500, Alex Villacís Lasso wrote:
> (Sorry if this is a double-post. Previous message appears to have 
> dissapeared or been rejected in transit. )
> 
> This is a report of the bug report at 
> https://bugzilla.redhat.com/show_bug.cgi?id=1965527. I was asked to post 
> the bisection results by Hans de Goede. Here is the bug information for 
> reference:
> 
> 1. Please describe the problem:
> 
> For my development work, I use several ESP32 boards from Espressif. On
> Fedora, these modules are plugged as USB serial devices, managed via
> the cp210x module, and show under /dev/ttyUSB0 .
> 
> On Fedora 34, up until kernel-5.11.21-300.fc34.x86_64, this setup
> worked correctly.
> 
> Under recently-released kernels kernel-5.12.5-300.fc34.x86_64 and
> kernel-5.12.6-300.fc34.x86_64, this setup is now broken. When I plug
> the board, the module loads as usual and shows up under /dev/ttyUSB0.
> However, *any* attempt to read or write to the port fails. For
> example, using miniterm.py from python3-pyserial-3.4-10.fc34.noarch:
> 
> Traceback (most recent call last):
>    File "/usr/bin/miniterm.py", line 976, in <module>
>      main()
>    File "/usr/bin/miniterm.py", line 932, in main
>      serial_instance.open()
>    File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 288, in open
>      self._update_rts_state()
>    File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 627, in _update_rts_state
>      fcntl.ioctl(self.fd, TIOCMBIS, TIOCM_RTS_str)
> BrokenPipeError: [Errno 32] Broken pipe
> 
> At the same time, the following appears in the system logs:
> 
> may 27 16:04:55 karlalex-asus kernel: usb 1-10: new full-speed USB device number 6 using xhci_hcd
> may 27 16:04:55 karlalex-asus kernel: usb 1-10: New USB device found, idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
> may 27 16:04:55 karlalex-asus kernel: usb 1-10: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> may 27 16:04:55 karlalex-asus kernel: usb 1-10: Product: CP2102N USB to UART Bridge Controller
> may 27 16:04:55 karlalex-asus kernel: usb 1-10: Manufacturer: Silicon Labs
> may 27 16:04:55 karlalex-asus kernel: usb 1-10: SerialNumber: 18c0ecf00d0aea119fe0ae442473482f
> may 27 16:04:55 karlalex-asus mtp-probe[3272]: checking bus 1, device 6: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
> may 27 16:04:55 karlalex-asus mtp-probe[3272]: bus: 1, device: 6 was not an MTP device
> may 27 16:04:55 karlalex-asus kernel: usbcore: registered new interface driver cp210x
> may 27 16:04:55 karlalex-asus kernel: usbserial: USB Serial support registered for cp210x
> may 27 16:04:55 karlalex-asus kernel: cp210x 1-10:1.0: cp210x converter detected
> may 27 16:04:55 karlalex-asus kernel: usb 1-10: cp210x converter now attached to ttyUSB0
> may 27 16:04:55 karlalex-asus mtp-probe[3287]: checking bus 1, device 6: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
> may 27 16:04:55 karlalex-asus mtp-probe[3287]: bus: 1, device: 6 was not an MTP device
> may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
> may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
> may 27 16:04:56 karlalex-asus python3[3292]: detected unhandled Python exception in '/usr/bin/miniterm.py'
> may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
> may 27 16:04:56 karlalex-asus abrt-server[3293]: Deleting problem directory Python3-2021-05-27-16:04:56-3292 (dup of Python3-2021-05-27-14:26:21-17653)
> may 27 16:04:56 karlalex-asus abrt-notification[3312]: [🡕] Process 17653 (miniterm.py) of user 1000 encountered an uncaught BrokenPipeError exception
> 
> The messages with "failed set request..." are abnormal.
> 
> Worked around by downgrading the kernel to any 5.11.x version. Tested
> with kernel-5.11.21-300.fc34.x86_64 and kernel-5.11.12-300.fc34.x86_64

> Module cp210x from kernel 5.11 works without errors with ESP32 when
> compiled under 5.12.x after applying commit
> c5d1448fa353242635fa3e1fed6ab4558e0e7d9a (USB: serial: make remove
> callback return void) on top of it. This allows bisection without
> rebooting.
> 
> 
> Bisection points me to this:
> 
> f61309d9c96a308465bec9d2e5206da265b075a0 is the first bad commit
> commit f61309d9c96a308465bec9d2e5206da265b075a0
> Author: Johan Hovold <johan@kernel.org  <mailto:johan@kernel.org>>
> Date:   Mon Jan 18 12:13:27 2021 +0100
> 
>      USB: serial: cp210x: set IXOFF thresholds
>      
>      At least CP2102 requires the XON/XOFF limits to be initialised in order
>      for software input flow control (IXOFF) to work. Specifically, XOFF is
>      never sent if the XOFF limit is left at its default value of zero.
>      
>      Set the limits so that input is throttled when the FIFO free level drops
>      below 128 bytes and restarted when the FIFO fill level drops below 128
>      bytes.
>      
>      Note that the threshold values have been chosen so that they can be used
>      also with CP2105 which has the smallest FIFO of the currently supported
>      device types (288 byte for the SCI port). If needed the limits can be
>      made device specific later.
>      
>      Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org  <mailto:gregkh@linuxfoundation.org>>
>      Signed-off-by: Johan Hovold <johan@kernel.org  <mailto:johan@kernel.org>>

> If I manually revert commit f61309d9c96a308465bec9d2e5206da265b075a0
> from cp210x.c from 5.12.7, it works correctly. Further proof that this
> commit introduced the bug.

Thanks for the detailed report.

I got another report of this issue off-list a few days ago, but I
haven't got any replies to my follow-up questions from that reporter
yet.

I can't seem to reproduce the issue here and the other reporter only
saw this for some CP2102N which seems to suggest that there's some
interaction with the device configuration at play here too.

The symptoms appear to be consistent with the device still having
hardware flow control enabled while the driver thinks it is disabled.
The IXON/IXOFF limits are set in the same request and this might explain
why things get out of sync, for example, if 128/128 limits are rejected
by your device in its current configuration. But that's still to be
determined.

First, can you enable dynamic debugging in the driver through debugfs:

        echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control

or when loading the module:

        modprobe cp210x dyndbg==p

and send me the logs from when connecting the device and running you
terminal program.

After the terminal program fails, try just to issue a

	cat /dev/ttyUSB0

press control-C and then include the logs for that too.

For completeness, also include the output of

	stty -F /dev/ttyUSB0 -a

after re-connecting the device and before and after running the terminal
program.

Johan
