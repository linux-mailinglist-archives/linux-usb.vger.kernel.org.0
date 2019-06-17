Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2B6F47DE9
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 11:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727670AbfFQJIa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 05:08:30 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57510 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbfFQJIa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 05:08:30 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5H98KTN037956;
        Mon, 17 Jun 2019 04:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560762500;
        bh=pnZdFqP8CIvoaf3g51aDzN25/VlR6prvSJVNYf1HJbI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JhTXGkACO5r4nXlBauS/b0DEDlsM5N6oLOztIwmuKdlHzjDKasE9IdzA3eUJR68S5
         isa/ycPIcPHCfn+HnvCy5y9E8+zo1fUkFmhBlpCGPl47M6Xy6qVWv+KTnrEfm/D+F7
         HDxccvCcwM3SsWAYpO8A4UZQpPnIx0bpPcAX6/LY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5H98KJX048308
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 17 Jun 2019 04:08:20 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 17
 Jun 2019 04:08:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 17 Jun 2019 04:08:19 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5H98HWb043698;
        Mon, 17 Jun 2019 04:08:17 -0500
Subject: Re: DWC3 USB hub issue
To:     Felipe Balbi <balbi@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-actions@lists.infradead.org>,
        <afaerber@suse.de>
References: <20190614183213.GB29654@Mani-XPS-13-9360>
 <874l4oit0s.fsf@linux.intel.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <5cb0d645-4ac8-7334-3be2-dc9b7d607a7f@ti.com>
Date:   Mon, 17 Jun 2019 12:08:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <874l4oit0s.fsf@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 17/06/2019 10:13, Felipe Balbi wrote:
> 
> Hi,
> 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> Hello,
>>
>> I'm trying to upstream Designware USB3 host driver present in the Actions
>> Semi S900 SoC. It can successfully detect the USB hub but when any of the
>> USB device got plugged in, it fails with following error:
>>
>> [    4.365566] usb usb1-port1: connect-debounce failed
>>
>> Full log can be found here: https://pastebin.ubuntu.com/p/PNff5fZkn6/
>>
>> Below is the output of, lsusb -v:
>>
>> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Device Descriptor:
>>   bLength                18
>>   bDescriptorType         1
>>   bcdUSB               3.00
>>   bDeviceClass            9 Hub
>>   bDeviceSubClass         0 Unused
>>   bDeviceProtocol         3 
>>   bMaxPacketSize0         9
>>   idVendor           0x1d6b Linux Foundation
>>   idProduct          0x0003 3.0 root hub
>>   bcdDevice            5.02
>>   iManufacturer           3 Linux 5.2.0-rc3-00032-gbd970cfc7a82-dirty xhci-hcd
>>   iProduct                2 xHCI Host Controller
>>   iSerial                 1 xhci-hcd.0.auto
>>   bNumConfigurations      1
>>   Configuration Descriptor:
>>     bLength                 9
>>     bDescriptorType         2
>>     wTotalLength           31
>>     bNumInterfaces          1
>>     bConfigurationValue     1
>>     iConfiguration          0 
>>     bmAttributes         0xe0
>>       Self Powered
>>       Remote Wakeup
>>     MaxPower                0mA
>>     Interface Descriptor:
>>       bLength                 9
>>       bDescriptorType         4
>>       bInterfaceNumber        0
>>       bAlternateSetting       0
>>       bNumEndpoints           1
>>       bInterfaceClass         9 Hub
>>       bInterfaceSubClass      0 Unused
>>       bInterfaceProtocol      0 Full speed (or root) hub
>>       iInterface              0 
>>       Endpoint Descriptor:
>>         bLength                 7
>>         bDescriptorType         5
>>         bEndpointAddress     0x81  EP 1 IN
>>         bmAttributes            3
>>           Transfer Type            Interrupt
>>           Synch Type               None
>>           Usage Type               Data
>>         wMaxPacketSize     0x0004  1x 4 bytes
>>         bInterval              12
>>         bMaxBurst               0
>> Hub Descriptor:
>>   bLength              12
>>   bDescriptorType      42
>>   nNbrPorts             1
>>   wHubCharacteristic 0x000a
>>     No power switching (usb 1.0)
>>     Per-port overcurrent protection
>>   bPwrOn2PwrGood       10 * 2 milli seconds
>>   bHubContrCurrent      0 milli Ampere
>>   bHubDecLat          0.0 micro seconds
>>   wHubDelay             0 nano seconds
>>   DeviceRemovable    0x00
>>  Hub Port Status:
>>    Port 1: 0000.02a0 5Gbps power Rx.Detect
>> Binary Object Store Descriptor:
>>   bLength                 5
>>   bDescriptorType        15
>>   wTotalLength           15
>>   bNumDeviceCaps          1
>>   SuperSpeed USB Device Capability:
>>     bLength                10
>>     bDescriptorType        16
>>     bDevCapabilityType      3
>>     bmAttributes         0x02
>>       Latency Tolerance Messages (LTM) Supported
>>     wSpeedsSupported   0x0008
>>       Device can operate at SuperSpeed (5Gbps)
>>     bFunctionalitySupport   3
>>       Lowest fully-functional device speed is SuperSpeed (5Gbps)
>>     bU1DevExitLat           0 micro seconds
>>     bU2DevExitLat           0 micro seconds
>> Device Status:     0x0001
>>   Self Powered
>>
>> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>>
>> Devicetree snippet:
>>
>>                 usbdrd3_0: usb@e0400000 {
>>                         compatible = "actions,s900-dwc3";
>>                         clocks = <&cmu CLK_USB3_480MPLL0>,
>>                                  <&cmu CLK_USB3_480MPHY0>,
>>                                  <&cmu CLK_USB3_5GPHY>,
>>                                  <&cmu CLK_USB3_CCE>,
>>                                  <&cmu CLK_USB3_MAC>;
>>                         clock-names = "usb3_480mpll0", "usb3_480mphy0",
>>                                       "usb3_5gphy", "usb3_cce",
>>                                       "usb3_mac";
>>                         resets  = <&cmu RESET_USB3>;
>>                         reset-names = "usb3";
>>                         power-domains = <&sps S900_PD_USB3>;
>>                         #address-cells = <2>;
>>                         #size-cells = <2>;
>>                         ranges;
>>
>>                         usbdrd_dwc3_0: dwc3 {
>>                                 compatible = "snps,dwc3";
>>                                 reg = <0x0 0xe0400000 0x0 0x100000>;
>>                                 interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
>>                                 usb-phy = <&usb2_phy>, <&usb3_phy>;
>>                                 dr_mode = "host";
>>                                 power-domains = <&sps S900_PD_USB3>;
>>                                 snps,hsphy_interface = "utmi";
>>                         };
>>                 };
>>
>> After going through the mailing list looking for similar issue, found that
>> some host controllers works with following quirk:
>>
>> snps,dis_u3_susphy_quirk;
>>
>> I tried that also but it didn't work. Can anyone shed some light on this?
>>
>> PS: USB3 is working fine with vendor kernel 3.10.
> 
> Check what's different between mainline and your v3.10 code. Specially
> look for changes in xhci and usbcore.

This kind of error usually happen when the PHY is not working correctly.
I would check that all USB analog power supplies are enabled, PHY is
clocked and powered ON.

Good luck!

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
