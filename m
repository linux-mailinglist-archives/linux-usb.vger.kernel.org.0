Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E13A22C943
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 17:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgGXPbP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 11:31:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20126 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726366AbgGXPbO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 11:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595604672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eZJqqjmOuiSI1QvODewrC9T02sHT4boO6cRGPXV6P2k=;
        b=TFXONDfFYSvPIPkzn+TKwIzxXvrvyLWL/nKNsEXAvUwD0J1rShnzsQj0q0QkRM/c+YMWbs
        p5sCwkxvCCbqF/FcC2xXnkKmocN6luQ4Ft53Ug8I1AJZfeTl5AxQZO6/fb7bXXS92c4ZWV
        23tX+B69tM572m6LnJdozuTwXXi5QFk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-wCR9dn3FNeOc7Qb3bYcozg-1; Fri, 24 Jul 2020 11:31:10 -0400
X-MC-Unique: wCR9dn3FNeOc7Qb3bYcozg-1
Received: by mail-wm1-f69.google.com with SMTP id t26so3489625wmn.4
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 08:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eZJqqjmOuiSI1QvODewrC9T02sHT4boO6cRGPXV6P2k=;
        b=QGHnzxN2uVp9Fvo5DnAP1SqfYxLaKE2SL1jbJzIVsHkCQt5ecEkwMZf9c3IVTW41x8
         rN/tPRzLiafwv1JwkeNFBMXrxrkCKbcZuqCC/qN307dkCvY7cYsX4ZYSxGX+Y+BKqhVM
         YqN0N4Ve4RW0Y3BbZjCBr+DPq3mf9Dh0z1jyK2vII5qa9lJW3obgRwmHoOQBskuq6uTu
         Ic3rFrhPCeEGBVw3CdPGpfcr3xVessR0FC6wPV0KVzH0ZyShLgu9mfYbUHB3Xl6Ur9DS
         iCT6stNlDEp0hjItPBwT4bn3NJPO7AeN1wwnuKqMsVym+sl0v1ZJCaNVfubUSq0TKGJX
         pBTA==
X-Gm-Message-State: AOAM532kaRC6ckNWtn04rrD7sQtBhKWenwMjBRuaoZrHLOcnhJQ5jOk3
        Zh1t72RILqq3ORO7hf/kRwtMrcT+G3zalDm/4LoQ5lC3aJ52jWZ9cnheJooAwF2Z04k0W5+5BmS
        Hkl6IOnZ2ab/PK8WqdvX9
X-Received: by 2002:adf:e704:: with SMTP id c4mr9884731wrm.81.1595604669241;
        Fri, 24 Jul 2020 08:31:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWpNQUgZgZNGU5OAHELleH9rA1PHk+gvh8b/8q2Olo+bVYlbrfaIJZNqnwLIMShITabfWA4w==
X-Received: by 2002:adf:e704:: with SMTP id c4mr9884718wrm.81.1595604668951;
        Fri, 24 Jul 2020 08:31:08 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id q5sm1658282wrp.60.2020.07.24.08.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 08:31:08 -0700 (PDT)
Subject: Re: [PATCH 4/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request
To:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200715132301.99816-1-hdegoede@redhat.com>
 <20200715132301.99816-5-hdegoede@redhat.com>
 <68fd64dd-0543-7a94-225d-16d21a4de149@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f688a25-8eef-077f-b785-e3f2ff04bee4@redhat.com>
Date:   Fri, 24 Jul 2020 17:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <68fd64dd-0543-7a94-225d-16d21a4de149@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/15/20 5:58 PM, Guenter Roeck wrote:
> On 7/15/20 6:22 AM, Hans de Goede wrote:
>> Refactor tcpm_handle_vdm_request and its tcpm_pd_svdm helper function so
>> that reporting the results of the vdm to the altmode-driver is separated
>> out into a clear separate step inside tcpm_handle_vdm_request, instead
>> of being scattered over various places inside the tcpm_pd_svdm helper.
>>
>> This is a preparation patch for fixing an AB BA lock inversion between the
>> tcpm code and some altmode drivers.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 80 +++++++++++++++++++++--------------
>>   1 file changed, 49 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index bf5a0322dbfe..4745b4062000 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -159,6 +159,14 @@ enum pd_msg_request {
>>   	PD_MSG_DATA_SOURCE_CAP,
>>   };
>>   
>> +enum adev_actions {
>> +	ADEV_NONE = 0,
>> +	ADEV_NOTIFY_USB_AND_QUEUE_VDM,
>> +	ADEV_QUEUE_VDM,
>> +	ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL,
>> +	ADEV_ATTENTION,
>> +};
>> +
>>   /* Events from low level driver */
>>   
>>   #define TCPM_CC_EVENT		BIT(0)
>> @@ -1079,9 +1087,8 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>>   #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
>>   
>>   static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>> -			u32 *response)
>> +			u32 *response, enum adev_actions *adev_action)
>>   {
>> -	struct typec_altmode *adev;
>>   	struct typec_altmode *pdev;
>>   	struct pd_mode_data *modep;
>>   	int rlen = 0;
>> @@ -1097,9 +1104,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>   
>>   	modep = &port->mode_data;
>>   
>> -	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
>> -				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>> -
>>   	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
>>   				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>>   
>> @@ -1125,8 +1129,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>   			break;
>>   		case CMD_ATTENTION:
>>   			/* Attention command does not have response */
>> -			if (adev)
>> -				typec_altmode_attention(adev, p[1]);
>> +			*adev_action = ADEV_ATTENTION;
>>   			return 0;
>>   		default:
>>   			break;
>> @@ -1178,27 +1181,18 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>   			}
>>   			break;
>>   		case CMD_ENTER_MODE:
>> -			if (adev && pdev) {
>> +			if (pdev)
>>   				typec_altmode_update_active(pdev, true);
>>   
> 
> There is a slight semantic difference: typec_altmode_update_active() is now
> called even if adev is NULL. Is this intentional ?

Sort of, I was / am aware of this and choose to accept the small behavior change,
since it seemed innocence and leads to some code cleanup, but thinking more about
it the behavior change indeed seems unwanted, so I will fix this for v2 of the
patch-set.

Regards,

Hans



> 
>> -				if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
>> -					response[0] = VDO(adev->svid, 1,
>> -							  CMD_EXIT_MODE);
>> -					response[0] |= VDO_OPOS(adev->mode);
>> -					return 1;
>> -				}
>> -			}
>> +			*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
>>   			return 0;
>>   		case CMD_EXIT_MODE:
>> -			if (adev && pdev) {
>> +			if (pdev)
>>   				typec_altmode_update_active(pdev, false);
>>   
>> -				/* Back to USB Operation */
>> -				WARN_ON(typec_altmode_notify(adev,
>> -							     TYPEC_STATE_USB,
>> -							     NULL));
>> -			}
>> -			break;
>> +			/* Back to USB Operation */
>> +			*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
>> +			return 0;
>>   		default:
>>   			break;
>>   		}
>> @@ -1207,11 +1201,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>   		switch (cmd) {
>>   		case CMD_ENTER_MODE:
>>   			/* Back to USB Operation */
>> -			if (adev)
>> -				WARN_ON(typec_altmode_notify(adev,
>> -							     TYPEC_STATE_USB,
>> -							     NULL));
>> -			break;
>> +			*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
>> +			return 0;
>>   		default:
>>   			break;
>>   		}
>> @@ -1221,15 +1212,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>   	}
>>   
>>   	/* Informing the alternate mode drivers about everything */
>> -	if (adev)
>> -		typec_altmode_vdm(adev, p[0], &p[1], cnt);
>> -
>> +	*adev_action = ADEV_QUEUE_VDM;
>>   	return rlen;
>>   }
>>   
>>   static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>   				    const __le32 *payload, int cnt)
>>   {
>> +	enum adev_actions adev_action = ADEV_NONE;
>> +	struct typec_altmode *adev;
>>   	u32 p[PD_MAX_PAYLOAD];
>>   	u32 response[8] = { };
>>   	int i, rlen = 0;
>> @@ -1237,6 +1228,9 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>   	for (i = 0; i < cnt; i++)
>>   		p[i] = le32_to_cpu(payload[i]);
>>   
>> +	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
>> +				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>> +
>>   	if (port->vdm_state == VDM_STATE_BUSY) {
>>   		/* If UFP responded busy retry after timeout */
>>   		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
>> @@ -1251,7 +1245,31 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>   	}
>>   
>>   	if (PD_VDO_SVDM(p[0]))
>> -		rlen = tcpm_pd_svdm(port, p, cnt, response);
>> +		rlen = tcpm_pd_svdm(port, p, cnt, response, &adev_action);
>> +
>> +	if (adev) {
>> +		switch (adev_action) {
>> +		case ADEV_NONE:
>> +			break;
>> +		case ADEV_NOTIFY_USB_AND_QUEUE_VDM:
>> +			WARN_ON(typec_altmode_notify(adev, TYPEC_STATE_USB, NULL));
>> +			typec_altmode_vdm(adev, p[0], &p[1], cnt);
>> +			break;
>> +		case ADEV_QUEUE_VDM:
>> +			typec_altmode_vdm(adev, p[0], &p[1], cnt);
>> +			break;
>> +		case ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL:
>> +			if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
>> +				response[0] = VDO(adev->svid, 1, CMD_EXIT_MODE);
>> +				response[0] |= VDO_OPOS(adev->mode);
>> +				rlen = 1;
>> +			}
>> +			break;
>> +		case ADEV_ATTENTION:
>> +			typec_altmode_attention(adev, p[1]);
>> +			break;
>> +		}
>> +	}
>>   
>>   	if (rlen > 0)
>>   		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
>>
> 

