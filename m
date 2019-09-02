Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9289A5084
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 09:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbfIBH7u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Sep 2019 03:59:50 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:3349 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfIBH7u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Sep 2019 03:59:50 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6ccbf60000>; Mon, 02 Sep 2019 00:59:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 02 Sep 2019 00:59:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 02 Sep 2019 00:59:48 -0700
Received: from [10.19.108.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Sep
 2019 07:59:46 +0000
Subject: Re: [PATCH] xhci: tegra: mbox registers address in"soc" data
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>
References: <20190902035445.32046-1-jckuo@nvidia.com>
 <20190902075723.GD930@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <c9090571-8336-1473-751b-e4a61569076c@nvidia.com>
Date:   Mon, 2 Sep 2019 15:59:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902075723.GD930@ulmo>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567411190; bh=vOpXVpkN6b6ku7XSLI7wetEJWNp9g36LYrNDmGARWn0=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Rlrp5+6Lcild0Y1CEcJoN2XFY8nThSKFlBrXzV9xqmvUPehp5jdZ4EvRazFHvmxjV
         pBr7j3rA93+jj8Li5vshtULD42wBA89Q3ComTnVfyEvVwldhT2CzUAigNs/IsU0Meu
         epPwd6w+Ofuns3auNK1kR2h4ujI6uhiZuQKVsPRuSYNSkWebRZtL1Ag3b/kTF08+y+
         IvpGx8Abpc/vor3rc7InqPiayTFTxPtpXJz8Ibw8jrOxqsJWuJKvwL4qLeRw58kc+I
         k1Wtbw4805sshL+SVVbopWAWk8F5G4jZKtfsexCPJi+IgFVnBZzhvHq5wHs2kjVyvA
         GG6dyeCebHbNw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for review. I will modify accordingly and submit again.

On 9/2/19 3:57 PM, Thierry Reding wrote:
> On Mon, Sep 02, 2019 at 11:54:45AM +0800, JC Kuo wrote:
>> Tegra194 XUSB host controller has rearranged mailbox registers. This
>> commit makes mailbox registers address a part of "soc" data so that
>> xhci-tegra driver can be used for Tegra194.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>>  drivers/usb/host/xhci-tegra.c | 51 ++++++++++++++++++++++++++---------
>>  1 file changed, 39 insertions(+), 12 deletions(-)
> 
> I'd perhaps reformulate the subject a little to be something like:
> 
> 	xhci: tegra: Parameterize mailbox register addresses
> 
> Two other minor comments below.
> 
>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>> index dafc65911fc0..b92a03bbbd2c 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -146,6 +146,13 @@ struct tegra_xusb_phy_type {
>>  	unsigned int num;
>>  };
>>  
>> +struct tega_xusb_mbox_regs {
>> +	u32 cmd;
>> +	u32 data_in;
>> +	u32 data_out;
>> +	u32 owner;
>> +};
> 
> Perhaps make these unsigned int (or unsigned long). Making these
> explicitly sized variables suggests (at least to me) that they are
> register values, whereas they really are offsets. So I prefer to use
> "unsized" types to distinguish between register offsets and values.
> 
>> +
>>  struct tegra_xusb_soc {
>>  	const char *firmware;
>>  	const char * const *supply_names;
>> @@ -160,6 +167,8 @@ struct tegra_xusb_soc {
>>  		} usb2, ulpi, hsic, usb3;
>>  	} ports;
>>  
>> +	struct tega_xusb_mbox_regs mbox;
>> +
>>  	bool scale_ss_clock;
>>  	bool has_ipfs;
>>  };
>> @@ -395,15 +404,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
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
>> @@ -413,17 +422,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
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
>> @@ -431,7 +440,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>>  		}
>>  
>>  		if (time_after(jiffies, timeout))
>> -			value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
>> +			value = fpci_readl(tegra, tegra->soc->mbox.owner);
>>  
>>  		if (value != MBOX_OWNER_NONE)
>>  			return -ETIMEDOUT;
>> @@ -598,16 +607,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
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
>> @@ -1365,6 +1374,12 @@ static const struct tegra_xusb_soc tegra124_soc = {
>>  	},
>>  	.scale_ss_clock = true,
>>  	.has_ipfs = true,
>> +	.mbox = {
>> +		.cmd = XUSB_CFG_ARU_MBOX_CMD,
>> +		.data_in = XUSB_CFG_ARU_MBOX_DATA_IN,
>> +		.data_out = XUSB_CFG_ARU_MBOX_DATA_OUT,
>> +		.owner = XUSB_CFG_ARU_MBOX_OWNER,
>> +	},
>>  };
>>  MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
>>  
>> @@ -1397,6 +1412,12 @@ static const struct tegra_xusb_soc tegra210_soc = {
>>  	},
>>  	.scale_ss_clock = false,
>>  	.has_ipfs = true,
>> +	.mbox = {
>> +		.cmd = XUSB_CFG_ARU_MBOX_CMD,
>> +		.data_in = XUSB_CFG_ARU_MBOX_DATA_IN,
>> +		.data_out = XUSB_CFG_ARU_MBOX_DATA_OUT,
>> +		.owner = XUSB_CFG_ARU_MBOX_OWNER,
>> +	},
>>  };
>>  MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
>>  
>> @@ -1422,6 +1443,12 @@ static const struct tegra_xusb_soc tegra186_soc = {
>>  	},
>>  	.scale_ss_clock = false,
>>  	.has_ipfs = false,
>> +	.mbox = {
>> +		.cmd = XUSB_CFG_ARU_MBOX_CMD,
>> +		.data_in = XUSB_CFG_ARU_MBOX_DATA_IN,
>> +		.data_out = XUSB_CFG_ARU_MBOX_DATA_OUT,
>> +		.owner = XUSB_CFG_ARU_MBOX_OWNER,
>> +	},
> 
> You're already giving these registers names via the new parameters, so I
> don't think we need the symbolic names. This usually just leads to weird
> things like:
> 
> 	#define XUSB_CFG_ARU_MBOX_CMD_T194 ...
> 	#define XUSB_CFG_ARU_MBOX_DATA_IN_T194 ...
> 	#define XUSB_CFG_ARU_MBOX_DATA_OUT_T194 ...
> 	#define XUSB_CFG_ARU_MBOX_OWNER_T194 ...
> 
> 	.mbox = {
> 		.cmd = XUSB_CFG_ARU_MBOX_CMD_T194,
> 		.data_in = XUSB_CFG_ARU_MBOX_DATA_IN_T194,
> 		.data_out = XUSB_CFG_ARU_MBOX_DATA_OUT_T194,
> 		.owner = XUSB_CFG_ARU_MBOX_OWNER_T194,
> 	},
> 
> Just remove the symbolic names and use the literal address in the
> structure definition.
> 
> Thierry
> 
