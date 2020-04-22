Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E94D1B47AF
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 16:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgDVOtk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 10:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgDVOtk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 10:49:40 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C056EC03C1A9
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 07:49:39 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id u16so2692859wmc.5
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0NteFVNoHgRWrObHPbDpirDN6mvTQN6F8NaXslOU4m0=;
        b=rJr8biWhV7qkM0V+ttKmBzemrgFOWhu60z2wvB7gFqW9jm9e0kJh1KPDkqWV/FE3Vi
         560Bk9iRMMRC6rkw4snjPepvhhofdJ5+eF0HNcASOB/qB8ef6Sdu1+JoBNCE7AtUxdtN
         bKmyJkj+Q1WqKqsMMQMBGyUqsmBrAGlSdwMYx6z/3PxRxcbe2Bf+afg+3mzlfgycLYtb
         M3XfHlGeRVnFODmlA2vbcvmMOpYW7qnedXZRMOXvCj7SHAjveACIarp7NuZsUOfuD/8D
         sgJRolYlQXfRx5DapboEaMsfcs5wq1mcIRq9Iu41y+ws+4B0wGIsTjWnldZGPGn9xHXr
         yy+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0NteFVNoHgRWrObHPbDpirDN6mvTQN6F8NaXslOU4m0=;
        b=h4hNtJlIWe6dmPAqCuwWZ4Jp5cQnSHVNLnlLJXrHd+BNteQdfM9vggM/s07toFeMpV
         Jww6it891hWuwM1r3fiAB0v1/h+qzKYgHmrgIAo2uRGHV0pSDldjDd64ydaQk7Nq7tZ2
         lCy4M+KnojwRwGKGBkMFVCj/X0FA6CqVkwNZjYA08VEGVM0SgT4o7jShZyJWqpwYFUWJ
         HA8zzGxLav6fD+aNbsy08pqQ2pqt5mnd3P0dQTxukStW45k7EiXfbgxdbTxbC20/tgJQ
         Ugfh2bl2j4wjUQ+cXU+GaYnQqUp8wX9K/QaJMBiOVRFP/PDF/A77ClqammRZVP4b874L
         O4sw==
X-Gm-Message-State: AGi0PuaXBFQivE/yNr+0Zvh0kf+k1A3qVgS5DdYFl7xyQcaHVCS38wLU
        IcErhuHWWbaqDaeUyvsdGKltcyzBWd0=
X-Google-Smtp-Source: APiQypLHJLvXcOLF3Jh9nFKV0aPWscBn4Kr2E+gxdJxUrR0o2I/cxhB4my12JLm3tS3UsJ4zElu7RQ==
X-Received: by 2002:a1c:4409:: with SMTP id r9mr11361301wma.165.1587566978137;
        Wed, 22 Apr 2020 07:49:38 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q17sm7731450wmj.45.2020.04.22.07.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 07:49:37 -0700 (PDT)
Subject: Re: Adding tps65986 to your tps6598x driver
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <d4a9214a-7a55-72ea-75b9-8388bc39d0dd@linaro.org>
 <20200414151505.GK2828150@kuha.fi.intel.com>
 <d64d7b21-4f03-05e8-e0db-aa8c75ba847e@linaro.org>
 <20200422132533.GC618654@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <e2eb882b-0ecd-a0a7-b415-8beae93f640f@linaro.org>
Date:   Wed, 22 Apr 2020 15:50:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422132533.GC618654@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22/04/2020 14:25, Heikki Krogerus wrote:
> +linux-usb ml
> 
> On Wed, Apr 22, 2020 at 12:17:14PM +0100, Bryan O'Donoghue wrote:
>> On 14/04/2020 16:15, Heikki Krogerus wrote: > So what you are proposing here is that you want to use tps65986 as
> just a port controller (so PHY), right? I don't think that's possible.

Both. Sorry I wasn't clear :)

> TCPM (port manager) is the software that implements the USB Type-C and
> PD state machines. The USB PD controllers are running their own state
> machines, and the thing is that you can't turn off that part of them.
> So basically the USB PD controllers are supplying the TCPM
> functionality internally.

OK. So forget about the above then. That answers the question why you 
didn't implement tps6598x as a tcpm bound device.

What's your feeling on the following.

In DT if we find a child connector then we can determine the state we 
are supposed to be in ?

That way it _shouldn't_ change the logic you already depend on the ACPI 
systems.

typec1_con: connector {
     compatible = "usb-c-connector";
     label = "USB-C";
     power-role = "dual";
     data-role = "dual";
     try-power-role = "sink";
     source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
     sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
                 PDO_VAR(5000, 20000, 3000)>;
     op-sink-microwatt = <15000000>;

     self-powered;
};

we need to control :

http://www.ti.com/lit/an/slva843a/slva843a.pdf

- InitiateSwapToDPF
- InitiateSwapToUFP
- process-swap-to-dfp;
- process-swap-to-ufp;
- InitiateVconnSwap;
- ProcessVconnSwap;

The documentation makes clear some of these settings are mutually exclusive.

You can capture the logic of that with the connector

- power-role = "dual";
- data-role = "dual";

from the connector declaration. Absent the connector declaration the 
ACPI launched code should still work as-is.

Alternatively it could be something specific to the chip - as opposed to 
the connector.

My thought is you either have these two at the type-c controller level 
or inside a child connector node.

Either way tps6598x would consume them.

> 
>> Something else ? It's important we get the changes upstream, so I'd
>> appreciate any thoughts you have on the right way to go about this.
> 
> So what exactly is the problem here?
> 
> Which USB controller are you using? Is it dual-role capable, or do you
> have separate xHCI controller and separate USB device controller plus
> a mux between them?

Err, checks notes.
Its a ChipIdea HDRC. That part just works.

As I suggested above,

tps6598x: tps6598x@38 {
     compatible = "ti,tps6598x";
     reg = <0x38>;

     interrupt-parent = <&gpio>;
     interrupts = <107 IRQ_TYPE_LEVEL_LOW>;
     interrupt-names = "irq";

     pinctrl-names = "default";
     pinctrl-0 = <&typec_pins>;

     port {
         typec1_dr_sw: endpoint {
             remote-endpoint = <&usb1_drd_sw>;
         };
     };

     /* Example A */
     typec1_con: connector {
         compatible = "usb-c-connector";
         label = "USB-C";
         power-role = "dual";
         data-role = "dual";
         try-power-role = "sink";
         source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
                       sink-pdos = <PDO_FIXED(5000, 3000,
                                    PDO_FIXED_USB_COMM)
                                    PDO_VAR(5000, 20000, 3000)>;
         op-sink-microwatt = <15000000>;
     };

     /* Example B */
     power-role = "dual";
     data-role = "dual";
     try-power-role = "sink";
     source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
                   sink-pdos = <PDO_FIXED(5000, 3000,
                                PDO_FIXED_USB_COMM)
                                PDO_VAR(5000, 20000, 3000)>;
     op-sink-microwatt = <15000000>;
};

I think connector is probably the right way to go.

---
bod
