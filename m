Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B444E252EC7
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 14:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729775AbgHZMhk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 08:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43391 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729804AbgHZMhg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 08:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598445453;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TvR8v0su4OMzMVSB/yixZYEsywfRZmxxYBu5jZ0Of3I=;
        b=TRkDythY8Vs+hLC9jwGLVUYeZwJwIUpw1IR2w/SGMQeksrVl70LdBKS9C7klqpqDD2ILQR
        1xCbk6u32tFtCmtj8uBW50UEH83k36vgf6Jb9viMulOrKj+TvHuDuyfrdfhfroRyTt0wGY
        4LdkLACuhWaqCk8o0W0OP4HxV7WLOzk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-ClHa59WUM3q50_CQK0quRg-1; Wed, 26 Aug 2020 08:37:31 -0400
X-MC-Unique: ClHa59WUM3q50_CQK0quRg-1
Received: by mail-ed1-f71.google.com with SMTP id c3so619790edm.7
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 05:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TvR8v0su4OMzMVSB/yixZYEsywfRZmxxYBu5jZ0Of3I=;
        b=S2ydpYaxTt2XOQdlISCa+83It2ioSujoatMJeOCThwl61vRReyn2bvsjK9kdqVi6/I
         33Wuy9sRZ2IbrKyOCYbVmkaq4WJryjnu4+LMP7PGlHbnmOm1O4+HV02m77GsJ0cvp4/U
         eV7AYM5kuk7htgKA/tcZTfe2aYPpHVl4rB61AFUgx6RuZvSZcmWl+PY0KAR+DCgKCu8z
         ZaSYxIB0uUTb6WAJwqi11Sf+OrTyNg6zkLvVpaJrbdJcBY1RHSzEdHZKKusuJgANsx8Q
         hr9ixfn9nh8yiPR+Yu+lpD8QE7ZX3N3VEcrVRZ1jp6biZF/sYqVCgL5QWbOcstLfvHQS
         JmEQ==
X-Gm-Message-State: AOAM531MdZDaJKml7LdGulBI169kGdcOf5Dn8IvUzba7OOiWAl6D59al
        OAfCjeZq6EacFrnZz8OSev+QTsMtFtuxOaiONmQEgDM6SoWjzTf271QdGv5mxyiiblOVsgfkVD8
        cjOXC7VdpQ7RZCfQfD62E
X-Received: by 2002:a17:906:560d:: with SMTP id f13mr15707518ejq.102.1598445450443;
        Wed, 26 Aug 2020 05:37:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDjgyyZIy2FVJ+/HUqr3oyGBfPnoSEsacYGWUNqbSWtk7NIoX7BiufoWZ48gd/JdiU+a/Iww==
X-Received: by 2002:a17:906:560d:: with SMTP id f13mr15707486ejq.102.1598445450073;
        Wed, 26 Aug 2020 05:37:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d9sm1937309edt.20.2020.08.26.05.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 05:37:29 -0700 (PDT)
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-3-hdegoede@redhat.com>
 <20200727130528.GB883641@kuha.fi.intel.com>
 <469f369a-73f4-c348-b9ee-1662956f45be@redhat.com>
 <20200811143833.GC627773@kuha.fi.intel.com>
 <6c223f20-cf63-392e-f694-869cb231c46d@redhat.com>
 <20200812124955.GB1169992@kuha.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <38f09a2a-4c6c-69b0-a61d-a67d2dc79546@redhat.com>
Date:   Wed, 26 Aug 2020 14:37:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200812124955.GB1169992@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/12/20 2:49 PM, Heikki Krogerus wrote:
> On Wed, Aug 12, 2020 at 10:36:32AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 8/11/20 4:38 PM, Heikki Krogerus wrote:
>>> Hi,
>>>
>>>>>> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
>>>>>> +	const struct typec_altmode_ops *ops, void *drvdata,
>>>>>> +	struct typec_altmode **altmodes, size_t n,
>>>>>> +	struct fwnode_handle *fwnode)
>>>>>> +{
>>>>>> +	struct fwnode_handle *altmodes_node, *child;
>>>>>> +	struct typec_altmode_desc desc;
>>>>>> +	struct typec_altmode *alt;
>>>>>> +	size_t index = 0;
>>>>>> +	u32 svid, vdo;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
>>>>>> +	if (!altmodes_node)
>>>>>> +		return;
>>>>>
>>>>> Do we need that? Why not just make the sub-nodes describing the
>>>>> alternate modes direct children of the connector node instead of
>>>>> grouping them under a special sub-node?
>>>>
>>>> If you envision how this will look in e.g. DTS sources then I think
>>>> you will see that this grouping keeps the DTS source code more
>>>> readable. Grouping things together like this is somewhat normal in
>>>> devicetree files. E.g. PMIC's or other regulator providers typical
>>>> have a "regulators" node grouping all their regulators; and also the OF
>>>> graph bindings which are used in the USB-connector node start with a
>>>> "ports" parent / grouping node.
>>>>
>>>>> If the child node of the connector has device properties "svid" and
>>>>> "vdo" then it is an alt mode that the connector supports, and it can't
>>>>> be anything else, no?
>>>>
>>>> If you want to get rid of the altmodes parent/grouping node, then the
>>>> usual way to do this would be to add a compatible string to the nodes,
>>>> rather then check for the existence of some properties.
>>>
>>> I'm looking at this from ACPI PoW. We do not have compatible string in
>>> ACPI (and in case you are wondering, the _HID PRP0001 is not a
>>> reliable solution for that).
>>
>> Note my main use-case for this is the ACPI case too, remember the
>> infamous drivers/platform/x86/intel_cht_int33fe_typec.c that is my
>> main consumer for this patch. Although there the info is lacking in ACPI
>> so I need to inject it with c-code.
>>
>>> If you wish to group the altmodes under a subnode, then that's fine, but
>>> the "altmodes" node will need to be optional, just like the "ports"
>>> OF-graph node is optional. So we need to be able to support systems
>>> where the alternate mode subnodes are directly under the connector as
>>> well.
>>
>> So for the ports case, AFAIK not having a ports subnode to group them
>> is only used in the case there are no other type of subnodes.
>>
>> With the existing usb-connector devicetree-bindings we will have both
>> ports subnodes and altmode subnodes. The usb-connector devicetree-bindings
>> already specify that the port subnodes *must* be grouped together under
>> a single ports subnode (for usb-connector nodes).
>>
>> So it seems logical and much cleaner to me to also group the altmodes
>> together under an altmodes subnode. This also solves the problem of
>> having to due heuristics to tell different kinds of subnodes apart.
>>
>> Question: why do you write: "we need to be able to support systems
>> where the alternate mode subnodes are directly under the connector as
>> well" are there already systems out there (or on their way) which
>> contain ACPI table which contain a fwnode adhering to the usb-connector
>> bindings + having subnodes which set a svid + vdo ?
> 
> There are indeed platforms on their way, but I'll see if I can still
> influence what goes into the ACPI tables of those platforms.
> 
>> Because unless such systems already exist I don't see why we need to
>> be able to support them ?  New systems can use whatever scheme we
>> can come-up with and unless existing systems already have what we
>> need, except for the altmodes grouping node, then we will need some
>> translating code which generates the expected swnodes anyways and
>> then the translator can easily inject the grouping node.
>>
>> So I do not see why we would " need to be able to support systems
>> where the alternate mode subnodes are directly under the connector as
>> well" ?
>>
>> If you insist I can make the altmodes node optional and simply
>> skip any child nodes which do not have both a svid and a vdo
>> property, but having the subnode (and then logging an error on
>> missing svid or vdo props) seems cleaner to me.
> 
> I'm trying to get the way the USB Type-C connectors are described
> in ACPI (including the alternate modes) documented somewhere. I think
> I already mentioned that to you already. There is now a discussion
> with our Windows folks how to move forward with that. In any case,
> additional nodes like that "altmodes" node are really problematic in
> Windows because of way they handle the nodes, and to be honest, I
> don't see any way I could convince those guys to accept it.
> 
> But all that is really not your problem. I have now a feeling that the
> way we will end up describing the alternate modes in ACPI will not be
> compatible with DT :-(. So I guess we can just go ahead with this, and
> then add support for ACPI later?

So since you wrote "So I guess we can just go ahead with this" O was
wondering what the next steps are for getting this series (minus the
DT-binding patch) upstream ?

Regards,

Hans

