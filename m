Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D4F22C8B3
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 17:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgGXPD7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 11:03:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32056 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXPD6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 11:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595603036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2pVOLnOWW+XCwvT/Q2kEx7f3HXjyclXzWuPj9LI3F9I=;
        b=UmQiCDGL2SHZyCkqdEC0H6LPrXBx42Kwc9pYnijJE86tJLy940qlHBGs2buPeKYtzyotgm
        +NCeiJo1m+tOPR4+ffaf2HToDH8zwaaXR0PJ97wWXpbJ57j11Jmx6Lf//Cr5/JC3oMESGK
        zzZ76N+oi6icDGfMWawlr4dPKFhtan8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-k7SJGvAMOPurW2WktMjYIQ-1; Fri, 24 Jul 2020 11:03:54 -0400
X-MC-Unique: k7SJGvAMOPurW2WktMjYIQ-1
Received: by mail-wr1-f72.google.com with SMTP id w1so195300wro.4
        for <linux-usb@vger.kernel.org>; Fri, 24 Jul 2020 08:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2pVOLnOWW+XCwvT/Q2kEx7f3HXjyclXzWuPj9LI3F9I=;
        b=SaKsBHs4hGMX9wxpBf9CIhoM+uVulSbV0353WSHgjO14jfGzvtGsg9pzmh1VCJ4wuS
         6vxtrQz6SB66qgd0WUAmUSSiYzMBV3JQJBdQRCwc25e+cp+4lD/HSADmsklAzGLD3ye6
         wdlG+GwYyATqZG4IjsuSfl0Dk6DMaB/ylfooYW/ZBX6o8jxUe0XvwJXPfB81UzOjNx1h
         NQlKD6y3fawQ0ustmzpAxP6LNiEaVbaTm/c4D8jawtftQSDbt27upXVhOrqFgwGq3leW
         PVH5Uf7B7CQapd35pD0KjijjZarCQpXgK59TjyKfQ/gRR5qJGpk0Z4RSmYViDlnuxqWJ
         Iu7g==
X-Gm-Message-State: AOAM532ZFX4BWoIwgts/0qaTCX/qpe89GtOgOhdIlvQCi7pgzzDzpINa
        yMoiA6wBnWCbIicVdyHDA9+Wp5xFKjUSCuH3Oh90KTBBak3AfrdS6acvYT9kVtV2K6oN81/VuIW
        ejK7EH/Lcvg2W0miMsbY2
X-Received: by 2002:a5d:610a:: with SMTP id v10mr8705774wrt.8.1595603033055;
        Fri, 24 Jul 2020 08:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsRJL4XoM71nROtvKbYOOh02SUV5iBahsVvU3i+nGPvu04ZhpZIN2fNxFGzV/SZPW471G9QQ==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr8705746wrt.8.1595603032731;
        Fri, 24 Jul 2020 08:03:52 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id a10sm1659970wrx.15.2020.07.24.08.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 08:03:51 -0700 (PDT)
Subject: Re: [PATCH 2/6] usb: typec: tcpm: Move locking into tcpm_queue_vdm()
To:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <20200715132301.99816-1-hdegoede@redhat.com>
 <20200715132301.99816-3-hdegoede@redhat.com>
 <edd1ea84-679e-0e7b-f615-c9cd8c58bcdc@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8d7e0bc9-9872-ffc0-b95a-e9ca12308f22@redhat.com>
Date:   Fri, 24 Jul 2020 17:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <edd1ea84-679e-0e7b-f615-c9cd8c58bcdc@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Thank you for the reviews.

On 7/15/20 5:41 PM, Guenter Roeck wrote:
> On 7/15/20 6:22 AM, Hans de Goede wrote:
>> Various callers (all the typec_altmode_ops) take the port-lock just for
>> the tcpm_queue_vdm() call.
>>
>> Rename the raw (unlocked) tcpm_queue_vdm() call to
>> tcpm_queue_vdm_unlocked() and add a new tcpm_queue_vdm() helper which takes
>> the lock, so that its callers don't have to do this themselves.
>>
>> This is a preparation patch for fixing an AB BA lock inversion between the
>> tcpm code and some altmode drivers.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 27 ++++++++++++++-------------
>>   1 file changed, 14 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index fc6455a29c74..30e997d6ea1e 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -958,9 +958,11 @@ static void tcpm_queue_message(struct tcpm_port *port,
>>   /*
>>    * VDM/VDO handling functions
>>    */
>> -static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>> -			   const u32 *data, int cnt)
>> +static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
>> +				    const u32 *data, int cnt)
> 
> The new function name is misleading. I think tcpm_queue_vdm_locked()
> would be a much better name. Alternatively, consider keeping tcpm_queue_vdm()
> as is and add tcpm_queue_vdm_unlocked().

At first I was a bit surprised by your comment, because I'm sure I have seen the
unlocked pattern used before, in the same way as I'm using it. But upon checking
it indeed seems that most of the time it is used in the way you suggest using it
including in the usb subsys. So I will make the requested changes for v2 of the
patchset.

Regards,

Hans



> 
>>   {
>> +	WARN_ON(!mutex_is_locked(&port->lock));
>> +
>>   	port->vdo_count = cnt + 1;
>>   	port->vdo_data[0] = header;
>>   	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
>> @@ -971,6 +973,14 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>>   	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
>>   }
>>   
>> +static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>> +			   const u32 *data, int cnt)
>> +{
>> +	mutex_lock(&port->lock);
>> +	tcpm_queue_vdm_unlocked(port, header, data, cnt);
>> +	mutex_unlock(&port->lock);
>> +}
>> +
>>   static void svdm_consume_identity(struct tcpm_port *port, const __le32 *payload,
>>   				  int cnt)
>>   {
>> @@ -1249,7 +1259,7 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>   		rlen = tcpm_pd_svdm(port, payload, cnt, response);
>>   
>>   	if (rlen > 0)
>> -		tcpm_queue_vdm(port, response[0], &response[1], rlen - 1);
>> +		tcpm_queue_vdm_unlocked(port, response[0], &response[1], rlen - 1);
>>   }
>>   
>>   static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
>> @@ -1263,7 +1273,7 @@ static void tcpm_send_vdm(struct tcpm_port *port, u32 vid, int cmd,
>>   	/* set VDM header with VID & CMD */
>>   	header = VDO(vid, ((vid & USB_SID_PD) == USB_SID_PD) ?
>>   			1 : (PD_VDO_CMD(cmd) <= CMD_ATTENTION), cmd);
>> -	tcpm_queue_vdm(port, header, data, count);
>> +	tcpm_queue_vdm_unlocked(port, header, data, count);
>>   }
>>   
>>   static unsigned int vdm_ready_timeout(u32 vdm_hdr)
>> @@ -1506,13 +1516,10 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
>>   	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>>   	u32 header;
>>   
>> -	mutex_lock(&port->lock);
>>   	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
>>   	header |= VDO_OPOS(altmode->mode);
>>   
>>   	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
>> -	mutex_unlock(&port->lock);
>> -
>>   	return 0;
>>   }
>>   
>> @@ -1521,13 +1528,10 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
>>   	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>>   	u32 header;
>>   
>> -	mutex_lock(&port->lock);
>>   	header = VDO(altmode->svid, 1, CMD_EXIT_MODE);
>>   	header |= VDO_OPOS(altmode->mode);
>>   
>>   	tcpm_queue_vdm(port, header, NULL, 0);
>> -	mutex_unlock(&port->lock);
>> -
>>   	return 0;
>>   }
>>   
>> @@ -1536,10 +1540,7 @@ static int tcpm_altmode_vdm(struct typec_altmode *altmode,
>>   {
>>   	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>>   
>> -	mutex_lock(&port->lock);
>>   	tcpm_queue_vdm(port, header, data, count - 1);
>> -	mutex_unlock(&port->lock);
>> -
>>   	return 0;
>>   }
>>   
>>
> 

