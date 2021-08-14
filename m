Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3395B3EC280
	for <lists+linux-usb@lfdr.de>; Sat, 14 Aug 2021 13:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238312AbhHNL7p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Aug 2021 07:59:45 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:33264 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238064AbhHNL7p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Aug 2021 07:59:45 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru A8FBA205BB47
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v3 0/2] Stop calling request_irq(), etc. with invalid IRQs
 in the USB drivers`
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>
References: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
 <YRdlGFh71JmKrJIm@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <e17abfd6-09ab-d701-49c2-e2a1891c72ba@omp.ru>
Date:   Sat, 14 Aug 2021 14:59:09 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YRdlGFh71JmKrJIm@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14.08.2021 9:39, Greg Kroah-Hartman wrote:

>> Here are 2 patches against the 'usb-linus' branch of GregKH's 'usb.git' repo.
> 
> Wait, why that branch?

    What branch I'd use for the fixes then?

>  Please make them against the branch you want
> them applied to.  Hopefully they will apply to the usb-next branch...

    I didn't intend them for usb-next but looks like they apply there too.

MBR, Sergey
