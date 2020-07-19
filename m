Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB272251BB
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 13:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgGSL4Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 07:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgGSL4Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jul 2020 07:56:24 -0400
Received: from iam.tj (soggy.cloud [IPv6:2a01:7e00:e000:151::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E244C0619D2
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2020 04:56:24 -0700 (PDT)
Received: from [10.0.40.34] (unknown [51.155.44.233])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by iam.tj (Postfix) with ESMTPSA id 95217340AD;
        Sun, 19 Jul 2020 12:56:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
        t=1595159782; bh=hikWqDuJQ4izcBrsBjmI9IYSfv58WNB3/U53L9a9RJY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QSKRyaudajT9NSF7WCxLndWPC3OnCzzqJ1D2pzVfvQlcRPsov9KlfmkMyCF/7Iig4
         KxBMGo0riNiq0AjQ/pDUQDFLl9kHymmReFKn62JmfvEnfVJOur7EDNOgzjp8cYj1tO
         OhmqRKH3Szjyn94Rdo3fh5bylTcaQ6/H34eY9s64Vl38wBBZA1JwadSlKop+miE6Hh
         7DEJQdjfKYNyDxR1/PBi/WvlN3yHib4FuWE9vx6srva4V3H1HeCamimf48jBd1raNS
         +c1Yhajt7r9jUMonYEs7DF/RgQ/H0Yc6PaWaWA4sxyDygUGFTVykLbOdCP0+ZgOw1p
         6Ex5VbIawhoBA==
Subject: Re: uas: bug: [sda] tag#21 uas_eh_abort_handler 0 uas-tag 6 inflight:
 IN
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
References: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
 <20200719110901.GE266150@kroah.com>
From:   "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Organization: Elloe CIC
Message-ID: <c6720231-e30c-41e4-cd2b-1b4b9baa0852@elloe.vision>
Date:   Sun, 19 Jul 2020 12:55:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200719110901.GE266150@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/07/2020 12:09, Greg KH wrote:
> On Sun, Jul 19, 2020 at 11:22:10AM +0100, Tj (Elloe Linux) wrote:
>> With all kernels from 4.14 to 5.8.0-rc5 we're seeing failures with uas
>> on a Turris Mox aarch64 Marvell Armada 3720 that we don't see on amd64.
>>
>> The device that triggers them is:
>>
>> Bus 003 Device 002: ID 152d:0562 JMicron Technology Corp. / JMicron USA
>> Technology Corp.
>>
> 
> That implies that the host controller, or the PCI controller code, is
> not working on the arm system well?

With 5.8.0-rc5 we're seeing less errors (although devices are still
unusable) in the log than we see with the Turris Mox kernel v4.14.187
where there are many repeated 30 second timeouts of the form:

Jun  3 08:53:43 turris kernel: [ 1881.659833] scsi host0:
uas_eh_device_reset_handler success
Jun  3 08:53:51 turris kernel: [ 1889.671447] usb 3-1: cmd cmplt err -71
Jun  3 08:53:52 turris kernel: [ 1890.300858] usb 3-1: USB disconnect,
device number 3
Jun  3 08:53:52 turris kernel: [ 1890.307043] sd 0:0:0:0: tag#1
uas_zap_pending 0 uas-tag 2 inflight: CMD


>> [   46.152049] scsi host0: uas_eh_device_reset_handler start
>> [   46.285155] usb 3-1: reset SuperSpeed Gen 1 USB device number 2 using
>> xhci_hcd
>> [   46.312219] scsi host0: uas_eh_device_reset_handler success
>> [   76.827742] scsi host0: uas_eh_device_reset_handler start
>> [   76.831151] sd 0:0:0:0: [sda] tag#21 uas_zap_pending 0 uas-tag 1
>> inflight:
>> [   76.837629] sd 0:0:0:0: [sda] tag#21 CDB: opcode=0x28 28 00 1d cf 2f
>> d8 00 00 28 00
>> [   76.845513] sd 0:0:0:0: [sda] tag#20 uas_zap_pending 0 uas-tag 2
>> inflight:
>> [   76.852678] sd 0:0:0:0: [sda] tag#20 CDB: opcode=0x28 28 00 1d cf 2f
>> 28 00 00 a8 00
>> [   76.992756] usb 3-1: reset SuperSpeed Gen 1 USB device number 2 using
>> xhci_hcd
>> ...
> 
> Where is an error here?  Those looks ok to me.

These repeated 'zaps' and resets every 30 seconds or so are not errors?
They never stop even though the devices are not mounted nor being
accessed (by users).

>> [  199.939976] blk_update_request: I/O error, dev sda, sector 500117464
>> op 0x0:(READ) flags 0x80700 phys_seg 5 prio class 0
> 
> So only the block layer is reporting errors, not the USB layer?  Any usb
> controller errors?
> 
> And what USB controller driver are you using here?

From what I can deduce in sysfs it is xhci_hcd (note: same issue with 1
or 2 identical devices attached):

$ lsusb -d 152d:0562
Bus 003 Device 003: ID 152d:0562 JMicron Technology Corp. / JMicron USA
Technology Corp.
Bus 003 Device 002: ID 152d:0562 JMicron Technology Corp. / JMicron USA
Technology Corp.

$ ls -l  /sys/bus/usb/devices/3-{1,2}
lrwxrwxrwx 1 root root 0 Jul 19 09:19 /sys/bus/usb/devices/3-1 ->
../../../devices/platform/soc/d0070000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb3/3-1
lrwxrwxrwx 1 root root 0 Jul 19 12:27 /sys/bus/usb/devices/3-2 ->
../../../devices/platform/soc/d0070000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb3/3-2

$ lspci -nnk
00:00.0 PCI bridge [0604]: Marvell Technology Group Ltd. Device [1b4b:0100]
        Kernel driver in use: pcieport
01:00.0 USB controller [0c03]: VIA Technologies, Inc. VL805 USB 3.0 Host
Controller [1106:3483] (rev 01)
        Subsystem: VIA Technologies, Inc. VL805 USB 3.0 Host Controller
[1106:3483]
        Kernel driver in use: xhci_hcd
        Kernel modules: xhci_pci





