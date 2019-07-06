Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5810360F69
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 10:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbfGFILX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Jul 2019 04:11:23 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45297 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfGFILW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Jul 2019 04:11:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id m23so11241060lje.12
        for <linux-usb@vger.kernel.org>; Sat, 06 Jul 2019 01:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=adacnbL2N960EFPA/kidZWPL/nChLL85l/hWsV4a7AM=;
        b=qURmnkZN1PoHLuL4kmXFc26c3QGQl/dSjiQHagzfbuH46BQHjEiofHbrNIun3hm5Vw
         AHglEn+h/qvtybNq0KqamVSuCiHbVSIdMM1dlP245qb4v1gny9GFHc1mweOJRV2l87Qn
         +BLEjQiuEDXwFeKpKIJgVF5vPLsozRts6fvhSG0TjflTfMfftngLnXTrz8naB/8ej1OC
         qYffuMP962oGtzKjfQv8DwehA+CgLbFKKai5+lw20leKsxThpU7f+cRztoDAP/EVB1gQ
         KOWWCL1209hheJgglZDVqnjYgR8nVE+R8S9A7vZFOijK8xx58zPe7Yk9p902U9G0bV0J
         DOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=adacnbL2N960EFPA/kidZWPL/nChLL85l/hWsV4a7AM=;
        b=rO/17U3Jg5uMs9kzqPWbpLrX/kKHB8cje8iwW//jAtMk/j5nT1TAHzTgrXbs46JsQc
         fcpKvCxwQZGRG5voTlsL0f8mXDJYFAjgdzRLJMiY8PguwLfYeRu6e9H91mSfBa90QxFE
         PoaCuQPyaJ6P6XygEihy5QVVL4UXQQR8sI2ezQ+0IyP6JKrHK6ydhg1VcNQN9I9TI25K
         1nw3B2d01zIkKH8A1BWIDDo7Cc0kxm5a3QYtqU422PnZxz279lA5AjNYsPMUy3IujSEw
         TP6MeZOeAEGgIP8uKCaUgGOOdRTLr0MZeqbHUAPIvEwLJ6ucc8DQ0mAc4VPpGpC380jA
         K/Lg==
X-Gm-Message-State: APjAAAUHSXnCNa4GBbk/gi0yzC7pVE52SsPcSlHfwGiMJCdYu7KacH2x
        WoN4madtGL+ufZnCBnJDjyc5JzIhAViLKw==
X-Google-Smtp-Source: APXvYqzNNgm1YCDdvNOR/rMFkgphxJCXqHdU1TXHiYakFJW8oJXzAf1IS5/HyddpZyRUelIi77nbgg==
X-Received: by 2002:a2e:9857:: with SMTP id e23mr4256193ljj.217.1562400680804;
        Sat, 06 Jul 2019 01:11:20 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:44f5:814c:7431:edc9:9838:64b4? ([2a00:1fa0:44f5:814c:7431:edc9:9838:64b4])
        by smtp.gmail.com with ESMTPSA id v7sm2300564ljj.3.2019.07.06.01.11.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Jul 2019 01:11:20 -0700 (PDT)
Subject: Re: [PATCH 02/10] usb: gadget: aspeed: Cleanup EP0 state on port
 reset
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
References: <20190706005345.18131-1-benh@kernel.crashing.org>
 <20190706005345.18131-3-benh@kernel.crashing.org>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6e554955-6a4f-06b1-82b3-982e5e299d19@cogentembedded.com>
Date:   Sat, 6 Jul 2019 11:11:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190706005345.18131-3-benh@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 06.07.2019 3:53, Benjamin Herrenschmidt wrote:

> Otherwise, we can have a stale state after a disconnect and reconnect
> causing errors on the first SETUP packet to the device.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
[...]
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> index e2927fb083cf..5054c6343ead 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/ep0.c
> @@ -459,6 +459,15 @@ static const struct usb_ep_ops ast_vhub_ep0_ops = {
>   	.free_request	= ast_vhub_free_request,
>   };
>   
> +void ast_vhub_reset_ep0(struct ast_vhub_dev *dev)
> +{
> +	struct ast_vhub_ep *ep = &dev->ep0;
> +
> +	ast_vhub_nuke(ep, -EIO);
> +        ep->ep0.state = ep0_state_token;

    This line is indented with spaces, previous with a tab.

> +}
> +
> +
>   void ast_vhub_init_ep0(struct ast_vhub *vhub, struct ast_vhub_ep *ep,
>   		       struct ast_vhub_dev *dev)
>   {
[...]

MBR, Sergei
