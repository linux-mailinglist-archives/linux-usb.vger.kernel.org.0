Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37B09358B0E
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 19:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhDHROS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 13:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55452 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231480AbhDHROS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 13:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617902046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KUZzUJw8cVcOuQoVR0vrCfkOIuGoj1x1NYjVpOjErqg=;
        b=DaCde2pluK4Ki8Rdxccdc7q31AXinP1uWCXDLZBnPFBVd+w7j4KX2wGb1iVRLMK6iv/+M3
        PEhshHahuIeIHKVfBDWJ9WUqoiJITmJ0t1CWm3JPfExMKugD39x16bShKyAcbbgMMj16P2
        dL16t4wMiiibPWbw1rBVtIz8aBIzvu0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-jyriPPhsPWugwkMXXDd3pQ-1; Thu, 08 Apr 2021 13:14:04 -0400
X-MC-Unique: jyriPPhsPWugwkMXXDd3pQ-1
Received: by mail-ed1-f69.google.com with SMTP id l22so1355890edt.8
        for <linux-usb@vger.kernel.org>; Thu, 08 Apr 2021 10:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KUZzUJw8cVcOuQoVR0vrCfkOIuGoj1x1NYjVpOjErqg=;
        b=A/ozqJ6MqDU+Uy0j/Y+5K4fvdbSF1g02q2J8zbyyruCQml+8oksZrJYhqIQwXj/Jd6
         ZzrOeQUifTA5n4ynG7We+mwz3q1R8OTZKDoElKtyxUNMYTkR82sYc4Opji41Up6FvKl+
         NNEVbtjj4GCbK3GSQIoUuTrEbqIp/N6UpUqTikn//2YugkLGeIBuVzy57B2gFdsS+FT4
         CKYxbQ3jyEjxWtekzo6CwQ4q1XR/pDL4e1WDBjaDkdg9GpBS9X+IK/sqaOL9X7mLlOA9
         DZLD+VR4LRFstXKeJanAb3UfKHGw96qxQUpWHdcNi32tN8x0SiEXbv/Q40S38qx6RZq3
         xN/w==
X-Gm-Message-State: AOAM531y2VpgZIOZSTaKzY1XmW5SF0KC7Q2p98JyW5I6DdihxnUupDVk
        a1pOk/3wPaGBSvqyIKPM5Hamm9eKXaKrz18W1GXeWDAkj3r6U81idC3ojx05Qs9RwolnzcgF5iT
        napRagVtfvhIZWnhMRk5A
X-Received: by 2002:a17:906:1408:: with SMTP id p8mr11564726ejc.89.1617902043273;
        Thu, 08 Apr 2021 10:14:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZMV8wr4q2RutqkZs9uxRr7Wx3PDsx+PLq+1xUrYkBTv5/1jYiwCaF91de078N5M1yoJrRng==
X-Received: by 2002:a17:906:1408:: with SMTP id p8mr11564703ejc.89.1617902043083;
        Thu, 08 Apr 2021 10:14:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a9sm17867129eds.33.2021.04.08.10.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 10:14:02 -0700 (PDT)
Subject: Re: [PATCH 1/1] usb: typec: tcpm: remove unused static variable
 'tcpm_altmode_ops'
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Zhen Lei <thunder.leizhen@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210407091540.2815-1-thunder.leizhen@huawei.com>
 <YG6+mfqIc15rc9H1@kuha.fi.intel.com>
 <aa30675b-a487-a605-7dae-4b9c18ad11e0@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8e3ae637-dc52-3285-2862-bee36e1dca14@redhat.com>
Date:   Thu, 8 Apr 2021 19:14:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <aa30675b-a487-a605-7dae-4b9c18ad11e0@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/8/21 3:55 PM, Guenter Roeck wrote:
> On 4/8/21 1:28 AM, Heikki Krogerus wrote:
>> On Wed, Apr 07, 2021 at 05:15:40PM +0800, Zhen Lei wrote:
>>> Fixes the following W=1 kernel build warning:
>>>
>>> drivers/usb/typec/tcpm/tcpm.c:2107:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
>>>
>>> The reference to the variable 'tcpm_altmode_ops' is deleted by the
>>> commit a079973f462a ("usb: typec: tcpm: Remove tcpc_config configuration
>>> mechanism").
>>>
>>> By the way, the static functions referenced only by the variable
>>> 'tcpm_altmode_ops' are deleted accordingly.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>
>> Oh, I thought this was already fixed. Should this go into the stable
>> trees as well?
>>
> 
> I thought there was some code supposed to be coming which would make use of it,
> but my memory may defeat me.

There is code coming which uses this; and this is necessary to make
DP altmode work on some devices.

I have dropped the ball a bit on posting a v2 of my series using this.

I'll prepare a v2 of my series, addressing Heikki's review comments
to my v1 right away. I'll post a v2 at the latest tomorrow.

This is something which is on my TODO list anyways and this way we will
save some churn with these functions going away only to be re-introduced
again relatively soon after they were removed.

Regards,

Hans


> Either case, it is getting old. It it is ever needed,
> it can be reintroduced.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter
> 
>> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>>> ---
>>>  drivers/usb/typec/tcpm/tcpm.c | 60 -------------------------------------------
>>>  1 file changed, 60 deletions(-)
>>>
>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>> index ce7af398c7c1c1f..2f89bae29c0c297 100644
>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>> @@ -1365,14 +1365,6 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
>>>  	mod_vdm_delayed_work(port, 0);
>>>  }
>>>  
>>> -static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
>>> -				    const u32 *data, int cnt)
>>> -{
>>> -	mutex_lock(&port->lock);
>>> -	tcpm_queue_vdm(port, header, data, cnt);
>>> -	mutex_unlock(&port->lock);
>>> -}
>>> -
>>>  static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
>>>  {
>>>  	u32 vdo = p[VDO_INDEX_IDH];
>>> @@ -1705,8 +1697,6 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
>>>  	 *
>>>  	 * And we also have this ordering:
>>>  	 * 1. alt-mode driver takes the alt-mode's lock
>>> -	 * 2. alt-mode driver calls tcpm_altmode_enter which takes the
>>> -	 *    tcpm port lock
>>>  	 *
>>>  	 * Dropping our lock here avoids this.
>>>  	 */
>>> @@ -2060,56 +2050,6 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
>>>  	return 0;
>>>  }
>>>  
>>> -static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
>>> -{
>>> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>>> -	int svdm_version;
>>> -	u32 header;
>>> -
>>> -	svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
>>> -	if (svdm_version < 0)
>>> -		return svdm_version;
>>> -
>>> -	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
>>> -	header |= VDO_OPOS(altmode->mode);
>>> -
>>> -	tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0);
>>> -	return 0;
>>> -}
>>> -
>>> -static int tcpm_altmode_exit(struct typec_altmode *altmode)
>>> -{
>>> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>>> -	int svdm_version;
>>> -	u32 header;
>>> -
>>> -	svdm_version = typec_get_negotiated_svdm_version(port->typec_port);
>>> -	if (svdm_version < 0)
>>> -		return svdm_version;
>>> -
>>> -	header = VDO(altmode->svid, 1, svdm_version, CMD_EXIT_MODE);
>>> -	header |= VDO_OPOS(altmode->mode);
>>> -
>>> -	tcpm_queue_vdm_unlocked(port, header, NULL, 0);
>>> -	return 0;
>>> -}
>>> -
>>> -static int tcpm_altmode_vdm(struct typec_altmode *altmode,
>>> -			    u32 header, const u32 *data, int count)
>>> -{
>>> -	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
>>> -
>>> -	tcpm_queue_vdm_unlocked(port, header, data, count - 1);
>>> -
>>> -	return 0;
>>> -}
>>> -
>>> -static const struct typec_altmode_ops tcpm_altmode_ops = {
>>> -	.enter = tcpm_altmode_enter,
>>> -	.exit = tcpm_altmode_exit,
>>> -	.vdm = tcpm_altmode_vdm,
>>> -};
>>> -
>>>  /*
>>>   * PD (data, control) command handling functions
>>>   */
>>> -- 
>>> 1.8.3
>>>
>>
> 
> 

