Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6F71C318B
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 06:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbgEDEBw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 00:01:52 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17047 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgEDEBw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 00:01:52 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eaf93a30000>; Sun, 03 May 2020 21:01:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Sun, 03 May 2020 21:01:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Sun, 03 May 2020 21:01:51 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 04:01:51 +0000
Received: from [10.19.66.205] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May 2020
 04:01:48 +0000
Subject: Re: [PATCH V1 4/4] usb: gadget: tegra-xudc: add port_speed_quirk
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
 <1587022460-31988-5-git-send-email-nkristam@nvidia.com>
 <20200428122512.GN3592148@ulmo>
X-Nvconfidentiality: public
From:   Nagarjuna Kristam <nkristam@nvidia.com>
Message-ID: <691d5a8e-0ca8-e763-9b85-54625db84076@nvidia.com>
Date:   Mon, 4 May 2020 09:33:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200428122512.GN3592148@ulmo>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588564899; bh=Q3+Vc1uts5b4S8WhqJ4nDKsljF9QCS2tTCNV7kcPkWg=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=M0WmIn1vRe+4SOwUnQ+kXiZbn6zquxpJI+LGl+ohVA4ehAFFtBCVzze6gWXV0WQIG
         FFiprs5BvxBOuIVufb0NnzXmjbMEmGTrLqiPUxB+ClEw3V600mxu7VY5FCGo2sM3a7
         qf+4/kT+2qV1astb7BOXNzFpEYYpo6ejTJRsNXLGDSfDiH8WDi7Bk0ibfDK7MS2Uw+
         cPOiC6Ilu4Y5o0yV2vpIvtNb50E/DZh3TU3JuaPrDZQpftRhN3WDonA0RTHiwTuMLr
         L8ytcKCS9+2DABrtL4nWq45u1hU6jjq6vSLy3aDgxEXSuWBqjQABEExLknxd0U3GcH
         9XMrIwE1wOb9w==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 28-04-2020 17:55, Thierry Reding wrote:
> 
> On Thu, Apr 16, 2020 at 01:04:20PM +0530, Nagarjuna Kristam wrote:
>> Add port_speed_quirk that modify below registers to limit/restore OTG
>> port speed to GEN1/GEN2.
>> SSPX_CORE_CNT56
>> SSPX_CORE_CNT57
>> SSPX_CORE_CNT65
>> SSPX_CORE_CNT66
>> SSPX_CORE_CNT67
>> SSPX_CORE_CNT72
>>
>> The basic idea is to make SCD intentionally fail, reduce SCD timeout and
>> force device transit to TSEQ. Enable this flag to only Tegra194.
>>
>> Based on work by WayneChang<waynec@nvidia.com>
>>
>> Signed-off-by: Nagarjuna Kristam<nkristam@nvidia.com>
>> ---
>>   drivers/usb/gadget/udc/tegra-xudc.c | 106 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
> You're telling readers what you're doing, but after reading the commit
> message, I have no idea why this is being done. Can you provide more
> information on why exactly is this needed? Why do we have to limit the
> OTG port speed?
> 
> Thierry
Will re-word the commit message to explain on why this is needed.

Thanks,
Nagarjuna
