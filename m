Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02BB710238D
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 12:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfKSLsd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Nov 2019 06:48:33 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35682 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbfKSLsd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Nov 2019 06:48:33 -0500
Received: by mail-wm1-f67.google.com with SMTP id 8so3227211wmo.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2019 03:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=ry/N2H6IErxUximdD1yn10PnjeL9UQUa13dI4Z3DXGI=;
        b=PWBEGZCIclelpZQaf7gRWAL/Bi6mEzGboeWLHPUz6DCTvNyw3hDgB1OdaKR4KuWP2N
         mJN4tu+2bmvj0TWgi+Bgo0jfCWANyT5pdiJNC8zcaaknM8T5ezD175eWOFf2tLlfF83w
         w76n1/vQLkfRsd2hi+rz4wuijsTj9il3vR4/XGq7bMgxpeM1ZRk9JLDABTq2WYGaGfHP
         ug9Ml1ri2MRdYxucc05Utvop6cZrqAI88QY2yLJg47OHhBDTYMCykCOi0MHhp1/ANGld
         jtclc5Osg1FB1p+drHoxXB5O7Dt40lWC4Sbj3LuxaosoTNT4d4ehkoqfV/qfAsJzjoeY
         JUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=ry/N2H6IErxUximdD1yn10PnjeL9UQUa13dI4Z3DXGI=;
        b=k5nhHNr/PxTFdmIalQY/oM7c3rc7qm+zyMSI+BuJWOPRm356HBdeboAjYXsd5FzfRx
         88AW3+4wC19JmUqJirpI4o/Hdvd+ZLKd+0Sewg3QAGhmpb/ymiPI6edkyKfZmjh3Z3xG
         SUcP4YiiFyJhlzelVqjJ450dS4FR4vGoK1qzyyZ9VYYELuHK0cQJEQCoYhEEsjLSNKCC
         8wC4NaXsuMMQgLOR39pHbZo8256Lu3jlOR9msN2Pszp+dqXr3ts/+X1YUVRh8KaIIeUU
         tpNHYCfu6axG+99zisGIj+czcJh7u28VIfwrACxvgo94MqXAiN9jiRbhXUPXVzPJ59kU
         ZVow==
X-Gm-Message-State: APjAAAVx9gtL0S62vgKQAmFPUIfSF1uE3c/MLoT7hV0gtvbHyUL7tJo2
        RE2l+J1Zq0KdDB0XLuFB5eg=
X-Google-Smtp-Source: APXvYqy41BtqKW8E1Rwq+sLnJEuAG7B1lQpEtCbWeMz5wj/m3VLtPWrnpv2Qpj7hKNkp2TVJO7QMww==
X-Received: by 2002:a1c:9dd3:: with SMTP id g202mr5238877wme.43.1574164108719;
        Tue, 19 Nov 2019 03:48:28 -0800 (PST)
Received: from [89.139.251.88] (89-139-251-88.bb.netvision.net.il. [89.139.251.88])
        by smtp.gmail.com with ESMTPSA id z8sm26274636wrp.49.2019.11.19.03.48.26
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Nov 2019 03:48:27 -0800 (PST)
Message-ID: <5DD3D689.8000609@gmail.com>
Date:   Tue, 19 Nov 2019 13:48:25 +0200
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     mathias.nyman@intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: No XHCI_TRUST_TX_LENGTH check in the absence of
 matching TD
References: <20191113130609.32831-1-eli.billauer@gmail.com> <6ad6dceb-a938-a2b7-c535-32bd3404e53d@linux.intel.com>
In-Reply-To: <6ad6dceb-a938-a2b7-c535-32bd3404e53d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I've taken the liberty to add parentheses for sake of clarity, so I 
tested the following patch (against kernel 5.3.0) with my Resesas USB 
controller. And as expected, it does the job: The warnings are not printed.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 9741cdeea9d7..b062e3a19e95 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2378,7 +2378,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
      case COMP_SUCCESS:
          if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
              break;
-        if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
+        if ((xhci->quirks & XHCI_TRUST_TX_LENGTH) ||
+            ep_ring->last_td_was_short)
              trb_comp_code = COMP_SHORT_PACKET;
          else
              xhci_warn_ratelimited(xhci,

So it solves the problem for me, and hopefully for future Renesas 
controllers with the same issue.

Regards,
    Eli

On 18/11/19 18:08, Mathias Nyman wrote:
> On 13.11.2019 15.06, eli.billauer@gmail.com wrote:
>> From: Eli Billauer <eli.billauer@gmail.com>
>>
>> When an IN transfer ends with a short packet, the xHCI controller is
>> required to submit an event TRB with Completion Code COMP_SHORT_PACKET
>> against the data TRB that was in effect when the short packet 
>> arrived, as
>> well as any event TRBs it submits on behalf of this transfer.
>>
>> Alas, some controllers (e.g. Renesas) mark the subsequent events TRBs 
>> (if
>> any) with COMP_SUCCESS. As these subsequent event TRBs are useless, they
>> are ignored on the basis that they have no matching TD queued (it was
>> dequeued in response to the first COMP_SHORT_PACKET event TRB).
>>
>> Accordingly, the quirk handling and kernel log warning is moved to after
>> the TD match check, in particular in order to avoid unnecessary warnings
>> messages.
>>
>> Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
>> ---
>>   drivers/usb/host/xhci-ring.c | 19 +++++++++++--------
>>   1 file changed, 11 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 9741cdeea9d7..96680eb71a45 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -2376,14 +2376,6 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>>        * transfer type
>>        */
>>       case COMP_SUCCESS:
>> -        if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
>> -            break;
>> -        if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
>> -            trb_comp_code = COMP_SHORT_PACKET;
>> -        else
>> -            xhci_warn_ratelimited(xhci,
>> -                          "WARN Successful completion on short TX 
>> for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
>> -                          slot_id, ep_index);
>>       case COMP_SHORT_PACKET:
>>           break;
>>       /* Completion codes for endpoint stopped state */
>> @@ -2586,6 +2578,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>>               skip_isoc_td(xhci, td, event, ep, &status);
>>               goto cleanup;
>>           }
>> +
>> +        if ((trb_comp_code == COMP_SUCCESS) &&
>> +            (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) != 0)) {
>> +            if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
>> +                trb_comp_code = COMP_SHORT_PACKET;
>> +            else
>> +                xhci_warn_ratelimited(xhci,
>> +                              "WARN Successful completion on short 
>> TX for slot %u ep %u: needs XHCI_TRUST_TX_LENGTH quirk?\n",
>> +                              slot_id, ep_index);
>> +        }
>> +
>>           if (trb_comp_code == COMP_SHORT_PACKET)
>>               ep_ring->last_td_was_short = true;
>>           else
>>
>
> I'd hate to rip out the success case from the switch statement where 
> the other
> completion codes are handled. We're still only making a choice about a 
> warning
> message
>
> How about handling all COMP_SUCCESS cases with remaining data after a 
> short
> transfer as COMP_SHORT_PACKET by default?
>
> The code below won't behave exactly the same as in your patch, but should
> do the trick in your Renesas case as well. Can you try it out?
>
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 9ebaa8e132a9..d23f7408c81f 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2381,7 +2381,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>         case COMP_SUCCESS:
>                 if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) == 0)
>                         break;
> -               if (xhci->quirks & XHCI_TRUST_TX_LENGTH)
> +               if (xhci->quirks & XHCI_TRUST_TX_LENGTH ||
> +                   ep_ring->last_td_was_short)
>                         trb_comp_code = COMP_SHORT_PACKET;
>                 else
>                         xhci_warn_ratelimited(xhci,
>
>

