Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620F621A041
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 14:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgGIMuy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 08:50:54 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49965 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726358AbgGIMux (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 08:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594299052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GIZJNhR3y6YBvemlqbwX1NqTLcp0fUoi5KbIF+Xun2c=;
        b=Qfe3RTMpVfwzWM/0VrqMDMs3XkzSowyxjV0yTO/RxJyYwOQ7Zb9MXO7jHv03PsvUffQc9M
        6Jvlgp2tWupNazcdGqpwK0L+9xxvLVNTbgnrfOw+qVEuLcf85/KkQEhMWwTQ1ufHC1HG+G
        0zf+mcxhvwTxImDdHDjjKAt4uY+Jrmw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-v4S5iva1PSC9h-nAu9RJ2w-1; Thu, 09 Jul 2020 08:50:50 -0400
X-MC-Unique: v4S5iva1PSC9h-nAu9RJ2w-1
Received: by mail-wr1-f70.google.com with SMTP id y13so1824840wrp.13
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2020 05:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GIZJNhR3y6YBvemlqbwX1NqTLcp0fUoi5KbIF+Xun2c=;
        b=bYqNX6XFQ/zvSaYzi+4Rq9V9LBthgQV5CYx12qJwaB1pvuSexd0WHzRiJfVAe/Mp/C
         3RO1PddHC+hE+WkfIwfw89zcjIyfZUE23i1xH2SrsadeT7BUdx+cVSUlXQlonXyQdKuo
         tSaXAvyGwK2MgpyS4Q/lkotrNkdYbtl/M/fTvuZrVNKCQl8bGWCk5z664O6IRdkJWcD6
         k3SUYDBa3gy53AvDsJnuoTscwNvesbpr9cGnFlpLCxUuC2SuongWBMCzn+bletBHQBMx
         Gki/R987Tq8rRA3eob7rVvG3qTo/5jongEQxOq+dn7PyJkh/XUJ35DgY3EVgKQ2si+Bq
         8m8g==
X-Gm-Message-State: AOAM533ssfMj4+pTE23hoTMBxa7zBpqnhnKfJnuhKHJ6P6UHzBqWcGtV
        1Fkv2CNowaMFy4Vq59SdTUVDevjj774s6U7CHGWHQ01vRjUvQApGHkBV4eRH7uY74vG+XFkMf4o
        NRNfbrnpjTxGDJDUo2Esq
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr68747918wrx.219.1594299049382;
        Thu, 09 Jul 2020 05:50:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfDlt5yj1fthXEpZsFA5pIqC91K5m6mxDJV0lfqUP1BqovE68y+kvuu/hf7T0uMxt1bbNXJg==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr68747899wrx.219.1594299049196;
        Thu, 09 Jul 2020 05:50:49 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id d81sm18218861wmc.0.2020.07.09.05.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 05:50:48 -0700 (PDT)
Subject: Re: [PATCH 08/32] usb: typec: tcpm: tcpm: Remove dangling unused
 'struct tcpm_altmode_ops'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20200706133341.476881-1-lee.jones@linaro.org>
 <20200706133341.476881-9-lee.jones@linaro.org>
 <ca14707c-7d40-07ac-da1d-ca27a2e93dcd@redhat.com>
 <20200706142051.GA3500@dell>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f2fdead0-9fac-dad3-5d76-41308d5c689d@redhat.com>
Date:   Thu, 9 Jul 2020 14:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706142051.GA3500@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/6/20 4:20 PM, Lee Jones wrote:
> On Mon, 06 Jul 2020, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 7/6/20 3:33 PM, Lee Jones wrote:
>>> Looks as though a079973f462a3 ("usb: typec: tcpm: Remove tcpc_config
>>> configuration mechanism") pulled out the only use of 'tcpm_altmode_ops'
>>> last year.  No need to keep it around.
>>>
>>> Fixes the following W=1 kernel build warning(s):
>>>
>>>    drivers/usb/typec/tcpm/tcpm.c:1551:39: warning: ‘tcpm_altmode_ops’ defined but not used [-Wunused-const-variable=]
>>>    1551 | static const struct typec_altmode_ops tcpm_altmode_ops = {
>>>    | ^~~~~~~~~~~~~~~~
>>>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
>>
>> This is necessary for adding Display port over Type-C support
>> on devices using the tcpm code, rather then firmware, to do
>> the Type-C alt-mode negotiation.
>>
>> I have a local patch in my tree which adds support for this.
>>
>> But Heikki did not like my approach, so that patch
>> (which needs the bits you are removing) never landed
>> upstream:
>>
>> https://patchwork.kernel.org/patch/11199517/
>>
>> Which is somewhat old now.
> 
> Yes, that's a just a little old now.
> 
> If it drags on for much longer, perhaps consider taking it out for the
> time being and adding it back when you start to make use of it again?
> 
>> Heikki said he would look into an approach to this more to
>> his liking. Heikki an progress on this area?

Just a little headsup that I'm making some time now to take a look
at solving this in the previously discussed better way, with the hope
of that we can get that upstream. So hopefully I will have some
patches for this ready during the upcoming weekend.

Regards,

Hans



