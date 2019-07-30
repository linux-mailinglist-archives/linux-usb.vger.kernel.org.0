Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 294607A98B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jul 2019 15:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfG3N2z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jul 2019 09:28:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42617 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfG3N2z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jul 2019 09:28:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so29837373pff.9;
        Tue, 30 Jul 2019 06:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3TCazDgar7kzrWDfaJ/SvNyVqEI0BptwG+QBAYkIWoI=;
        b=QOlFFV10FvPTu13MZHW4vbvP28axPG5jvrGKqlZf9a76uybOUqKBiCrslrNU7AfwxC
         H97Y8/jHVb7Gk8hcXNZiwDiFPj1Nz9mwmSpbDOoVgVH/Ug000+zkMTpsCETE09unWUdS
         Q6ypThiyZYbUjIkTRipPwcHWO7Kj0k+v0WXvD3NkiOy8P7eqAkfTjSazehJQ2VAJAFj0
         aGSA0DB6ePH/0CML+iTRLI35Cv+kT1t/MYHTj1+r8DAwS3gm2bC9++gq8ww9om57daTk
         TyLiOuZf/RtOUhIJSlqCW31ou7Uuvzn2YMuGbjNXyx1oo5OlKS+9r3LjqDnjtIv1XR9k
         d24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3TCazDgar7kzrWDfaJ/SvNyVqEI0BptwG+QBAYkIWoI=;
        b=kDSsxJkhonnlCXW0PbXaKdjUEftYg50vwHDo7BIRB+hn9ZlmWFcDIWh0LxmmtLuMhG
         dTgCQYwY2IVg//t0tQuyrRWJ16lx6uomjPF1FKvVsEy+pbCodDYOz07jDAIWWUD52Doz
         4yRWOXhZ/xCV7IptDPTziKmwGt8AoDACC5E9Q9IYK3kptZZ2xjFzuQdNQbAWKywaeo1c
         32IY46Jd7p+qKhCkT8mScJ1k8N72s2LnR1ixDP+PFVVXB55+HDQ2dzqY/4kEQOjgMF2z
         4DfGxdJvvdQKByFBWd5CWdVEmZb5QkvzUephp9GGPkO9bnzTUHW87M6pdjR0WeWrAFxX
         fp3Q==
X-Gm-Message-State: APjAAAUcon7j/gjcsCxddgDfRA+lBjbNv3EhV1jCjHcuT8edhlP6CF2q
        kJ19eLuDX/1TvTz6wlGSbIzYnNXP
X-Google-Smtp-Source: APXvYqwpDkh8n5pQNxMvEPEnKNGzp/Dd+2rP4CVJRlWQ/48oQNXcqEC1g+DssoEeCm2lwTCofo+UBA==
X-Received: by 2002:a65:6114:: with SMTP id z20mr110727777pgu.141.1564493333919;
        Tue, 30 Jul 2019 06:28:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p20sm102368133pgj.47.2019.07.30.06.28.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 06:28:53 -0700 (PDT)
Subject: Re: [RFC PATCH] usb: typec: tcpm: Ignore unsupported/unknown
 alternate mode requests
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Douglas Gilbert <dgilbert@interlog.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1564029037-22929-1-git-send-email-linux@roeck-us.net>
 <20190729140457.GC28600@kuha.fi.intel.com>
 <20190729173104.GA32556@roeck-us.net>
 <20190730120747.GL28600@kuha.fi.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a14d8a51-85f6-65d8-2e1e-19538a7bf3d3@roeck-us.net>
Date:   Tue, 30 Jul 2019 06:28:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730120747.GL28600@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/30/19 5:07 AM, Heikki Krogerus wrote:
> On Mon, Jul 29, 2019 at 10:31:04AM -0700, Guenter Roeck wrote:
>> On Mon, Jul 29, 2019 at 05:04:57PM +0300, Heikki Krogerus wrote:
>>> Hi,
>>>
>>> On Wed, Jul 24, 2019 at 09:30:37PM -0700, Guenter Roeck wrote:
>>>> TCPM may receive PD messages associated with unknown or unsupported
>>>> alternate modes. If that happens, calls to typec_match_altmode()
>>>> will return NULL. The tcpm code does not currently take this into
>>>> account. This results in crashes.
>>>>
>>>> Unable to handle kernel NULL pointer dereference at virtual address 000001f0
>>>> pgd = 41dad9a1
>>>> [000001f0] *pgd=00000000
>>>> Internal error: Oops: 5 [#1] THUMB2
>>>> Modules linked in: tcpci tcpm
>>>> CPU: 0 PID: 2338 Comm: kworker/u2:0 Not tainted 5.1.18-sama5-armv7-r2 #6
>>>> Hardware name: Atmel SAMA5
>>>> Workqueue: 2-0050 tcpm_pd_rx_handler [tcpm]
>>>> PC is at typec_altmode_attention+0x0/0x14
>>>> LR is at tcpm_pd_rx_handler+0xa3b/0xda0 [tcpm]
>>>> ...
>>>> [<c03fbee8>] (typec_altmode_attention) from [<bf8030fb>]
>>>> 				(tcpm_pd_rx_handler+0xa3b/0xda0 [tcpm])
>>>> [<bf8030fb>] (tcpm_pd_rx_handler [tcpm]) from [<c012082b>]
>>>> 				(process_one_work+0x123/0x2a8)
>>>> [<c012082b>] (process_one_work) from [<c0120a6d>]
>>>> 				(worker_thread+0xbd/0x3b0)
>>>> [<c0120a6d>] (worker_thread) from [<c012431f>] (kthread+0xcf/0xf4)
>>>> [<c012431f>] (kthread) from [<c01010f9>] (ret_from_fork+0x11/0x38)
>>>>
>>>> Ignore PD messages if the asociated alternate mode is not supported.
>>>>
>>>> Reported-by: Douglas Gilbert <dgilbert@interlog.com>
>>>> Cc: Douglas Gilbert <dgilbert@interlog.com>
>>>> Fixes: e9576fe8e605c ("usb: typec: tcpm: Support for Alternate Modes")
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>> ---
>>>> Taking a stab at the problem. I don't really know if this is the correct
>>>> fix, or even if my understanding of the problem is correct, thus marking
>>>> the patch as RFC.
>>>
>>> My guess is that typec_match_altmode() is the real culprit. We can't
>>> rely on the partner mode index number when identifying the port alt
>>> mode.
>>>
>>> Douglas, can you test the attached hack instead of this patch?
>>>
>>>
>>> thanks,
>>>
>>> -- 
>>> heikki
>>
>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>> index ec525811a9eb..033dc097ba83 100644
>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>> @@ -1067,12 +1067,11 @@ static int tcpm_pd_svdm(struct tcpm_port *port, const __le32 *payload, int cnt,
>>>   
>>>   	modep = &port->mode_data;
>>>   
>>> -	adev = typec_match_altmode(port->port_altmode, ALTMODE_DISCOVERY_MAX,
>>> -				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>>> -
>>>   	pdev = typec_match_altmode(port->partner_altmode, ALTMODE_DISCOVERY_MAX,
>>>   				   PD_VDO_VID(p[0]), PD_VDO_OPOS(p[0]));
>>>   
>>> +	adev = (void *)typec_altmode_get_partner(pdev);
>>> +
>>
>> I understand that typec_altmode_get_partner() returns a const *;
>> maybe adev should be declared as const struct typec_altmode *
>> instead of using a typecast.
> 
> Yes...
> 
>> Also, typec_altmode_get_partner() can return NULL as well if pdev is NULL.
>> Is it guaranteed that typec_match_altmode() never returns NULL for pdev ?
> 
> ...and probable no. But I don't think we can receive Attention to a
> mode that hasn't been entered.
> 

If I understand correctly, the Attention was generated by a test system.
What prevents badly implemented code in the connected system from sending
such an Attention message ?

Thanks,
Guenter
