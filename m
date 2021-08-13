Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C3E3EAE36
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 03:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238247AbhHMBok (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Aug 2021 21:44:40 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62405 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238244AbhHMBok (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Aug 2021 21:44:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628819054; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yKB585e+W6FgF524wGRfYxwHeT/TqmQJg/xn/cG/j0Y=;
 b=aUQM9qHmGsYpHiCRPny1DQ2w4DWi/kRDbLjZqMqtZLCj120Pw72diWYMrU+eqLfMSL8Oy6fT
 m3RfOEPac0jUmkOKS1tV+XGk1DJEld+G/nG/w+FJQHqTA+L9tki60/TA8CYyNGDtuDBwWjU9
 +bdsrwYMS/qt1qjh844rxiAE/6s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6115ce61b14e7e2ecb67cbfd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Aug 2021 01:44:01
 GMT
Sender: wat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2693CC433D3; Fri, 13 Aug 2021 01:44:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: wat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 69100C4338A;
        Fri, 13 Aug 2021 01:44:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 13 Aug 2021 09:44:00 +0800
From:   wat@codeaurora.org
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     quic_wat@quicinc.com, wat@codeaurora.org
Subject: Re: [PATCH] usb: xhci-ring: USB SSD may fail to unmount if disconnect
 during data transferring.
In-Reply-To: <1628769727-45046-1-git-send-email-wat@codeaurora.org>
References: <1628769727-45046-1-git-send-email-wat@codeaurora.org>
Message-ID: <83812530fbe1ba6f93c0978019bf118b@codeaurora.org>
X-Sender: wat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi usb teams,

I have a patch about xhci-ring, can you help me to check?

you can contact me if you have any question.


On 2021-08-12 20:02, Tao Wang wrote:
> From: Tao Wang <quic_wat@quicinc.com>
> 
> it stuck in usb_kill_urb() due to urb use_count will not become zero,
> this means urb giveback is not happen.
> in xhci_handle_cmd_set_deq() will giveback urb if td's cancel_status
> equal to TD_CLEARING_CACHE,
> but in xhci_invalidate_cancelled_tds(), only last canceled td's
> cancel_status change to TD_CLEARING_CACHE,
> thus giveback only happen to last urb.
> 
> this change set all cancelled_td's cancel_status to TD_CLEARING_CACHE
> rather than the last one, so all urb can giveback.
> 
> Signed-off-by: Tao Wang <quic_wat@quicinc.com>
> ---
>  drivers/usb/host/xhci-ring.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c 
> b/drivers/usb/host/xhci-ring.c
> index 8fea44b..c7dd7c0 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -960,19 +960,19 @@ static int xhci_invalidate_cancelled_tds(struct
> xhci_virt_ep *ep)
>  			td_to_noop(xhci, ring, td, false);
>  			td->cancel_status = TD_CLEARED;
>  		}
> -	}
> -	if (cached_td) {
> -		cached_td->cancel_status = TD_CLEARING_CACHE;
> -
> -		err = xhci_move_dequeue_past_td(xhci, slot_id, ep->ep_index,
> -						cached_td->urb->stream_id,
> -						cached_td);
> -		/* Failed to move past cached td, try just setting it noop */
> -		if (err) {
> -			td_to_noop(xhci, ring, cached_td, false);
> -			cached_td->cancel_status = TD_CLEARED;
> +		if (cached_td) {
> +			cached_td->cancel_status = TD_CLEARING_CACHE;
> +
> +			err = xhci_move_dequeue_past_td(xhci, slot_id, ep->ep_index,
> +							cached_td->urb->stream_id,
> +							cached_td);
> +			/* Failed to move past cached td, try just setting it noop */
> +			if (err) {
> +				td_to_noop(xhci, ring, cached_td, false);
> +				cached_td->cancel_status = TD_CLEARED;
> +			}
> +			cached_td = NULL;
>  		}
> -		cached_td = NULL;
>  	}
>  	return 0;
>  }
