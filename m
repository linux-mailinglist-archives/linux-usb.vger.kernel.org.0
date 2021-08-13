Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4A7E3EB412
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 12:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239416AbhHMKdf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 06:33:35 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:55914 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239046AbhHMKdf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Aug 2021 06:33:35 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 4B6362334E2E
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 8/9] usb: phy: tahvo: add IRQ check
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <71d33de9-ffee-705d-843a-dfc1b1c0bbc6@omp.ru> <YRYY+0y3rZeRDLFA@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <02f48143-6fc6-6af6-f070-748b4dbbcc6a@omp.ru>
Date:   Fri, 13 Aug 2021 13:33:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YRYY+0y3rZeRDLFA@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 13.08.2021 10:02, Greg Kroah-Hartman wrote:
> On Mon, Aug 09, 2021 at 11:52:05PM +0300, Sergey Shtylyov wrote:
>> The driver neglects to check the result of platform_get_irq()'s call and
>> blithely passes the negative error codes to request_irq() (which takes
>> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
>> error code. Stop calling request_irq() with the invalid IRQ #s.
>>
>> Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>>   drivers/usb/phy/phy-fsl-usb.c |    2 ++
>>   1 file changed, 2 insertions(+)
> 
> This patch did not apply to my tree :(

    No wonder -- I managed to send the FSL PHY patch twice. Sorry about all 
the mess! :-/

MBR, Sergei
