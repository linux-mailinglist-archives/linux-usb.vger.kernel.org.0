Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA9814FB4
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 17:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfEFPNP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 11:13:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfEFPNO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 11:13:14 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 797E821655;
        Mon,  6 May 2019 15:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557155593;
        bh=urvZds8q7ORx0dlZAA0EP3S0wW1PZs1TK0DarwdKs1g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DKxTEPyFRW8lrwyVRMXDbv8BBbQCtBSy3WUL6weEtoojh0I4m3FG7wc/tOuYO9Bln
         G+BfI+y0vdLOWP1pMcePV7KxU7ykes5/NurWrbUQ9YvZPWPPTDcLNDVwYw3DdAMmOU
         jXMxFVNtyNGgE1D/2pHA1++fpJaL2l49qa8i4DuM=
Subject: Re: [PATCH 1/2] usbip: Remove repeated setting of hcd->state in
 vhci_bus_suspend()
To:     Suwan Kim <suwan.kim027@gmail.com>, valentina.manea.m@gmail.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <20190506125550.7826-1-suwan.kim027@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <440389ab-62c3-7bc2-0e9b-0b302a88c929@kernel.org>
Date:   Mon, 6 May 2019 09:13:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506125550.7826-1-suwan.kim027@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/6/19 6:55 AM, Suwan Kim wrote:
> When hcd suspends execution, hcd_bus_suspend() calls vhci_bus_suspend()
> which sets hcd->state as HC_STATE_SUSPENDED. But after calling
> vhci_bus_suspend(), hcd_bus_suspend() also sets hcd->state as
> HC_STATE_SUSPENDED.
> So, setting hcd->state in vhci_hcd_suspend() is unnecessary.
> 
> Signed-off-by: Suwan Kim <suwan.kim027@gmail.com>
> ---
>   drivers/usb/usbip/vhci_hcd.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 667d9c0ec905..e6f378d00fb6 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1238,10 +1238,6 @@ static int vhci_bus_suspend(struct usb_hcd *hcd)
>   
>   	dev_dbg(&hcd->self.root_hub->dev, "%s\n", __func__);
>   
> -	spin_lock_irqsave(&vhci->lock, flags);
> -	hcd->state = HC_STATE_SUSPENDED;
> -	spin_unlock_irqrestore(&vhci->lock, flags);
> -
>   	return 0;
>   }
>   
> 

Tell me more about why you think this change is needed? How did you test
this change?

thanks,
-- Shuah
