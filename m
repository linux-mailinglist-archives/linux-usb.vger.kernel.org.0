Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A355C240257
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 09:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgHJHTi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 03:19:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45599 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726472AbgHJHTg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 03:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597043973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IdPp+ky3+l0vsDUx1MEmcIdtmS3DI4hGyGGscVhnCXA=;
        b=jTIoUOZhFYL1H3a3rPj7qYH42WuoQ8kdoMyb1n9T/rGAg06J0Sei5k2RwXdu6dIOJ+gylP
        HxTI5KIu8J6SESQWigva3vh7eliVWbxrqKSL5+MIBtgN25jUpwKv7VXRU7/fK9rCYWjhOp
        pA4vk6M+nMJ3AfloqCM/h74SAQRx1oI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-qlHvDVmFOgiIIhlAEHFzOg-1; Mon, 10 Aug 2020 03:19:31 -0400
X-MC-Unique: qlHvDVmFOgiIIhlAEHFzOg-1
Received: by mail-ej1-f69.google.com with SMTP id l7so3496671ejr.7
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2020 00:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IdPp+ky3+l0vsDUx1MEmcIdtmS3DI4hGyGGscVhnCXA=;
        b=dTRxrq1gIHZHlU5CxGGc+JqayOvUxdMU4DFzfzd1AVyj8B9VVRY2WzCAPo7U3vbzMs
         iedsMBKoGOkPxe2m3fTwdUcKBoYu+0GC2NDfbO152eigDIHK4WiZul2aVcHu0D1FOZyE
         x6yvFnU2LSe6R+bP4n3WNl0/DGTUFOccJNvwioMsIY+DFser1160LJvRlxBfApbqZW8M
         9xiYe4D+ra+8ZHWfmb781iZFw/yxxZR9SCwlIQAoh8FxdhweLXXvFCn2TV6LsK3y4lwi
         iYQ0JEkPxQ4zy0QJEU8umL2Qq8EnxYshYiA0ECWhOhQDn+XDQIAPQFmp5K0Lg1AfOHut
         EHrQ==
X-Gm-Message-State: AOAM5301M8oF/kJBb+F22SXulmRrQ3Gya1L8/fhuEWZnYL+nx0DmpDfR
        M+7TR9y5Bc29KrQhjoEgj78bj8i+sKa8b4oqZxggkCeZdYUsQ/k72sHYAJaNqaAQFaWtDM+GvCJ
        3lKsZKYkKoQoqUnigpW0p
X-Received: by 2002:a17:906:198e:: with SMTP id g14mr20008151ejd.266.1597043969715;
        Mon, 10 Aug 2020 00:19:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLKBIb+PD1XhZu/ndFYc7QoSd0w8khDmgEo6fDLbZ20zyRucoNKIZnBD3zTeN8gtsxsMiimA==
X-Received: by 2002:a17:906:198e:: with SMTP id g14mr20008139ejd.266.1597043969449;
        Mon, 10 Aug 2020 00:19:29 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id sd8sm12500696ejb.58.2020.08.10.00.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 00:19:28 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <469f369a-73f4-c348-b9ee-1662956f45be@redhat.com>
Date:   Mon, 10 Aug 2020 09:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727130528.GB883641@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 7/27/20 3:05 PM, Heikki Krogerus wrote:
> Hi Hans,
> 
> On Tue, Jul 14, 2020 at 01:36:15PM +0200, Hans de Goede wrote:
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
> 
> Do we need that? Why not just make the sub-nodes describing the
> alternate modes direct children of the connector node instead of
> grouping them under a special sub-node?

If you envision how this will look in e.g. DTS sources then I think
you will see that this grouping keeps the DTS source code more
readable. Grouping things together like this is somewhat normal in
devicetree files. E.g. PMIC's or other regulator providers typical
have a "regulators" node grouping all their regulators; and also the OF
graph bindings which are used in the USB-connector node start with a
"ports" parent / grouping node.

> If the child node of the connector has device properties "svid" and
> "vdo" then it is an alt mode that the connector supports, and it can't
> be anything else, no?

If you want to get rid of the altmodes parent/grouping node, then the
usual way to do this would be to add a compatible string to the nodes,
rather then check for the existence of some properties.

Regards,

Hans


> 
> 
>> +	child = NULL;
>> +	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
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
>> -- 
>> 2.26.2
> 
> thanks,
> 

