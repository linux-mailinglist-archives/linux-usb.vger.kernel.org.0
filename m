Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2E9717B1C
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 11:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbjEaJFG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 05:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235328AbjEaJEd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 05:04:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EADB192
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 02:03:59 -0700 (PDT)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFD65FB;
        Wed, 31 May 2023 11:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685523816;
        bh=nbh+rlbxY2VZ78ScbmZ/brzmU0RVTOKXwbQaVA0bS08=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=fPlBNMUoiLGtrgxQctbD5H4/Y1XYjTyCCWUJ5BDqPyjdDgb46QDPB38rjwJQ2VFoJ
         aron/hJZSF8KM8PpH4dfY1HdGnKIwJydc/RS7IJr7O4P5JUv4JQ3smUjBhFp1dFXC0
         emm+0Mj4QFW/Isxs+xYggEX59UhSCTcqnkElcQEU=
Message-ID: <69135fc1-5ebb-ff95-4c7b-17cf8e30c924@ideasonboard.com>
Date:   Wed, 31 May 2023 10:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     torleiv@huddly.com
References: <20230531085544.253363-1-dan.scally@ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Clear DWC3_EP_PENDING_REQUEST from
 non-0 endpoints
In-Reply-To: <20230531085544.253363-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh

On 31/05/2023 09:55, Daniel Scally wrote:
> The DWC3_EP_PENDING_REQUEST flag is set against an endpoint when
> there are no pending or started requests available. This flag is
> cleared on queuing to the endpoint for endpoint 0, but not for any
> other endpoints. This can exacerbate timing problems by allowing a
> queue to go ahead for an isochronous endpoint that should not be
> started, so clear the flag upon a successful dwc3_gadget_ep_queue().
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---


Just wanted to give some background on the timing issues that this is helping to relieve; we spotted 
this issue as a result of a "No resource for ep1in" error being thrown occasionally during repeated 
stream on/off tests for the UVC gadget on a platform using the DWC3; following the error stream 
won't restart unless you reboot. That error occurs when the gadget's workqueue function runs 
usb_ep_queue() whilst usb_ep_disable() is running during stream off. The DWC3 gadget code's locking 
plus the nulling of the endpoint descriptor during __dwc3_gadget_ep_disable() [1] and the check for 
that situation in __dwc3_gadget_ep_queue() [2] should make that harmless, but what occasionally 
happens is the dwc3_gadget_ep_queue() call sometimes manages to grab the lock when it's briefly 
unlocked during dwc3_gadget_giveback() [3]. That happens after the Stop Transfer command has been 
sent, so __dwc3_gadget_ep_queue() running through triggers a Start Transfer command, the 
dwc3_gadget_ep_disable() then finishes and stream shuts down, but when it's started back up again 
another Start Transfer command is sent and triggers the error. This patch ameliorates the impact of 
that race in my case, because clearing the flag prevents __dwc3_gadget_ep_queue() from running 
either __dwc3_gadget_start_isoc() or __dwc3_gadget_kick_transfer() for a non started isoc endpoint - 
but the race is still there. I think the potential for races is probably unavoidable given the 
unlock, but I thought it was worth explaining what lead to the patch in case it raises some issue 
that I'm missing.


Thanks

Dan


[1] https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/gadget.c#L1044
[2] https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/gadget.c#L1923
[3] https://elixir.bootlin.com/linux/latest/source/drivers/usb/dwc3/gadget.c#L216

>   drivers/usb/dwc3/gadget.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 578804dc29ca..bc1d93c56d82 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1988,13 +1988,17 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
>   	 */
>   	if (usb_endpoint_xfer_isoc(dep->endpoint.desc)) {
>   		if (!(dep->flags & DWC3_EP_TRANSFER_STARTED)) {
> +			int ret = 0;
> +
>   			if ((dep->flags & DWC3_EP_PENDING_REQUEST))
> -				return __dwc3_gadget_start_isoc(dep);
> +				ret = __dwc3_gadget_start_isoc(dep);
>   
> -			return 0;
> +			dep->flags &= ~DWC3_EP_PENDING_REQUEST;
> +			return ret;
>   		}
>   	}
>   
> +	dep->flags &= ~DWC3_EP_PENDING_REQUEST;
>   	__dwc3_gadget_kick_transfer(dep);
>   
>   	return 0;
