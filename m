Return-Path: <linux-usb+bounces-331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B73D7A4DAD
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 17:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EBD11C214CB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 15:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F12219FC;
	Mon, 18 Sep 2023 15:54:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297CA1F605
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 15:54:04 +0000 (UTC)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854132D52
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 08:54:03 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d818d4230f6so4245530276.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 08:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695052184; x=1695656984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GY4Xs9tPm/8Ov6kgdqkd/KejihY5w92YfT7U3N/x6jI=;
        b=kGwuDXXxW34kDLGIqow8CBupaePKuQFMvOfnODXJ3bbZjI/ozejkKwPOEZ4X/Zz6z7
         nnEPz9j7ua+kzSwO3iknVd6NEwX8tMgFaTvtvPj71SRi5v9Es1mmnIicoeIlQERe5G3p
         iMNlbjnV6YKsEB7iIBWa09DnXkuX7tpzclPNAuKk6/tg3UlRReL8IH+KxZOAxksnL4N1
         Vt4hKQKnb4CxNvWYs+u6YflaKKgJCzobYlHeXe5JrLrNeF6oaj6FfMmQcRoGF8XYjBLy
         iYK7jLAJ1m9NtObS+1u+GStq4hWSXlau946CGJrjIRxS0rzRwxbeJrV87474tisihFjK
         7Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052184; x=1695656984;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GY4Xs9tPm/8Ov6kgdqkd/KejihY5w92YfT7U3N/x6jI=;
        b=dGxfBRG/XNyY5thYwHRKb1NUOP17P2Qkgf+1GQ71uO7QJmgqrmPIDZEP0jmzQClwUn
         Ad7alORDQycRA9i1cSnaZwC9UL34olYPCHgbkzTgDuOvHbDcw2DOQ33nYNWZIfeKUxMH
         +YqZvHU00MOVJ4uXK7hPVLN3MH6HN8GbHWd8LUOxlDdfbXv/5bXIyf71KSQHsZwMKKg3
         PjjqGsiIKdxjc8qQwt/wcGWGZMmBnXD41D2bIRcioq58QhxgiirLdwciTuXQBjjybWKn
         K1VdIRaylvt6J0aajtXhvf6tk9wytnn4THoJiLy4H56hAu8BlWSpr15aJhrDfzalXx2H
         QWrQ==
X-Gm-Message-State: AOJu0YzcZYNLtoYK5b9IG/lyaKbcX9rNcrJ4OZB8m4+84BdJf6eLsnCv
	ejfvHDJRghKYnLbJO6gzqZb06qz+yMU=
X-Google-Smtp-Source: AGHT+IF7FaTc+KKMzso+cT1Wxgk34MwZgNhK61NDA/bXcr3FHEOtDcICDKODwON7N44THQxZJkkNfQ==
X-Received: by 2002:a17:902:f544:b0:1c3:9f2b:4d08 with SMTP id h4-20020a170902f54400b001c39f2b4d08mr8296714plf.20.1695048173755;
        Mon, 18 Sep 2023 07:42:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ec8400b001bdc9daadc9sm8422466plg.89.2023.09.18.07.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:42:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <22c69730-43b5-9c48-da21-03f0441eecbb@roeck-us.net>
Date: Mon, 18 Sep 2023 07:42:50 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, jun.li@nxp.com
References: <20230914121158.2955900-1-xu.yang_2@nxp.com>
 <ZQgl8byyZNqe5Af1@kuha.fi.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/2] usb: typec: tcpci: add check code for
 tcpci/regmap_read/write()
In-Reply-To: <ZQgl8byyZNqe5Af1@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/23 03:26, Heikki Krogerus wrote:
> On Thu, Sep 14, 2023 at 08:11:57PM +0800, Xu Yang wrote:
>> The return value from tcpci/regmap_read/write() must be checked to get
>> rid of the bad influence of other modules. This will add check code for
>> all of the rest read/write() callbacks and will show error when failed
>> to get ALERT register.
>>
>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>
>> ---
>> Changes in v2:
>>   - remove printing code
>> ---
>>   drivers/usb/typec/tcpm/tcpci.c | 34 +++++++++++++++++++++++++---------
>>   1 file changed, 25 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
>> index 0ee3e6e29bb1..8ccc2d1a8ffc 100644
>> --- a/drivers/usb/typec/tcpm/tcpci.c
>> +++ b/drivers/usb/typec/tcpm/tcpci.c
>> @@ -657,21 +657,28 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>>   	int ret;
>>   	unsigned int raw;
>>   
>> -	tcpci_read16(tcpci, TCPC_ALERT, &status);
>> +	ret = tcpci_read16(tcpci, TCPC_ALERT, &status);
>> +	if (ret < 0)
>> +		return ret;
>>   
>>   	/*
>>   	 * Clear alert status for everything except RX_STATUS, which shouldn't
>>   	 * be cleared until we have successfully retrieved message.
>>   	 */
>> -	if (status & ~TCPC_ALERT_RX_STATUS)
>> -		tcpci_write16(tcpci, TCPC_ALERT,
>> +	if (status & ~TCPC_ALERT_RX_STATUS) {
>> +		ret = tcpci_write16(tcpci, TCPC_ALERT,
>>   			      status & ~TCPC_ALERT_RX_STATUS);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>>   
>>   	if (status & TCPC_ALERT_CC_STATUS)
>>   		tcpm_cc_change(tcpci->port);
>>   
>>   	if (status & TCPC_ALERT_POWER_STATUS) {
>> -		regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
>> +		ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
>> +		if (ret < 0)
>> +			return ret;
>>   		/*
>>   		 * If power status mask has been reset, then the TCPC
>>   		 * has reset.
>> @@ -687,7 +694,9 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>>   		unsigned int cnt, payload_cnt;
>>   		u16 header;
>>   
>> -		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
>> +		ret = regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
>> +		if (ret < 0)
>> +			return ret;
> 
> I think you still need to clear TCPC_ALERT_RX_STATUS in this case.
> Guenter, can you check this?
> 

If reading from or writing to the status register failed, we are pretty
much messed up anyway, so I don't think it really matters.

I think the more severe problem is that this is an interrupt handler,
which either handles the interrupt or it doesn't. It does not have the
option of returning an error (negative error code).

The submitter will have to decide what to do in the error case: Was
the interrupt handled or not ? I have no real answer to that question; all
answers seem wrong to me. I would tend to returning that the interrupt
was not handled. Most likely that would cause the handler to be called
again because the interrupt condition is not cleared. If this happens
repeatedly, the interrupt might end up being disabled, which would probably
be the best possible outcome.

Guenter


