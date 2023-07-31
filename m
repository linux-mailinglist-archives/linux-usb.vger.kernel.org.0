Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E827697DE
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 15:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjGaNm0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 09:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjGaNm0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 09:42:26 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07CB8170A
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 06:42:25 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2680a031283so2717568a91.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690810944; x=1691415744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UABKvsP146+NetkqsehekGWioRGp+pybOwSs4IsftuY=;
        b=SEk4W3w739sVosqglI2lZLnjO+pU6sjxj9RT7winQ4+Rg9N8fhLHgcnHyMe7eRoGr/
         rzWCIU2fLeZi6E8YsWTFkw9Pi4gFedWcJHx9ZQK+LSH0xGZmKYvMKb4wLTOE4kSah+CX
         XgLWp2hmKdGQHhYo7Y2ci+114AmCzB7MquF7s+IBTjwzluO74TWS0M+zmwv61jtsGOaC
         keJf4Iy5QtYAf4oOTBTLLodOaNOPuNV3o8kGoVhzRr8WC/QO8AWiWK3NbuzY+76jjMbi
         RewzHCPCo9QyDfQ7NmMP98ZRrY2dn7iQryMJ2VzlrOZx8kraZpO9Xh2pu/r3rac9CGSR
         joLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690810944; x=1691415744;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UABKvsP146+NetkqsehekGWioRGp+pybOwSs4IsftuY=;
        b=gGo3PZwBwFiXt3OmAM6wH0Pf2A2SO52DL5MUGLxhEDX1LFth4fJdG9qZWWqTzjF5Ie
         RBnZG2OktCprrH6CoC4XufR+jerpzOubMjTo0Kh3pm9RHMZPYyGhS6OUOA6scnrZs1ph
         ibF5c9pnaX8RnCveB2xmMtcOCgFXIeRzNtUBBCHMxZxLR7z7Nl1ykwnJc8uYyVDjaOad
         Z7FHhK134YWxO+GCULQaWySginmA5vT4gaEr5Th79D9publDv8SC/Wwpl7KtftKbTlhM
         FFHt7odxiu0JIxl6vQvsdpcvc+zZDEwpLVdl3xI8hXztwQQ1Jiv65IRwa1GRUxTHLI5e
         vwbw==
X-Gm-Message-State: ABy/qLalWf/QXKz0YTrFCZef/BXkt6sz9R4BrcPUM+ZmHqW8KIpHWH6S
        EEStIDYBAbvOrZ+oWOklcSU=
X-Google-Smtp-Source: APBJJlGYMEhrJXdPjXZ3l7xU4jQbtJztFd9tRU+BnlimEVrjypuDNshhFmtmr1rZHNF/4vfkHzZvKg==
X-Received: by 2002:a17:90a:2c8:b0:267:ee56:4c59 with SMTP id d8-20020a17090a02c800b00267ee564c59mr7943026pjd.35.1690810944230;
        Mon, 31 Jul 2023 06:42:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cp4-20020a17090afb8400b002676e973275sm8929036pjb.1.2023.07.31.06.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:42:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5759a57b-3bb8-5a1b-a7a8-8c512fc50012@roeck-us.net>
Date:   Mon, 31 Jul 2023 06:42:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: typec: tcpm: not sink vbus if operational current is
 0mA
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, jun.li@nxp.com
References: <20230630105656.2828595-1-xu.yang_2@nxp.com>
 <ZMe4GOfAT3a1YueY@kuha.fi.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZMe4GOfAT3a1YueY@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/31/23 06:33, Heikki Krogerus wrote:
> Hi,
> 
> I'm sorry to keep you waiting.
> 
> On Fri, Jun 30, 2023 at 06:56:56PM +0800, Xu Yang wrote:
>> PD3.0 Spec 6.4.1.3.1 said:
>> For a Sink requiring no power from the Source, the Voltage (B19…10)
>> Shall be set to 5V and the Operational Current Shall be set to 0mA.
>>
>> Therefore, we can keep sink path closed if the operational current of
>> the first fixed PDO is 0mA.
>>
>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>> ---
>>   drivers/usb/typec/tcpm/tcpm.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index 829d75ebab42..4f7e4c50e847 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>> @@ -4301,7 +4301,12 @@ static void run_state_machine(struct tcpm_port *port)
>>   			if (port->slow_charger_loop && (current_lim > PD_P_SNK_STDBY_MW / 5))
>>   				current_lim = PD_P_SNK_STDBY_MW / 5;
>>   			tcpm_set_current_limit(port, current_lim, 5000);
>> -			tcpm_set_charge(port, true);
>> +
>> +			if (pdo_max_current(port->snk_pdo[0]))
>> +				tcpm_set_charge(port, true);
>> +			else
>> +				tcpm_log(port, "Not require power from Source");
>> +
>>   			if (!port->pd_supported)
>>   				tcpm_set_state(port, SNK_READY, 0);
>>   			else
>> @@ -4582,7 +4587,10 @@ static void run_state_machine(struct tcpm_port *port)
>>   			tcpm_set_current_limit(port,
>>   					       tcpm_get_current_limit(port),
>>   					       5000);
>> -			tcpm_set_charge(port, true);
>> +			if (pdo_max_current(port->snk_pdo[0]))
>> +				tcpm_set_charge(port, true);
>> +			else
>> +				tcpm_log(port, "Not require power from Source");
> 
> Shouldn't you still always call tcpm_set_charge()?
> 
>          tcpm_set_charge(port, pdo_max_current(port->snk_pdo[0]));
> 

I think so, something like
	tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));

Guenter

> I think we need to wait for comments from Guenter. I don't know this
> driver well enough.
> 
> thanks,
> 

