Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF20258DE0
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 14:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgIAMGI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 08:06:08 -0400
Received: from foss.arm.com ([217.140.110.172]:40882 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728060AbgIAMAx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Sep 2020 08:00:53 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 463E01FB;
        Tue,  1 Sep 2020 05:00:30 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 937E73F68F;
        Tue,  1 Sep 2020 05:00:28 -0700 (PDT)
Subject: Re: [PATCH 2/2] usb: dwc3: Add driver for Xilinx platforms
To:     Manish Narani <MNARANI@xilinx.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <1598467441-124203-1-git-send-email-manish.narani@xilinx.com>
 <1598467441-124203-3-git-send-email-manish.narani@xilinx.com>
 <0927fb9f-1044-38b3-d6f3-76edffefd99c@arm.com>
 <DM6PR02MB589878EB45E441F87B6D177CC1520@DM6PR02MB5898.namprd02.prod.outlook.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <98c17481-e9c5-ce03-ad30-3653ec2305d4@arm.com>
Date:   Tue, 1 Sep 2020 13:00:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <DM6PR02MB589878EB45E441F87B6D177CC1520@DM6PR02MB5898.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-08-28 18:53, Manish Narani wrote:
> Hi Robin,
> 
> Thanks for the review. Please find my comment below inline.
> 
>> -----Original Message-----
>> From: Robin Murphy <robin.murphy@arm.com>
>> Sent: Friday, August 28, 2020 12:17 AM
>> To: Manish Narani <MNARANI@xilinx.com>; gregkh@linuxfoundation.org;
>> robh+dt@kernel.org; Michal Simek <michals@xilinx.com>; balbi@kernel.org;
>> p.zabel@pengutronix.de
>> Cc: devicetree@vger.kernel.org; linux-usb@vger.kernel.org; linux-
>> kernel@vger.kernel.org; git <git@xilinx.com>; linux-arm-
>> kernel@lists.infradead.org
>> Subject: Re: [PATCH 2/2] usb: dwc3: Add driver for Xilinx platforms
>>
>> On 2020-08-26 19:44, Manish Narani wrote:
>> [...]
>>> +	/*
>>> +	 * This routes the usb dma traffic to go through CCI path instead
>>> +	 * of reaching DDR directly. This traffic routing is needed to
>>> +	 * make SMMU and CCI work with USB dma.
>>> +	 */
>>> +	if (of_dma_is_coherent(dev->of_node) || dev->iommu_group) {
>>> +		reg = readl(priv_data->regs + XLNX_USB_COHERENCY);
>>> +		reg |= XLNX_USB_COHERENCY_ENABLE;
>>> +		writel(reg, priv_data->regs + XLNX_USB_COHERENCY);
>>> +	}
>>
>> This looks rather suspect - coherency should be based on coherency, not
>> on whether an IOMMU group is present. If the device isn't described as
>> coherent in the DT, then any SMMU mappings will end up using attributes
>> that will downgrade traffic to be non-snooping anyway. And if the SMMU
>> is enabled but not translating (e.g. "iommu.passthrough=1") then
>> enabling hardware coherency when the DMA layer hasn't been told about it
>> can potentially lead to nasty subtle problems and data loss.
> 
> May be the description needs to be updated in this. This is not the actual coherency enabling bit, but this is needed when coherency is enabled.
> This is a register inside Xilinx USB controller which handles USB (which is in LPD) traffic route switching from LPD (Low Power Domain) to FPD (Full Power Domain)  path in the Xilinx SoC in either of the below scenarios:
> 1. Device is described coherent in  DT.
> 2. SMMU is enabled.
> 
> I will update the same in v2.

Ah, OK, so it's just that the control bit itself has a terrible name :)

 From the available information I had assumed that this controlled the 
output attributes, and that the interconnect might then steer traffic 
based on those. Explaining a bit more clearly in the comment probably 
would be a good idea. In that case, I'd concur that the current logic is 
in fact appropriate, but please use the device_iommu_mapped() helper for 
cleanliness.

Cheers,
Robin.
