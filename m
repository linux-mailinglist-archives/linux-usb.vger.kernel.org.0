Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA8555182FB
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 13:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbiECLE7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 07:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234571AbiECLE6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 07:04:58 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A44E33A31
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651575683; x=1683111683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5f+hH+X3jmxAuGdtlsn1uWfmkcEwZ5X+jcS0wurGlnU=;
  b=v6Ye40JE2C7YFZUGcCkcXFcVvnwjsq3nOcLISp8Td8LadA/5y0v80/sz
   htg3sPP6MtGPAWW3IP41vTR8E01fspDwjNKYoc5LeF8j0haekyoItSrLb
   +55IJyt012T7+Cv+jjUH1VZq/9wYpyIKFh5abgphHf9TFFekYvCoesrwe
   0=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 03 May 2022 04:01:22 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 04:01:22 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 04:01:21 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 04:01:19 -0700
Date:   Tue, 3 May 2022 16:31:15 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, John Youn <John.Youn@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 4/6] usb: dwc3: ep0: Don't prepare beyond Setup stage
Message-ID: <20220503110115.GA21427@hu-pkondeti-hyd.qualcomm.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <6bacec56ecabb2c6e49a09cedfcac281fdc97de0.1650593829.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6bacec56ecabb2c6e49a09cedfcac281fdc97de0.1650593829.git.Thinh.Nguyen@synopsys.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 21, 2022 at 07:22:50PM -0700, Thinh Nguyen wrote:
> Since we can't guarantee that the host won't send new Setup packet
> before going through the device-initiated disconnect, don't prepare
> beyond the Setup stage and keep the device in EP0_SETUP_PHASE. This
> ensures that the device-initated disconnect sequence can go through
> gracefully. Note that the controller won't service the End Transfer
> command if it can't DMA out the Setup packet.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/ep0.c    |  2 +-
>  drivers/usb/dwc3/gadget.c | 29 +++++++++++++++++------------
>  2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index 1064be5518f6..c47c696316dd 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -813,7 +813,7 @@ static void dwc3_ep0_inspect_setup(struct dwc3 *dwc,
>  	int ret = -EINVAL;
>  	u32 len;
>  
> -	if (!dwc->gadget_driver)
> +	if (!dwc->gadget_driver || !dwc->connected)
>  		goto out;
>  
>  	trace_dwc3_ctrl_req(ctrl);
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index a86225dbaa2c..e5f07c0e8ad9 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2505,6 +2505,23 @@ static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc)
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	dwc->connected = false;
>  
> +	/*
> +	 * Per databook, when we want to stop the gadget, if a control transfer
> +	 * is still in process, complete it and get the core into setup phase.
> +	 */
> +	if (dwc->ep0state != EP0_SETUP_PHASE) {
> +		int ret;
> +
> +		reinit_completion(&dwc->ep0_in_setup);
> +
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +		ret = wait_for_completion_timeout(&dwc->ep0_in_setup,
> +				msecs_to_jiffies(DWC3_PULL_UP_TIMEOUT));
> +		spin_lock_irqsave(&dwc->lock, flags);
> +		if (ret == 0)
> +			dev_warn(dwc->dev, "timed out waiting for SETUP phase\n");

DWC3_PULL_UP_TIMEOUT is 500 msec. If the ongoing control transfer is delayed
(dwc3::delayed_status), for whatever reason, would there be a problem?

Thanks,
Pavan
