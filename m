Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456D0470AFD
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 20:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242837AbhLJT5K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 14:57:10 -0500
Received: from mxout01.lancloud.ru ([45.84.86.81]:45542 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343812AbhLJT5H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 14:57:07 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru E8EEC2097300
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 01/10] usb: gadget: udc: bcm63xx: fix deferred probing
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
CC:     Kevin Cernekee <cernekee@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
 <20211021191437.8737-2-s.shtylyov@omp.ru>
 <c25858ae-0cc6-1c0c-ab2f-8ca00fafc2c0@gmail.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <8bb47069-a642-3b5f-f6f9-c2a60c02dff6@omp.ru>
Date:   Fri, 10 Dec 2021 22:53:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c25858ae-0cc6-1c0c-ab2f-8ca00fafc2c0@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/27/21 12:33 AM, Florian Fainelli wrote:

>> The driver overrides the error codes returned by platform_get_irq() to
>> -ENXIO for some strange reason, so if it returns -EPROBE_DEFER, the driver
>> will fail the probe permanently instead of the deferred probing. Switch to
>> propagating the error codes upstream.
>>
>> Fixes: 613065e53cb1 ("usb: gadget: bcm63xx UDC driver")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Not that this is going to happen for this particular driver on the
> platform where it is use MIPS BCM63XX

   Thanks for noting that. I think I should re-qualify this patch from
a bug fix to cleanup. I'll split the series into 2 parts now.

> but this is still the right thing
> to do anyway.

   Yes, propagating the error is the Right Thing. :-)

MBR, Sergey
