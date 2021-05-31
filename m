Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7FA396745
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 19:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhEaRk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 13:40:29 -0400
Received: from mail.palosanto.com ([181.39.87.190]:44868 "EHLO palosanto.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233534AbhEaRkK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 13:40:10 -0400
Received: from localhost (mail.palosanto.com [127.0.0.1])
        by palosanto.com (Postfix) with ESMTP id D2C0B13C1EC9
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 12:38:23 -0500 (-05)
X-Virus-Scanned: Debian amavisd-new at mail.palosanto.com
Received: from palosanto.com ([127.0.0.1])
        by localhost (mail.palosanto.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nCHrJwoZhYCx for <linux-usb@vger.kernel.org>;
        Mon, 31 May 2021 12:38:17 -0500 (-05)
Received: from [192.168.0.105] (unknown [191.99.3.5])
        by palosanto.com (Postfix) with ESMTPSA id A944E13C1D90
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 12:38:17 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=palosanto.com;
        s=mail; t=1622482697;
        bh=/6p3akwMbB5l3Kcg9XiDT4Ozr3wFrGbzyPUQe+8rR6I=;
        h=To:From:Subject:Date:From;
        b=uSxxmLyY+64EqSGy8PNk+e/5Lctj94LgPBHQEa7259DTPmRjoL0syzBTLG3h2w5Cj
         pF8f+819aeOYgLjzp2br9R7BkDmYwHc01eN3hvqmdIRDTEgfopqJN9GzZFJTGZgl2r
         ZNS/XtnNmgR/Y+x/9n1yac2RbJDtAYNLuMtXJ2zw=
To:     linux-usb@vger.kernel.org
From:   =?UTF-8?Q?Alex_Villac=c3=ads_Lasso?= <a_villacis@palosanto.com>
Subject: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with
 bisection)
Message-ID: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
Date:   Mon, 31 May 2021 12:38:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(Sorry if this is a double-post. Previous message appears to have 
dissapeared or been rejected in transit. )

This is a report of the bug report at 
https://bugzilla.redhat.com/show_bug.cgi?id=1965527. I was asked to post 
the bisection results by Hans de Goede. Here is the bug information for 
reference:

1. Please describe the problem:

For my development work, I use several ESP32 boards from Espressif. On Fedora, these modules are plugged as USB serial devices, managed via the cp210x module, and show under /dev/ttyUSB0 .

On Fedora 34, up until kernel-5.11.21-300.fc34.x86_64, this setup worked correctly.

Under recently-released kernels kernel-5.12.5-300.fc34.x86_64 and kernel-5.12.6-300.fc34.x86_64, this setup is now broken. When I plug the board, the module loads as usual and shows up under /dev/ttyUSB0. However, *any* attempt to read or write to the port fails. For example, using miniterm.py from python3-pyserial-3.4-10.fc34.noarch:

Traceback (most recent call last):
   File "/usr/bin/miniterm.py", line 976, in <module>
     main()
   File "/usr/bin/miniterm.py", line 932, in main
     serial_instance.open()
   File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 288, in open
     self._update_rts_state()
   File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 627, in _update_rts_state
     fcntl.ioctl(self.fd, TIOCMBIS, TIOCM_RTS_str)
BrokenPipeError: [Errno 32] Broken pipe

At the same time, the following appears in the system logs:

may 27 16:04:55 karlalex-asus kernel: usb 1-10: new full-speed USB device number 6 using xhci_hcd
may 27 16:04:55 karlalex-asus kernel: usb 1-10: New USB device found, idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
may 27 16:04:55 karlalex-asus kernel: usb 1-10: New USB device strings: Mfr=1, Product=2, SerialNumber=3
may 27 16:04:55 karlalex-asus kernel: usb 1-10: Product: CP2102N USB to UART Bridge Controller
may 27 16:04:55 karlalex-asus kernel: usb 1-10: Manufacturer: Silicon Labs
may 27 16:04:55 karlalex-asus kernel: usb 1-10: SerialNumber: 18c0ecf00d0aea119fe0ae442473482f
may 27 16:04:55 karlalex-asus mtp-probe[3272]: checking bus 1, device 6: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
may 27 16:04:55 karlalex-asus mtp-probe[3272]: bus: 1, device: 6 was not an MTP device
may 27 16:04:55 karlalex-asus kernel: usbcore: registered new interface driver cp210x
may 27 16:04:55 karlalex-asus kernel: usbserial: USB Serial support registered for cp210x
may 27 16:04:55 karlalex-asus kernel: cp210x 1-10:1.0: cp210x converter detected
may 27 16:04:55 karlalex-asus kernel: usb 1-10: cp210x converter now attached to ttyUSB0
may 27 16:04:55 karlalex-asus mtp-probe[3287]: checking bus 1, device 6: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
may 27 16:04:55 karlalex-asus mtp-probe[3287]: bus: 1, device: 6 was not an MTP device
may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
may 27 16:04:56 karlalex-asus python3[3292]: detected unhandled Python exception in '/usr/bin/miniterm.py'
may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
may 27 16:04:56 karlalex-asus abrt-server[3293]: Deleting problem directory Python3-2021-05-27-16:04:56-3292 (dup of Python3-2021-05-27-14:26:21-17653)
may 27 16:04:56 karlalex-asus abrt-notification[3312]: [🡕] Process 17653 (miniterm.py) of user 1000 encountered an uncaught BrokenPipeError exception

The messages with "failed set request..." are abnormal.

Worked around by downgrading the kernel to any 5.11.x version. Tested with kernel-5.11.21-300.fc34.x86_64 and kernel-5.11.12-300.fc34.x86_64

2. What is the Version-Release number of the kernel:

kernel-5.12.5-300.fc34.x86_64
kernel-5.12.6-300.fc34.x86_64


3. Did it work previously in Fedora? If so, what kernel version did the issue
    *first* appear?  Old kernels are available for download at
    https://koji.fedoraproject.org/koji/packageinfo?packageID=8  <https://koji.fedoraproject.org/koji/packageinfo?packageID=8>  :

Previously worked on kernel-5.11.21-300.fc34.x86_64 as explained above.

4. Can you reproduce this issue? If so, please provide the steps to reproduce
    the issue below:

- Get device that shows as an USB port to be managed by cp210x module
- Plug device
- Open autoprobed /dev/ttyUSBx port with any serial console

5. Does this problem occur with the latest Rawhide kernel? To install the
    Rawhide kernel, run ``sudo dnf install fedora-repos-rawhide`` followed by
    ``sudo dnf update --enablerepo=rawhide kernel``:


6. Are you running any modules that not shipped with directly Fedora's kernel?:

Using VirtualBox modules from rpmfusion. However, no virtual machines are running alongside any of the tests performed.

7. Please attach the kernel logs. You can get the complete kernel log
    for a boot with ``journalctl --no-hostname -k > dmesg.txt``. If the
    issue occurred on a previous boot, use the journalctl ``-b`` flag.


Module cp210x from kernel 5.11 works without errors with ESP32 when compiled under 5.12.x after applying commit c5d1448fa353242635fa3e1fed6ab4558e0e7d9a (USB: serial: make remove callback return void) on top of it. This allows bisection without rebooting.


Bisection points me to this:

f61309d9c96a308465bec9d2e5206da265b075a0 is the first bad commit
commit f61309d9c96a308465bec9d2e5206da265b075a0
Author: Johan Hovold <johan@kernel.org  <mailto:johan@kernel.org>>
Date:   Mon Jan 18 12:13:27 2021 +0100

     USB: serial: cp210x: set IXOFF thresholds
     
     At least CP2102 requires the XON/XOFF limits to be initialised in order
     for software input flow control (IXOFF) to work. Specifically, XOFF is
     never sent if the XOFF limit is left at its default value of zero.
     
     Set the limits so that input is throttled when the FIFO free level drops
     below 128 bytes and restarted when the FIFO fill level drops below 128
     bytes.
     
     Note that the threshold values have been chosen so that they can be used
     also with CP2105 which has the smallest FIFO of the currently supported
     device types (288 byte for the SCI port). If needed the limits can be
     made device specific later.
     
     Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org  <mailto:gregkh@linuxfoundation.org>>
     Signed-off-by: Johan Hovold <johan@kernel.org  <mailto:johan@kernel.org>>

  drivers/usb/serial/cp210x.c | 3 +++
  1 file changed, 3 insertions(+)


This is the bisection log:

git bisect start
# bad: [9f4ad9e425a1d3b6a34617b8ea226d56a119a717] Linux 5.12
git bisect bad 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
# good: [f40ddce88593482919761f74910f42f4b84c004b] Linux 5.11
git bisect good f40ddce88593482919761f74910f42f4b84c004b
# bad: [d99676af540c2dc829999928fb81c58c80a1dce4] Merge tag 'drm-next-2021-02-19' of git://anongit.freedesktop.org/drm/drm
git bisect bad d99676af540c2dc829999928fb81c58c80a1dce4
# bad: [f9d58de23152f2c16f326d7e014cfa2933b00304] Merge tag 'affs-for-5.12-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
git bisect bad f9d58de23152f2c16f326d7e014cfa2933b00304
# good: [b8af417e4d93caeefb89bbfbd56ec95dedd8dab5] Merge git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
git bisect good b8af417e4d93caeefb89bbfbd56ec95dedd8dab5
# good: [82851fce6107d5a3e66d95aee2ae68860a732703] Merge tag 'arm-dt-v5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 82851fce6107d5a3e66d95aee2ae68860a732703
# bad: [780607b9731feef575514108fc7956c54180f16e] Merge tag 'usb-5.12-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
git bisect bad 780607b9731feef575514108fc7956c54180f16e
# bad: [c85bfed171aaa91a32dcecd7962a4c880bf9d0ab] Merge tag 'usb-serial-5.12-rc1' ofhttps://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial  <https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial>  into usb-next
git bisect bad c85bfed171aaa91a32dcecd7962a4c880bf9d0ab
# good: [29b01295a829fba7399ee84afff4e64660e49f04] usb: typec: Add typec_partner_set_pd_revision
git bisect good 29b01295a829fba7399ee84afff4e64660e49f04
# good: [31737c27d665bb3bc8ad9396c63fae2543dd8818] usb: pd: Make SVDM Version configurable in VDM header
git bisect good 31737c27d665bb3bc8ad9396c63fae2543dd8818
# bad: [6420a569504e212d618d4a4736e2c59ed80a8478] USB: serial: option: update interface mapping for ZTE P685M
git bisect bad 6420a569504e212d618d4a4736e2c59ed80a8478
# bad: [54c98d9d7ba48c66d64f72e3d5a7586601705611] USB: serial: xr: fix interface leak at disconnect
git bisect bad 54c98d9d7ba48c66d64f72e3d5a7586601705611
# bad: [f7de9b64265faafe96c2533ddfcc1ad7b2e8080d] USB: serial: mxuport: drop short control-transfer check
git bisect bad f7de9b64265faafe96c2533ddfcc1ad7b2e8080d
# bad: [f61309d9c96a308465bec9d2e5206da265b075a0] USB: serial: cp210x: set IXOFF thresholds
git bisect bad f61309d9c96a308465bec9d2e5206da265b075a0
# good: [979d9cbe75b922ab1695b8ad5576115774f72e62] USB: serial: pl2303: fix line-speed handling on newer chips
git bisect good 979d9cbe75b922ab1695b8ad5576115774f72e62
# good: [7748feffcd80f3ee25dae5e6acd3cf90e8e838d8] USB: serial: cp210x: add support for software flow control
git bisect good 7748feffcd80f3ee25dae5e6acd3cf90e8e838d8
# first bad commit: [f61309d9c96a308465bec9d2e5206da265b075a0] USB: serial: cp210x: set IXOFF thresholds

Bug still present in kernel-5.12.7-300.fc34.x86_64 .

If I manually revert commit f61309d9c96a308465bec9d2e5206da265b075a0 from cp210x.c from 5.12.7, it works correctly. Further proof that this commit introduced the bug.

