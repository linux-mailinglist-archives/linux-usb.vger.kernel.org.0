Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 252EFE135
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 13:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbfD2LV5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 07:21:57 -0400
Received: from rila.superhosting.bg ([91.196.125.212]:47876 "EHLO
        rila.superhosting.bg" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbfD2LV5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 07:21:57 -0400
Received: from [78.128.48.21] (port=33730 helo=[192.168.0.10])
        by rila.superhosting.bg with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.91)
        (envelope-from <help@roumenpetrov.info>)
        id 1hL4M3-0007T2-5s
        for linux-usb@vger.kernel.org; Mon, 29 Apr 2019 14:21:53 +0300
Subject: Re: flash fail with mediatek device
Cc:     linux-usb@vger.kernel.org
References: <fa172514-38ed-71af-bc25-e035b8840807@roumenpetrov.info>
 <20190429093257.GA24165@kroah.com>
From:   =?UTF-8?B?0KDRg9C80LXQvSDQn9C10YLRgNC+0LI=?= 
        <help@roumenpetrov.info>
Message-ID: <366044c5-9fbd-a445-c914-92ebd3f462c8@roumenpetrov.info>
Date:   Mon, 29 Apr 2019 14:21:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <20190429093257.GA24165@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=1.1
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - rila.superhosting.bg
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roumenpetrov.info
X-Get-Message-Sender-Via: rila.superhosting.bg: authenticated_id: master78@roumenpetrov.info
X-Authenticated-Sender: rila.superhosting.bg: master78@roumenpetrov.info
X-Source: 
X-Source-Args: 
X-Source-Dir: 
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg KH wrote:
> On Mon, Apr 29, 2019 at 11:13:12AM +0300, Румен Петров wrote:
>> Hello,
>>
>> I would like to use  "SP Flash Tool"  to flash Android MediaTek.
> 
> That's great, but there is nothing that we can do to help out here,
> please contact MediaTek about this as this is their specific userspace
> tool, and you are using a specific MediaTek kernel, which only they can
> support.

Quite interesting.

Many guides that claim use of SP Flash Tool"  mention Ubuntu 14.04 
(kernel 3.13), 16.04 (kernel 4.4) and 16.10 (kernel 4.8).

That's way I wonder how all those people use flash tool.


> Good luck!
> 
> greg k-h
> 

Roumen
