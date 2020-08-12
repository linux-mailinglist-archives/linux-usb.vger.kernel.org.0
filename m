Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6002426CF
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 10:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgHLIgj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 04:36:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58800 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726618AbgHLIgi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Aug 2020 04:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597221396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aU3HA05Op9nzcUSBykYGFF9yu8Zbve2PUKHl7lE6dBg=;
        b=aEDwLRH5yVAd0ytDUE9h/gxIU53dWUZuybs5hsKveHOFZVn+JE+kaBMUp3MS1/p1NYF+8f
        MinkmAbqHNR/awl2XyQr3I/I9TtyuT8neCAOIUk8SjsJA1trBvXTXBU3rMScXpDKTTiefh
        WEm/NsBe7rVk+5syVEdmhumn+fx40q8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-DIBlHvs8POyPiLbfPPy8sQ-1; Wed, 12 Aug 2020 04:36:35 -0400
X-MC-Unique: DIBlHvs8POyPiLbfPPy8sQ-1
Received: by mail-ed1-f70.google.com with SMTP id l5so566756eds.16
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2020 01:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aU3HA05Op9nzcUSBykYGFF9yu8Zbve2PUKHl7lE6dBg=;
        b=rwHXwcu3lTJnbMUUROc0e3EUeloM0hgRlKLq+Z4T70QW+fQ2a2+kLGXBIEsgkKCVyj
         UnzYPzyO7rPFoR9Xg0Y2HLJP99QS230URRZlGbo/FtfbQUA0rxzOinc0H53k4LBU+rRm
         bIcZEjDkL+kDv2mawqMDU3t0/kXmwJTntvatJHlKyxbafJMtjMznDFYwhn8c6ZQns+6d
         /5h6OoaYD4QT2j9mhtPl2Klhzi0Ch8m12vRYOo6itV0Jzv1L3ifQgdBjSw2OC1KfT2Wl
         b4+vdq8jYsXUk9APjc1KvFwHzoHLzY1OMKhnY16sPN1YvSq2pIt0//nlKwv4JOIUChbX
         GbMw==
X-Gm-Message-State: AOAM532GO9X/VOTBLL0ZK/x3Jvxp16VYohi9cAFuSuuueK0ggoyY+vL6
        KHHD1xzJtcsDhDef18aCsmAoFNaQSfaGFLphAKx1WY4gLjiQR3pf35O9lzY7K+PO/SUfRfsz19S
        NgVHXIVI1TQA86+RbzpIH
X-Received: by 2002:a05:6402:297:: with SMTP id l23mr30203803edv.145.1597221391966;
        Wed, 12 Aug 2020 01:36:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh/5kSwjj/FYRqmKuTksRnhIu5O95ZxYv36KmlTRtltj5MECUob6P2g/bPGbyE7hOrqnAwhg==
X-Received: by 2002:a05:6402:297:: with SMTP id l23mr30203784edv.145.1597221391741;
        Wed, 12 Aug 2020 01:36:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d2sm710992ejm.19.2020.08.12.01.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 01:36:30 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c223f20-cf63-392e-f694-869cb231c46d@redhat.com>
Date:   Wed, 12 Aug 2020 10:36:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811143833.GC627773@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 8/11/20 4:38 PM, Heikki Krogerus wrote:
> Hi,
> 
>>>> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
>>>> +	const struct typec_altmode_ops *ops, void *drvdata,
>>>> +	struct typec_altmode **altmodes, size_t n,
>>>> +	struct fwnode_handle *fwnode)
>>>> +{
>>>> +	struct fwnode_handle *altmodes_node, *child;
>>>> +	struct typec_altmode_desc desc;
>>>> +	struct typec_altmode *alt;
>>>> +	size_t index = 0;
>>>> +	u32 svid, vdo;
>>>> +	int ret;
>>>> +
>>>> +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
>>>> +	if (!altmodes_node)
>>>> +		return;
>>>
>>> Do we need that? Why not just make the sub-nodes describing the
>>> alternate modes direct children of the connector node instead of
>>> grouping them under a special sub-node?
>>
>> If you envision how this will look in e.g. DTS sources then I think
>> you will see that this grouping keeps the DTS source code more
>> readable. Grouping things together like this is somewhat normal in
>> devicetree files. E.g. PMIC's or other regulator providers typical
>> have a "regulators" node grouping all their regulators; and also the OF
>> graph bindings which are used in the USB-connector node start with a
>> "ports" parent / grouping node.
>>
>>> If the child node of the connector has device properties "svid" and
>>> "vdo" then it is an alt mode that the connector supports, and it can't
>>> be anything else, no?
>>
>> If you want to get rid of the altmodes parent/grouping node, then the
>> usual way to do this would be to add a compatible string to the nodes,
>> rather then check for the existence of some properties.
> 
> I'm looking at this from ACPI PoW. We do not have compatible string in
> ACPI (and in case you are wondering, the _HID PRP0001 is not a
> reliable solution for that).

Note my main use-case for this is the ACPI case too, remember the
infamous drivers/platform/x86/intel_cht_int33fe_typec.c that is my
main consumer for this patch. Although there the info is lacking in ACPI
so I need to inject it with c-code.

> If you wish to group the altmodes under a subnode, then that's fine, but
> the "altmodes" node will need to be optional, just like the "ports"
> OF-graph node is optional. So we need to be able to support systems
> where the alternate mode subnodes are directly under the connector as
> well.

So for the ports case, AFAIK not having a ports subnode to group them
is only used in the case there are no other type of subnodes.

With the existing usb-connector devicetree-bindings we will have both
ports subnodes and altmode subnodes. The usb-connector devicetree-bindings
already specify that the port subnodes *must* be grouped together under
a single ports subnode (for usb-connector nodes).

So it seems logical and much cleaner to me to also group the altmodes
together under an altmodes subnode. This also solves the problem of
having to due heuristics to tell different kinds of subnodes apart.

Question: why do you write: "we need to be able to support systems
where the alternate mode subnodes are directly under the connector as
well" are there already systems out there (or on their way) which
contain ACPI table which contain a fwnode adhering to the usb-connector
bindings + having subnodes which set a svid + vdo ?

Because unless such systems already exist I don't see why we need to
be able to support them ?  New systems can use whatever scheme we
can come-up with and unless existing systems already have what we
need, except for the altmodes grouping node, then we will need some
translating code which generates the expected swnodes anyways and
then the translator can easily inject the grouping node.

So I do not see why we would " need to be able to support systems
where the alternate mode subnodes are directly under the connector as
well" ?

If you insist I can make the altmodes node optional and simply
skip any child nodes which do not have both a svid and a vdo
property, but having the subnode (and then logging an error on
missing svid or vdo props) seems cleaner to me.

Regards,

Hans

