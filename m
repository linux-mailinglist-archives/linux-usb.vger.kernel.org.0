Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D2F4C1D67
	for <lists+linux-usb@lfdr.de>; Wed, 23 Feb 2022 21:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240554AbiBWU7c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Feb 2022 15:59:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237286AbiBWU7b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Feb 2022 15:59:31 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966C34B862
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 12:59:02 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id p15so54903219ejc.7
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EvfefPJQD58rL//TUV4xf4YegZYhYTR/Y5nWvjnPOkU=;
        b=njpv+aGIWK+rQpyBHzZ9+e8u1lxFRxIqHI2dQL5GhcGaN6LKwXzycoxHdmvi4leQ33
         luXv49gYGazw7c1qKuucgowwd1HiO5+UVoZrQ4QSN57YDUjDn0WaqU74oQ+ssFuJfjpB
         /6KVvCGJni4+FZElzLCUpJgNmvw3Wbjmjrwqw9JSjjdghqE+qvscGzPRhFbSRU0aybPh
         vQ4eGIa4s4TepfSF4UGkglzdMeivD5yvmeE7SVmhi46ioWGSDQE4sQ+4U7h7dfBBSeW9
         904QGBhbnHxnM07s1kGaKPDxXBrbdGSrD+uhu3+6hgSpoekvHI799J6JPo4suh6NOM7X
         DuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EvfefPJQD58rL//TUV4xf4YegZYhYTR/Y5nWvjnPOkU=;
        b=sqoPFCaT9JjU+F1t709JOalSsTrF7CMMinkwL0mxD47qy/TYKV6sftLdxTEhYgRmIp
         RVZkXABRJjtrFqBb2aapB4UGPwUCZrvRDsEnZYINAf4rzNsB0ncxplj9NagEtY3Nk9lO
         Idm4aszvM0iCTiu5ZayL61K4FzidV7bTLuh9xZf7tI1WYf98bBn+3UeHa9ZwVHSHXgIU
         S6Qbrf1/Mte5mceAxX5EN0kHedm6xxUPVMTP7aST+EaSNrTflAapQ1HtHxOCTlqNbycQ
         Ll346QI6UzH9B7b3ZjSirru4jjPFTLuxhgUaZ6igQ4LGDtM72Hmclj2+VUch52d77urf
         wr3g==
X-Gm-Message-State: AOAM5327sSTte164XaraM3IlXXl80XDBJ42aCB/LNa0Tn0OEqG0Pl6kt
        hHHMR9nofVk2kdkiQjQqZj0=
X-Google-Smtp-Source: ABdhPJzloU1IRGXCNjmFDv+YExaB9VsBpbub0gmyBMHg54LDCCu7FyMXkLkNwI2ZtNrm7KYF/+81vA==
X-Received: by 2002:a17:906:ae97:b0:6cf:73fe:8515 with SMTP id md23-20020a170906ae9700b006cf73fe8515mr1132085ejb.462.1645649941030;
        Wed, 23 Feb 2022 12:59:01 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:d12c:c0a:f603:b44d? (p200300ea8f4d2b00d12c0c0af603b44d.dip0.t-ipconnect.de. [2003:ea:8f4d:2b00:d12c:c0a:f603:b44d])
        by smtp.googlemail.com with ESMTPSA id m2sm369970edl.106.2022.02.23.12.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 12:59:00 -0800 (PST)
Message-ID: <131166ee-9926-2eb5-2abd-6bab294d2937@gmail.com>
Date:   Wed, 23 Feb 2022 21:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <YhZB9C/xGaoslZzT@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.02.2022 15:17, Alan Stern wrote:
> On Wed, Feb 23, 2022 at 01:26:23PM +0100, Heiner Kallweit wrote:
>> On 23.02.2022 03:10, Alan Stern wrote:
>>> On Tue, Feb 22, 2022 at 10:13:09PM +0100, Heiner Kallweit wrote:
>>>>
>>>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>>>> index 83b5aff25..e3f40d1f4 100644
>>>> --- a/drivers/usb/core/hub.c
>>>> +++ b/drivers/usb/core/hub.c
>>>> @@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
>>>>  		ret = -ENODEV;
>>>>  		goto fail;
>>>>  	} else if (hub->descriptor->bNbrPorts == 0) {
>>>> -		message = "hub doesn't have any ports!";
>>>> -		ret = -ENODEV;
>>>> -		goto fail;
>>>> +		dev_info(hub_dev, "hub has no ports, exiting\n");
>>>> +		return -ENODEV;
>>>>  	}
>>>>  
>>>>  	/*
>>>
>>> How about instead changing xhci-hcd so that it doesn't try to register 
>>> a USB-3 root hub if the controller doesn't have any USB-3 ports?  I 
>>> think that would make more sense.
>>>
>> Right, this would be better. I checked and it seems to be a little bit
>> bigger endeavor. If I let register_root_hub() fail, then this removes
>> the USB3 bus/host (shared hcd), but also the USB2 bus/host.
>> It took an additional change to xhci_plat_probe() to make it work on my
>> system. Not sure what the impact could be on systems not using
>> xhci_plat_probe(). Users may face the same issue like me, and having
>> a USB3 hub with no ports may remove also the USB2 bus/host.
> 
> Don't change register_root_hub().  Just change xhci_plat_probe(); make 
> it skip the second call to usb_add_hcd() if there are no USB-3 ports.
> 
This works on my system. However a consequence is that xhci->shared_hcd
is NULL. There are a few places like the following in xhci.c where
this may result in a NPE. Not knowing the USB subsystem in detail
I can't say whether these places are in any relevant path.

static int xhci_run_finished(struct xhci_hcd *xhci)
{
        if (xhci_start(xhci)) {
                xhci_halt(xhci);
                return -ENODEV;
        }
        xhci->shared_hcd->state = HC_STATE_RUNNING;



> Alan Stern
> 
>> What I can do: submit my patches as RFC, then there's a better basis
>> for a discussion.
>>
>>> Alan Stern
>>
>> Heiner

Heiner
