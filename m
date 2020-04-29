Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02701BE4B2
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 19:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgD2RET (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 13:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2RES (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 13:04:18 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F185C03C1AE
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 10:04:18 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id u16so2836078wmc.5
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2020 10:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kjKMXLzcwr4axBX2OaYHfsddLl1QFj/mnkcodysTxEY=;
        b=gKPQVCRw6nUUqMKep4nC7g9v/rtf4YEy3ox5sUL/QxJSIJnpPOD+3PUBk7I4QKqEFx
         cQ34IqS2kSUVij+dLPlxygIedAFLJmEc42JUD3xWx9Y6Grz7hrtZ5/RvDsuSFaXoMUJN
         phQP8d3LAHo9IDZB049GAcR5EntkYy5J8G4ybHGffe4BGdVxXb927vvxnlT2F6esY5bn
         PtiksHsyjIFRzy2lK2p4X/vYqm6CudIWGZzwsUylxglZ6DAs1gfzTLu4xSHiWWimhgOZ
         s7bIBDIQlsIa8iU0+NpeskuAbekobZ8WlKmOoAev0MuRNlDN55eLLnDs8TK3RqACts1u
         6jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kjKMXLzcwr4axBX2OaYHfsddLl1QFj/mnkcodysTxEY=;
        b=aWYD19NzF6yv98WFHG48evMaQbaPAQa8TSNuVvRRKpXda1r8d9Hhgbe/qT/mlgF1Cu
         SY8OKERPDpbPW5cQkMrZLnawxZP5y8kKg90G1brkyO0SV9vQMFGZ9tpCHBlhBan1Y5wE
         KC9umh99xYQzrmAPRAd43IBEzlarS6HGVGUFLnpfEsioQjkppThSvHCqtUmsJ/rM9T1H
         UHpCrNh464Oh32PS6JiruArtOhoxpPn9+jKHrZB+GfjYJ2BbDjaBi/11l2FfUVVXex8L
         gQA7Oz57mMqiZQbkJsbmJcVaCEXJy/iPMG5t5bo+K38YOZmSY0ePFUJUHa0o27GLDYvd
         +PHw==
X-Gm-Message-State: AGi0PuaEGeA1XACuKOeVMBsOK66YpLiYQYs/bLbOildvyuf2hghTXjwH
        TMvPHCPTt+UPnK8kXOMju/BNPHk/Eyo=
X-Google-Smtp-Source: APiQypLoDUU9GIguTav7F6befROwiA4r1AQLaCoeEaYkllxh3oyMxtQoinKht+C+hDHqF5T/DGCpWg==
X-Received: by 2002:a1c:1985:: with SMTP id 127mr4627580wmz.13.1588179856510;
        Wed, 29 Apr 2020 10:04:16 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i74sm13070738wri.49.2020.04.29.10.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:04:15 -0700 (PDT)
Subject: Re: Adding tps65986 to your tps6598x driver
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <d4a9214a-7a55-72ea-75b9-8388bc39d0dd@linaro.org>
 <20200414151505.GK2828150@kuha.fi.intel.com>
 <d64d7b21-4f03-05e8-e0db-aa8c75ba847e@linaro.org>
 <20200422132533.GC618654@kuha.fi.intel.com>
 <e2eb882b-0ecd-a0a7-b415-8beae93f640f@linaro.org>
 <20200429140351.GE2738754@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <4087f16d-a170-eea9-0738-ec5f1c42317d@linaro.org>
Date:   Wed, 29 Apr 2020 18:04:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200429140351.GE2738754@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29/04/2020 15:03, Heikki Krogerus wrote:
> On Wed, Apr 22, 2020 at 03:50:08PM +0100, Bryan O'Donoghue wrote:
>> What's your feeling on the following.
>>
>> In DT if we find a child connector then we can determine the state we are
>> supposed to be in ?
>>
>> That way it _shouldn't_ change the logic you already depend on the ACPI
>> systems.
>>
>> typec1_con: connector {
>>      compatible = "usb-c-connector";
>>      label = "USB-C";
>>      power-role = "dual";
>>      data-role = "dual";
>>      try-power-role = "sink";
>>      source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>>      sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
>>                  PDO_VAR(5000, 20000, 3000)>;
>>      op-sink-microwatt = <15000000>;
>>
>>      self-powered;
>> };
>>
>> we need to control :
>>
>> http://www.ti.com/lit/an/slva843a/slva843a.pdf
>>
>> - InitiateSwapToDPF
>> - InitiateSwapToUFP
>> - process-swap-to-dfp;
>> - process-swap-to-ufp;
>> - InitiateVconnSwap;
>> - ProcessVconnSwap;
>>
>> The documentation makes clear some of these settings are mutually exclusive.
>>
>> You can capture the logic of that with the connector
>>
>> - power-role = "dual";
>> - data-role = "dual";
>>
>> from the connector declaration. Absent the connector declaration the ACPI
>> launched code should still work as-is.
>>
>> Alternatively it could be something specific to the chip - as opposed to the
>> connector.
>>
>> My thought is you either have these two at the type-c controller level or
>> inside a child connector node.
>>
>> Either way tps6598x would consume them.
> 
> You should always have a child node for every connector. Please Note
> that we usually have one for each connector in ACPI as well.
> 
> For now on every platform the application code (the PD controler FW)
> has been platform specific, which means we have not needed to
> configure things like the System Configuration register, because we've
> known that the application code has already done that for us.
> 
> In your case I'm assuming you do not have a platform specific PD
> controler FW, so you are going to need to use device properties, which
> is the correct thing to do.

On our platform I found the settings "just worked" asking around it 
turns out our FW has been configured with the TI configuration tool, so 
at this moment in time I don't think the stuff I'm working on has a 
specific need to configure these options.


> So we can always check those properties in tps6598x.c. If we have
> them, we configure the System Configuration, and what have you,
> according to those. If we don't have them, then we know the PD
> controller FW is platform specific.
> 
>>>> Something else ? It's important we get the changes upstream, so I'd
>>>> appreciate any thoughts you have on the right way to go about this.
>>>
>>> So what exactly is the problem here?
>>>
>>> Which USB controller are you using? Is it dual-role capable, or do you
>>> have separate xHCI controller and separate USB device controller plus
>>> a mux between them?
>>
>> Err, checks notes.
>> Its a ChipIdea HDRC. That part just works.
>>
>> As I suggested above,
>>
>> tps6598x: tps6598x@38 {
>>      compatible = "ti,tps6598x";
>>      reg = <0x38>;
>>
>>      interrupt-parent = <&gpio>;
>>      interrupts = <107 IRQ_TYPE_LEVEL_LOW>;
>>      interrupt-names = "irq";
>>
>>      pinctrl-names = "default";
>>      pinctrl-0 = <&typec_pins>;
>>
>>      port {
>>          typec1_dr_sw: endpoint {
>>              remote-endpoint = <&usb1_drd_sw>;
>>          };
>>      };
> 
> That looks a bit odd to me. I think you want to place that under the
> connector node too, however, OF graph is a bit problematic with
> Type-C. 


I discovered that as I came to implement, also looking at the other 
typec controllers like the fusb302 and hd3ss3220 it became obvious a 
connector {} should be included.

tps6598x: tps6598x@38 {
         compatible = "ti,tps6598x";
         reg = <0x38>;

         interrupt-parent = <&msmgpio>;
         interrupts = <107 IRQ_TYPE_LEVEL_LOW>;
         interrupt-names = "irq";

         reset-gpios = <&msmgpio 116 GPIO_ACTIVE_LOW>;

         pinctrl-names = "default";
         pinctrl-0 = <&typec_pins>;

         typec_con: connector {
                 compatible = "usb-c-connector";
                 label = "USB-C";
                 port {
                         typec_ep: endpoint {
                                 remote-endpoint = <&otg_ep>;
                         };
                 };
         };
};

&otg {
         status = "okay";
         usb-role-switch;
         ulpi {
                 usb_hs_phy: phy {
                         v1p8-supply = <&pm8916_l7>;
                         v3p3-supply = <&pm8916_l13>;
                 };
         };
         port {
                 otg_ep: endpoint {
                         remote-endpoint = <&typec_ep>;
                 };
         };
};

with no more change than adding OF binding and the role-switch stuff we 
discussed.

Not quite ready to send out yet.

> The problem is that there is no way to identify the OF graph
> ports/endpoints. It means that there does not seem to be any way to
> know which port/endpoint/remote-endpoint is for the DisplayPort, the
> mux, USB port, TBT 3 port, retimer #1, retimer #2, etc.


> There is a proposal to define device property that simply contains
> reference to the correct node for every type of connection. For USB
> role switch the property is named "usb-role-switch":
> 
>          connector {
>                  ...
>                  usb-role-switch = <the remote port parent of &usb1_drd_sw>;
>                  ...
>          };

I'll take a look.

Thanks for the feedback.

---
bod
