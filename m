Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0E6436B35
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 21:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhJUTUE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 15:20:04 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:52668 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231430AbhJUTUE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 15:20:04 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 7CDE82074A62
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 07/10] usb: host: ohci-da8xx: fix deferred probing
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Sergey Shtylyov <s.shtylyov@omprussia.ru>
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
 <20211021191437.8737-8-s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <d91d3f67-a4ec-30be-a1ab-8318bfbf51ef@omp.ru>
Date:   Thu, 21 Oct 2021 22:17:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211021191437.8737-8-s.shtylyov@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/21/21 10:14 PM, Sergey Shtylyov wrote:

> From: Sergey Shtylyov <s.shtylyov@omprussia.ru>

   Oops, should have been @omp.ru -- missed it somehow... :-?

> The driver overrides the error codes returned by platform_get_irq() to
> -ENODEV for some strange reason, so if it returns -EPROBE_DEFER, the driver
> will fail the probe permanently instead of the deferred probing. Switch to
> propagating the error codes upstream.
> 
> Fixes: efe7daf2231a ("USB: OHCI: DA8xx/OMAP-L1x glue layer")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

   Hm, this needs fixing too...

> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
[...]

MBR, Sergey
