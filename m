Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12752108EF2
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 14:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfKYNde (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 08:33:34 -0500
Received: from mail.kapsi.fi ([91.232.154.25]:46097 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727497AbfKYNde (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Nov 2019 08:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qXIOLXLUvREKWOjexp0rNM4qehc0b6PN+dZkfXxuP0k=; b=gjYeqBVQ0oXUgwcgAbY7GzVQVy
        fYgmY5dflOcMHx4qpU14rrKKe8aLfGihg+d+e0P72Q/M/tE3ckaOYZUOOZ4SM86S/A7jgCShEV2/A
        Ra9RpsDldfp3pjc4An50v2E9ofdhNNz0bY5B4txq/amo5G6tDJKVqnhJLRzKGXeuxc9sUXWwacv15
        gmyVwzyVZk5BffRufkTr6H/Tuh/1iiGTDL88YNsw5blquCKQI4kiyYAJJEf+4ZZmFS2L59KouXmc/
        w9QZbHWCe25DFRpv1cwslBxq8sbebm9F3K+s0jpRSXk1+Ghh5/h91lLzprMqB5IkB1YgiI9EBVext
        k3xonaww==;
Received: from [193.209.96.43] (helo=[10.21.26.179])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1iZEUb-0003B6-L4; Mon, 25 Nov 2019 15:33:29 +0200
Subject: Re: [PATCH 03/10] usb: host: xhci-tegra: Avoid a fixed duration sleep
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20191125123210.1564323-1-thierry.reding@gmail.com>
 <20191125123210.1564323-4-thierry.reding@gmail.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <3d6e2b34-bc66-60fd-1db9-8804ec9b027d@kapsi.fi>
Date:   Mon, 25 Nov 2019 15:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191125123210.1564323-4-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 193.209.96.43
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25.11.2019 14.32, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Do not use a fixed duration sleep to wait for the DMA controller to
> become ready. Instead, poll the L2IMEMOP_RESULT register for the VLD
> flag to determine when the XUSB controller's DMA master is ready.
> 
> Based on work by JC Kuo <jckuo@nvidia.com>.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/usb/host/xhci-tegra.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 5cfd54862670..d15fd16168ae 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -101,6 +101,8 @@
>   #define  L2IMEMOP_ACTION_SHIFT			24
>   #define  L2IMEMOP_INVALIDATE_ALL		(0x40 << L2IMEMOP_ACTION_SHIFT)
>   #define  L2IMEMOP_LOAD_LOCKED_RESULT		(0x11 << L2IMEMOP_ACTION_SHIFT)
> +#define XUSB_CSB_MEMPOOL_L2IMEMOP_RESULT	0x101a18
> +#define  L2IMEMOP_RESULT_VLD			BIT(31)
>   #define XUSB_CSB_MP_APMAP			0x10181c
>   #define  APMAP_BOOTPATH				BIT(31)
>   
> @@ -893,7 +895,22 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>   
>   	csb_writel(tegra, 0, XUSB_FALC_DMACTL);
>   
> -	msleep(50);
> +	/* wait for RESULT_VLD to get set */
> +	timeout = jiffies + msecs_to_jiffies(10);
> +
> +	do {
> +		value = csb_readl(tegra, XUSB_CSB_MEMPOOL_L2IMEMOP_RESULT);
> +		if (value & L2IMEMOP_RESULT_VLD)
> +			break;
> +
> +		usleep_range(50, 100);
> +	} while (time_is_after_jiffies(timeout));
> +
> +	value = csb_readl(tegra, XUSB_CSB_MEMPOOL_L2IMEMOP_RESULT);
> +	if ((value & L2IMEMOP_RESULT_VLD) == 0) {
> +		dev_err(dev, "DMA controller not ready %#010x\n", value);
> +		return -EBUSY;
> +	}
>   
>   	csb_writel(tegra, le32_to_cpu(header->boot_codetag),
>   		   XUSB_FALC_BOOTVEC);
> 

readx_poll_timeout? I think you can define a local macro to "curry" the 
'tegra' argument to csb_readl..

#define tegra_csb_readl(x) csb_readl(tegra, x)
readx_poll_timeout(tegra_csb_readl, ...)

Cheers,
Mikko
