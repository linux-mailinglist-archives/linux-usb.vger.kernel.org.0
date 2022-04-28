Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D25BD51285A
	for <lists+linux-usb@lfdr.de>; Thu, 28 Apr 2022 02:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239313AbiD1BDE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 21:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiD1BDD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 21:03:03 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B99A0BE24
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 17:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651107590; x=1682643590;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mvgPxmCgGUFxhHtLc6DnSvfsEIR7LqzV2GGiruiJoF0=;
  b=lbpOYPDkO2OdDaBAW/fMw1ZkKjkhoMNW8QR2tRhuLb5RO1RE7pX3EbNk
   +B1RTG6kzlDtPhNHS6zxXkOxSKw7keOFvmRuELHrjLYBCgiY/yxwTGiwX
   BVTUt5RKzF/sW711LaKOLTD0hX9/MCg+zWKDjTOHbIVH/KeCwLEwTkggC
   8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Apr 2022 17:59:50 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 17:59:49 -0700
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 27 Apr 2022 17:59:49 -0700
Received: from [10.110.111.46] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 27 Apr
 2022 17:59:49 -0700
Message-ID: <5fa9ab81-6b5c-6c3c-2ae7-eb620973a54b@quicinc.com>
Date:   Wed, 27 Apr 2022 17:59:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 6/6] usb: dwc3: gadget: Delay issuing End Transfer
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
 <2fcf3b5d90068d549589a57a27a79f76c6769b04.1650593829.git.Thinh.Nguyen@synopsys.com>
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2fcf3b5d90068d549589a57a27a79f76c6769b04.1650593829.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

On 4/21/2022 7:23 PM, Thinh Nguyen wrote:
> If the controller hasn't DMA'ed the Setup data from its fifo, it won't
> process the End Transfer command. Polling for the command completion may
> block the driver from servicing the Setup phase and cause a timeout.
> Previously we only check and delay issuing End Transfer in the case of
> endpoint dequeue. Let's do that for all End Transfer scenarios.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>   drivers/usb/dwc3/gadget.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 7c4d5f671687..f0fd7c32828b 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2056,16 +2056,6 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
>   		if (r == req) {
>   			struct dwc3_request *t;
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
>   			/* wait until it is processed */
>   			dwc3_stop_active_transfer(dep, true, true);
>   
> @@ -3657,6 +3647,18 @@ void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
>   	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
>   		return;
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

Since we could be calling dwc3_stop_active_transfer() as part of the 
dwc3_gadget_pullup(0) case (due to dwc3_stop_active_transfers()), how do 
we ensure that all active EPs are stopped before calling run/stop clear?

static int dwc3_gadget_soft_disconnect(struct dwc3 *dwc) {
...
        if (dwc->ep0state != EP0_SETUP_PHASE) {
                int ret;

                reinit_completion(&dwc->ep0_in_setup);

                spin_unlock_irqrestore(&dwc->lock, flags);
                ret = wait_for_completion_timeout(&dwc->ep0_in_setup,
                                msecs_to_jiffies(DWC3_PULL_UP_TIMEOUT));
                spin_lock_irqsave(&dwc->lock, flags);
                if (ret == 0)
                        dev_warn(dwc->dev, "timed out waiting for SETUP 
phase\n");
        }

---> We know that ep0state will be in SETUP phase now, but host can send 
the SETUP data shortly after here.  This may cause some endpoints in the 
below dwc3_stop_active_transfers() call to mark DWC3_EP_DELAY_STOP. 
(ep0state could advance as we call gadget giveback in between servicing 
each dep, and lock is released briefly)
	
        /*
         * In the Synopsys DesignWare Cores USB3 Databook Rev. 3.30a
         * Section 4.1.8 Table 4-7, it states that for a device-initiated
         * disconnect, the SW needs to ensure that it sends "a DEPENDXFER
         * command for any active transfers" before clearing the RunStop
         * bit.
         */
	dwc3_stop_active_transfers(dwc);

---> Do we need to add some synchronization here to make sure that all 
EPs that had the DWC3_EP_DELAY_STOP had been serviced by the status 
phase complete handler?  Otherwise, we will continue to try to halt the 
controller, which will fail since there could still be EPs which are active.

	__dwc3_gadget_stop(dwc);
	spin_unlock_irqrestore(&dwc->lock, flags);

	return dwc3_gadget_run_stop(dwc, false, false);
}

I haven't run into this particular scenario yet, but thought I'd ask to 
see if there was some flow that I missed.

Thanks
Wesley Cheng
