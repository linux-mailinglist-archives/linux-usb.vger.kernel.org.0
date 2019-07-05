Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511F85FFD8
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 05:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbfGEDpy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 23:45:54 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:11285 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfGEDpy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 23:45:54 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1ec7f00001>; Thu, 04 Jul 2019 20:45:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 04 Jul 2019 20:45:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 04 Jul 2019 20:45:53 -0700
Received: from [10.19.108.127] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 5 Jul
 2019 03:45:22 +0000
Subject: Re: [PATCH 2/8] clk: tegra: don't enable PLLE HW sequencer at init
To:     Jon Hunter <jonathanh@nvidia.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-3-jckuo@nvidia.com>
 <4b63588d-937c-ea9f-573f-0fc2028b6061@nvidia.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <db0e32ac-eacd-e6e0-ed33-22bdfd8295da@nvidia.com>
Date:   Fri, 5 Jul 2019 11:45:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <4b63588d-937c-ea9f-573f-0fc2028b6061@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562298352; bh=vjXUBF0Gkj114nabhLTU/RVS0DLjij1fs7qcvEn1AXA=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=n1b+ys2temx4x7ViUzEcf/8zZBQuEwn4cnJipXMfhStdlDwLH5Dy6WkriRyFLob0Q
         lfc6Yxdu8eWHIrzLwkinCf0OSsMQwXHGa6OfFEWB3LgWjAX2zuXLoTsPgm8wSF2T4p
         BJtkIo3lhuBm/QHpvQCJXgosMJStoEKTW7377CQw1Ur0swM9yCLHPkEJXYZCiyrpSy
         GeFojlVhMlpFtzg9U0ObXvDbHSYKd5G2dOj7WQm1Ujt90wnSbxfE2+dDNIbcBCMp7o
         Pwq0rkOpmkh13VuzNYfQA18OKmteeu3L/myNVN6mKliIdn2qpfdcv7XD73TLyirG2M
         PqYJDD8ZBIEhQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/4/19 8:22 PM, Jon Hunter wrote:
> 
> On 14/06/2019 08:46, JC Kuo wrote:
>> PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
>> power sequencers' output to enable/disable PLLE. PLLE hardware power
>> sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
>> are enabled.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>>  drivers/clk/tegra/clk-pll.c | 12 ------------
>>  1 file changed, 12 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
>> index 1583f5fc992f..e6de65987fd2 100644
>> --- a/drivers/clk/tegra/clk-pll.c
>> +++ b/drivers/clk/tegra/clk-pll.c
>> @@ -2469,18 +2469,6 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
>>  	pll_writel(val, PLLE_SS_CTRL, pll);
>>  	udelay(1);
>>  
>> -	val = pll_readl_misc(pll);
>> -	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
>> -	pll_writel_misc(val, pll);
>> -
>> -	val = pll_readl(pll->params->aux_reg, pll);
>> -	val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
>> -	val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
>> -	pll_writel(val, pll->params->aux_reg, pll);
>> -	udelay(1);
>> -	val |= PLLE_AUX_SEQ_ENABLE;
>> -	pll_writel(val, pll->params->aux_reg, pll);
>> -
>>  out:
>>  	if (pll->lock)
>>  		spin_unlock_irqrestore(pll->lock, flags);
>>
> 
> So this function is called clk_plle_tegra210_enable() and is called by
> the CCF enable callback. However, after the above change, does this mean
> that this no longer enables the PLL? I understand that that is what you
> want, but from an architecture perspective, it seems incorrect to have
> an enable function that when called does not enable the PLL as expected.
> 
> I don't fully understand why we need to add the new helpers from the
> previous patch and we cannot use the CCF APIs directly?
> 
> If you really need to split the existing enable function, then the CCF
> does have prepare and enable callbacks that can be used.
> 
> Cheers
> Jon
> 
Hi Jon,
Thanks for review. With this change, clk_plle_tegra210_enable() still enables
PLLE (by setting PLLE_BASE_ENABLE bit). It just skips the procedure to enable
the hardware sequencer (controlled by PLLE_AUX_SEQ_ENABLE bit).

PLLE has a hardware power sequencer logic which is a state machine that can
power on/off PLLE without any software intervention. The sequencer has two
inputs, one from XUSB UPHY PLL and the other from SATA UPHY PLL. PLLE provides
reference clock to XUSB and SATA UPHY PLLs. When both of the downstream PLLs are
powered-off, PLLE hardware power sequencer will automatically power off PLLE for
power saving.

XUSB and SATA UPHY PLLs also have their own hardware power sequencer logic. XUSB
UPHY PLL is shared between XUSB SuperSpeed ports and PCIE controllers. The XUSB
UPHY PLL hardware power sequencer has inputs from XUSB and PCIE. When all of the
XUSB SuperSpeed ports and PCIE controllers are in low power state, XUSB UPHY PLL
hardware power sequencer automatically power off PLL and signals idle to PLLE
hardware power sequencer. Similar applies to SATA UPHY PLL.

Therefore, before enabling PLLE hardware power sequencer, software must ensure
that both XUSB and SATA UPHY PLLs hardware power sequencers are enabled properly.

Tegra210 XUSB PADCTL driver (drivers/phy/tegra/xusb-tegra210.c) is in charge of
enabling XUSB and SATA UPHY PLLs in software controlled power state. Sequencers
are managed by CAR registers, so xusb-tegra210.c invokes the following APIs to
get hardware power sequencers enabled.

  tegra210_xusb_pll_hw_control_enable()
  tegra210_xusb_pll_hw_sequence_start()
  tegra210_sata_pll_hw_control_enable()
  tegra210_sata_pll_hw_sequence_start()

Thanks,
JC
