Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C4A1008DD
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 17:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKRQFz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 11:05:55 -0500
Received: from mga02.intel.com ([134.134.136.20]:44729 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726216AbfKRQFz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 11:05:55 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 08:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; 
   d="scan'208";a="407436437"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2019 08:05:51 -0800
Subject: Re: [PATCH] xhci: No XHCI_TRUST_TX_LENGTH check in the absence of
 matching TD
To:     eli.billauer@gmail.com
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
References: <20191113130609.32831-1-eli.billauer@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <6ad6dceb-a938-a2b7-c535-32bd3404e53d@linux.intel.com>
Date:   Mon, 18 Nov 2019 18:08:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113130609.32831-1-eli.billauer@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13.11.2019 15.06, eli.billauer@gmail.com wrote:
> From: Eli Billauer <eli.billauer@gmail.com>
> 
> When an IN transfer ends with a short packet, the xHCI controller is
> required to submit an event TRB with Completion Code COMP_SHORT_PACKET
> against the data TRB that was in effect when the short packet arrived, as
> well as any event TRBs it submits on behalf of this transfer.
> 
> Alas, some controllers (e.g. Renesas) mark the subsequent events TRBs (if
> any) with COMP_SUCCESS. As these subsequent event TRBs are useless, they
> are ignored on the basis that they have no matching TD queued (it was
> dequeued in response to the first COMP_SHORT_PACKET event TRB).
> 
> Accordingly, the quirk handling and kernel log warning is moved to after
> the TD match check, in particular in order to avoid unnecessary warnings
> messages.
> 
> Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
> ---
>   drivers/usb/host/xhci-ring.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9741cdeea9d7..96680eb71a45 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2376,14 +2376,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>   	 * transfer type
>   	 */
>   	case COMP_SUCCESS:
> -		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
> -			break;
> -		if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
> -			trb_comp_code = COMP_SHORT_PACKET;
> -		else
> -			xhci_warn_ratelimited(xhci,
> -					      "WARN Successful completion on short TX for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
> -					      slot_id, ep_index);
>   	case COMP_SHORT_PACKET:
>   		break;
>   	/* Completion codes for endpoint stopped state */
> @@ -2586,6 +2578,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>   			skip_isoc_td(xhci, td, event, ep, &status);
>   			goto cleanup;
>   		}
> +
> +		if ((trb_comp_code == COMP_SUCCESS) &&
> +		    (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) != 0)) {
> +			if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
> +				trb_comp_code = COMP_SHORT_PACKET;
> +			else
> +				xhci_warn_ratelimited(xhci,
> +						      "WARN Successful completion on short TX for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
> +						      slot_id, ep_index);
> +		}
> +
>   		if (trb_comp_code == COMP_SHORT_PACKET)
>   			ep_ring->last_td_was_short = true;
>   		else
> 

I'd hate to rip out the success case from the switch statement where the other
completion codes are handled. We're still only making a choice about a warning
message

How about handling all COMP_SUCCESS cases with remaining data after a short
transfer as COMP_SHORT_PACKET by default?

The code below won't behave exactly the same as in your patch, but should
do the trick in your Renesas case as well. Can you try it out?

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9ebaa8e132a9..d23f7408c81f 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2381,7 +2381,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
         case COMP_SUCCESS:
                 if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
                         break;
-               if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
+               if (xhci->quirks & XHCI_TRUST_TX_LENGTH ||
+                   ep_ring->last_td_was_short)
                         trb_comp_code = COMP_SHORT_PACKET;
                 else
                         xhci_warn_ratelimited(xhci,
  
