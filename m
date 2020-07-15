Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F1B2216D8
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 23:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgGOVOM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 17:14:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40646 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725917AbgGOVOL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 17:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594847648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Kpv1zOkxbhnG32cADERhaysVLD6xZDL8mTz6Ngsn82E=;
        b=iE6nscc580T27Awh1yMTb9puWxbvcNskvymt8/prBv7HjNEQxbb5dmtA7YT8eJ9E8bM5Yn
        HZGd7J/wirngsY7/HDcQcMsoy4b26EQFoUKfwbCO2PqmKcvVDy2+8NFUtTA8Hcs5TvZmCM
        d4bDR9rQ1DIYriEr/242FPPvXy8Wm/s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-T4z4dJ2_O2CVZyPDTEsQnw-1; Wed, 15 Jul 2020 17:14:06 -0400
X-MC-Unique: T4z4dJ2_O2CVZyPDTEsQnw-1
Received: by mail-wr1-f69.google.com with SMTP id f5so2585429wrv.22
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 14:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kpv1zOkxbhnG32cADERhaysVLD6xZDL8mTz6Ngsn82E=;
        b=GkEshqzvGu1Wzvq6wPPvfLo73f5RYsdgB0VQjvnq81nUNK8ehaRwHEeMBl51WkAFzL
         +tQznqMOAAiw2XZpg5+m62cj83kJuacpR90jwWuj0KfdEyRALc5M1GqNOhiVfv+Q54al
         m3L6Le5/KA3lcuPwZtV4NRUldh09CoDIg6sqSUAEA2Fq9wTozmVBCRfTxarjmo3qedTx
         Xoy2c8RrOngeyXDisI1PYTm+jsmVThAamDkPqVaEY4EtGqeNGXnqROkFmzV8n/kgfulB
         IBS/aKmJpyca/XytDtCwR+qxtUPKfX1AsqvCwlRHL6A9+GMtBG9mavcZarL8TGnIPHkh
         AIkg==
X-Gm-Message-State: AOAM5337PVqzsrMtBlGb8E4oWChfpkDgw3rxV4GjjP4rJ2xmlujDRs1M
        BL7hYW2bBmlkgyR8J1XpWg3NXmMhWASTjNUXtf4UxuZ2aqDaAuLQlBRXoOmb3yZIxwG936nvmyF
        rrwkzfi8kxOVayEki3mmc
X-Received: by 2002:a1c:2e57:: with SMTP id u84mr1507924wmu.52.1594847645135;
        Wed, 15 Jul 2020 14:14:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhoB3/Oak3Tm8Z2CQLtbr5DW1S+lRGQnck32qB/SkrBdvAtiCxeDB+LbnHPgIOfOmEWx2gAw==
X-Received: by 2002:a1c:2e57:: with SMTP id u84mr1507890wmu.52.1594847644795;
        Wed, 15 Jul 2020 14:14:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q3sm4723118wmq.22.2020.07.15.14.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:14:04 -0700 (PDT)
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
To:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tobias Schramm <t.schramm@manjaro.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-3-hdegoede@redhat.com>
 <38a0c13d-fd78-9e67-91c8-4b86c437593e@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9d1a2929-6fea-f035-6413-57cf55d1562a@redhat.com>
Date:   Wed, 15 Jul 2020 23:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <38a0c13d-fd78-9e67-91c8-4b86c437593e@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Guenter,

Thank you for all the reviews.

On 7/15/20 6:39 PM, Guenter Roeck wrote:
> On 7/14/20 4:36 AM, Hans de Goede wrote:
>> This can be used by Type-C controller drivers which use a standard
>> usb-connector fwnode, with altmodes sub-node, to describe the available
>> altmodes.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/usb/typec/class.c | 56 +++++++++++++++++++++++++++++++++++++++
>>   include/linux/usb/typec.h |  7 +++++
>>   2 files changed, 63 insertions(+)
>>
>> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
>> index c9234748537a..47de2b2e3d54 100644
>> --- a/drivers/usb/typec/class.c
>> +++ b/drivers/usb/typec/class.c
>> @@ -1607,6 +1607,62 @@ typec_port_register_altmode(struct typec_port *port,
>>   }
>>   EXPORT_SYMBOL_GPL(typec_port_register_altmode);
>>   
>> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
>> +	const struct typec_altmode_ops *ops, void *drvdata,
>> +	struct typec_altmode **altmodes, size_t n,
>> +	struct fwnode_handle *fwnode)
>> +{
>> +	struct fwnode_handle *altmodes_node, *child;
>> +	struct typec_altmode_desc desc;
>> +	struct typec_altmode *alt;
>> +	size_t index = 0;
>> +	u32 svid, vdo;
>> +	int ret;
>> +
>> +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
>> +	if (!altmodes_node)
>> +		return;
>> +
>> +	child = NULL;
>> +	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
>> +		ret = fwnode_property_read_u32(child, "svid", &svid);
>> +		if (ret) {
>> +			dev_err(&port->dev, "Error reading svid for altmode %s\n",
>> +				fwnode_get_name(child));
>> +			continue;
> 
> The properties are mandatory. I think the errors should not be ignored.

I have done this this way deliberately, let me try to explain:

We basically have 2 choices here:

1) Log an error and continue, skipping/ignoring the faulty altmode fw-child-node
2) Make the error fatal, rollback all changes made so far and return an error
to our caller

First of all, these errors should never happen and if they do happen then the
person adding the new alt-mode to the dt, will presumably test that this alt-mode
works, sees that it does not, check the logs and know why. So for stable shipping
kernels I would expect to never hit this path.

Secondly even if we somehow do hit this path in a stable shipping kernel, then
what should our caller do if we return an error? Our caller basically has 2 choices:

1. Log and otherwise ignore the error
2. Completely abort the registration of the Type-C controller, possibly breaking
things like USB over the port, charging, etc.

2. Seems rather drastic and is not necessary, except for the alt-modes all the
other functionality of the port will work fine if the call fails. So our caller
should probably choose 1. as error handling strategy. If it does that, then for
the error logging it can rely on typec_port_register_altmodes_from_fwnode() having
already logged an error, so it can just treat it as returning void.

But if our caller does not care, would it then not be better to just ignore
any bad alt-mode child nodes and still try to register an alt-mode for the
good ones?

Thirdly adding code to unwind the registration of the alt-modes done so far
+ adding code to our caller to abort the port registration would be adding a
bunch of extra, fragile code for something which should (and likely will)
never happen. So we ware adding a bunch of code here which in essence is
pretty much never tested and thus is almost assured to either be broken
from day 1, or to become broken over time.

The kernel is likely full of error handling paths with bugs because it is
trying to handle errors which never happen. Sometimes this is necessary
because e.g. a driver's probe function cannot continue without acquiring
a certain resource. But in this case we can easily avoid the broken error
handling code syndrome; and keep the code nice and simple, by just skipping
over broken nodes.

> 
>> +		}
>> +
>> +		ret = fwnode_property_read_u32(child, "vdo", &vdo);
>> +		if (ret) {
>> +			dev_err(&port->dev, "Error reading vdo for altmode %s\n",
>> +				fwnode_get_name(child));
>> +			continue;
>> +		}
>> +
>> +		if (index >= n) {
>> +			dev_err(&port->dev, "Error not enough space for altmode %s\n",
>> +				fwnode_get_name(child));
>> +			continue;
> 
> Seems to be pointless to continue here.

Continuing here makes sure that if the dts contains 10 alt-modes and n = 8 that we print
an error for both alt-modes which we are not registering because there is not enough space
in the passed in array for storing alt-mode pointers.

It also ensures that we error check any further nodes for missing svid/vdo properties.


> 
>> +		}
>> +
>> +		desc.svid = svid;
>> +		desc.vdo = vdo;
>> +		desc.mode = index + 1;
>> +		alt = typec_port_register_altmode(port, &desc);
>> +		if (IS_ERR(alt)) {
>> +			dev_err(&port->dev, "Error registering altmode %s\n",
>> +				fwnode_get_name(child));
>> +			continue;
> 
> Maybe there is a reason to ignore all those errors. If so,
> that should be explained.

See above, note this is another error which should never happen, I think
this can only happen in case of -ENOMEM, which itself can only happen
for allocations of an order greater then n=2 AFAIK, and I don't think
typec_port_register_altmode() does any such allocations.

I guess some comment here is warranted, but my full explanation above
is way too long. So maybe a simple comment like this?  :

			/* Should never happen, keep the error handling as simple as possible */

Regards,

Hans


> 
>> +		}
>> +
>> +		alt->ops = ops;
>> +		typec_altmode_set_drvdata(alt, drvdata);
>> +		altmodes[index] = alt;
>> +		index++;
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(typec_port_register_altmodes_from_fwnode);
>> +
>>   /**
>>    * typec_register_port - Register a USB Type-C Port
>>    * @parent: Parent device
>> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
>> index 5daa1c49761c..fbe4bccb3a98 100644
>> --- a/include/linux/usb/typec.h
>> +++ b/include/linux/usb/typec.h
>> @@ -17,6 +17,7 @@ struct typec_partner;
>>   struct typec_cable;
>>   struct typec_plug;
>>   struct typec_port;
>> +struct typec_altmode_ops;
>>   
>>   struct fwnode_handle;
>>   struct device;
>> @@ -121,6 +122,12 @@ struct typec_altmode
>>   struct typec_altmode
>>   *typec_port_register_altmode(struct typec_port *port,
>>   			     const struct typec_altmode_desc *desc);
>> +
>> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
>> +	const struct typec_altmode_ops *ops, void *drvdata,
>> +	struct typec_altmode **altmodes, size_t n,
>> +	struct fwnode_handle *fwnode);
>> +
>>   void typec_unregister_altmode(struct typec_altmode *altmode);
>>   
>>   struct typec_port *typec_altmode2port(struct typec_altmode *alt);
>>
> 

