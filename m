Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0485D2C0165
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 09:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgKWIUY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 03:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKWIUX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 03:20:23 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1F8C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 00:20:22 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so14229148pfn.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 00:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Mo0Sq/OzugcX97oreNJE3KHVwzOxGHyEtciIJ5e7V8I=;
        b=RxRK+i+jCTbdPUrYg5fWbnGDtz33PWkkWl0zBjBchH2KFQetHERottW91emNnI+6xE
         gyHJeTwLGe+joGdr1XMd/kNVSY2yMmRbcOGLj2PByvvWPDuX/OokrDnZE7J/d6bA7J1R
         y9Q/mYCQl/FnO3lyTwG/4kLvT7LJfDm0/0xGvpI4ABqW01dApl0MkFlLiHkfKz1fCtE6
         nFhYPL8sK2dJ4ov/TDneQHbzGxvTLFEykNRcbqEw0je8NAZbD5c0dGWZZ8G5gOkFFgz0
         8SXRXiOZgIUSxm7jVkbxSPlhHgkCgbrt2c0gKoVkFxdzlY1DFwZ9uW50iQkdIAQLUiXH
         L+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mo0Sq/OzugcX97oreNJE3KHVwzOxGHyEtciIJ5e7V8I=;
        b=PiyWBib3xbxFIVCOhbpbdwnpmRSQrNNCP/gCqI8wx2rq/5r6780JDDAEUvSpksMNe/
         OZjvrUbdDJ8xYLipX7nZ2Lzq+LNp/W/fiEmPDD+LG0a679SDGul3iiup9mhUjcalMyKn
         avRlqW8d8yD9YKTuU1exyZIoOZ2en59Dy2oyc6XVonIgIu9XBLmN3r9CnBHPQTI57u3n
         3paEcE4v85nfl9BAWbLtRqOkjCiNVANlVAOmD233mg6yHWiwtrly41cFKncpZzglpozV
         8cwj/1NWQS0n0Mv14kjzP9w5vjDt2Ij0RL0OqMGteXyeo5kD+J4/Hv8ofuT++9GsUiDe
         Nq4A==
X-Gm-Message-State: AOAM531crSRTbI7Ccq5IIVng5/+DjTWNl6ePLa7JrHmIvn1Iim7sr/ic
        Rpbx+3Yoh7MtrbV0WheHVQ0OuxktNJ0=
X-Google-Smtp-Source: ABdhPJzBdGy004AdS2W/VowWcFa6K509Ep15vcw7pKLvk5l9a1rOWtj9N0p+L5Yc+aAPr3ERcRsH+A==
X-Received: by 2002:a63:d547:: with SMTP id v7mr26050989pgi.375.1606119622120;
        Mon, 23 Nov 2020 00:20:22 -0800 (PST)
Received: from [192.168.1.5] ([159.192.85.80])
        by smtp.googlemail.com with ESMTPSA id x8sm11105173pfi.24.2020.11.23.00.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 00:20:21 -0800 (PST)
Subject: Re: [PATCH] option: added support for Thales Cinterion MV31 option
 port.
To:     Giacinto Cifelli <gciofono@gmail.com>, linux-usb@vger.kernel.org
References: <20201119115931.19050-1-gciofono@gmail.com>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <981fe0c1-58be-21b8-0e6b-bd19d0b26ce5@gmail.com>
Date:   Mon, 23 Nov 2020 15:20:19 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201119115931.19050-1-gciofono@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/19/2020 18:59, Giacinto Cifelli wrote:
> There is a single option port in this modem, and it is used as debug port
> 
> Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>
> ---
>   drivers/usb/serial/option.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 54ca85cc920d..3ad86a6e8487 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -424,6 +424,7 @@ static void option_instat_callback(struct urb *urb);
>   #define CINTERION_PRODUCT_AHXX_2RMNET		0x0084
>   #define CINTERION_PRODUCT_AHXX_AUDIO		0x0085
>   #define CINTERION_PRODUCT_CLS8			0x00b0
> +#define CINTERION_PRODUCT_EXS82			0x006c
>   
>   /* Olivetti products */
>   #define OLIVETTI_VENDOR_ID			0x0b3c
> @@ -1908,6 +1909,8 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC25_MDMNET) },
>   	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDM) }, /* HC28 enumerates with Siemens or Cinterion VID depending on FW revision */
>   	{ USB_DEVICE(SIEMENS_VENDOR_ID, CINTERION_PRODUCT_HC28_MDMNET) },
> +	{ USB_DEVICE_INTERFACE_CLASS(CINTERION_VENDOR_ID, CINTERION_PRODUCT_EXS82, 0xff),
> +	  .driver_info = RSVD(1) | RSVD(2) | RSVD(3) },
>   	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD100),
>   	  .driver_info = RSVD(4) },
>   	{ USB_DEVICE(OLIVETTI_VENDOR_ID, OLIVETTI_PRODUCT_OLICARD120),
> 

There is only one interface in this device that should be driven by 
optiom, the first interface which likely is a diag interface.
All other interfaces are driven by CDC drivers and they will not be 
taken by option so no need for the blacklisting of them.
Remove the .driver_info line from the patch.

thanks
Lars
