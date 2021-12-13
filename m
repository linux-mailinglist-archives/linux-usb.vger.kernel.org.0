Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500F2473053
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 16:21:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbhLMPVT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 10:21:19 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:58240 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbhLMPVR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 10:21:17 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru EB07D20F7FA8
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v3 1/6] usb: gadget: udc: gr: fix deferred probing
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>
References: <20211210204634.8182-1-s.shtylyov@omp.ru>
 <20211210204634.8182-2-s.shtylyov@omp.ru> <YbdUpnlk4sjP9nGU@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e5490edf-2b10-e3b5-3ab5-3c5ea205e540@omp.ru>
Date:   Mon, 13 Dec 2021 18:21:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YbdUpnlk4sjP9nGU@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 12/13/21 5:11 PM, Greg Kroah-Hartman wrote:

>> The driver overrides the error codes and IRQ0 returned by platform_get_irq()
>> to -ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
>> permanently instead of the deferred probing. Switch to propagating the error
>> codes upstream. IRQ0 is no longer returned by platform_get_irq(), so we now
>> can safely ignore it...
> 
> What commit keeps IRQ0 from being returned by platform_get_irq()?

   It's yet unmerged patch on which (as I wrote in the cover letter) the series
depend:

https://marc.info/?l=linux-kernel&m=163623041902285

MBR, Sergey
