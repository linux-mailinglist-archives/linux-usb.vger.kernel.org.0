Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0E23EF785
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 03:29:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235148AbhHRBaD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 21:30:03 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19504 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbhHRBaD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Aug 2021 21:30:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629250169; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=J7m7Hf2/uFvbntikmYV/QOVXJnJYNOziSOGh0Yt9Jkg=; b=nfsAOABl/9iKTmDzg7rIYflHxrFX4lsncMZikdLEZjHwCVaxgeIcuDWgLob113e/KVRaCKqp
 gv4xushFHXoO/bQ/GoKx2hIsr1ZM37xqZy9GJPAe3no3YBLWmvrpVENSdC+4HWHjAVRfF1B6
 6NtC8ZSvWW9aUUtGiHR1dsOnnT4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 611c6266454b7a558f19d3c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 01:29:10
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0A5DC43460; Wed, 18 Aug 2021 01:29:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15732C4338F;
        Wed, 18 Aug 2021 01:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 15732C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Tue, 17 Aug 2021 18:28:59 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ray Chi <raychi@google.com>, Ferry Toth <ftoth@exalondelft.nl>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Li Jun <jun.li@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: Re: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Message-ID: <20210818012859.GB30805@jackp-linux.qualcomm.com>
References: <20210812082635.12924-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812082635.12924-1-jackp@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 12, 2021 at 01:26:35AM -0700, Jack Pham wrote:
> On DWC_usb3 revisions 3.00a and newer (including DWC_usb31 and
> DWC_usb32) the GUCTL1 register gained the DEV_DECOUPLE_L1L2_EVT
> field (bit 31) which when enabled allows the controller in device
> mode to treat USB 2.0 L1 LPM & L2 events separately.
> 
> After commit d1d90dd27254 ("usb: dwc3: gadget: Enable suspend
> events") the controller will now receive events (and therefore
> interrupts) for every state change when entering/exiting either
> L1 or L2 states.  Since L1 is handled entirely by the hardware
> and requires no software intervention, there is no need to even
> enable these events and unnecessarily notify the gadget driver.
> Enable the aforementioned bit to help reduce the overall interrupt
> count for these L1 events that don't need to be handled while
> retaining the events for full L2 suspend/wakeup.

Hi folks in To:

I'd like to request if any of you could help test this patch on your
boards to help make sure it doesn't cause any regressions since I know
some of the recent dwc3 patches from Qualcomm have been found to break
other devices :(. So I'm hoping to avoid that even for a patch as
small as this.

Hoping this could be tried out on boards/SoCs such as db845c, hikey960,
Exynos, the Intel "lakes", etc.  Ideally this needs validation with a
high-speed connection to a USB 3.x host, which increases the chances
that USB 2.0 Link Power Management is supported.

The overall goal of this patch is to eliminate events generated for
L1 entry/exit, so we should see a slight reduction in interrupt counts
when checking `grep dwc3 /proc/interrupts` for comparable traffic.

Appreciate any feedback and help in testing!
Thanks,
Jack

> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c | 9 +++++++++
>  drivers/usb/dwc3/core.h | 5 +++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index ba74ad7f6995..719dac228703 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1050,6 +1050,15 @@ static int dwc3_core_init(struct dwc3 *dwc)
>  		if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
>  			reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
>  
> +		/*
> +		 * Decouple USB 2.0 L1 & L2 events which will allow for
> +		 * gadget driver to only receive U3/L2 suspend & wakeup
> +		 * events and prevent the more frequent L1 LPM transitions
> +		 * from interrupting the driver.
> +		 */
> +		if (!DWC3_VER_IS_PRIOR(DWC3, 300A))
> +			reg |= DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT;
> +
>  		if (dwc->dis_tx_ipgap_linecheck_quirk)
>  			reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
>  
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 5991766239ba..356b94a7ec70 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -256,9 +256,10 @@
>  #define DWC3_GUCTL_HSTINAUTORETRY	BIT(14)
>  
>  /* Global User Control 1 Register */
> -#define DWC3_GUCTL1_PARKMODE_DISABLE_SS	BIT(17)
> +#define DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT	BIT(31)
>  #define DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS	BIT(28)
> -#define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW	BIT(24)
> +#define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW		BIT(24)
> +#define DWC3_GUCTL1_PARKMODE_DISABLE_SS		BIT(17)
>  
>  /* Global Status Register */
>  #define DWC3_GSTS_OTG_IP	BIT(10)
> -- 
> 2.24.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
