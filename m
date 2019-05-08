Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9150C175EF
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 12:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfEHKZn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 06:25:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47984 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfEHKZn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 May 2019 06:25:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 03D7D60A05; Wed,  8 May 2019 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557311142;
        bh=QIJD2cfvBZLHptTQdj6KsSGkzWLRMfCAuZ2PtDPLVAc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XFW+0DPeChubXzYeatOyBVbhP2MdKMQkX5IfcUgkiPUND6RguH1dd2+GJ3k8/AyYV
         rwCaUncCwQHnGd2GLkBauZCHR64oNEX5eLmcQJvqLPHJ8s5hWmtb3QrpmLwCeoea0a
         fgyFDC1/ZbiK++lhKRo4wNjzveJlHiEYh2NlhGFg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.206.25.226] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sallenki@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 720EA60741;
        Wed,  8 May 2019 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557311141;
        bh=QIJD2cfvBZLHptTQdj6KsSGkzWLRMfCAuZ2PtDPLVAc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DSUCXhZdDj/aR7yU29bHs4LSrByzHHcH85KL2Yiq3VzetKjWi1dB4QaszTw55L/1v
         wjtsmvpmF5wX80n6lMhbVwy7ndiab/XUP9DlE01tmZtxAOYJhZ6gJvlhfX+pBrCc1i
         COKdhwAo1GjAke5E0c4Tc5WeLcbF4r/LdWs765Co=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 720EA60741
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sallenki@codeaurora.org
Subject: Re: [PATCH] usb: dwc3: move core validation to be after clks enable
To:     Jun Li <jun.li@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "thinhn@synopsys.com" <thinhn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1557288102-26129-1-git-send-email-jun.li@nxp.com>
From:   Sriharsha Allenki <sallenki@codeaurora.org>
Message-ID: <636e1751-dab8-ab8a-a924-0015f9ae8089@codeaurora.org>
Date:   Wed, 8 May 2019 15:55:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557288102-26129-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jun Li,

On 5/8/2019 9:54 AM, Jun Li wrote:
> From: Jun Li <jun.li@nxp.com>
>
> Register access in core validation may hang before the bulk
> clks are enabled.
>
> Fixes: b873e2d0ea1e ("usb: dwc3: Do core validation early on probe")
> Signed-off-by: Jun Li <jun.li@nxp.com>
> ---
>   drivers/usb/dwc3/core.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 4aff1d8..0e49ff3 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1423,11 +1423,6 @@ static int dwc3_probe(struct platform_device *pdev)
>   	dwc->regs	= regs;
>   	dwc->regs_size	= resource_size(&dwc_res);
>   
> -	if (!dwc3_core_is_valid(dwc)) {
> -		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
> -		return -ENODEV;
> -	}
> -
>   	dwc3_get_properties(dwc);
>   
>   	dwc->reset = devm_reset_control_get_optional_shared(dev, NULL);
> @@ -1460,6 +1455,11 @@ static int dwc3_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto unprepare_clks;
>   
> +	if (!dwc3_core_is_valid(dwc)) {
> +		dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");

Please update "ret" here with -ENODEV, else the probe call will return 
success (ret is 0).

> +		goto disable_clks;
> +	}
> +
>   	platform_set_drvdata(pdev, dwc);
>   	dwc3_cache_hwparams(dwc);
>   
> @@ -1524,7 +1524,7 @@ static int dwc3_probe(struct platform_device *pdev)
>   err1:
>   	pm_runtime_put_sync(&pdev->dev);
>   	pm_runtime_disable(&pdev->dev);
> -
> +disable_clks:
>   	clk_bulk_disable(dwc->num_clks, dwc->clks);
>   unprepare_clks:
>   	clk_bulk_unprepare(dwc->num_clks, dwc->clks);

Regards,

Sriharsha

