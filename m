Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB08A6A94
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 15:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729306AbfICN60 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 09:58:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:48088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727107AbfICN60 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Sep 2019 09:58:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D99E233A1;
        Tue,  3 Sep 2019 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567519104;
        bh=AL9ilAfm2z6FaQF3vz1LCd4EHX+4bfHVacS04chIOsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UH8LSR+PDgbTgGC6CJvjtKRuo/kmJsjofK/mAeyr28hcXvH0qxo8d8Vc/ujetoG4W
         V3Cx1zdEay4SsPWgI7dUCVdiPXFxM+QEssShS5IwGYAf+ZLjIERwEtLMg67/Sp/dfy
         AyG9k+kIG9XBqoEGX9WU2BE0Jnk7TDUUY43/IjY8=
Date:   Tue, 3 Sep 2019 15:58:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: tegra: Parameterize mailbox register addresses
Message-ID: <20190903135822.GA10466@kroah.com>
References: <20190902082127.17963-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190902082127.17963-1-jckuo@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 02, 2019 at 04:21:27PM +0800, JC Kuo wrote:
> Tegra194 XUSB host controller has rearranged mailbox registers. This
> commit makes mailbox registers address a part of "soc" data so that
> xhci-tegra driver can be used for Tegra194.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 58 +++++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index dafc65911fc0..247b08ca49ee 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -42,19 +42,18 @@
>  #define XUSB_CFG_CSB_BASE_ADDR			0x800
>  
>  /* FPCI mailbox registers */
> -#define XUSB_CFG_ARU_MBOX_CMD			0x0e4
> +/* XUSB_CFG_ARU_MBOX_CMD */
>  #define  MBOX_DEST_FALC				BIT(27)
>  #define  MBOX_DEST_PME				BIT(28)
>  #define  MBOX_DEST_SMI				BIT(29)
>  #define  MBOX_DEST_XHCI				BIT(30)
>  #define  MBOX_INT_EN				BIT(31)
> -#define XUSB_CFG_ARU_MBOX_DATA_IN		0x0e8
> +/* XUSB_CFG_ARU_MBOX_DATA_IN and XUSB_CFG_ARU_MBOX_DATA_OUT */
>  #define  CMD_DATA_SHIFT				0
>  #define  CMD_DATA_MASK				0xffffff
>  #define  CMD_TYPE_SHIFT				24
>  #define  CMD_TYPE_MASK				0xff
> -#define XUSB_CFG_ARU_MBOX_DATA_OUT		0x0ec
> -#define XUSB_CFG_ARU_MBOX_OWNER			0x0f0
> +/* XUSB_CFG_ARU_MBOX_OWNER */
>  #define  MBOX_OWNER_NONE			0
>  #define  MBOX_OWNER_FW				1
>  #define  MBOX_OWNER_SW				2
> @@ -146,6 +145,13 @@ struct tegra_xusb_phy_type {
>  	unsigned int num;
>  };
>  
> +struct tega_xusb_mbox_regs {
> +	unsigned int cmd;
> +	unsigned int data_in;
> +	unsigned int data_out;
> +	unsigned int owner;

Shouldn't these all be u8 values?

> +};
> +
>  struct tegra_xusb_soc {
>  	const char *firmware;
>  	const char * const *supply_names;
> @@ -160,6 +166,8 @@ struct tegra_xusb_soc {
>  		} usb2, ulpi, hsic, usb3;
>  	} ports;
>  
> +	struct tega_xusb_mbox_regs mbox;
> +
>  	bool scale_ss_clock;
>  	bool has_ipfs;
>  };
> @@ -395,15 +403,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>  	 * ACK/NAK messages.
>  	 */
>  	if (!(msg->cmd == MBOX_CMD_ACK || msg->cmd == MBOX_CMD_NAK)) {
> -		value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
> +		value = fpci_readl(tegra, tegra->soc->mbox.owner);
>  		if (value != MBOX_OWNER_NONE) {
>  			dev_err(tegra->dev, "mailbox is busy\n");
>  			return -EBUSY;
>  		}
>  
> -		fpci_writel(tegra, MBOX_OWNER_SW, XUSB_CFG_ARU_MBOX_OWNER);
> +		fpci_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
>  
> -		value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
> +		value = fpci_readl(tegra, tegra->soc->mbox.owner);
>  		if (value != MBOX_OWNER_SW) {
>  			dev_err(tegra->dev, "failed to acquire mailbox\n");
>  			return -EBUSY;
> @@ -413,17 +421,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>  	}
>  
>  	value = tegra_xusb_mbox_pack(msg);
> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_DATA_IN);
> +	fpci_writel(tegra, value, tegra->soc->mbox.data_in);
>  
> -	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_CMD);
> +	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
>  	value |= MBOX_INT_EN | MBOX_DEST_FALC;
> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_CMD);
> +	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
>  
>  	if (wait_for_idle) {
>  		unsigned long timeout = jiffies + msecs_to_jiffies(250);
>  
>  		while (time_before(jiffies, timeout)) {
> -			value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
> +			value = fpci_readl(tegra, tegra->soc->mbox.owner);
>  			if (value == MBOX_OWNER_NONE)
>  				break;
>  
> @@ -431,7 +439,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
>  		}
>  
>  		if (time_after(jiffies, timeout))
> -			value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_OWNER);
> +			value = fpci_readl(tegra, tegra->soc->mbox.owner);
>  
>  		if (value != MBOX_OWNER_NONE)
>  			return -ETIMEDOUT;
> @@ -598,16 +606,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
>  
>  	mutex_lock(&tegra->lock);
>  
> -	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_DATA_OUT);
> +	value = fpci_readl(tegra, tegra->soc->mbox.data_out);
>  	tegra_xusb_mbox_unpack(&msg, value);
>  
> -	value = fpci_readl(tegra, XUSB_CFG_ARU_MBOX_CMD);
> +	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
>  	value &= ~MBOX_DEST_SMI;
> -	fpci_writel(tegra, value, XUSB_CFG_ARU_MBOX_CMD);
> +	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
>  
>  	/* clear mailbox owner if no ACK/NAK is required */
>  	if (!tegra_xusb_mbox_cmd_requires_ack(msg.cmd))
> -		fpci_writel(tegra, MBOX_OWNER_NONE, XUSB_CFG_ARU_MBOX_OWNER);
> +		fpci_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
>  
>  	tegra_xusb_mbox_handle(tegra, &msg);
>  
> @@ -1365,6 +1373,12 @@ static const struct tegra_xusb_soc tegra124_soc = {
>  	},
>  	.scale_ss_clock = true,
>  	.has_ipfs = true,
> +	.mbox = {
> +		.cmd = 0xe4,
> +		.data_in = 0xe8,
> +		.data_out = 0xec,
> +		.owner = 0xf0,
> +	},
>  };
>  MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
>  
> @@ -1397,6 +1411,12 @@ static const struct tegra_xusb_soc tegra210_soc = {
>  	},
>  	.scale_ss_clock = false,
>  	.has_ipfs = true,
> +	.mbox = {
> +		.cmd = 0xe4,
> +		.data_in = 0xe8,
> +		.data_out = 0xec,
> +		.owner = 0xf0,
> +	},
>  };
>  MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
>  
> @@ -1422,6 +1442,12 @@ static const struct tegra_xusb_soc tegra186_soc = {
>  	},
>  	.scale_ss_clock = false,
>  	.has_ipfs = false,
> +	.mbox = {
> +		.cmd = 0xe4,
> +		.data_in = 0xe8,
> +		.data_out = 0xec,
> +		.owner = 0xf0,
> +	},

This did not change any existing functionality, is there a follow-on
patch somewhere that takes advantage of this change to enable different
hardware?  Otherwise this doesn't seem worth it.

thanks,

greg k-h
