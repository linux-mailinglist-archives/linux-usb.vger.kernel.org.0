Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A76AC51831C
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 13:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbiECLQk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 07:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbiECLQj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 07:16:39 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA39936E2D
        for <linux-usb@vger.kernel.org>; Tue,  3 May 2022 04:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651576381; x=1683112381;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WQ42Nq/4pc4VU+I5n+u3hfLqjxc9MntY3Ac4dtjirUs=;
  b=j+UzXknYBkHuNYJ2DizhjG+f0HZT6tKK/NrJaZtwlOkpxrnvwRAg4i0K
   Vzxqhb7NQvhlprOiaXbunY/akAy+ZVWH2F3EAIqpg74vGt2E1V92gftCb
   n5FtUZ7+ewIy31pXUHs2nqXwqjLWTi3cWM04Kam5NsuHMnLPwVs/EMbE+
   c=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 03 May 2022 04:13:01 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 04:13:01 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 04:12:40 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 3 May 2022 04:12:37 -0700
Date:   Tue, 3 May 2022 16:42:33 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, John Youn <John.Youn@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH 6/6] usb: dwc3: gadget: Delay issuing End Transfer
Message-ID: <20220503111233.GB21427@hu-pkondeti-hyd.qualcomm.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <2fcf3b5d90068d549589a57a27a79f76c6769b04.1650593829.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2fcf3b5d90068d549589a57a27a79f76c6769b04.1650593829.git.Thinh.Nguyen@synopsys.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 21, 2022 at 07:23:03PM -0700, Thinh Nguyen wrote:
> If the controller hasn't DMA'ed the Setup data from its fifo, it won't
> process the End Transfer command. Polling for the command completion may
> block the driver from servicing the Setup phase and cause a timeout.
> Previously we only check and delay issuing End Transfer in the case of
> endpoint dequeue. Let's do that for all End Transfer scenarios.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/gadget.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 7c4d5f671687..f0fd7c32828b 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2056,16 +2056,6 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
>  		if (r == req) {
>  			struct dwc3_request *t;
>  
> -			/*
> -			 * If a Setup packet is received but yet to DMA out, the controller will
> -			 * not process the End Transfer command of any endpoint. Polling of its
> -			 * DEPCMD.CmdAct may block setting up TRB for Setup packet, causing a
> -			 * timeout. Delay issuing the End Transfer command until the Setup TRB is
> -			 * prepared.
> -			 */
> -			if (dwc->ep0state != EP0_SETUP_PHASE && !dwc->delayed_status)
> -				dep->flags |= DWC3_EP_DELAY_STOP;
> -
>  			/* wait until it is processed */
>  			dwc3_stop_active_transfer(dep, true, true);
>  
> @@ -3657,6 +3647,18 @@ void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
>  	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
>  		return;
>  
> +	/*
> +	 * If a Setup packet is received but yet to DMA out, the controller will
> +	 * not process the End Transfer command of any endpoint. Polling of its
> +	 * DEPCMD.CmdAct may block setting up TRB for Setup packet, causing a
> +	 * timeout. Delay issuing the End Transfer command until the Setup TRB is
> +	 * prepared.
> +	 */
> +	if (dwc->ep0state != EP0_SETUP_PHASE && !dwc->delayed_status) {
> +		dep->flags |= DWC3_EP_DELAY_STOP;
> +		return;
> +	}
> +

dwc3_remove_requests() calls dwc3_stop_active_transfer() but does not check
any flags before retiring all the requests. should we add some assert/WARN_ON
to make sure that we are not retiring the requests before stopping the active
transfers?

Thanks,
Pavan
