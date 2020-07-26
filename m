Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E946A22DF74
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 15:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgGZNWr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jul 2020 09:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGZNWr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jul 2020 09:22:47 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E936C0619D2
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2020 06:22:47 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id w2so7914121pgg.10
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2020 06:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4CnDG5c0thXXt98hZWTwfZv0r6mqpqDgdjCkM3zwqmU=;
        b=ndkAU/8kvdUPYpCEpuw9SVbhCAXL/oTjXP4lU5AdxQ/X2ufhA1g057AsrSOLHwlz4s
         gcsiGyNDW13F1MyP9HjCbPBeI5B640NCv2cXBvACAWuaweTLHKS9vOCt3Z+ApJATeuzI
         F1dsV5xS1NozplrciWsd3kJtYv4eJI4f44PBcEwRjM2ceNaTnUUTO79lZXaMz01yYEBZ
         thVmpTes41VoUDxB0ezlchmCWmB2s9TxtoraoQzBUs82FIxM/rkfZuXI/pNIwGCQTzeP
         LBhljEfQmMvPppYfO9GioCAqILBk4UUnTab0ssboPz2/nyGDaDSOQMyqlR1AOXsvOHLh
         LLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4CnDG5c0thXXt98hZWTwfZv0r6mqpqDgdjCkM3zwqmU=;
        b=fnqG8UaZJ/Ww4XqcWo7UI/b3FnbSZQRC9593wqXXMHaBQT5qbAitFlZT3xFvvRE3Pn
         Roy5JzO5D16ZMasxU3sVjYRXg+H6FMim8B/qfvgqUAZLU10xo+xRunXgU/FnMx+4YY+9
         RbdPwR+6TeSVxdaXg+DSZMOSARJwhMhQALUPcmVYIa/v571cap2IPHrAHvpIT/NDwr+b
         yVX1SRwr0oApvXwe9DOkNkQ34h93RSgWy8wG0T6U6wX3JUol+iDXsrY7LeDGvRvgcxOq
         s+6mjCdOfTEH3k8oHDlV3dQkzLniNGaBoMsQkJ040GGRydQEu0xE7qBqPI1haW3CArxh
         G8jQ==
X-Gm-Message-State: AOAM532g9aWhydLmfrp+G93jGH9UGfPmgQJYtFuAOlB1jsalizrKK64W
        7GFiP5s53gZRNl6uRZGP7qx9zhEM
X-Google-Smtp-Source: ABdhPJzM5Qt5RCZ/MLV0mLyV0ws2IkoijLJ6itMaNiORKjO+Bf4Wvvm9g/wYqoS0xNc3NttrpyZjlg==
X-Received: by 2002:a63:cf49:: with SMTP id b9mr15320989pgj.31.1595769766366;
        Sun, 26 Jul 2020 06:22:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g5sm12076019pfh.168.2020.07.26.06.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 06:22:45 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-4-hdegoede@redhat.com>
 <2053df88-872f-aed5-c0a7-ea85b1999f8f@roeck-us.net>
 <7e77b7a9-b37f-7c2e-3974-cca7d010c451@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <7bc17785-4fcd-eb39-3134-ae9269b13e8e@roeck-us.net>
Date:   Sun, 26 Jul 2020 06:22:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7e77b7a9-b37f-7c2e-3974-cca7d010c451@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/26/20 3:58 AM, Hans de Goede wrote:
> Hi,
> 
> On 7/25/20 4:45 PM, Guenter Roeck wrote:
>> On 7/24/20 10:47 AM, Hans de Goede wrote:
>>> Refactor tcpm_handle_vdm_request and its tcpm_pd_svdm helper function so
>>> that reporting the results of the vdm to the altmode-driver is separated
>>> out into a clear separate step inside tcpm_handle_vdm_request, instead
>>> of being scattered over various places inside the tcpm_pd_svdm helper.
>>>
>>> This is a preparation patch for fixing an AB BA lock inversion between the
>>> tcpm code and some altmode drivers.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> Changes in v2:
>>> - Keep "if (adev && pdev)" checks as is instead of modifying them
>>> ---
>>>   drivers/usb/typec/tcpm/tcpm.c | 76 ++++++++++++++++++++++-------------
>>>   1 file changed, 48 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>> index ee239b54bcd8..03a0c083ee9a 100644
>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>> @@ -159,6 +159,14 @@ enum pd_msg_request {
>>>       PD_MSG_DATA_SOURCE_CAP,
>>>   };
>>>   +enum adev_actions {
>>> +    ADEV_NONE = 0,
>>> +    ADEV_NOTIFY_USB_AND_QUEUE_VDM,
>>> +    ADEV_QUEUE_VDM,
>>> +    ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL,
>>> +    ADEV_ATTENTION,
>>> +};
>>> +
>>>   /* Events from low level driver */
>>>     #define TCPM_CC_EVENT        BIT(0)
>>> @@ -1078,10 +1086,10 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>>>     #define supports_modal(port)    PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
>>>   -static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>> -            u32 *response)
>>> +static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>>> +            const u32 *p, int cnt, u32 *response,
>>> +            enum adev_actions *adev_action)
>>>   {
>>> -    struct typec_altmode *adev;
>>>       struct typec_altmode *pdev;
>>>       struct pd_mode_data *modep;
>>>       int rlen = 0;
>>> @@ -1097,9 +1105,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>>         modep = &port->mode_data;
>>>   -    adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
>>> -                   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>>> -
>>>       pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
>>>                      PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>>>   @@ -1125,8 +1130,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>>               break;
>>>           case CMD_ATTENTION:
>>>               /* Attention command does not have response */
>>> -            if (adev)
>>> -                typec_altmode_attention(adev, p[1]);
>>> +            *adev_action = ADEV_ATTENTION;
>>>               return 0;
>>>           default:
>>>               break;
>>> @@ -1180,23 +1184,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>>           case CMD_ENTER_MODE:
>>>               if (adev && pdev) {
>>
>> I must be missing something. Does this compile ? The 'adev' variable was removed above.
>> Maybe move the call to typec_altmode_update_active() into tcpm_handle_vdm_request()
>> instead ?
> 
> Yes it compiles. The adev variable is now a function parameter, since
> we already to the lookup for it in tcpm_handle_vdm_request() now,
> I'm simply passing it along here.
> 

Thanks for the clarification, and sorry I missed that.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> Regards,
> 
> Hans
> 
> 
> 
>>>                   typec_altmode_update_active(pdev, true);
>>> -
>>> -                if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
>>> -                    response[0] = VDO(adev->svid, 1,
>>> -                              CMD_EXIT_MODE);
>>> -                    response[0] |= VDO_OPOS(adev->mode);
>>> -                    return 1;
>>> -                }
>>> +                *adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
>>>               }
>>>               return 0;
>>>           case CMD_EXIT_MODE:
>>>               if (adev && pdev) {
>>>                   typec_altmode_update_active(pdev, false);
>>> -
>>>                   /* Back to USB Operation */
>>> -                WARN_ON(typec_altmode_notify(adev,
>>> -                                 TYPEC_STATE_USB,
>>> -                                 NULL));
>>> +                *adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
>>> +                return 0;
>>>               }
>>>               break;
>>>           default:
>>> @@ -1207,11 +1203,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>>           switch (cmd) {
>>>           case CMD_ENTER_MODE:
>>>               /* Back to USB Operation */
>>> -            if (adev)
>>> -                WARN_ON(typec_altmode_notify(adev,
>>> -                                 TYPEC_STATE_USB,
>>> -                                 NULL));
>>> -            break;
>>> +            *adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
>>> +            return 0;
>>>           default:
>>>               break;
>>>           }
>>> @@ -1221,15 +1214,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>>       }
>>>         /* Informing the alternate mode drivers about everything */
>>> -    if (adev)
>>> -        typec_altmode_vdm(adev, p[0], &p[1], cnt);
>>> -
>>> +    *adev_action = ADEV_QUEUE_VDM;
>>>       return rlen;
>>>   }
>>>     static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>>                       const __le32 *payload, int cnt)
>>>   {
>>> +    enum adev_actions adev_action = ADEV_NONE;
>>> +    struct typec_altmode *adev;
>>>       u32 p[PD_MAX_PAYLOAD];
>>>       u32 response[8] = { };
>>>       int i, rlen = 0;
>>> @@ -1237,6 +1230,9 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>>       for (i = 0; i < cnt; i++)
>>>           p[i] = le32_to_cpu(payload[i]);
>>>   +    adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
>>> +                   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>>> +
>>>       if (port->vdm_state == VDM_STATE_BUSY) {
>>>           /* If UFP responded busy retry after timeout */
>>>           if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
>>> @@ -1251,7 +1247,31 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>>       }
>>>         if (PD_VDO_SVDM(p[0]))
>>> -        rlen = tcpm_pd_svdm(port, p, cnt, response);
>>> +        rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
>>> +
>>> +    if (adev) {
>>> +        switch (adev_action) {
>>> +        case ADEV_NONE:
>>> +            break;
>>> +        case ADEV_NOTIFY_USB_AND_QUEUE_VDM:
>>> +            WARN_ON(typec_altmode_notify(adev, TYPEC_STATE_USB, NULL));
>>> +            typec_altmode_vdm(adev, p[0], &p[1], cnt);
>>> +            break;
>>> +        case ADEV_QUEUE_VDM:
>>> +            typec_altmode_vdm(adev, p[0], &p[1], cnt);
>>> +            break;
>>> +        case ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL:
>>> +            if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
>>> +                response[0] = VDO(adev->svid, 1, CMD_EXIT_MODE);
>>> +                response[0] |= VDO_OPOS(adev->mode);
>>> +                rlen = 1;
>>> +            }
>>> +            break;
>>> +        case ADEV_ATTENTION:
>>> +            typec_altmode_attention(adev, p[1]);
>>> +            break;
>>> +        }
>>> +    }
>>>         if (rlen > 0)
>>>           tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
>>>
>>
> 

