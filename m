Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F4A3AAC57
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 08:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhFQGdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 02:33:45 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:50900 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbhFQGdp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 02:33:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623911498; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SngUPBLveg21Qfuh/XnIr4W7RadI8/mPM1yTT3fW1CI=; b=gmeQKNv4uHDbk3whtP9Ey04KDw373fwFEmJ9rjK1Hp1McStKEfRWUGBIVjaY52UVUdugaVY+
 QcQaX2TV3l57KiEWU7QKrymCivN4fCN3lMthx/fOah5HfnkcNoRZr5r1kUnYo2XI8ymVrjuB
 Op7rZnMA4hKvFLNl3KvmApUPwc8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60caec49ed59bf69cc55f5d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 06:31:37
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32F22C433D3; Thu, 17 Jun 2021 06:31:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D784AC433F1;
        Thu, 17 Jun 2021 06:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D784AC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 16 Jun 2021 23:31:31 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Chen <peter.chen@kernel.org>
Subject: Re: [PATCH] usb: dwc3: Fix debugfs creation flow
Message-ID: <20210617063130.GA11567@jackp-linux.qualcomm.com>
References: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,

On Wed, Jun 16, 2021 at 10:56:02PM -0700, Minas Harutyunyan wrote:
> Creation EP's debugfs called earlier than debugfs folder for dwc3
> device created. As result EP's debugfs are created in '/sys/kernel/debug'
> instead of '/sys/kernel/debug/usb/dwc3.1.auto'.

Interesting, I didn't encounter this in my testing. Oh but in our case
we have dr_mode as USB_DR_MODE_OTG, so when dwc3_core_init_mode() calls
dwc3_drd_init() the gadget_init() is done from a worker, and meanwhile
dwc3_debugfs_init() would have already had a chance to create the root
folder before that.

I'm assuming you're seeing this with dr_mode == USB_DR_MODE_PERIPHERAL?
Then in that case dwc3_core_init_mode() synchronously calls
dwc3_gadget_init() before the debugfs_init.

> Moved dwc3_debugfs_init() function call before calling
> dwc3_core_init_mode() to allow create dwc3 debugfs parent before
> creating EP's debugfs's.
> 
> Fixes: 8562d5bfc0fc ("USB: dwc3: remove debugfs root dentry storage")

Isn't it fixing 8d396bb0a5b6 ("usb: dwc3: debugfs: Add and remove
endpoint dirs dynamically")?  More fallout from my change I guess :-/.

Anyway it looks good to me, thanks!

Reviewed-by: Jack Pham <jackp@codeaurora.org>

> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> ---
>  drivers/usb/dwc3/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index e0a8e796c158..ba74ad7f6995 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1620,17 +1620,18 @@ static int dwc3_probe(struct platform_device *pdev)
>  	}
>  
>  	dwc3_check_params(dwc);
> +	dwc3_debugfs_init(dwc);
>  
>  	ret = dwc3_core_init_mode(dwc);
>  	if (ret)
>  		goto err5;
>  
> -	dwc3_debugfs_init(dwc);
>  	pm_runtime_put(dev);
>  
>  	return 0;
>  
>  err5:
> +	dwc3_debugfs_exit(dwc);
>  	dwc3_event_buffers_cleanup(dwc);
>  
>  	usb_phy_shutdown(dwc->usb2_phy);
> 
> base-commit: 1da8116eb0c5dfc05cfb89896239badb18c4daf3
> -- 
> 2.11.0
> 
