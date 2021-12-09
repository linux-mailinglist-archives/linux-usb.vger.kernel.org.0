Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C27746E577
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 10:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231833AbhLIJ0z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 04:26:55 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:39422 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhLIJ0z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 04:26:55 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru AFF5020F316E
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <877db647-961f-3882-3d4c-ee2155e39495@omp.ru>
Date:   Thu, 9 Dec 2021 12:23:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 00/10] Fix deferred probing in the USB host/gadget
 drivers
Content-Language: en-US
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>
References: <20211208192118.7483-1-s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211208192118.7483-1-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08.12.2021 22:21, Sergey Shtylyov wrote:

> Here are 10 patches against the 'usb-linus' branch of Greg KH's 'usb.git'
> repo. The affected host/gadget drivers call platform_get_irq() but override
> its result in case of error which prevents the deferred probing from working.
> These patches now logically depend on the previously posted patch:
> 
> https://marc.info/?l=linux-kernel&m=163623041902285
> 
> Sergey Shtylyov (10):
>    usb: gadget: udc: bcm63xx: fix deferred probing
>    usb: gadget: udc: gr: fix deferred probing
>    usb: gadget: udc: pxa25x: fix deferred probing
>    usb: host: ehci-atmel: fix deferred probing
>    usb: host: ehci-orion: fix deferred probing
>    usb: host: ehci-sh: fix deferred probing
>    usb: host: ohci-da8xx: fix deferred probing
>    usb: host: ohci-nxp: fix deferred probing
>    usb: host: ohci-omap: fix deferred probing
>    usb: musb: core: fix deferred probing

    Ignore this -- I totally forgot I had a feedback to v1. :-/

[...]

MBR, Sergey
