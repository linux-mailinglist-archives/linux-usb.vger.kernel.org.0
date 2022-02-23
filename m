Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC2F4C12B3
	for <lists+linux-usb@lfdr.de>; Wed, 23 Feb 2022 13:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237504AbiBWM1D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Feb 2022 07:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233949AbiBWM1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Feb 2022 07:27:02 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F259C3A7
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 04:26:30 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id c6so40978648edk.12
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 04:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=BHomSSQD97eL1L3iIvV/N/L/ht5aaNsClxtdMafmHn4=;
        b=B3u3WounpaV4NhRtuSfywxlVKLgQvcBDybBZB7eegub1Q241QIiLBfyR1msFqj95f+
         rrYL+xBjGogjlh+aHr/SeaDthVBFsePeq/dGGecNzipnUzH2txPMtia59Kgrqe6DNrDh
         wPH1iKrtrCaQgyIB7p4YA8oueq8y5wdf6GDiKH2FM63j8ZN/+pTthB2JZmRyh1oe1CCy
         n8DRpoWPp4o4GGG428+g2HGpsauO+LRJjZ17YfIaIOF1gk5n9gvlY04liaGQEdN/+xWe
         rbzqTbDj8dK3yG8E7+e6r83YZzYyYftV+ZmV6m2zHBbv6N0gfIP3HV6z8qpLbusSBoLR
         uH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=BHomSSQD97eL1L3iIvV/N/L/ht5aaNsClxtdMafmHn4=;
        b=7o/tnAIICFFWzO3lZEUvUf2CkAaqNoE9M4L+9vSZV4Zf2Ibf+92+9d1xRo2UXHzi5d
         Krb/yCBSyapA9S1z3Yb2awN0ZzzrZXihsL9cn7VLDdHVcNJGnyhDmgcDQUz328sV2tC6
         zWFpzDNdP5veAmSV2KPhHhA8DBiBLYdbxPeojyVihaAzm3yvWOK2OTxHrEEIz8METGLg
         cFe/SfTs4B+n+2gF0+36SwD6ksFJsp8Y9oe4A1ahXmqBCQ1zS/Q8O7PKhbFfYRSCBRug
         r9zUNtWRPxYdN7t3lybpCBO5eXeV89Q9QuwAtleauoJhKwDsYFR8cvWeyRucbvl9tW/+
         UzDw==
X-Gm-Message-State: AOAM530MMObjsVBbl5ZhUhUZbqwvSCuyJzYRUmbm5E8gaeLuVGb7saev
        4j8JYbUt16YIBcv2oBcuTdUiyCfny6Y=
X-Google-Smtp-Source: ABdhPJyutAbwGJQ5EK+Xs6/1bApegrw0In6ODfXQw75ryb93ENY9m611dnqYXPdL0M3hez9NQNOlcQ==
X-Received: by 2002:a50:9f8b:0:b0:413:2dbd:8793 with SMTP id c11-20020a509f8b000000b004132dbd8793mr4179935edf.39.1645619189444;
        Wed, 23 Feb 2022 04:26:29 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:19e2:181b:94d8:8cf0? (p200300ea8f4d2b0019e2181b94d88cf0.dip0.t-ipconnect.de. [2003:ea:8f4d:2b00:19e2:181b:94d8:8cf0])
        by smtp.googlemail.com with ESMTPSA id y21sm7251806ejq.185.2022.02.23.04.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 04:26:28 -0800 (PST)
Message-ID: <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
Date:   Wed, 23 Feb 2022 13:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
In-Reply-To: <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
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

On 23.02.2022 03:10, Alan Stern wrote:
> On Tue, Feb 22, 2022 at 10:13:09PM +0100, Heiner Kallweit wrote:
>> I get the "hub doesn't have any ports" error message on a system with
>> Amlogic S905W SoC. Seems the SoC has internal USB 3.0 supports but
>> is crippled with regard to USB 3.0 ports.
>> Maybe we shouldn't consider this scenario an error. So let's change
>> the message to info level, but otherwise keep the handling of the
>> scenario as it is today. With the patch it looks like this on my
>> system.
>>
>> dwc2 c9100000.usb: supply vusb_d not found, using dummy regulator
>> dwc2 c9100000.usb: supply vusb_a not found, using dummy regulator
>> dwc2 c9100000.usb: EPs: 7, dedicated fifos, 712 entries in SPRAM
>> xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
>> xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
>> xhci-hcd xhci-hcd.0.auto: hcc params 0x0228f664 hci version 0x100 quirks 0x0000000002010010
>> xhci-hcd xhci-hcd.0.auto: irq 49, io mem 0xc9000000
>> hub 1-0:1.0: USB hub found
>> hub 1-0:1.0: 2 ports detected
>> xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
>> xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
>> xhci-hcd xhci-hcd.0.auto: Host supports USB 3.0 SuperSpeed
>> usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
>> hub 2-0:1.0: USB hub found
>> hub 2-0:1.0: hub has no ports, exiting
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/usb/core/hub.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 83b5aff25..e3f40d1f4 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
>>  		ret = -ENODEV;
>>  		goto fail;
>>  	} else if (hub->descriptor->bNbrPorts == 0) {
>> -		message = "hub doesn't have any ports!";
>> -		ret = -ENODEV;
>> -		goto fail;
>> +		dev_info(hub_dev, "hub has no ports, exiting\n");
>> +		return -ENODEV;
>>  	}
>>  
>>  	/*
> 
> How about instead changing xhci-hcd so that it doesn't try to register 
> a USB-3 root hub if the controller doesn't have any USB-3 ports?  I 
> think that would make more sense.
> 
Right, this would be better. I checked and it seems to be a little bit
bigger endeavor. If I let register_root_hub() fail, then this removes
the USB3 bus/host (shared hcd), but also the USB2 bus/host.
It took an additional change to xhci_plat_probe() to make it work on my
system. Not sure what the impact could be on systems not using
xhci_plat_probe(). Users may face the same issue like me, and having
a USB3 hub with no ports may remove also the USB2 bus/host.

What I can do: submit my patches as RFC, then there's a better basis
for a discussion.

> Alan Stern

Heiner
