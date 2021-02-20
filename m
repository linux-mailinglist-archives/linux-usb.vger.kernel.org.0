Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8EA33204DA
	for <lists+linux-usb@lfdr.de>; Sat, 20 Feb 2021 10:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbhBTJwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Feb 2021 04:52:41 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:61345 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhBTJwd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Feb 2021 04:52:33 -0500
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11K9pZWh013673;
        Sat, 20 Feb 2021 18:51:36 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp);
 Sat, 20 Feb 2021 18:51:35 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11K9pYhD013668
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 20 Feb 2021 18:51:35 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v2] usb: usbip: serialize attach/detach operations
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-usb@vger.kernel.org
References: <20210219094744.3577-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20210219150832.4701-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <YC/fF0c7PA3ndTPv@kroah.com>
 <68fe3981-27d2-1f8d-17c6-9cb773382e66@linuxfoundation.org>
 <f8110365-767d-6aa4-ff9e-3ab8380c0919@i-love.sakura.ne.jp>
 <YDCzLfhawx4u28dd@kroah.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <e1fe719d-35df-3898-33dd-f8bfc6d10b5d@i-love.sakura.ne.jp>
Date:   Sat, 20 Feb 2021 18:51:37 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDCzLfhawx4u28dd@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/20 15:58, Greg Kroah-Hartman wrote:
>>> Also please run the usbip test on your changes:
>>> tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
>>
>> Too much requirements for me to run that test. I'm not a user of your module.
> 
> It should be self-contained, what requirements do you see that you do
> not have?

It asks me to build usbip tools from source code. I took source code from
https://github.com/lucianm/usbip-utils , but I couldn't rebuild without
removing -Werror from Makefile . Where is maintained source code?
Please embed appropriate URL into usbip_test.sh .

Too many error messages to convince that the test succeeded. The only device listed
in my environment is a Virtual Mouse, which makes me wonder if the test did work.
Therefore, I think I should wait for your test result in your environment which
would list appropriate devices.

----- console output -----

root@fuzz:~# linux/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh
usbip_test.sh -b <busid> -p <usbip tools path>
root@fuzz:~# ~/usbip-utils/src/usbip list -l
 - busid 3-1 (0e0f:0003)
   VMware, Inc. : Virtual Mouse (0e0f:0003)

root@fuzz:~# linux/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh -b 3-1 -p ~/usbip-utils/
Running USB over IP Testing on 3-1
Load usbip_host module
usbip_test: module usbip_host is loaded [OK]
Load vhci_hcd module
usbip_test: module vhci_hcd is loaded [OK]
==============================================================
Expect to see export-able devices
 - busid 3-1 (0e0f:0003)
   VMware, Inc. : Virtual Mouse (0e0f:0003)

==============================================================
Run lsusb to see all usb devices
/:  Bus 37.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 36.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 35.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 34.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 33.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 32.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 31.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 30.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 29.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 28.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 27.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 26.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 25.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 24.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 23.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 22.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 21.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 20.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 19.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 18.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 17.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 16.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 15.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 14.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 13.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 12.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 11.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 10.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 09.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=dummy_hcd/1p, 480M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
    |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
==============================================================
Get exported devices from localhost - expect to see none
usbip: info: no exportable devices found on localhost
==============================================================
bind devices
bind device on busid 3-1: complete
==============================================================
Run lsusb - bound devices should be under usbip_host control
/:  Bus 37.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 36.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 35.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 34.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 33.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 32.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 31.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 30.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 29.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 28.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 27.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 26.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 25.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 24.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 23.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 22.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 21.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 20.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 19.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 18.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 17.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 16.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 15.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 14.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 13.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 12.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 11.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 10.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 09.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=dummy_hcd/1p, 480M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
==============================================================
bind devices - expect already bound messages
usbip: error: device on busid 3-1 is already bound to usbip-host
==============================================================
Get exported devices from localhost - expect to see exported devices
Exportable USB devices
======================
 - localhost
        3-1: VMware, Inc. : Virtual Mouse (0e0f:0003)
           : /sys/devices/pci0000:00/0000:00:15.0/0000:03:00.0/usb3/3-1
           : (Defined at Interface level) (00/00/00)

==============================================================
unbind devices
unbind device on busid 3-1: complete
==============================================================
Run lsusb - bound devices should be rebound to original drivers
/:  Bus 37.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 36.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 35.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 34.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 33.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 32.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 31.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 30.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 29.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 28.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 27.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 26.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 25.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 24.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 23.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 22.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 21.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 20.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 19.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 18.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 17.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 16.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 15.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 14.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 13.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 12.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 11.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 10.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 09.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=dummy_hcd/1p, 480M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
==============================================================
unbind devices - expect no devices bound message
usbip: error: Device is not bound to usbip-host driver.
==============================================================
Get exported devices from localhost - expect to see none
usbip: error: failed to get device list from localhost
==============================================================
List imported devices - expect to see none
usbip: error: open vhci_driver
usbip: error: list imported devices
==============================================================
Import devices from localhost - should fail with no devices
usbip: error: recv op_common
usbip: error: query
==============================================================
bind devices
bind device on busid 3-1: complete
==============================================================
List imported devices - expect to see exported devices
Exportable USB devices
======================
 - localhost
        3-1: VMware, Inc. : Virtual Mouse (0e0f:0003)
           : /sys/devices/pci0000:00/0000:00:15.0/0000:03:00.0/usb3/3-1
           : (Defined at Interface level) (00/00/00)

==============================================================
List imported devices - expect to see none
usbip: error: open vhci_driver
usbip: error: list imported devices
==============================================================
Import devices from localhost - should work
usbip: error: open vhci_driver
usbip: error: query
==============================================================
List imported devices - expect to see imported devices
usbip: error: open vhci_driver
usbip: error: list imported devices
==============================================================
Import devices from localhost - expect already imported messages
usbip: error: open vhci_driver
usbip: error: query
==============================================================
Un-import devices
usbip: error: open vhci_driver
usbip: error: open vhci_driver
==============================================================
List imported devices - expect to see none
usbip: error: open vhci_driver
usbip: error: list imported devices
==============================================================
Un-import devices - expect no devices to detach messages
usbip: error: open vhci_driver
usbip: error: open vhci_driver
==============================================================
Detach invalid port tests - expect invalid port error message
usbip: error: open vhci_driver
==============================================================
Expect to see export-able devices
 - busid 3-1 (0e0f:0003)
   VMware, Inc. : Virtual Mouse (0e0f:0003)

==============================================================
Remove usbip_host module
rmmod: ERROR: Module usbip_host is builtin.
Run lsusb - bound devices should be rebound to original drivers
/:  Bus 37.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 36.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 35.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 34.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 33.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 32.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 31.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 30.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 29.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 28.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 27.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 26.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 25.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 24.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 23.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 22.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 21.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 20.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 19.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 18.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 17.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 16.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 15.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 14.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 13.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 12.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 11.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 10.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 09.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=dummy_hcd/1p, 480M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
==============================================================
Run bind without usbip_host - expect fail
usbip: error: device on busid 3-1 is already bound to usbip-host
==============================================================
Run lsusb - devices that failed to bind aren't bound to any driver
/:  Bus 37.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 36.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 35.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 34.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 33.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 32.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 31.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 30.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 29.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 28.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 27.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 26.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 25.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 24.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 23.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 22.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 21.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 20.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 19.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 18.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 17.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 16.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 15.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 14.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 13.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 12.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 11.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 10.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 09.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 480M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=dummy_hcd/1p, 480M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
==============================================================
modprobe usbip_host - does it work?
Should see -busid- is not in match_busid table... skip! dmesg
==============================================================
==============================================================
End of USB over IP Testing on 3-1
root@fuzz:~# echo $?
0



----- dmesg output -----

[   95.256736] usbip-host 3-1: usbip-host: register new device (bus 3 dev 2)
[   95.897937] usbipd[1202]: segfault at 0 ip 00007f9eebe2d4c2 sp 00007ffc4ecd52f0 error 4 in libusbip.so.0.0.1[7f9eebe2b000+7000]
[   95.902053] Code: 64 e2 ff ff 49 8b 7d 00 48 89 c6 48 89 c3 e8 75 e0 ff ff 48 89 c7 e8 cd e1 ff ff b9 0b 00 00 00 48 8d 3d 49 4f 00 00 48 89 c6 <f3> a6 0f 97 c1 80 d9 00 44 0f be f1 45 85 f6 75 ad be 58 01 00 00
[   97.102442] usbipd[1234]: segfault at 0 ip 00007f9eebe2d4c2 sp 00007ffc4ecd52f0 error 4 in libusbip.so.0.0.1[7f9eebe2b000+7000]
[   97.106679] Code: 64 e2 ff ff 49 8b 7d 00 48 89 c6 48 89 c3 e8 75 e0 ff ff 48 89 c7 e8 cd e1 ff ff b9 0b 00 00 00 48 8d 3d 49 4f 00 00 48 89 c6 <f3> a6 0f 97 c1 80 d9 00 44 0f be f1 45 85 f6 75 ad be 58 01 00 00
[   97.462294] usbip-host 3-1: usbip-host: register new device (bus 3 dev 2)
[   97.816252] usbip-host 3-1: stub up
[   97.818997] usbip-host 3-1: recv a header, 0
[   97.969602] usbip-host 3-1: reset full-speed USB device number 2 using xhci_hcd
[  113.280217] usbip-host 3-1: device descriptor read/64, error -110
[  128.702195] usbip-host 3-1: device descriptor read/64, error -110
[  128.999228] usbip-host 3-1: reset full-speed USB device number 2 using xhci_hcd
[  144.311886] usbip-host 3-1: device descriptor read/64, error -110
[  159.749491] usbip-host 3-1: device descriptor read/64, error -110
[  160.062046] usbip-host 3-1: reset full-speed USB device number 2 using xhci_hcd
[  160.110668] usbip-host 3-1: device reset
[  160.159742] usbip-host 3-1: stub up
[  160.164251] usbip-host 3-1: recv a header, 0
[  160.318951] usbip-host 3-1: reset full-speed USB device number 2 using xhci_hcd
[  175.575825] usbip-host 3-1: device descriptor read/64, error -110
[  191.029443] usbip-host 3-1: device descriptor read/64, error -110
[  191.326302] usbip-host 3-1: reset full-speed USB device number 2 using xhci_hcd
[  206.638840] usbip-host 3-1: device descriptor read/64, error -110
[  222.061243] usbip-host 3-1: device descriptor read/64, error -110
[  222.358197] usbip-host 3-1: reset full-speed USB device number 2 using xhci_hcd
[  222.406409] usbip-host 3-1: device reset

