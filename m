Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 640D34D123E
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 09:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344919AbiCHI3v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Mar 2022 03:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344898AbiCHI3r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Mar 2022 03:29:47 -0500
Received: from mxout01.lancloud.ru (mxout01.lancloud.ru [45.84.86.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944D13F310
        for <linux-usb@vger.kernel.org>; Tue,  8 Mar 2022 00:28:46 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru BEF4020D5C2E
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: dwc3: gadget: set status of request on every
 completed trb
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        <linux-usb@vger.kernel.org>
CC:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <kernel@pengutronix.de>
References: <20220307214639.4164547-1-m.grzeschik@pengutronix.de>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <5ad73204-dc5d-c6e6-49c3-9a3a6ea28d8f@omp.ru>
Date:   Tue, 8 Mar 2022 11:28:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220307214639.4164547-1-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 3/8/22 12:46 AM, Michael Grzeschik wrote:

> Currently the status of the request being completed comes from the
> dwc3_event_depevt status. The resulting status will then be applied to
> the request on dwc3_gadget_del_and_unmap_request.
> 
> This assigned status is not right in every case. Since it is possible
> that more requests can be ready on the interrupt handler we have to set
> the actual status for every request from the trbstatus instead.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/dwc3/gadget.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index a0c883f19a417c..760af09d6d8ef7 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -3171,6 +3171,11 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,
>  	count = trb->size & DWC3_TRB_SIZE_MASK;
>  	req->remaining += count;
>  
> +	if (DWC3_TRB_SIZE_TRBSTS(trb->size) == DWC3_TRBSTS_MISSED_ISOC)
> +		req->request.status = -EXDEV;
> +	else if (DWC3_TRB_SIZE_TRBSTS(trb->size) == DWC3_TRBSTS_OK)
> +		req->request.status = 0;
> +

   Shouldn't that be a *switch* statement instead?

[...]

MBR, Sergey
