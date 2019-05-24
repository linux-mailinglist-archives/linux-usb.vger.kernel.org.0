Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E1829243
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 10:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389046AbfEXIAH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 May 2019 04:00:07 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:18881 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389021AbfEXIAH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 May 2019 04:00:07 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce7a4860001>; Fri, 24 May 2019 01:00:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 24 May 2019 01:00:06 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 24 May 2019 01:00:06 -0700
Received: from [10.24.193.7] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 24 May
 2019 08:00:03 +0000
Subject: Re: [Patch V3 8/8] arm64: defconfig: Enable tegra XUDC driver
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-9-git-send-email-nkristam@nvidia.com>
 <20190523103042.GH30331@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <0b7508f4-584e-0193-6415-bbe4d9a4db42@nvidia.com>
Date:   Fri, 24 May 2019 13:31:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523103042.GH30331@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558684806; bh=FlLewyOu6/LhepYQjOXtri6Fy7Jtb8D5m5LOrENMcbo=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=WG2gV/8KHMONDicQHrbJ9dAxC+iUFTRoQe6JUvcfYTLzoBHQpX+czg2zzvKc2KXUv
         iD7rghwWbFQridS8BjaiJe/Qo9Tay0EetYRjoFia1TsF7fXtAgFfFzb8C3lM/R9ksb
         4hzkB1PXb2HWLo3gnJ6/fEXw4BerEVFNhgUc+PDaIMSUtKeM9ilyXG3rvmFERFiaKD
         8FWeC8nbR7VC6FuJfDequbFOk7URL10lELwS62yR7NtI+gbiRu2IIYEON6mGr4xDh9
         NemA8bbGCS3AYoqrPkysuZVbdzaqTwx3EKtIY/gyJ36v5zLVRm30DDkRzX6B/oegVB
         Ljt80EQKVUDTg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 23-05-2019 16:00, Thierry Reding wrote:
> On Thu, May 16, 2019 at 12:09:32PM +0530, Nagarjuna Kristam wrote:
>> Enable support for Nvidia XUSB device mode controller driver.
>>
>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>> ---
>>  arch/arm64/configs/defconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index b605b7f..bf1437c 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -575,6 +575,7 @@ CONFIG_USB_ULPI=y
>>  CONFIG_USB_GADGET=y
>>  CONFIG_USB_RENESAS_USBHS_UDC=m
>>  CONFIG_USB_RENESAS_USB3=m
>> +CONFIG_USB_TEGRA_XUDC=y
> 
> This driver is fairly large, do we really want to make it built-in by
> default? Are there any downsides to making this a loadable module?
> 
> Thierry
> 
 No downsides to make it as a module, will update change to mark it as module.
