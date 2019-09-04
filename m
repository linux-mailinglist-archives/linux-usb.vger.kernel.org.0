Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB418A781F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 03:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfIDBnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 21:43:14 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:18756 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbfIDBnO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 21:43:14 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6f16b30000>; Tue, 03 Sep 2019 18:43:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 03 Sep 2019 18:43:12 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 03 Sep 2019 18:43:12 -0700
Received: from [10.19.108.121] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Sep
 2019 01:43:10 +0000
Subject: Re: [PATCH] xhci: tegra: Parameterize mailbox register addresses
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20190902082127.17963-1-jckuo@nvidia.com>
 <20190903135822.GA10466@kroah.com>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <90794861-1fe7-b659-fd33-4fb0f2e7f929@nvidia.com>
Date:   Wed, 4 Sep 2019 09:43:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903135822.GA10466@kroah.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567561395; bh=AolpN2XapqNWiHC++EK/EfhoocqnX+VHovMQXLSeQxg=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=ESd4pjCGRpo1dnBUeqJ5Irvrs8KVS4uu8Qhhe4HJa9qB+ZScCzpPO8J4yeQN1ySK4
         a4L359PnMIWv8A75AYHu0bOz0YAOW8OjE1ZtN6dT1PYYIlMO0At44QfmcsfNp8lQEy
         QqKoiGDPjU1nhzFLFIeh21dNUTrkruOPx+OkcOT/gZW4h/r0NvYUyPCbzuhH0JGuyL
         eB2mSuyrqNXAY0uFfqVAYFVvrtEmiRibxyp71aP2OF59a66wwmBHB/tzSVkL+Gf3Xq
         KuIS2LjoIlsVy564ZERsCZTg97euHMOkW/nh67W/Hn4cKyBoVFJP87LLG4SUPnG3sd
         2dhH40kRWbFqA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/3/19 9:58 PM, Greg KH wrote:
> On Mon, Sep 02, 2019 at 04:21:27PM +0800, JC Kuo wrote:
>> Tegra194 XUSB host controller has rearranged mailbox registers. This
>> commit makes mailbox registers address a part of "soc" data so that
>> xhci-tegra driver can be used for Tegra194.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 58 +++++++++++++++++++++++++----------
>>  1 file changed, 42 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>> index dafc65911fc0..247b08ca49ee 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -42,19 +42,18 @@
>>  #define XUSB_CFG_CSB_BASE_ADDR			0x800
>>  
>>  /* FPCI mailbox registers */
>> -#define XUSB_CFG_ARU_MBOX_CMD			0x0e4
>> +/* XUSB_CFG_ARU_MBOX_CMD */
>>  #define  MBOX_DEST_FALC				BIT(27)
>>  #define  MBOX_DEST_PME				BIT(28)
>>  #define  MBOX_DEST_SMI				BIT(29)
>>  #define  MBOX_DEST_XHCI				BIT(30)
>>  #define  MBOX_INT_EN				BIT(31)
>> -#define XUSB_CFG_ARU_MBOX_DATA_IN		0x0e8
>> +/* XUSB_CFG_ARU_MBOX_DATA_IN and XUSB_CFG_ARU_MBOX_DATA_OUT */
>>  #define  CMD_DATA_SHIFT				0
>>  #define  CMD_DATA_MASK				0xffffff
>>  #define  CMD_TYPE_SHIFT				24
>>  #define  CMD_TYPE_MASK				0xff
>> -#define XUSB_CFG_ARU_MBOX_DATA_OUT		0x0ec
>> -#define XUSB_CFG_ARU_MBOX_OWNER			0x0f0
>> +/* XUSB_CFG_ARU_MBOX_OWNER */
>>  #define  MBOX_OWNER_NONE			0
>>  #define  MBOX_OWNER_FW				1
>>  #define  MBOX_OWNER_SW				2
>> @@ -146,6 +145,13 @@ struct tegra_xusb_phy_type {
>>  	unsigned int num;
>>  };
>>  
>> +struct tega_xusb_mbox_regs {
>> +	unsigned int cmd;
>> +	unsigned int data_in;
>> +	unsigned int data_out;
>> +	unsigned int owner;
> 
> Shouldn't these all be u8 values?
> 
These data members represent register offset in Tegra XUSB FPCI area. Size of
FPCI area is 0x1000, so it is possible for future Tegra XUSB to have mailbox
registers allocated to somewhere > 0x100.

>> +};
>> +
>>  struct tegra_xusb_soc {
>>  	const char *firmware;
>>  	const char * const *supply_names;
>> @@ -160,6 +166,8 @@ struct tegra_xusb_soc {
>>  		} usb2, ulpi, hsic, usb3;
>>  	} ports;
>>  
>> +	struct tega_xusb_mbox_regs mbox;
>> +
>>  	bool scale_ss_clock;
>>  	bool has_ipfs;
>>  };
>> @@ -395,15 +403,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>>  	 * ACK/NAK messages.
>>  	 */
>>  	if (!(msg->cmd == MBOX_CMD_ACK || msg->cmd == MBOX_CMD_NAK)) {
>> -		value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
>> +		value = fpci_readl(tegra, tegra->soc->mbox.owner);
>>  		if (value != MBOX_OWNER_NONE) {
>>  			dev_err(tegra->dev, "mailbox is busy\n");
>>  			return -EBUSY;
>>  		}
>>  
>> -		fpci_writel(tegra, MBOX_OWNER_SW, XUSB_CFG_ARU_MBOX_OWNER);
>> +		fpci_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
>>  
>> -		value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
>> +		value = fpci_readl(tegra, tegra->soc->mbox.owner);
>>  		if (value != MBOX_OWNER_SW) {
>>  			dev_err(tegra->dev, "failed to acquire mailbox\n");
>>  			return -EBUSY;
>> @@ -413,17 +421,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>>  	}
>>  
>>  	value = tegra_xusb_mbox_pack(msg);
>> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_DATA_IN);
>> +	fpci_writel(tegra, value, tegra->soc->mbox.data_in);
>>  
>> -	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_CMD);
>> +	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
>>  	value |= MBOX_INT_EN | MBOX_DEST_FALC;
>> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_CMD);
>> +	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
>>  
>>  	if (wait_for_idle) {
>>  		unsigned long timeout = jiffies + msecs_to_jiffies(250);
>>  
>>  		while (time_before(jiffies, timeout)) {
>> -			value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
>> +			value = fpci_readl(tegra, tegra->soc->mbox.owner);
>>  			if (value == MBOX_OWNER_NONE)
>>  				break;
>>  
>> @@ -431,7 +439,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>>  		}
>>  
>>  		if (time_after(jiffies, timeout))
>> -			value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
>> +			value = fpci_readl(tegra, tegra->soc->mbox.owner);
>>  
>>  		if (value != MBOX_OWNER_NONE)
>>  			return -ETIMEDOUT;
>> @@ -598,16 +606,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
>>  
>>  	mutex_lock(&tegra->lock);
>>  
>> -	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_DATA_OUT);
>> +	value = fpci_readl(tegra, tegra->soc->mbox.data_out);
>>  	tegra_xusb_mbox_unpack(&msg, value);
>>  
>> -	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_CMD);
>> +	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
>>  	value &= ~MBOX_DEST_SMI;
>> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_CMD);
>> +	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
>>  
>>  	/* clear mailbox owner if no ACK/NAK is required */
>>  	if (!tegra_xusb_mbox_cmd_requires_ack(msg.cmd))
>> -		fpci_writel(tegra, MBOX_OWNER_NONE, XUSB_CFG_ARU_MBOX_OWNER);
>> +		fpci_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
>>  
>>  	tegra_xusb_mbox_handle(tegra, &msg);
>>  
>> @@ -1365,6 +1373,12 @@ static const struct tegra_xusb_soc tegra124_soc = {
>>  	},
>>  	.scale_ss_clock = true,
>>  	.has_ipfs = true,
>> +	.mbox = {
>> +		.cmd = 0xe4,
>> +		.data_in = 0xe8,
>> +		.data_out = 0xec,
>> +		.owner = 0xf0,
>> +	},
>>  };
>>  MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
>>  
>> @@ -1397,6 +1411,12 @@ static const struct tegra_xusb_soc tegra210_soc = {
>>  	},
>>  	.scale_ss_clock = false,
>>  	.has_ipfs = true,
>> +	.mbox = {
>> +		.cmd = 0xe4,
>> +		.data_in = 0xe8,
>> +		.data_out = 0xec,
>> +		.owner = 0xf0,
>> +	},
>>  };
>>  MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
>>  
>> @@ -1422,6 +1442,12 @@ static const struct tegra_xusb_soc tegra186_soc = {
>>  	},
>>  	.scale_ss_clock = false,
>>  	.has_ipfs = false,
>> +	.mbox = {
>> +		.cmd = 0xe4,
>> +		.data_in = 0xe8,
>> +		.data_out = 0xec,
>> +		.owner = 0xf0,
>> +	},
> 
> This did not change any existing functionality, is there a follow-on
> patch somewhere that takes advantage of this change to enable different
> hardware?  Otherwise this doesn't seem worth it.
> 
Yes, I will submit another patch to enable Tegra194 XHCI. It will make use of
this patch to declare Tegra194 XUSB mailbox registers as:

	.mbox = {
		.cmd = 0x68,
		.data_in = 0x6c,
		.data_out = 0x70,
		.owner = 0x74,
	},

Thanks for review.
JC

> thanks,
> 
> greg k-h
> 
