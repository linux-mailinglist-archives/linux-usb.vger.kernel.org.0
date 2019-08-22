Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBCC7990EF
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 12:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387715AbfHVKeY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 06:34:24 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:5762 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387699AbfHVKeY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 06:34:24 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d5e6faf0000>; Thu, 22 Aug 2019 03:34:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 22 Aug 2019 03:34:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 22 Aug 2019 03:34:23 -0700
Received: from [10.24.193.88] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Aug
 2019 10:34:21 +0000
Subject: Re: [Patch V6 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
 <1565257046-9890-8-git-send-email-nkristam@nvidia.com>
 <20190822091248.GD23873@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <f48e97e5-4ceb-7c83-de6a-4f29cf1945cf@nvidia.com>
Date:   Thu, 22 Aug 2019 16:05:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822091248.GD23873@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL109.nvidia.com (172.20.187.15) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1566470063; bh=UwwQWiEoSYjEYygq5DziID0WjJ39nuEsV4tOXdpa8zQ=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=rCdoBFQJnlPZmEuyVlH4/ytaw0MHhfGOcIEz+iHdSSSpT0w+fXeAIfB00TdSIU1HI
         3zajcgb6C+gWo0x1A72e8F8swF4DYfYBzPzW1isnh0tuUA6f2NZmnZ0oMRGSDQ37R7
         UgOBcnN2hYcESjAepRNWGPc2Q56lg6uYtPGBF7l12SW8CPnRC9S40uFxtLecJ0HBcR
         LTrFg7+QDnhkFEeZyMMVlJlZogcrwFtd4k/BObdp47S+pLtQCXHuou6UPt4o7ind+u
         BtHDITRQZLDzhx7X0lz13cMO0BrjAQMKC2GYif1kPviaKeAn9ntUyzP181Z8CtRb7F
         +Wv0OyU/jmZSQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 22-08-2019 14:42, Thierry Reding wrote:
> On Thu, Aug 08, 2019 at 03:07:25PM +0530, Nagarjuna Kristam wrote:
>> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
>> XUSB device mode controller supports SS, HS and FS modes
>>
>> Based on work by:
>>   Mark Kuo <mkuo@nvidia.com>
>>   Hui Fu <hfu@nvidia.com>
>>   Andrew Bresticker <abrestic@chromium.org>
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  drivers/usb/gadget/udc/Kconfig      |   11 +
>>  drivers/usb/gadget/udc/Makefile     |    1 +
>>  drivers/usb/gadget/udc/tegra_xudc.c | 3808 +++++++++++++++++++++++++++++++++++
>>  3 files changed, 3820 insertions(+)
>>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>>
>> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
>> index ef0259a..fe6028e 100644
>> --- a/drivers/usb/gadget/udc/Kconfig
>> +++ b/drivers/usb/gadget/udc/Kconfig
>> @@ -440,6 +440,17 @@ config USB_GADGET_XILINX
>>  	  dynamically linked module called "udc-xilinx" and force all
>>  	  gadget drivers to also be dynamically linked.
>>  
>> +config USB_TEGRA_XUDC
>> +	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
>> +	depends on ARCH_TEGRA
>> +	select USB_ROLE_SWITCH
>> +	help
>> +	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
>> +
>> +	 Say "y" to link the driver statically, or "m" to build a
>> +	 dynamically linked module called "tegra_xudc" and force all
>> +	 gadget drivers to also be dynamically linked.
>> +
>>  source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
>>  
>>  #
>> diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
>> index 897f648..1c55c96 100644
>> --- a/drivers/usb/gadget/udc/Makefile
>> +++ b/drivers/usb/gadget/udc/Makefile
>> @@ -24,6 +24,7 @@ obj-$(CONFIG_USB_BCM63XX_UDC)	+= bcm63xx_udc.o
>>  obj-$(CONFIG_USB_FSL_USB2)	+= fsl_usb2_udc.o
>>  fsl_usb2_udc-y			:= fsl_udc_core.o
>>  fsl_usb2_udc-$(CONFIG_ARCH_MXC)	+= fsl_mxc_udc.o
>> +obj-$(CONFIG_USB_TEGRA_XUDC)	+= tegra_xudc.o
> 
> Nit: I have a slight preference for tegra-xudc.o over tegra_xudc.o. We
> use dashes rather than underscores pretty consistently on Tegra, so it
> would be good to keep the same pattern here, unless somebody feels
> strongly about the underscore.
> 
> It doesn't matter that much because module utilities treat them the same
> way I think, so the Acked-by remains valid either way.
> 
> Thierry
> 

Thierry,
Reason to keep tegra_xudc.c instead of tegra-xudc.c is to inline with local file naming.
I will use tegra-xudc.c name in next version, to be inline with other tegra files across
kernel.

Thanks,
Nagarjuna
