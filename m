Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D215A407A23
	for <lists+linux-usb@lfdr.de>; Sat, 11 Sep 2021 20:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbhIKSpa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Sep 2021 14:45:30 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:55410 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233408AbhIKSp3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Sep 2021 14:45:29 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 3D31E22EF8F9
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: dwc2: gadget: Fix ISOC transfer complete handling
 for DDMA
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
References: <df7851e6416a7817140c2be65a479a2650d746d8.1631356397.git.Minas.Harutyunyan@synopsys.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <4fc52c99-cace-d290-21e3-549d5b3c00a2@omp.ru>
Date:   Sat, 11 Sep 2021 21:44:13 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <df7851e6416a7817140c2be65a479a2650d746d8.1631356397.git.Minas.Harutyunyan@synopsys.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 11.09.2021 18:16, Minas Harutyunyan wrote:

> When last descriptor in a descriptor list completed with XferComplete
> interrupt, core switching to handle next descriptor and assert BNA
> interrupt. This both interrupts are set while dwc2_hsotg_epint()

    Both these...

> handler called. Each interrupt should be handled separately: first
> XferComplete interrupt then BNA interrupt, otherwise last completed
> transfer will not be giveback to function driver as completed
> request.
> 
> Fixes: 729cac693eec ("usb: dwc2: Change ISOC DDMA flow")
> Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> ---
>   drivers/usb/dwc2/gadget.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 837237e4bc96..1c11fb89406d 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
[...]
> base-commit: 1b4f3dfb4792f03b139edf10124fcbeb44e608e6

    Hm?

MBR, Sergei
