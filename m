Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1393216F37
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 04:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfEHCtW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 22:49:22 -0400
Received: from node.akkea.ca ([192.155.83.177]:46368 "EHLO node.akkea.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbfEHCtW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 May 2019 22:49:22 -0400
Received: by node.akkea.ca (Postfix, from userid 33)
        id 3C76E4E204B; Wed,  8 May 2019 02:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
        t=1557283762; bh=+WUVgJTWDiI4MUYrOQzPqfMp8FfR2cyfkf1EPXrBe6A=;
        h=To:Subject:Date:From:Cc:In-Reply-To:References;
        b=VRluUhmGBMhZFquE0VkrQIINncPc896WwNEFdh9UYiM0NlP63en/HdfN/2EzXuNVq
         51cz0zavea8JPrlTvByWoGoSlhclDKgjjR3L2bySX3pbn0ATLExg+dSlUMq0R2owzl
         fb2gjkj/Bm8SRaMCtTfuxrHIpFcDehthOnuWNgRE=
To:     Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/1] usb: typec: tcpci: Clear the fault status register
X-PHP-Originating-Script: 1000:rcube.php
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 07 May 2019 20:49:22 -0600
From:   Angus Ainslie <angus@akkea.ca>
Cc:     angus.ainslie@puri.sm,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <groeck7@gmail.com>
In-Reply-To: <aed487a4-3f7c-55e8-9c84-feaa1c7f583d@roeck-us.net>
References: <20190508002749.14816-1-angus@akkea.ca>
 <20190508002749.14816-2-angus@akkea.ca>
 <aed487a4-3f7c-55e8-9c84-feaa1c7f583d@roeck-us.net>
Message-ID: <3fd046562f3bea2cb85354f8d3c420fc@www.akkea.ca>
X-Sender: angus@akkea.ca
User-Agent: Roundcube Webmail/1.1.3
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2019-05-07 20:03, Guenter Roeck wrote:
> On 5/7/19 5:27 PM, Angus Ainslie (Purism) wrote:
>> If the fault status register doesn't get cleared then
>> the ptn5110 interrupt gets stuck on. As the fault register gets
>> set everytime the ptn5110 powers on the interrupt is always stuck.
>> 
>> Fixes: fault status register stuck
>> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
>> ---
>>   drivers/usb/typec/tcpm/tcpci.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>> 
>> diff --git a/drivers/usb/typec/tcpm/tcpci.c 
>> b/drivers/usb/typec/tcpm/tcpci.c
>> index c1f7073a56de..a5746657b190 100644
>> --- a/drivers/usb/typec/tcpm/tcpci.c
>> +++ b/drivers/usb/typec/tcpm/tcpci.c
>> @@ -463,6 +463,17 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>>   	else if (status & TCPC_ALERT_TX_FAILED)
>>   		tcpm_pd_transmit_complete(tcpci->port, TCPC_TX_FAILED);
>>   +	if (status & TCPC_ALERT_FAULT) {
> 
> Wait - the driver doesn't set TCPC_ALERT_FAULT in the alert mask
> register. How can the chip report it if fault alerts are not enabled ?

Well that I didn't check. But I know this code gets executed so 
something must be turning it on.

Also if I don't clear it I get an unlimited number of interrupts.

> What am I missing here ?

Can the power on fault be masked ?

Angus

> 
> Thanks,
> Guenter
> 
>> +		u16 fault_status;
>> +
>> +		tcpci_read16(tcpci, TCPC_FAULT_STATUS, &fault_status);
>> +
>> +		dev_warn(tcpci->dev, "FAULT ALERT status 0x%x\n", fault_status);
>> +
>> +		/* clear the fault status */
>> +		tcpci_write16(tcpci, TCPC_FAULT_STATUS, fault_status);
>> +	}
>> +
>>   	return IRQ_HANDLED;
>>   }
>>   EXPORT_SYMBOL_GPL(tcpci_irq);
>> 

