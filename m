Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAFBAA7AD5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 07:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbfIDFnr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 01:43:47 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:5521 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfIDFnr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 01:43:47 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6f4f130000>; Tue, 03 Sep 2019 22:43:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 03 Sep 2019 22:43:46 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 03 Sep 2019 22:43:46 -0700
Received: from [10.19.108.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Sep
 2019 05:43:45 +0000
Subject: Re: [PATCH] xhci: tegra: Parameterize mailbox register addresses
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20190902082127.17963-1-jckuo@nvidia.com>
 <20190903135822.GA10466@kroah.com>
 <90794861-1fe7-b659-fd33-4fb0f2e7f929@nvidia.com>
 <20190904052101.GA17236@kroah.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <cd029850-0115-11d2-90fe-4d885130641e@nvidia.com>
Date:   Wed, 4 Sep 2019 13:43:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904052101.GA17236@kroah.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567575827; bh=m5SkN3/dj3tzznYFcWIQShp1kqLKqjPPZqXFmZflqz8=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=HwRVCJR54v6OEGgojAHc/vuJOgsdnzKM7w9c6LI1U78LimBZsmrOOFb/HBh/6At3X
         Zw/P7BPpcMHts9YyuKFJ2UXBsYbnzPdKZziSZRM9O5Hv8D3Y1yo83zT4STXys7IPRF
         jS72hEMXDSYGQ/ojcym96Zrz3+l9zCNsJUp0enwXkpRI/ACcYkqBxEreT6rOSCkHx/
         xM1WRlxtL2hq2qLBJELd+PopjomxL76uaVsBzYU/R7G4RmNPgjnQ5m0z/AmrgvgiiE
         xyqib06q9P6orySSF7YA2zpffrzpalwCkmK5FEWf+EGegBhXLC7jRm23RuW2PYYjNw
         NIfxKIhtgpEVg==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/4/19 1:21 PM, Greg KH wrote:
> On Wed, Sep 04, 2019 at 09:43:08AM +0800, JC Kuo wrote:
>> On 9/3/19 9:58 PM, Greg KH wrote:
>>> On Mon, Sep 02, 2019 at 04:21:27PM +0800, JC Kuo wrote:
>>>> Tegra194 XUSB host controller has rearranged mailbox registers. This
>>>> commit makes mailbox registers address a part of "soc" data so that
>>>> xhci-tegra driver can be used for Tegra194.
>>>>
>>>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>>>> ---
>>>>  drivers/usb/host/xhci-tegra.c | 58 +++++++++++++++++++++++++----------
>>>>  1 file changed, 42 insertions(+), 16 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>>>> index dafc65911fc0..247b08ca49ee 100644
>>>> --- a/drivers/usb/host/xhci-tegra.c
>>>> +++ b/drivers/usb/host/xhci-tegra.c
>>>> @@ -42,19 +42,18 @@
>>>>  #define XUSB_CFG_CSB_BASE_ADDR			0x800
>>>>  
>>>>  /* FPCI mailbox registers */
>>>> -#define XUSB_CFG_ARU_MBOX_CMD			0x0e4
>>>> +/* XUSB_CFG_ARU_MBOX_CMD */
>>>>  #define  MBOX_DEST_FALC				BIT(27)
>>>>  #define  MBOX_DEST_PME				BIT(28)
>>>>  #define  MBOX_DEST_SMI				BIT(29)
>>>>  #define  MBOX_DEST_XHCI				BIT(30)
>>>>  #define  MBOX_INT_EN				BIT(31)
>>>> -#define XUSB_CFG_ARU_MBOX_DATA_IN		0x0e8
>>>> +/* XUSB_CFG_ARU_MBOX_DATA_IN and XUSB_CFG_ARU_MBOX_DATA_OUT */
>>>>  #define  CMD_DATA_SHIFT				0
>>>>  #define  CMD_DATA_MASK				0xffffff
>>>>  #define  CMD_TYPE_SHIFT				24
>>>>  #define  CMD_TYPE_MASK				0xff
>>>> -#define XUSB_CFG_ARU_MBOX_DATA_OUT		0x0ec
>>>> -#define XUSB_CFG_ARU_MBOX_OWNER			0x0f0
>>>> +/* XUSB_CFG_ARU_MBOX_OWNER */
>>>>  #define  MBOX_OWNER_NONE			0
>>>>  #define  MBOX_OWNER_FW				1
>>>>  #define  MBOX_OWNER_SW				2
>>>> @@ -146,6 +145,13 @@ struct tegra_xusb_phy_type {
>>>>  	unsigned int num;
>>>>  };
>>>>  
>>>> +struct tega_xusb_mbox_regs {
>>>> +	unsigned int cmd;
>>>> +	unsigned int data_in;
>>>> +	unsigned int data_out;
>>>> +	unsigned int owner;
>>>
>>> Shouldn't these all be u8 values?
>>>
>> These data members represent register offset in Tegra XUSB FPCI area. Size of
>> FPCI area is 0x1000, so it is possible for future Tegra XUSB to have mailbox
>> registers allocated to somewhere > 0x100.
> 
> Ok, then u16?
> 

Thierry said he'd prefer to use "unsized" types to distinguish between register
offsets and values. I am fine with either way.

>>> This did not change any existing functionality, is there a follow-on
>>> patch somewhere that takes advantage of this change to enable different
>>> hardware?  Otherwise this doesn't seem worth it.
>>>
>> Yes, I will submit another patch to enable Tegra194 XHCI. It will make use of
>> this patch to declare Tegra194 XUSB mailbox registers as:
>>
>> 	.mbox = {
>> 		.cmd = 0x68,
>> 		.data_in = 0x6c,
>> 		.data_out = 0x70,
>> 		.owner = 0x74,
>> 	},
> 
> Can you send that out as patch 2/2 so that we see the need for this
> change?
> 
Yes, I will submit it along with this one.

Thanks,
JC
