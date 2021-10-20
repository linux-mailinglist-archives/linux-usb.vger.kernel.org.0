Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5B7435334
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 20:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhJTSxs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 14:53:48 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:37710 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbhJTSxS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Oct 2021 14:53:18 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 6D0AB20AD26C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <YXBA7IdNIrWNAEi3@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e3792d5f-d8a1-02cf-9538-bfe1f61f6f38@omp.ru>
Date:   Wed, 20 Oct 2021 21:50:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YXBA7IdNIrWNAEi3@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/20/21 7:16 PM, Greg Kroah-Hartman wrote:
[...]
>> Here are 22 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
>> The affected drivers use platform_get_irq() which can return IRQ0 (considered
>> invalid, according to Linus) that means broken HCD when passed to usb_add_hcd()
>> called at the end of the probe methods. I think that the solution to this issue
>> is either explicitly deny or accept IRQ0 in usb_add_hcd()... /but/ here's this
>> patch set to get the things going...

[...]

> Can you update and send a v2 for this series, with Alan's acks added to
> the proper commits and fix up the other things that people have found?

   OK, I'll try. Posting the patches with git for the 1st time, so somewhat
afraid to ruin something (which I've already done). :-)

> thanks,
> 
> greg k-h

MBR, Sergey
