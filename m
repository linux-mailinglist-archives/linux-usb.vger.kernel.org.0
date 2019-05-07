Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D855161B0
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 12:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfEGKIj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 06:08:39 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14657 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfEGKIj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 06:08:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd1592a0000>; Tue, 07 May 2019 03:08:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 07 May 2019 03:08:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 07 May 2019 03:08:38 -0700
Received: from [10.24.193.7] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 May
 2019 10:08:31 +0000
Subject: Re: [PATCH V2 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
To:     Thierry Reding <thierry.reding@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-8-git-send-email-nkristam@nvidia.com>
 <87bm0us0iy.fsf@linux.intel.com> <20190425135501.GA24213@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <007f702c-9da1-65db-3ef8-4472ee208eab@nvidia.com>
Date:   Tue, 7 May 2019 15:39:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425135501.GA24213@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557223725; bh=BVhSQBXBl0g5/D70gKliu7jAmuZktZ0a2UDB3hrem4s=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=bsl0762pw6LmQhwXkcd1vPnY3pB61a1Fo0wxvBeRWJui1V6zjjunbeqwUdKeFCVJK
         6Zy26Cffngtx6QrDRiycQqGdj/6D5cDnRvV+5Vea18INOwkNgCA+4rUM8Ts+1Cgnrf
         vKhzGXMvGy2R+UlBalWFK5C6EC+0/MlVwZio+gF1Rw710LrhVV8oPDu1TlNdr3dY4L
         1DPMDSOCLXEyecavs7Hl+wOY94L+JQm7sb+R8vD5I9x6uTA5mhlj4LVjB55sN/lmd9
         k+NzIPgpELKQUtnnRiXwySGCodKuBaB/nGCjZ2pOHatf2LKqxDkjF+geXFBO0H15G7
         +N8pjQ8ePEGSw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 25-04-2019 19:25, Thierry Reding wrote:
> On Thu, Apr 25, 2019 at 04:00:05PM +0300, Felipe Balbi wrote:
>> Nagarjuna Kristam <nkristam@nvidia.com> writes:
>>
>>> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
>>> XUSB device mode controller support SS, HS and FS modes
>>>
>>> Based on work by:
>>>   Mark Kuo <mkuo@nvidia.com>
>>>   Andrew Bresticker <abrestic@chromium.org>
>>>
>>> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
>>> ---
>>>  drivers/usb/gadget/udc/Kconfig      |   10 +
>>>  drivers/usb/gadget/udc/Makefile     |    1 +
>>>  drivers/usb/gadget/udc/tegra_xudc.c | 3702 +++++++++++++++++++++++++++++++++++
>>>  3 files changed, 3713 insertions(+)
>>>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>>>
>>> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
>>> index 0a16cbd..f6f469c 100644
>>> --- a/drivers/usb/gadget/udc/Kconfig
>>> +++ b/drivers/usb/gadget/udc/Kconfig
>>> @@ -439,6 +439,16 @@ config USB_GADGET_XILINX
>>>  	  dynamically linked module called "udc-xilinx" and force all
>>>  	  gadget drivers to also be dynamically linked.
>>>  
>>> +config USB_TEGRA_XUDC
>>> +	tristate "NVIDIA Superspeed USB 3.0 Device Controller"
>>> +	depends on ARCH_TEGRA
>>
>> no compile_test?
> 
> That's not possible right now. The driver depends on functions that
> don't have dummy implementations to support COMPILE_TEST. I suppose
> that's something that we could change, but does it need to be part
> of this initial submission?
> 
> On that note:
> 
> Nagarjuna, I think we have PHY_TEGRA_XUSB as at least one other
> dependency. Without that the driver could be enabled but fail to link
> because of the missing implementations that that driver would've
> provided.
> 

Yes. Will add PHY_TEGRA_XUSB as dependecy for funtional dependency too.

- Nagarjuna
> Thierry
> 
