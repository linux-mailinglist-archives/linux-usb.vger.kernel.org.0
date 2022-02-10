Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A394B1688
	for <lists+linux-usb@lfdr.de>; Thu, 10 Feb 2022 20:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbiBJTqY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Feb 2022 14:46:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbiBJTqW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Feb 2022 14:46:22 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD9325D1;
        Thu, 10 Feb 2022 11:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644522382; x=1676058382;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uzy2kSSy/fcP4PGpMnT5ocmzeNzJHhEsZFk9PUmz+bY=;
  b=DjfTqJ1K7bowUplgP22///638EuAYDRyOKo7n3yZxOiubE1iv+vAHlJP
   QKiTlQAFbDwoQfGPHDaAj5r/6AhWqhHyVr8hQMLo35vJJP7rbMkEXIAoK
   fe75OHajqLUbBejnibl+0S26xg2C3OSoMfLtvbauFVGma7y8BfKj4o041
   o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Feb 2022 11:46:22 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 11:46:21 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 11:46:21 -0800
Received: from [10.110.35.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 10 Feb
 2022 11:46:20 -0800
Message-ID: <2d0fd690-4ab0-bc88-946d-c621792721d4@quicinc.com>
Date:   Thu, 10 Feb 2022 11:46:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/3] usb: dwc3: Flush pending SETUP data during stop
 active xfers
Content-Language: en-US
To:     Jack Pham <quic_jackp@quicinc.com>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Thinh.Nguyen@synopsys.com>
References: <20220203080017.27339-1-quic_wcheng@quicinc.com>
 <20220203080017.27339-2-quic_wcheng@quicinc.com>
 <20220208173355.GB13801@jackp-linux.qualcomm.com>
From:   Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20220208173355.GB13801@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jack,

On 2/8/2022 9:33 AM, Jack Pham wrote:
> Hi Wesley,
> 
> On Thu, Feb 03, 2022 at 12:00:15AM -0800, Wesley Cheng wrote:
>> While running the pullup disable sequence, if there are pending SETUP
>> transfers stored in the controller, then the endxfer commands will
> 
> Should mention specifically that the endxfer commands *on non-EP0*
> endpoints will time out.
> 
Thanks for the feedback and initial review.  Done.
> 
> Also let's use the same terminology as defined by the macros, i.e.
> 
> endxfer/ENDXFER -> ENDTRANSFER
> STARTXFER -> STARTTRANSFER
> 
>> fail w/ ETIMEDOUT.  As a suggestion from SNPS, in order to drain the
>> SETUP packets, SW needs to issue a STARTXFER command.  After issuing
>                                                     ^^^^ on EP0.
> 
Sure will add explicit EP0 statement.

>> the STARTXFER, and retrying the ENDXFER, the command should succeed.
>> Else, if the endpoints are not properly stopped, the controller halt
>> sequence will fail as well.
>>
>> One limitation is that the current logic will drop the SETUP data
>> being received (ie dropping the SETUP packet), however, it should be
>> acceptable in the pullup disable case, as the device is eventually
>> going to disconnect from the host.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  drivers/usb/dwc3/core.h   |  7 +++++++
>>  drivers/usb/dwc3/ep0.c    | 21 ++++++++++++--------
>>  drivers/usb/dwc3/gadget.c | 42 ++++++++++++++++++++++++++++++++++-----
>>  3 files changed, 57 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index e1cc3f7398fb..a124694c0038 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1546,6 +1546,8 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>>  int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>  		u32 param);
>>  void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc);
>> +void dwc3_ep0_stall_and_restart(struct dwc3 *dwc);
>> +void dwc3_ep0_end_control_data(struct dwc3 *dwc, struct dwc3_ep *dep);
>>  #else
>>  static inline int dwc3_gadget_init(struct dwc3 *dwc)
>>  { return 0; }
>> @@ -1567,6 +1569,11 @@ static inline int dwc3_send_gadget_generic_command(struct dwc3 *dwc,
>>  { return 0; }
>>  static inline void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
>>  { }
>> +static inline void dwc3_ep0_stall_and_restart(struct dwc3 *dwc)
>> +{ }
>> +static inline void dwc3_ep0_end_control_data(struct dwc3 *dwc,
>> +					     struct dwc3_ep *dep)
>> +{ }
>>  #endif
>>  
>>  #if IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>> index 658739410992..eb677b888610 100644
>> --- a/drivers/usb/dwc3/ep0.c
>> +++ b/drivers/usb/dwc3/ep0.c
>> @@ -197,7 +197,7 @@ int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb_request *request,
>>  	int				ret;
>>  
>>  	spin_lock_irqsave(&dwc->lock, flags);
>> -	if (!dep->endpoint.desc || !dwc->pullups_connected) {
>> +	if (!dep->endpoint.desc || !dwc->pullups_connected || !dwc->connected) {
>>  		dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n",
>>  				dep->name);
>>  		ret = -ESHUTDOWN;
>> @@ -218,19 +218,21 @@ int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct usb_request *request,
>>  	return ret;
>>  }
>>  
>> -static void dwc3_ep0_stall_and_restart(struct dwc3 *dwc)
>> +void dwc3_ep0_stall_and_restart(struct dwc3 *dwc)
>>  {
>>  	struct dwc3_ep		*dep;
>>  
>>  	/* reinitialize physical ep1 */
>>  	dep = dwc->eps[1];
>>  	dep->flags = DWC3_EP_ENABLED;
>> +	dep->trb_enqueue = 0;
>>  
>>  	/* stall is always issued on EP0 */
>>  	dep = dwc->eps[0];
>>  	__dwc3_gadget_ep_set_halt(dep, 1, false);
>>  	dep->flags = DWC3_EP_ENABLED;
>>  	dwc->delayed_status = false;
>> +	dep->trb_enqueue = 0;
>>  
>>  	if (!list_empty(&dep->pending_list)) {
>>  		struct dwc3_request	*req;
>> @@ -240,7 +242,9 @@ static void dwc3_ep0_stall_and_restart(struct dwc3 *dwc)
>>  	}
>>  
>>  	dwc->ep0state = EP0_SETUP_PHASE;
>> -	dwc3_ep0_out_start(dwc);
>> +	complete(&dwc->ep0_in_setup);
>> +	if (dwc->softconnect)
>> +		dwc3_ep0_out_start(dwc);
>>  }
>>  
>>  int __dwc3_gadget_ep0_set_halt(struct usb_ep *ep, int value)
>> @@ -272,8 +276,6 @@ void dwc3_ep0_out_start(struct dwc3 *dwc)
>>  	struct dwc3_ep			*dep;
>>  	int				ret;
>>  
>> -	complete(&dwc->ep0_in_setup);
>> -
>>  	dep = dwc->eps[0];
>>  	dwc3_ep0_prepare_one_trb(dep, dwc->ep0_trb_addr, 8,
>>  			DWC3_TRBCTL_CONTROL_SETUP, false);
>> @@ -922,7 +924,9 @@ static void dwc3_ep0_complete_status(struct dwc3 *dwc,
>>  		dwc->setup_packet_pending = true;
>>  
>>  	dwc->ep0state = EP0_SETUP_PHASE;
>> -	dwc3_ep0_out_start(dwc);
>> +	complete(&dwc->ep0_in_setup);
>> +	if (dwc->softconnect)
>> +		dwc3_ep0_out_start(dwc);
>>  }
>>  
>>  static void dwc3_ep0_xfer_complete(struct dwc3 *dwc,
>> @@ -1073,7 +1077,7 @@ void dwc3_ep0_send_delayed_status(struct dwc3 *dwc)
>>  	__dwc3_ep0_do_control_status(dwc, dwc->eps[direction]);
>>  }
>>  
>> -static void dwc3_ep0_end_control_data(struct dwc3 *dwc, struct dwc3_ep *dep)
>> +void dwc3_ep0_end_control_data(struct dwc3 *dwc, struct dwc3_ep *dep)
>>  {
>>  	struct dwc3_gadget_ep_cmd_params params;
>>  	u32			cmd;
>> @@ -1083,7 +1087,8 @@ static void dwc3_ep0_end_control_data(struct dwc3 *dwc, struct dwc3_ep *dep)
>>  		return;
>>  
>>  	cmd = DWC3_DEPCMD_ENDTRANSFER;
>> -	cmd |= DWC3_DEPCMD_CMDIOC;
>> +	cmd |= dwc->connected ? 0 : DWC3_DEPCMD_HIPRI_FORCERM;
>> +	cmd |= dwc->connected ? DWC3_DEPCMD_CMDIOC : 0;
> 
> Can this be combined?
> 
Agreed. Will combine them.

Thanks
Wesley Cheng

> 	cmd |= dwc->connected ? DWC3_DEPCMD_CMDIOC : DWC3_DEPCMD_HIPRI_FORCERM;
> 
>>  	cmd |= DWC3_DEPCMD_PARAM(dep->resource_index);
>>  	memset(&params, 0, sizeof(params));
>>  	ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 520031ba38aa..19b8d837e9d0 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -885,12 +885,13 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
>>  		reg |= DWC3_DALEPENA_EP(dep->number);
>>  		dwc3_writel(dwc->regs, DWC3_DALEPENA, reg);
>>  
>> -		if (usb_endpoint_xfer_control(desc))
>> -			goto out;
>> -
>>  		/* Initialize the TRB ring */
>>  		dep->trb_dequeue = 0;
>>  		dep->trb_enqueue = 0;
>> +
>> +		if (usb_endpoint_xfer_control(desc))
>> +			goto out;
>> +
>>  		memset(dep->trb_pool, 0,
>>  		       sizeof(struct dwc3_trb) * DWC3_TRB_NUM);
>>  
>> @@ -2463,7 +2464,8 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
>>  	 * Per databook, when we want to stop the gadget, if a control transfer
>>  	 * is still in process, complete it and get the core into setup phase.
>>  	 */
>> -	if (!is_on && dwc->ep0state != EP0_SETUP_PHASE) {
>> +	if ((!is_on && (dwc->ep0state != EP0_SETUP_PHASE ||
>> +	     dwc->ep0_next_event != DWC3_EP0_COMPLETE))) {
>>  		reinit_completion(&dwc->ep0_in_setup);
>>  
>>  		ret = wait_for_completion_timeout(&dwc->ep0_in_setup,
>> @@ -2506,6 +2508,17 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
>>  		u32 count;
>>  
>>  		dwc->connected = false;
>> +
>> +		/*
>> +		 * Ensure no pending data/setup stages, and disable ep0 to
>> +		 * block further EP0 transactions before stopping pending
>> +		 * transfers.
>> +		 */
>> +		dwc3_ep0_end_control_data(dwc, dwc->eps[1]);
>> +		dwc3_ep0_stall_and_restart(dwc);
>> +		__dwc3_gadget_ep_disable(dwc->eps[0]);
>> +		__dwc3_gadget_ep_disable(dwc->eps[1]);
>> +
>>  		/*
>>  		 * In the Synopsis DesignWare Cores USB3 Databook Rev. 3.30a
>>  		 * Section 4.1.8 Table 4-7, it states that for a device-initiated
>> @@ -3587,8 +3600,10 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
>>  	bool interrupt)
>>  {
>>  	struct dwc3_gadget_ep_cmd_params params;
>> +	struct dwc3 *dwc = dep->dwc;
>>  	u32 cmd;
>>  	int ret;
>> +	int retries = 1;
>>  
>>  	if (!(dep->flags & DWC3_EP_TRANSFER_STARTED) ||
>>  	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
>> @@ -3620,7 +3635,7 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
>>  	 *
>>  	 * This mode is NOT available on the DWC_usb31 IP.
>>  	 */
>> -
>> +retry:
>>  	cmd = DWC3_DEPCMD_ENDTRANSFER;
>>  	cmd |= force ? DWC3_DEPCMD_HIPRI_FORCERM : 0;
>>  	cmd |= interrupt ? DWC3_DEPCMD_CMDIOC : 0;
>> @@ -3628,6 +3643,23 @@ static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
>>  	memset(&params, 0, sizeof(params));
>>  	ret = dwc3_send_gadget_ep_cmd(dep, cmd, &params);
>>  	WARN_ON_ONCE(ret);
>> +	if (ret == -ETIMEDOUT) {
>> +		if (!dwc->connected) {
>> +			/*
>> +			 * While the controller is in an active setup/control
>> +			 * transfer, the HW is unable to service other eps
>> +			 * potentially leading to an endxfer command timeout.
>> +			 * It was recommended to ensure that there are no
>> +			 * pending/cached setup packets stored in internal
>> +			 * memory.  Only way to achieve this is to issue another
>> +			 * start transfer, and retry.
>> +			 */
>> +			if (retries--) {
>> +				dwc3_ep0_out_start(dwc);
>> +				goto retry;
>> +			}
>> +		}
>> +	}
>>  	dep->resource_index = 0;
>>  
>>  	if (!interrupt)
