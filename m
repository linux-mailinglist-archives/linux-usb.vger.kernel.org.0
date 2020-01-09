Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFD20135CB9
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 16:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbgAIP1P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 10:27:15 -0500
Received: from mail.navigue.com ([74.117.40.3]:52961 "EHLO mail.navigue.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730112AbgAIP1P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jan 2020 10:27:15 -0500
Received: from [192.168.7.178] (bureau.navigue.com [74.117.40.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.navigue.com (Postfix) with ESMTPSA id A4D64140069;
        Thu,  9 Jan 2020 10:29:10 -0500 (EST)
Subject: Re: USB_DWC3_OF_SIMPLE
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
References: <c3a1c48c-1ac7-e5c2-e09a-3b55100735ab@navigue.com>
 <871rs9t336.fsf@kernel.org>
From:   Jonathan Thibault <jonathan@navigue.com>
Message-ID: <f07f375c-9096-c94b-f457-42d4e83093c3@navigue.com>
Date:   Thu, 9 Jan 2020 10:27:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <871rs9t336.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the quick reply.

On 2020-01-09 4:02 a.m., Felipe Balbi wrote:
> Hi,
>
> Jonathan Thibault <jonathan@navigue.com> writes:
>
>> Greetings,
>>
>> I am currently trying to port OpenWRT to Ubiquiti's EdgeRouter 4 which
>> is a Cavium Octeon 7130.  While investigating to support XHCI (the
>> device has a single USB3 port), I ran into the dwc3 driver which
>> apparently supports that very chipset via the dwc3-of-simple glue.
>>
>> Looking at Ubiquiti's own firmware, it seems they are using a modified
>> version of the standard xhci-platform driver.
>>
>> So now I am faced with two different approaches:
>>
>> 1- Attempt to replicate Ubiquiti's modifications to xhci-plat.
>>
>> 2- Switch to dwc3-of-simple.
>>
>> With option 1, so far, I can get xhci to load by merely adding a
>> '.compatible =' member to usb_xhci_of_match[], but the driver complains
>> about LPM algorithms and disables LPM (which may be fine, I don't know
>> if it is even supported on this device).
>>
>> Option 2 (where you might hopefully help), potentially involves more
>> modification to the OpenWRT since their Octeon kernel config does not
>> appear to enable CONFIG_COMMON_CLK, which the driver depends on.  And I
>> do not know if I should also disable standard ohci and ehci drivers once
>> I manage to enable the USB_DWC3_OF_SIMPLE.
>>
>> I'm looking for recommendations on the best approach.  Keep in mind that
>> while I can cobble together some ugly but functional hacks, I am not an
>> experienced kernel dev.
> Just switch to dwc3-of-simple, it already supports the SoC you're
> dealing with. Try removing the dependency on CONFIG_COMMON_CLK. I think
> we already get empty stubs when common clk is disabled.
>
> If that works for you, that's an easy patch.
>

Sadly, while it does build without the COMMON_CLK dependency, probing fails:

[    4.881646] dwc3 1680000000000.xhci: Configuration mismatch. dr_mode 
forced to host
[    4.889574] dwc3 1690000000000.xhci: Configuration mismatch. dr_mode 
forced to host
[    4.897546] dwc3-of-simple: probe of 1180068000000.uctl failed with 
error -12
[    4.904715] dwc3-of-simple: probe of 1180069000000.uctl failed with 
error -12

The return value suggests that it's from the if(!simple->clks) check in 
dwc3_of_simple_clk_init().

The configuration mismatch warning is a bit of a mystery to me as well 
since the only mode available in kernel config is USB_DWC3_HOST and what 
I selected.  Would this be because the controller itself is reporting 
another configuration?

-- 
Jonathan Thibault
Analyste/Administrateur Réseau
Navigue
97, route 132, Saint-Godefroi (Québec) G0C 3C0
581-357-2015
jonathan@navigue.com
www.navigue.com

