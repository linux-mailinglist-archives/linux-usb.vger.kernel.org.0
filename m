Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F54433E4C
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 20:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbhJSSUa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 14:20:30 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:56534 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbhJSSU3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 14:20:29 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru AB5D120ADE85
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <YW5ajmF67RjuD7l5@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <45bba3fc-5816-cbb5-6c62-588fc2b5a20d@omp.ru>
Date:   Tue, 19 Oct 2021 21:18:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YW5ajmF67RjuD7l5@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 10/19/21 8:41 AM, Greg Kroah-Hartman wrote:

>> Here are 22 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
>> The affected drivers use platform_get_irq() which can return IRQ0 (considered
>> invalid, according to Linus) that means broken HCD when passed to usb_add_hcd()
>> called at the end of the probe methods. I think that the solution to this issue
>> is either explicitly deny or accept IRQ0 in usb_add_hcd()... /but/ here's this
>> patch set to get the things going...
> 
> Why not fix the root of the problem for your platform that is failing to
> assign a valid irq for the device?

   I'm just auditing the existing code, not developing on a new platform.
   (I also don't share Linus' opinion on IRQ0, TBH.)

> Are you going to make this change to all callers of this function in the
> kernel tree?

   No, only to those drivers that reinterpret IRQ0 as something other, e.g. polling
(only libata so far). No change needed to the subsystem that call request_irq() and
its ilk w/o filtering out IRQ0.

> thanks,
> 
> greg k-h

MBR, Sergey
