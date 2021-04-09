Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28FB359F40
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 14:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbhDIMuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 08:50:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46591 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234077AbhDIMtW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 08:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617972549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9lsqhN6BRgkW8I6u0LYXKeTIFdu+3s7dAG4C628z2p0=;
        b=D9nseGl7jMpA38FvEznlmY7kpLeF7x6EMBmQ9EDK4cKHZbB8+0igUBqq9e/ovv9Vr6vucd
        gLyRcI3seDTVciPoEpuw/KYfXyGv+tEDH0LmfkmghIl844GoM96ZNxGFcBw9AePqEY5DFI
        mdYjEwA+iINJB7bakh1R5KUrjpxUW9o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-bJIHoujQMiaKdrzNkLftYw-1; Fri, 09 Apr 2021 08:49:07 -0400
X-MC-Unique: bJIHoujQMiaKdrzNkLftYw-1
Received: by mail-ed1-f69.google.com with SMTP id f9so2598736edd.13
        for <linux-usb@vger.kernel.org>; Fri, 09 Apr 2021 05:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9lsqhN6BRgkW8I6u0LYXKeTIFdu+3s7dAG4C628z2p0=;
        b=gyZz9OXcyexVwZa+S59SlkpTIyjVKJGDGswsAVFCBb5kgATQ5odpY2bcBv0JmMmCBi
         J+oNnnJU1WDqZL4TT1gFIs6hb/CsZGWucFjY7viDdK2OAByJd142RY4IUt+Mb5DZzCvu
         cjQy8gw/FmwoEzCAQScXZT8Do2vUbh+C6VfDlD/0qqRmMK0MmQ6D0FxNzMSf/nQOPTav
         0uNMc5i7HZKod0qUZQy4V64F0PYw10bLbuYjz55gfonIR8WYM8v3c+HBuJhg/oRTFoeq
         L5kkK3I6+5L2kiQKOsZAlCLbjJ5/cuVE+yySLo81PmqsLyKCBDa7ebhr6Xa+LecoUgPt
         MrhA==
X-Gm-Message-State: AOAM531JtnCqnY2qvXZvrWnuP8KuFvBQ/vQ8sba7RRwUuh8YNF0vYur0
        3OyIUZqgNNfoNwUBhMYz9M9H+kxNNmj9P87UFDarZZ2gQZ+IsBrCierfN5lXnrIKV3uU7v2QptV
        fiQkV5bGb7kT9z+YSEuZlcoU3TUO5+hLkr0RLOHQhw9xJwzK3AC4nEcBGGzZ7atfiTYmJRCKw
X-Received: by 2002:a17:906:2a0f:: with SMTP id j15mr13640263eje.159.1617972546245;
        Fri, 09 Apr 2021 05:49:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUYsKaJP+ybXclVsg9P1cLhsjq8sMp6aoUXuV3Lkv8o+g7cuUgla+qvnTnEpDwOchmfvYqaw==
X-Received: by 2002:a17:906:2a0f:: with SMTP id j15mr13640246eje.159.1617972546041;
        Fri, 09 Apr 2021 05:49:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hd8sm1183569ejc.92.2021.04.09.05.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 05:49:05 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
References: <20210408203129.526604-1-hdegoede@redhat.com>
 <20210408203129.526604-2-hdegoede@redhat.com>
 <YHAyah2n+yKnAT7d@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d2f809ef-9e9f-ed00-f8f1-acb4d75a786a@redhat.com>
Date:   Fri, 9 Apr 2021 14:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YHAyah2n+yKnAT7d@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/9/21 12:54 PM, Heikki Krogerus wrote:
> Hi Hans,
> 
> On Thu, Apr 08, 2021 at 10:31:27PM +0200, Hans de Goede wrote:
>> This can be used by Type-C controller drivers which use a standard
>> usb-connector fwnode, with altmodes sub-node, to describe the available
>> altmodes.
>>
>> Note there are is no devicetree bindings documentation for the altmodes
>> node, this is deliberate. ATM the fwnodes used to register the altmodes
>> are only used internally to pass platform info from a drivers/platform/x86
>> driver to the type-c subsystem.
>>
>> When a devicetree user of this functionally comes up and the dt-bindings
>> have been hashed out the internal use can be adjusted to match the
>> dt-bindings.
>>
>> Currently the typec_port_register_altmodes_from_fwnode() function expects
>> an "altmodes" child fwnode on port->dev with this "altmodes" fwnode having
>> child fwnodes itself with each child containing 2 integer properties:
>>
>> 1. A "svid" property, which sets the id of the altmode, e.g. displayport
>> altmode has a svid of 0xff01.
>>
>> 2. A "vdo" property, typically used as a bitmask describing the
>> capabilities of the altmode, the bits in the vdo are specified in the
>> specification of the altmode.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Drop the unnecessary fwnode parameter from
>>   typec_port_register_altmodes_from_fwnode()
>> - Document the expected "altmodes" fwnode in the commit message for now
>>   as v2 of the patch-set drops the dt-bindings since there are not DT
>>   users for this yet
>> ---
>>  drivers/usb/typec/class.c | 55 +++++++++++++++++++++++++++++++++++++++
>>  include/linux/usb/typec.h |  6 +++++
>>  2 files changed, 61 insertions(+)
>>
>> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
>> index 45f0bf65e9ab..a82344fe1650 100644
>> --- a/drivers/usb/typec/class.c
>> +++ b/drivers/usb/typec/class.c
>> @@ -1978,6 +1978,61 @@ typec_port_register_altmode(struct typec_port *port,
>>  }
>>  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
>>  
>> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
>> +	const struct typec_altmode_ops *ops, void *drvdata,
>> +	struct typec_altmode **altmodes, size_t n)
> 
> Couldn't we just call this typec_port_register_altmodes()?

Ack, will fix for v3.

>> +{
>> +	struct fwnode_handle *altmodes_node, *child;
>> +	struct typec_altmode_desc desc;
>> +	struct typec_altmode *alt;
>> +	size_t index = 0;
>> +	u32 svid, vdo;
>> +	int ret;
>> +
>> +	altmodes_node = device_get_named_child_node(&port->dev, "altmodes");
>> +	if (!altmodes_node)
>> +		return; /* No altmodes specified */
>> +
>> +	child = NULL;
>> +	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
> 
> fwnode_for_each_child_node()?

Ack, will fix for v3.

> 
>> +		ret = fwnode_property_read_u32(child, "svid", &svid);
>> +		if (ret) {
>> +			dev_err(&port->dev, "Error reading svid for altmode %s\n",
>> +				fwnode_get_name(child));
>> +			continue;
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
>> +		}
>> +
>> +		alt->ops = ops;
>> +		typec_altmode_set_drvdata(alt, drvdata);
>> +		altmodes[index] = alt;
>> +		index++;
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(typec_port_register_altmodes_from_fwnode);
> 
> This is OK by me, but I've been wondering if it would be more clear to
> just have a function fwnode_for_each_altmode() (I don't know if the
> name is good enough).
> 
> int fwnode_for_each_altmode(struct fwnode_handle *fwnode,
>                             int (*fn)(struct typec_altmode_desc *, void *),
>                             void *data)
> {
>         struct fwnode_handle *altmodes_node, *child;
>         struct typec_altmode_desc desc;
> 	u32 svid, vdo;
> 	int ret;
> 
> 	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
> 	if (!altmodes_node)
> 		return 0; /* No altmodes specified */
> 
>         fwnode_for_each_child_node(altmodes_node, child) {
>                 ...
>                 /* read the properties */
>                 ...
> 
> 		desc.svid = svid;
> 		desc.vdo = vdo;
> 		desc.mode = index + 1;
> 
>                 /* We need to add this member to struct typec_altmode_desc! */
>                 desc.fwnode = client;
> 
>                 ret = fn(&desc, data);
>                 if (ret)
>                         return ret;
>         }
> 
>         return 0;
> }
> 
> Something like that. It would leave the registration of the alternate
> modes to the drivers, which I think would actually be better.
> 
> If there ever is need, this can be also used for other things besides
> mode registration.
> 
> What do you think?

I think adding such a helper might make sense once we actually have
a need for the doing "other things" for all altmodes in a fwnode beside
registering them.

And even then I think it would still make sense to have a
typec_port_register_altmodes() helper for drivers to use, but that
could then be a wrapper around fwnode_for_each_altmode().

Since ATM we have only 1 user for a fwnode_for_each_altmode()
helper adding it now seems premature to me.

But if you have a strong preference for adding it now, then I can
do that for v3.

If you let me know which way you want to go on this, then I'll
prepare a v3.

Regards,

Hans

