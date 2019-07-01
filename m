Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1287614FCE
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 17:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbfEFPQB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 11:16:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:43352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726229AbfEFPQB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 11:16:01 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F05C2053B;
        Mon,  6 May 2019 15:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557155760;
        bh=U6Vyjp97VlH44xcjqVqARjbbyRorzalrxW/bmXKjuu4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Kx9tOpblCIPNnWBZ2ejj2b9Vm3/Nic6lFJZU8Lck4WpwNazTlgN6acHsWuu+yUHbx
         PeclSfNv9BHX388vHfWFeILlZIyxk8wms3mo2SNA871txaSosrzBtPQ0/pmfQ1Ultn
         iLugm8WeN177OqR1VqSx1UuBgZJUu3tfZZczrrtk=
Subject: Re: [PATCH 2/2] usbip: Remove repeated setting of hcd->state in
 vhci_bus_resume()
To:     Suwan Kim <suwan.kim027@gmail.com>, valentina.manea.m@gmail.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <20190506125550.7826-1-suwan.kim027@gmail.com>
 <20190506125550.7826-2-suwan.kim027@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <c5c1c46a-14dc-250c-2c14-2868079222e4@kernel.org>
Date:   Mon, 6 May 2019 09:16:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506125550.7826-2-suwan.kim027@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/6/19 6:55 AM, Suwan Kim wrote:
> When hcd resumes, hcd_bus_resume() calls vhci_bus_resume() which sets
> hcd->state as HC_STATE_RUNNING. But after calling vhci_bus_resume(),
> hcd_bus_resume() also sets hcd->state as HC_STATE_RUNNING. So, setting
> hcd->state in vhci_hcd_resume() is unnecessary.
> 
> Signed-off-by: Suwan Kim <suwan.kim027@gmail.com>
> ---
>   drivers/usb/usbip/vhci_hcd.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index e6f378d00fb6..335d61676fb4 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1252,8 +1252,6 @@ static int vhci_bus_resume(struct usb_hcd *hcd)
>   	spin_lock_irqsave(&vhci->lock, flags);
>   	if (!HCD_HW_ACCESSIBLE(hcd))
>   		rc = -ESHUTDOWN;
> -	else
> -		hcd->state = HC_STATE_RUNNING;
>   	spin_unlock_irqrestore(&vhci->lock, flags);
>   
>   	return rc;
> 

Tell me more about why you think this change is needed? How did you test
this change?

thanks,
-- Shuah
