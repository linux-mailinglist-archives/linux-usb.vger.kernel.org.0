Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CDA416FE5
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 12:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245527AbhIXKGm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 06:06:42 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:60576 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245408AbhIXKGm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Sep 2021 06:06:42 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru F032A233D9BA
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] USB: phy: tahvo:remove unnecessary debug log
To:     Zhiwei Yang <yangzhiwei@uniontech.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
References: <20210924083852.6029-1-yangzhiwei@uniontech.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <aeb1bd39-5fee-9e98-13f5-a6268e11c0bd@omp.ru>
Date:   Fri, 24 Sep 2021 13:04:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210924083852.6029-1-yangzhiwei@uniontech.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.09.2021 11:38, Zhiwei Yang wrote:
> Remove the debug info which should be instead with ftrace
> 
> Signed-off-by: Zhiwei Yang <yangzhiwei@uniontech.com>
> ---
>   drivers/usb/phy/phy-tahvo.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-tahvo.c b/drivers/usb/phy/phy-tahvo.c
> index 5dc600fadc5f..468151496d23 100644
> --- a/drivers/usb/phy/phy-tahvo.c
> +++ b/drivers/usb/phy/phy-tahvo.c
> @@ -194,8 +194,6 @@ static int tahvo_usb_set_host(struct usb_otg *otg, struct usb_bus *host)
>   	struct tahvo_usb *tu = container_of(otg->usb_phy, struct tahvo_usb,
>   					    phy);
>   
> -	dev_dbg(&tu->pt_dev->dev, "%s %p\n", __func__, host);
> -

    Moreover, "%p" doesn't print a real address since 4.15.

[...]

MBR, Sergey
