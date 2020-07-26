Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0E422DE14
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 12:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgGZK6R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jul 2020 06:58:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31584 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725972AbgGZK6R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jul 2020 06:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595761095;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YenbmtO04IdOkazffmSFT4lLxkg0a02uwJKmMFswq+M=;
        b=AuJEYTcIKyZgMugm94QVeO+hn/gB8cs3hEAnJ1VfAo54AdY42EEz4hCnrHDwa9JUlvLWoA
        qMAzXWBGS6SnWOFGXPS1DrX63edVxfQDRZuAB7SYMQe/coshoXZPC8Xp0eGmbDh/whq0Fo
        eX7iOV/rQFhhbBBh6hzcXZaoLg8GOqQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-Q14YZuFbMmSMHdcZ4gs65w-1; Sun, 26 Jul 2020 06:58:12 -0400
X-MC-Unique: Q14YZuFbMmSMHdcZ4gs65w-1
Received: by mail-ed1-f72.google.com with SMTP id a4so4397971edr.18
        for <linux-usb@vger.kernel.org>; Sun, 26 Jul 2020 03:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YenbmtO04IdOkazffmSFT4lLxkg0a02uwJKmMFswq+M=;
        b=NBbqctaAH9oFeL2ktTCgdupyW/V/32w2zxSoBccWAwScMosi6mPUF2AtLIY92ArE1B
         DjYhHZzmWvBv87YUtxxhpPYsMK3FxK4bEpaFEE6qbrF0ik1z+OoRPNRVfBkD6EEgS2qb
         /cy4pk9JabqCbU04WQzFWpJNOXyI+OmhBKtDOkx36Qz4j0lJKNJFLZRiKW9bXEq4Lqmi
         Xd+eQy8j+ejUlCIDMpVGSoQvboPDnys3FSEx9z68Ecp9NmZ7zpi91vC57LOFTmPzgvuA
         ZklN4bm4dJPW+YSYGKyG3GA8O1/tPEfmSQqml+grQyBGn8BwLh69obBwHNc+BZ1qv6Si
         9Ouw==
X-Gm-Message-State: AOAM532p2bYaFAGECiU4WwernOoNl51VvVN4MJvg71J9JGlGiHPTXdpO
        bOWnsa6Bc43PyS/1MZuN3UdgArAlOJ419sV1kaGDdjxkpc8PwOjnX44LSv0KQioyG4DTBU58uqe
        G6/xPlech1aZPa7Tp0Urw
X-Received: by 2002:a17:906:248f:: with SMTP id e15mr9060066ejb.296.1595761091448;
        Sun, 26 Jul 2020 03:58:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5f59vKGSfX08U8c3klPlYbOlEcsHYrOASyI9WBoHHKa/No0Z/51v1DQICDVCotv7dX7vj9w==
X-Received: by 2002:a17:906:248f:: with SMTP id e15mr9060048ejb.296.1595761090848;
        Sun, 26 Jul 2020 03:58:10 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d23sm4788102eja.27.2020.07.26.03.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 03:58:09 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] usb: typec: tcpm: Refactor tcpm_handle_vdm_request
To:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200724174702.61754-1-hdegoede@redhat.com>
 <20200724174702.61754-4-hdegoede@redhat.com>
 <2053df88-872f-aed5-c0a7-ea85b1999f8f@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7e77b7a9-b37f-7c2e-3974-cca7d010c451@redhat.com>
Date:   Sun, 26 Jul 2020 12:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2053df88-872f-aed5-c0a7-ea85b1999f8f@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/25/20 4:45 PM, Guenter Roeck wrote:
> On 7/24/20 10:47 AM, Hans de Goede wrote:
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
>> Changes in v2:
>> - Keep "if (adev && pdev)" checks as is instead of modifying them
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 76 ++++++++++++++++++++++-------------
>>   1 file changed, 48 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index ee239b54bcd8..03a0c083ee9a 100644
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
>> @@ -1078,10 +1086,10 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>>   
>>   #define supports_modal(port)	PD_IDH_MODAL_SUPP((port)->partner_ident.id_header)
>>   
>> -static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>> -			u32 *response)
>> +static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>> +			const u32 *p, int cnt, u32 *response,
>> +			enum adev_actions *adev_action)
>>   {
>> -	struct typec_altmode *adev;
>>   	struct typec_altmode *pdev;
>>   	struct pd_mode_data *modep;
>>   	int rlen = 0;
>> @@ -1097,9 +1105,6 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>   
>>   	modep = &port->mode_data;
>>   
>> -	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
>> -				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>> -
>>   	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
>>   				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>>   
>> @@ -1125,8 +1130,7 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>   			break;
>>   		case CMD_ATTENTION:
>>   			/* Attention command does not have response */
>> -			if (adev)
>> -				typec_altmode_attention(adev, p[1]);
>> +			*adev_action = ADEV_ATTENTION;
>>   			return 0;
>>   		default:
>>   			break;
>> @@ -1180,23 +1184,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
>>   		case CMD_ENTER_MODE:
>>   			if (adev && pdev) {
> 
> I must be missing something. Does this compile ? The 'adev' variable was removed above.
> Maybe move the call to typec_altmode_update_active() into tcpm_handle_vdm_request()
> instead ?

Yes it compiles. The adev variable is now a function parameter, since
we already to the lookup for it in tcpm_handle_vdm_request() now,
I'm simply passing it along here.

Regards,

Hans



>>   				typec_altmode_update_active(pdev, true);
>> -
>> -				if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
>> -					response[0] = VDO(adev->svid, 1,
>> -							  CMD_EXIT_MODE);
>> -					response[0] |= VDO_OPOS(adev->mode);
>> -					return 1;
>> -				}
>> +				*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
>>   			}
>>   			return 0;
>>   		case CMD_EXIT_MODE:
>>   			if (adev && pdev) {
>>   				typec_altmode_update_active(pdev, false);
>> -
>>   				/* Back to USB Operation */
>> -				WARN_ON(typec_altmode_notify(adev,
>> -							     TYPEC_STATE_USB,
>> -							     NULL));
>> +				*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
>> +				return 0;
>>   			}
>>   			break;
>>   		default:
>> @@ -1207,11 +1203,8 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
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
>> @@ -1221,15 +1214,15 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const u32 *p, int cnt,
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
>> @@ -1237,6 +1230,9 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>   	for (i = 0; i < cnt; i++)
>>   		p[i] = le32_to_cpu(payload[i]);
>>   
>> +	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
>> +				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>> +
>>   	if (port->vdm_state == VDM_STATE_BUSY) {
>>   		/* If UFP responded busy retry after timeout */
>>   		if (PD_VDO_CMDT(p[0]) == CMDT_RSP_BUSY) {
>> @@ -1251,7 +1247,31 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>   	}
>>   
>>   	if (PD_VDO_SVDM(p[0]))
>> -		rlen = tcpm_pd_svdm(port, p, cnt, response);
>> +		rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
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
>>   		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
>>
> 

