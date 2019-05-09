Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90A7218864
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 12:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfEIKcY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 06:32:24 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33621 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfEIKcY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 May 2019 06:32:24 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190509103221euoutp020cc2977d23290a24c6bbdea2d3a85629~c-S06m7Zs0571105711euoutp02T
        for <linux-usb@vger.kernel.org>; Thu,  9 May 2019 10:32:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190509103221euoutp020cc2977d23290a24c6bbdea2d3a85629~c-S06m7Zs0571105711euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1557397941;
        bh=46XYfxodhaRXNh8OQsIohdDHtip5LkSaGl00vt5h5cQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=bcI42N6PHnZbKA2LtO4Oa9FpomTGIOTNYBfsyg0Iy31KDAe+6HPK7XmIDot38wCrq
         hOePhauHPbWnn6kr7io38MxjsP5gwc0cyqvKx9pDwbgWILgcXbInVNGAclvrvAIpYM
         CiGZb+oQmdWDaHGdPcrIluTh2O+opRowhzbmq6qs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190509103221eucas1p1d593aabfbea5986211171bc11af7f6cf~c-S0T6WFI2709327093eucas1p1b;
        Thu,  9 May 2019 10:32:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 94.DB.04298.4B104DC5; Thu,  9
        May 2019 11:32:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190509103220eucas1p1330f2827916b55e05b1b791504963630~c-SzoTnva2724327243eucas1p1r;
        Thu,  9 May 2019 10:32:20 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190509103220eusmtrp272fbb207bb635ac54bec67dc55531113~c-SzaTSq_2898928989eusmtrp25;
        Thu,  9 May 2019 10:32:20 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-b9-5cd401b403dc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 9F.B3.04146.4B104DC5; Thu,  9
        May 2019 11:32:20 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190509103219eusmtip191bab8a9cccc272ff9f89fa910bd018d~c-SydQirB2812928129eusmtip1L;
        Thu,  9 May 2019 10:32:19 +0000 (GMT)
Subject: Re: [PATCH 1/4] usb: xhci: add Immediate Data Transfer support
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <bc747768-7457-0df6-f57e-4aeac9c8bf0c@samsung.com>
Date:   Thu, 9 May 2019 12:32:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556285012-28186-2-git-send-email-mathias.nyman@linux.intel.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djP87pbGK/EGBy5YGnRvHg9m8X58xvY
        LWac38dksWhZK7PF6w9NLBbbZi1nc2Dz2LSqk81j3slAj/1z17B7bD5d7fF5k1wAaxSXTUpq
        TmZZapG+XQJXxrSVGxgLjuRUnD7dztbA+Cuyi5GTQ0LAROLWzGmMXYxcHEICKxgl/t97zgSS
        EBL4wijRczkIIvGZUaL/z39WmI4Dl2dAdSxnlLjd9BfKecsoMXPbfWaQKmEBd4k1096C2SIC
        /hJNH3awghQxC2xilNj7cjoLSIJNwFCi620XG4jNK2An8eLnRnYQm0VARWLHrHtAzRwcogIx
        Eos+Q5UISpyc+QSslVPAT+LZ9UdgNrOAvETz1tnMELa4xK0n85lAdkkIrGKXWPrnKxvIHAkB
        F4lpP5QhPhCWeHV8CzuELSPxfydMfTOjxMNza9khnB5GictNIH+CVFlLHD5+kRVkELOApsT6
        XfoQYUeJ9ZPuM0PM55O48VYQ4gY+iUnbpkOFeSU62oQgqtUkZh1fB7f24IVLzBMYlWYh+WwW
        km9mIflmFsLeBYwsqxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3MQKTzul/xz/tYPx6KekQ
        owAHoxIPb8ahSzFCrIllxZW5hxglOJiVRHivTwQK8aYkVlalFuXHF5XmpBYfYpTmYFES561m
        eBAtJJCeWJKanZpakFoEk2Xi4JRqYIy9ePngqQPdf09J9gi29ni57mrOtppr+zZc7YuTuibX
        5ckab7cHHNHZEX7gTNr21FVZ5ald8d5M3dcqW1LrGyXzZ175XjDD8shc+xcfZ4WdWr8qPO+N
        isRDHo/8A2mVr6a1p/SaTsrLvJIwT3e6cvyyLP5Zsa/nTthduvT0+ezO3CVLU8M99ymxFGck
        GmoxFxUnAgCUA/fNNgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xu7pbGK/EGLyayGvRvHg9m8X58xvY
        LWac38dksWhZK7PF6w9NLBbbZi1nc2Dz2LSqk81j3slAj/1z17B7bD5d7fF5k1wAa5SeTVF+
        aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexrSVGxgLjuRU
        nD7dztbA+Cuyi5GTQ0LAROLA5RmMXYxcHEICSxkltlz/xAyRkJE4Oa2BFcIWlvhzrYsNoug1
        o8Syr81MIAlhAXeJNdPegjWICPhKXJj3hQmkiFlgE6NE05v1UGMnMkp8XPUNrIpNwFCi6y3I
        KE4OXgE7iRc/N7KD2CwCKhI7Zt0DqxEViJE4MXULO0SNoMTJmU9YQGxOAT+JZ9cfgdnMAmYS
        8zY/ZIaw5SWat86GssUlbj2ZzzSBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTcYkO94sTc
        4tK8dL3k/NxNjMBY23bs5+YdjJc2Bh9iFOBgVOLhzTh0KUaINbGsuDL3EKMEB7OSCO/1iUAh
        3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgemgbySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLp
        iSWp2ampBalFMH1MHJxSDYwTL+T5c2dqqLv3F1ukzH2X78vOlWjh/S1c9UWSY+iE386z/Vc6
        x/LzLnz9REJXUJpDUVBoqUFnIPt/40+HAnver//fZbQwSvBn21ze+EbN3c/6r8/5/spS91H7
        hYZ3Hpuiri060GyXblhy9uOyWWHvWFdKKj+dr9X6eW7aVvlrjV2nl2t9W6nEUpyRaKjFXFSc
        CAC4YMEUywIAAA==
X-CMS-MailID: 20190509103220eucas1p1330f2827916b55e05b1b791504963630
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190509103220eucas1p1330f2827916b55e05b1b791504963630
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190509103220eucas1p1330f2827916b55e05b1b791504963630
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
        <1556285012-28186-2-git-send-email-mathias.nyman@linux.intel.com>
        <CGME20190509103220eucas1p1330f2827916b55e05b1b791504963630@eucas1p1.samsung.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear All,

On 2019-04-26 15:23, Mathias Nyman wrote:
> From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>
> Immediate data transfers (IDT) allow the HCD to copy small chunks of
> data (up to 8bytes) directly into its output transfer TRBs. This avoids
> the somewhat expensive DMA mappings that are performed by default on
> most URBs submissions.
>
> In the case an URB was suitable for IDT. The data is directly copied
> into the "Data Buffer Pointer" region of the TRB and the IDT flag is
> set. Instead of triggering memory accesses the HC will use the data
> directly.
>
> The implementation could cover all kind of output endpoints. Yet
> Isochronous endpoints are bypassed as I was unable to find one that
> matched IDT's constraints. As we try to bypass the default DMA mappings
> on URB buffers we'd need to find a Isochronous device with an
> urb->transfer_buffer_length <= 8 bytes.
>
> The implementation takes into account that the 8 byte buffers provided
> by the URB will never cross a 64KB boundary.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Reviewed-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

I've noticed that this patch causes regression on various Samsung Exynos 
5420/5422/5800 boards, which have USB3.0 host ports provided by 
DWC3/XHCI hardware module. The regression can be observed with ASIX USB 
2.0 ethernet dongle, which stops working after applying this patch (eth0 
interface is registered, but no packets are transmitted/received). I can 
provide more debugging information or do some tests, just let me know 
what do you need. Reverting this commit makes ASIX USB ethernet dongle 
operational again.

Here are some more information from one of my test systems:

# lsusb
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 002: ID 0b95:772b ASIX Electronics Corp. AX88772B
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Bus 001 Device 002: ID 2232:1056 Silicon Motion
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

# lsusb -t
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 480M
     |__ Port 1: Dev 2, If 0, Class=Vendor Specific Class, Driver=asix, 480M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=exynos-ohci/3p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=exynos-ehci/3p, 480M
     |__ Port 1: Dev 2, If 0, Class=Video, Driver=, 480M
     |__ Port 1: Dev 2, If 1, Class=Video, Driver=, 480M

# dmesg | grep usb
[    1.484210] reg-fixed-voltage regulator-usb300: GPIO lookup for 
consumer (null)
[    1.484219] reg-fixed-voltage regulator-usb300: using device tree for 
GPIO lookup
[    1.484241] of_get_named_gpiod_flags: can't parse 'gpios' property of 
node '/regulator-usb300[0]'
[    1.484276] of_get_named_gpiod_flags: parsed 'gpio' property of node 
'/regulator-usb300[0]' - status (0)
[    1.484749] reg-fixed-voltage regulator-usb301: GPIO lookup for 
consumer (null)
[    1.484758] reg-fixed-voltage regulator-usb301: using device tree for 
GPIO lookup
[    1.484777] of_get_named_gpiod_flags: can't parse 'gpios' property of 
node '/regulator-usb301[0]'
[    1.484807] of_get_named_gpiod_flags: parsed 'gpio' property of node 
'/regulator-usb301[0]' - status (0)
[    1.490275] usbcore: registered new interface driver usbfs
[    1.495521] usbcore: registered new interface driver hub
[    1.500897] usbcore: registered new device driver usb
[    2.014966] samsung-usb2-phy 12130000.phy: 12130000.phy supply vbus 
not found, using dummy regulator
[    2.024093] exynos5_usb3drd_phy 12100000.phy: 12100000.phy supply 
vbus-boost not found, using dummy regulator
[    2.033232] exynos5_usb3drd_phy 12500000.phy: 12500000.phy supply 
vbus-boost not found, using dummy regulator
[    2.347306] usbcore: registered new interface driver r8152
[    2.352427] usbcore: registered new interface driver asix
[    2.357877] usbcore: registered new interface driver ax88179_178a
[    2.363860] usbcore: registered new interface driver cdc_ether
[    2.369730] usbcore: registered new interface driver smsc75xx
[    2.375421] usbcore: registered new interface driver smsc95xx
[    2.381198] usbcore: registered new interface driver net1080
[    2.386760] usbcore: registered new interface driver cdc_subset
[    2.392699] usbcore: registered new interface driver zaurus
[    2.398280] usbcore: registered new interface driver cdc_ncm
[    2.404280] exynos-dwc3 soc:usb3-0: soc:usb3-0 supply vdd33 not 
found, using dummy regulator
[    2.412485] exynos-dwc3 soc:usb3-0: soc:usb3-0 supply vdd10 not 
found, using dummy regulator
[    2.427570] exynos-dwc3 soc:usb3-1: soc:usb3-1 supply vdd33 not 
found, using dummy regulator
[    2.434748] exynos-dwc3 soc:usb3-1: soc:usb3-1 supply vdd10 not 
found, using dummy regulator
[    2.459866] of_get_named_gpiod_flags: can't parse 'samsung,vbus-gpio' 
property of node '/soc/usb@12110000[0]'
[    2.460177] exynos-ehci 12110000.usb: EHCI Host Controller
[    2.465329] exynos-ehci 12110000.usb: new USB bus registered, 
assigned bus number 1
[    2.473161] exynos-ehci 12110000.usb: irq 90, io mem 0x12110000
[    2.507027] exynos-ehci 12110000.usb: USB 2.0 started, EHCI 1.00
[    2.512197] usb usb1: New USB device found, idVendor=1d6b, 
idProduct=0002, bcdDevice= 5.01
[    2.519880] usb usb1: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    2.527075] usb usb1: Product: EHCI Host Controller
[    2.531875] usb usb1: Manufacturer: Linux 
5.1.0-rc3-00114-g95e060e68bd9 ehci_hcd
[    2.539298] usb usb1: SerialNumber: 12110000.usb
[    2.562423] exynos-ohci 12120000.usb: USB Host Controller
[    2.567689] exynos-ohci 12120000.usb: new USB bus registered, 
assigned bus number 2
[    2.575502] exynos-ohci 12120000.usb: irq 90, io mem 0x12120000
[    2.651364] usb usb2: New USB device found, idVendor=1d6b, 
idProduct=0001, bcdDevice= 5.01
[    2.658219] usb usb2: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    2.665376] usb usb2: Product: USB Host Controller
[    2.670180] usb usb2: Manufacturer: Linux 
5.1.0-rc3-00114-g95e060e68bd9 ohci_hcd
[    2.677560] usb usb2: SerialNumber: 12120000.usb
[    2.719349] usb usb3: New USB device found, idVendor=1d6b, 
idProduct=0002, bcdDevice= 5.01
[    2.726870] usb usb3: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    2.734107] usb usb3: Product: xHCI Host Controller
[    2.738947] usb usb3: Manufacturer: Linux 
5.1.0-rc3-00114-g95e060e68bd9 xhci-hcd
[    2.746297] usb usb3: SerialNumber: xhci-hcd.3.auto
[    2.778642] usb usb4: We don't know the algorithms for LPM for this 
host, disabling LPM.
[    2.786800] usb usb4: New USB device found, idVendor=1d6b, 
idProduct=0003, bcdDevice= 5.01
[    2.794836] usb usb4: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    2.802022] usb usb4: Product: xHCI Host Controller
[    2.806837] usb usb4: Manufacturer: Linux 
5.1.0-rc3-00114-g95e060e68bd9 xhci-hcd
[    2.814258] usb usb4: SerialNumber: xhci-hcd.3.auto
[    2.855879] usb usb5: New USB device found, idVendor=1d6b, 
idProduct=0002, bcdDevice= 5.01
[    2.863456] usb usb5: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    2.870894] usb usb5: Product: xHCI Host Controller
[    2.875457] usb usb5: Manufacturer: Linux 
5.1.0-rc3-00114-g95e060e68bd9 xhci-hcd
[    2.882884] usb usb5: SerialNumber: xhci-hcd.4.auto
[    2.915149] usb usb6: We don't know the algorithms for LPM for this 
host, disabling LPM.
[    2.917137] usb 1-1: new high-speed USB device number 2 using exynos-ehci
[    2.923623] usb usb6: New USB device found, idVendor=1d6b, 
idProduct=0003, bcdDevice= 5.01
[    2.938433] usb usb6: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
[    2.945302] usb usb6: Product: xHCI Host Controller
[    2.950196] usb usb6: Manufacturer: Linux 
5.1.0-rc3-00114-g95e060e68bd9 xhci-hcd
[    2.957579] usb usb6: SerialNumber: xhci-hcd.4.auto
[    2.970795] usbcore: registered new interface driver uas
[    2.975423] usbcore: registered new interface driver usb-storage
[    3.208523] usb 1-1: New USB device found, idVendor=2232, 
idProduct=1056, bcdDevice= 0.35
[    3.219999] usb 1-1: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
[    3.227034] usb 1-1: Product: WebCam SC-10HDM13631N
[    3.227041] usb 1-1: Manufacturer: Generic
[    3.235923] usb 1-1: SerialNumber: 200901010001
[    3.257013] usb 5-1: new high-speed USB device number 2 using xhci-hcd
[    3.459744] usb 5-1: New USB device found, idVendor=0b95, 
idProduct=772b, bcdDevice= 0.01
[    3.460560] usbcore: registered new interface driver usbhid
[    3.460572] usbhid: USB HID core driver
[    3.474443] usb 5-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[    3.491163] usb 5-1: Product: AX88772B
[    3.500613] usb 5-1: Manufacturer: ASIX Elec. Corp.
[    3.509275] usb 5-1: SerialNumber: 1892F2
[    4.133358] asix 5-1:1.0 eth0: register 'asix' at 
usb-xhci-hcd.4.auto-1, ASIX AX88772B USB 2.0 Ethernet, 00:50:b6:18:92:f2

> ---
>   drivers/usb/host/xhci-ring.c | 12 ++++++++++++
>   drivers/usb/host/xhci.c      | 16 ++++++++++++++++
>   drivers/usb/host/xhci.h      | 17 +++++++++++++++++
>   3 files changed, 45 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9215a28..2825031 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3275,6 +3275,12 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>   			field |= TRB_IOC;
>   			more_trbs_coming = false;
>   			td->last_trb = ring->enqueue;
> +
> +			if (xhci_urb_suitable_for_idt(urb)) {
> +				memcpy(&send_addr, urb->transfer_buffer,
> +				       trb_buff_len);
> +				field |= TRB_IDT;
> +			}
>   		}
>   
>   		/* Only set interrupt on short packet for IN endpoints */
> @@ -3414,6 +3420,12 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>   	if (urb->transfer_buffer_length > 0) {
>   		u32 length_field, remainder;
>   
> +		if (xhci_urb_suitable_for_idt(urb)) {
> +			memcpy(&urb->transfer_dma, urb->transfer_buffer,
> +			       urb->transfer_buffer_length);
> +			field |= TRB_IDT;
> +		}
> +
>   		remainder = xhci_td_remainder(xhci, 0,
>   				urb->transfer_buffer_length,
>   				urb->transfer_buffer_length,
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 7fa58c9..255f93f 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1238,6 +1238,21 @@ EXPORT_SYMBOL_GPL(xhci_resume);
>   
>   /*-------------------------------------------------------------------------*/
>   
> +/*
> + * Bypass the DMA mapping if URB is suitable for Immediate Transfer (IDT),
> + * we'll copy the actual data into the TRB address register. This is limited to
> + * transfers up to 8 bytes on output endpoints of any kind with wMaxPacketSize
> + * >= 8 bytes. If suitable for IDT only one Transfer TRB per TD is allowed.
> + */
> +static int xhci_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb,
> +				gfp_t mem_flags)
> +{
> +	if (xhci_urb_suitable_for_idt(urb))
> +		return 0;
> +
> +	return usb_hcd_map_urb_for_dma(hcd, urb, mem_flags);
> +}
> +
>   /**
>    * xhci_get_endpoint_index - Used for passing endpoint bitmasks between the core and
>    * HCDs.  Find the index for an endpoint given its descriptor.  Use the return
> @@ -5154,6 +5169,7 @@ static const struct hc_driver xhci_hc_driver = {
>   	/*
>   	 * managing i/o requests and associated device resources
>   	 */
> +	.map_urb_for_dma =      xhci_map_urb_for_dma,
>   	.urb_enqueue =		xhci_urb_enqueue,
>   	.urb_dequeue =		xhci_urb_dequeue,
>   	.alloc_dev =		xhci_alloc_dev,
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 9334cde..abbd481 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1303,6 +1303,8 @@ enum xhci_setup_dev {
>   #define TRB_IOC			(1<<5)
>   /* The buffer pointer contains immediate data */
>   #define TRB_IDT			(1<<6)
> +/* TDs smaller than this might use IDT */
> +#define TRB_IDT_MAX_SIZE	8
>   
>   /* Block Event Interrupt */
>   #define	TRB_BEI			(1<<9)
> @@ -2149,6 +2151,21 @@ static inline struct xhci_ring *xhci_urb_to_transfer_ring(struct xhci_hcd *xhci,
>   					urb->stream_id);
>   }
>   
> +/*
> + * TODO: As per spec Isochronous IDT transmissions are supported. We bypass
> + * them anyways as we where unable to find a device that matches the
> + * constraints.
> + */
> +static inline bool xhci_urb_suitable_for_idt(struct urb *urb)
> +{
> +	if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && usb_urb_dir_out(urb) &&
> +	    usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
> +	    urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE)
> +		return true;
> +
> +	return false;
> +}
> +
>   static inline char *xhci_slot_state_string(u32 state)
>   {
>   	switch (state) {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

