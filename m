Return-Path: <linux-usb+bounces-965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C167B596B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 19:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id C686E2832DF
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 17:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE531E52F;
	Mon,  2 Oct 2023 17:48:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA99199B2
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 17:48:45 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07B890
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 10:48:43 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6c4a25f6390so9810014a34.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Oct 2023 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696268923; x=1696873723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArpFlxjb/tidMMcoJLYiYql1O9zWxusIpcC7Xf3Yrv4=;
        b=L4tyU9W87E5gBgzFbbfIzzszmX2khfhG/Dg8BtFjNh25BrxD60mUSDI9LadUNepaMg
         /XId8ionBj3uXx7pjv8d5vcrYObcq5NllYhFLh5a+LxjkA8GVAYe3QLMUsJPph1hmIbJ
         l43nfZqq73BUGVWHfjIGUx7XchSkSNSNE7mf9Mk48wNslxE++AWPX8Z9zVyZDo22mlm4
         FFku//x8Kf2VsKQ4sq5pgpNlaumAiTdYDywh2tuJb0kj5D7PnejndnvzaiDioXCu9KHY
         4JSk+AUKEx9PT9qsiMlNdmp8FyPXajkdddyyC/4F4sWR4FPb8TVnX8EzwWAmEe6QF5mN
         tQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696268923; x=1696873723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ArpFlxjb/tidMMcoJLYiYql1O9zWxusIpcC7Xf3Yrv4=;
        b=YnOHhugYhkyUnLxoiMESu63EYM5f7dfd1xngx51N8MJBJurvsdL88cJOEkWEQxV39U
         26eWVuk01pv54t3+EqDqgG+iGLRWuHSKlj6oHIPh06jnx/4RxveYztjbtYe57O46NzwS
         v4W2PFvF7NjO+HrjYhg/C+x+WOTyJILyGwajM7s/wrbHnCMEsaz9Afc+bLLKoptapwwZ
         1siZo14ZlZ/38ONBBsattezOPg6MRVB9XzdJ4VoT7zCg9V5BgkKCeDucN/ETiw69YK9f
         j7RDd402W5lDiu28ebV+NmoSkmhhH/2aNl+kYjG3I+J0qMNNXaambslVAW+R0/i+BU40
         6nsw==
X-Gm-Message-State: AOJu0YxFyJmn2T9MLlY35wsaJhLJINunxaFGpveEb5dRvvoyW4dXuVxR
	9Oz81YJum/pWET/ykc5OJ2M=
X-Google-Smtp-Source: AGHT+IHXgbOxQO/3FVyfcMyGHfuyiRpkzj+9CBmXBjHIFHWsN38ijpCRLMxgci9k4aGskYYWiUzStA==
X-Received: by 2002:a9d:6d0f:0:b0:6c4:c151:8ebe with SMTP id o15-20020a9d6d0f000000b006c4c1518ebemr12392905otp.22.1696268923063;
        Mon, 02 Oct 2023 10:48:43 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.229.27])
        by smtp.googlemail.com with ESMTPSA id n16-20020a637210000000b0057408a9b3a8sm19626725pgc.42.2023.10.02.10.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 10:48:42 -0700 (PDT)
Message-ID: <1e67fdfa-be41-6d8f-4b1a-e26f098a6bfc@gmail.com>
Date: Tue, 3 Oct 2023 00:48:39 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] USB: serial: option: Sierra EM9191 with new firmware
Content-Language: en-US
To: =?UTF-8?Q?Beno=c3=aet_Monin?= <benoit.monin@gmx.fr>,
 Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <f72b49af24b281f80bb217cff04d0cc249f229b6.1696261301.git.benoit.monin@gmx.fr>
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <f72b49af24b281f80bb217cff04d0cc249f229b6.1696261301.git.benoit.monin@gmx.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 10/2/2023 22:51, Benoît Monin wrote:
> Following a firmware update of the modem, the interface for the AT
> command port changed, so add it back.
> 
> T:  Bus=08 Lev=01 Prnt=01 Port=01 Cnt=02 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=1199 ProdID=90d3 Rev=00.06
> S:  Manufacturer=Sierra Wireless, Incorporated
> S:  Product=Sierra Wireless EM9191
> S:  SerialNumber=xxxxxxxxxxxxxxxx
> C:  #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=896mA
> I:  If#=0x0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> I:  If#=0x1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=(none)
> I:  If#=0x4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> Signed-off-by: Benoît Monin <benoit.monin@gmx.fr>
> ---
>   drivers/usb/serial/option.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 7994a4549a6c..73971a3a1897 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2262,6 +2262,7 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },			/* GosunCn GM500 ECM/NCM */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(OPPO_VENDOR_ID, OPPO_PRODUCT_R11, 0xff, 0xff, 0x30) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x30) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0xff, 0x40) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
>   	{ } /* Terminating entry */
> 

No need to add additional lines in the driver, the entry can be 
simplified by removing the previous two lines and add a single line 
using the USB_DEVICE_INTERFACE_CLASS macro.


Thanks
Lars

