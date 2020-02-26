Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7254516F950
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2020 09:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgBZIML (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 03:12:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9344 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727247AbgBZIMK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 03:12:10 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e56280b0000>; Wed, 26 Feb 2020 00:10:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 26 Feb 2020 00:12:09 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 26 Feb 2020 00:12:09 -0800
Received: from [10.19.108.125] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Feb
 2020 08:12:08 +0000
Subject: Re: [PATCH] usb: host: xhci-tegra: Tegra186/Tegra194 LPM
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <mathias.nyman@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <nkristam@nvidia.com>
References: <20200224062145.25785-1-jckuo@nvidia.com>
 <20200224125100.GA2108060@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <223f5f09-781a-825d-e75e-3b878acec27d@nvidia.com>
Date:   Wed, 26 Feb 2020 16:12:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200224125100.GA2108060@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582704652; bh=yW+snmU/UwWQi2opidcn1n4kXQcvIs5im8Czqul7n/Q=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Vh7n+cJD157zg5dC3Nfo/k4ms2z1MbK8cMt9bIIYbz2nxrxdQpLfkrUbIH2pC/o78
         wGRk8ZQUxBQNEKkY5h0GVHq3sNeZarz9i4YoQMix4ZuPshwLpkn5641zKe9MG0Lit7
         VAScbOEmhYz2nyxqkeCMMVrKcWorAGML5XmFkKqBydmCaXQktE/O6rVAe2O4shOJBR
         uaQfK1fxXVekqNiN/BV2Mgg4RfE+eAw6qd7BBXG5I/R2vlMFExiFswrbs3RmFG60vN
         DKVDEdQXlpkNKEdLKXrjZkmGYWf+o/6b4VphoSKk3LPAehrp7+mzvWl6kOSn0hKD4T
         qrzgMB3i6ItDQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thierry,
Yes, it can be verified with a LPM capable device. For example, a VIA USB 3.0
hub is connected to Jetson-Xavier. "lsusb -v" output [1] shows the device
supports LPM and the host has enabled U1/U2 states for the device. If host LPM
is disabled, there will be no "U1 Enabled" and "U2 Enabled" strings in "Device
Status" section.

To check LPM operation, disconnect all USB 3.0 devices from the hub and disable
runtime PM for the super-speed portion of the hub, so that it won't be
auto-suspended.
root@tegra-ubuntu:~# echo on > /sys/bus/usb/devices/2-4/power/control

Since there is no data transaction for the hub, link will enter U2 soon. This
can be checked by reading XHCI.PORTSC register. In below, PLS (Port Link State)
field is U2.
root@tegra-ubuntu:~# devmem 0x3610450
0x00001243

Thanks,
JC

[1] lsusb -v -d 2109:0820
Bus 002 Device 002: ID 2109:0820 VIA Labs, Inc.
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            9 Hub
  bDeviceSubClass         0 Unused
  bDeviceProtocol         3
  bMaxPacketSize0         9
  idVendor           0x2109 VIA Labs, Inc.
  idProduct          0x0820
  bcdDevice            4.e3
  iManufacturer           1 VIA Labs, Inc.
  iProduct                2 USB3.0 Hub
  iSerial                 0
  bNumConfigurations      1

...
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength           42
  bNumDeviceCaps          3
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat           4 micro seconds
    bU2DevExitLat         231 micro seconds
  Container ID Device Capability:
    bLength                20
    bDescriptorType        16
    bDevCapabilityType      4
    bReserved               0
    ContainerID             {5cf3ee30-d507-4925-b001-802d79434c30}
Device Status:     0x000d
  Self Powered
  U1 Enabled
  U2 Enabled



On 2/24/20 8:51 PM, Thierry Reding wrote:
> On Mon, Feb 24, 2020 at 02:21:45PM +0800, JC Kuo wrote:
>> Tegra186 and Tegra194 xHC supports USB 3.0 LPM. This commit enables
>> XHCI_LPM_SUPPORT quirk for Tegra186 and Tegra194.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
> 
> I see that Mathias has already queued this up, but for the record:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 
> JC, is there some way that we can test this? I see that there are some
> sysfs files that can control LPM enablement on a per-device basis, but
> is there some way to check that this works as expected? Or do we just
> assume everything is fine as long as all the devices continue to operate
> properly? Perhaps there are some state transition counters or something
> that would indicate that devices are properly transitioning?
> 
> Thierry
> 
