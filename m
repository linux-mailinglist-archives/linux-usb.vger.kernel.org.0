Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDDD9133C4B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 08:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgAHH1k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 02:27:40 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60228 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgAHH1k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 02:27:40 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0087RUD1015600;
        Wed, 8 Jan 2020 01:27:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578468450;
        bh=VW6PM2702lIPzXmgqg+YQwX0PinR2cdtSGnvdoOmC5o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=CZ3NjYtr64i0Jjr/SVcrmXAhNO0lxnE1IdTdkzYW5Y56DE3Zmt3no7FVoI9H5wg9j
         kp/RbylwAkbiz/NYKOXDmiGhmmFbCVTDQ45rg/0/vmlfroLUDD54cmaTNQHYvx9O/n
         q28/yIqnu1t3YF4kPOeiYbkg01TPXSvdUyd0gxWM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0087RU1J068663
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Jan 2020 01:27:30 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 01:27:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 01:27:29 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0087RPhs016665;
        Wed, 8 Jan 2020 01:27:26 -0600
Subject: Re: [PATCH] phy: core: Add consumer device link support
To:     Jon Hunter <jonathanh@nvidia.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <20191104143713.11137-1-alexandre.torgue@st.com>
 <146b2971-d51a-164c-aea8-9b6b4ff5f420@nvidia.com>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <341954e6-79f8-d45c-fc05-1ce5bd4e3abb@ti.com>
Date:   Wed, 8 Jan 2020 12:59:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <146b2971-d51a-164c-aea8-9b6b4ff5f420@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jon,

On 07/01/20 5:21 PM, Jon Hunter wrote:
> 
> On 04/11/2019 14:37, Alexandre Torgue wrote:
>> In order to enforce suspend/resume ordering, this commit creates link
>> between phy consumers and phy devices. This link avoids to suspend phy
>> before phy consumers.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> With next-20200106 we are seeing a boot regression on Tegra124 Jetson
> TK1 board. Bisect is pointing to this commit and reverting this on top
> of -next fixes the problem.
> 
> The bootlog is showing the following crash on boot ...
> 
> [    1.730024] 8<--- cut here ---
> [    1.733079] Unable to handle kernel paging request at virtual address fffffe7f
> [    1.740318] pgd = (ptrval)
> [    1.743021] [fffffe7f] *pgd=affff841, *pte=00000000, *ppte=00000000
> [    1.749304] Internal error: Oops: 27 [#1] SMP ARM
> [    1.754001] Modules linked in:
> [    1.757057] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.5.0-rc4-next-20200106-g9eb1b48ca4ce #1
> [    1.765654] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [    1.771919] PC is at device_link_add+0x68/0x4d4
> [    1.776444] LR is at device_link_add+0x68/0x4d4
> [    1.780967] pc : [<c09832e4>]    lr : [<c09832e4>]    psr: 60000013
> [    1.787223] sp : ee0e1d60  ip : 60000013  fp : 00000005
> [    1.792439] r10: 00000000  r9 : 00000000  r8 : eefedd88
> [    1.797657] r7 : ee269c10  r6 : fffffdfb  r5 : 00000001  r4 : 00000001
> [    1.804173] r3 : ee0d8000  r2 : 00000000  r1 : 00000000  r0 : c1858f88
> [    1.810691] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    1.817815] Control: 10c5387d  Table: 8020406a  DAC: 00000051
> [    1.823552] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> [    1.829549] Stack: (0xee0e1d60 to 0xee0e2000)
> [    1.833904] 1d60: eefedd88 00000040 c07087a0 fffffdfb ee269c10 ee737640 00000000 eefedd88
> [    1.842073] 1d80: 00000000 00000000 00000005 c0707d34 00000000 ee3c8a00 ee7375c0 ee269c10
> [    1.850242] 1da0: eefedd88 c0a0bd2c c1704e48 ee269c10 ee269c00 ee3c8a00 00000000 c0a0c4a8
> [    1.858409] 1dc0: ee269c10 c1704e48 c186603c 00000000 c186603c 00000000 00000000 bc98ab22
> [    1.866577] 1de0: ffffffff ee269c10 00000000 c186603c ee269c00 c186603c 00000000 00000000
> [    1.874744] 1e00: c1656690 c0a0ffe0 00000000 bc98ab22 ee269c10 ee269c10 00000000 c186603c
> [    1.882913] 1e20: 00000000 c186603c 00000000 c09887e0 c18ff9dc ee269c10 c18ff9e0 c0986860
> [    1.891082] 1e40: ee269c10 c186603c c186603c c1704e48 00000000 c15003f0 c15c3854 c0986af0
> [    1.899249] 1e60: c15c3854 c0d128b4 c10e48ec ee269c10 00000000 c186603c c1704e48 00000000
> [    1.907416] 1e80: c15003f0 c15c3854 c1656690 c0986da0 00000000 c186603c ee269c10 c0986e28
> [    1.915583] 1ea0: 00000000 c186603c c0986da8 c0984ba0 c15003f0 ee20c058 ee242334 bc98ab22
> [    1.923752] 1ec0: c18588c8 c186603c ee737200 c18588c8 00000000 c0985b94 c133ef10 ffffe000
> [    1.931919] 1ee0: c186603c c186603c c18aaf80 ffffe000 c158b72c c09878ac c1704e48 c18aaf80
> [    1.940088] 1f00: ffffe000 c0302f80 00000168 c0367d84 c143e5b4 c1371000 00000000 00000006
> [    1.948255] 1f20: 00000006 c125b1b4 00000000 c1704e48 c126f324 c125b228 00000000 efffec88
> [    1.956424] 1f40: 00000000 bc98ab22 00000000 c18b6bc0 c18b6bc0 bc98ab22 c18b6bc0 c18b6bc0
> [    1.964591] 1f60: 00000007 c15c3834 00000169 c1500f28 00000006 00000006 00000000 c15003f0
> [    1.972758] 1f80: 00000000 00000000 c0ef1cdc 00000000 00000000 00000000 00000000 00000000
> [    1.980924] 1fa0: 00000000 c0ef1ce4 00000000 c03010e8 00000000 00000000 00000000 00000000
> [    1.989092] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.997260] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [    2.005440] [<c09832e4>] (device_link_add) from [<c0707d34>] (devm_of_phy_get+0x6c/0xb0)
> [    2.013528] [<c0707d34>] (devm_of_phy_get) from [<c0a0bd2c>] (ahci_platform_get_phy+0x28/0xd0)
> [    2.022134] [<c0a0bd2c>] (ahci_platform_get_phy) from [<c0a0c4a8>] (ahci_platform_get_resources+0x384/0x468)
> [    2.031952] [<c0a0c4a8>] (ahci_platform_get_resources) from [<c0a0ffe0>] (tegra_ahci_probe+0x14/0x650)
> [    2.041254] [<c0a0ffe0>] (tegra_ahci_probe) from [<c09887e0>] (platform_drv_probe+0x48/0x98)
> [    2.049686] [<c09887e0>] (platform_drv_probe) from [<c0986860>] (really_probe+0x234/0x34c)
> [    2.057944] [<c0986860>] (really_probe) from [<c0986af0>] (driver_probe_device+0x60/0x168)
> [    2.066202] [<c0986af0>] (driver_probe_device) from [<c0986da0>] (device_driver_attach+0x58/0x60)
> [    2.075064] [<c0986da0>] (device_driver_attach) from [<c0986e28>] (__driver_attach+0x80/0xbc)
> [    2.083582] [<c0986e28>] (__driver_attach) from [<c0984ba0>] (bus_for_each_dev+0x74/0xb4)
> [    2.091751] [<c0984ba0>] (bus_for_each_dev) from [<c0985b94>] (bus_add_driver+0x164/0x1e8)
> [    2.100008] [<c0985b94>] (bus_add_driver) from [<c09878ac>] (driver_register+0x7c/0x114)
> [    2.108094] [<c09878ac>] (driver_register) from [<c0302f80>] (do_one_initcall+0x54/0x22c)
> [    2.116271] [<c0302f80>] (do_one_initcall) from [<c1500f28>] (kernel_init_freeable+0x14c/0x1b0)
> [    2.124967] [<c1500f28>] (kernel_init_freeable) from [<c0ef1ce4>] (kernel_init+0x8/0x10c)
> [    2.133139] [<c0ef1ce4>] (kernel_init) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
> [    2.140697] Exception stack(0xee0e1fb0 to 0xee0e1ff8)
> [    2.145743] 1fa0:                                     00000000 00000000 00000000 00000000
> [    2.153910] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    2.162076] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    2.168686] Code: e59f0470 03844040 eb15cb16 eb004c8a (e5d63084) 
> [    2.174824] ---[ end trace fddbf111e88ec722 ]---
> 
> 
> I believe that there is a bug in this patch and the following fixed it for me ...
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 8dfb4868c8c3..2eb28cc2d2dc 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -799,6 +799,7 @@ struct phy *devm_of_phy_get(struct device *dev, struct device_node *np,
>                 devres_add(dev, ptr);
>         } else {
>                 devres_free(ptr);
> +               return phy;
>         }
>  
>         link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);

Thank you for spotting this. I've included the fix now.

Thanks
Kishon
