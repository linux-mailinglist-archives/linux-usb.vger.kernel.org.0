Return-Path: <linux-usb+bounces-452-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D487AA084
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 22:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A09A1C20D54
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 20:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8328419445;
	Thu, 21 Sep 2023 20:39:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE5A9CA5B
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 20:39:50 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A331EC29;
	Thu, 21 Sep 2023 13:39:48 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c364fb8a4cso12856295ad.1;
        Thu, 21 Sep 2023 13:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695328788; x=1695933588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=M9HdsDbH7/BYH1yt3a5xJbh+tKoPnezjQwqx5ecLr6A=;
        b=nMxdaYdOqHw5sIaJaUL6nsLFOOPkFDdvX84JSuAozb10hOYpWDDg71aXZM8VW4MDmY
         kMN7zrTWC/qk4mfce7b88rWT3YmfuwH5ePTX1m3b7F6vy9waJd/MuQ7+gC3zEzZYyzBl
         Qj74BssfYnTPyqfYbtvqmVVtcpQEW1YUenmffQzx5o4OZnXkQC2fc8MKei8IA7wceSg1
         Lb3T1rFYJ1KvkGD77Pc9/P/V2Cy5mOxI3WhVLgGl55v+rZtMoo1VGqF4GDumqjEvD7mA
         dw/W4DTKzRKJHejt4kv08yNzX4Oa9PdU3MYa5ce8zIKlAkm4RgJUxv3xVdxvGD/uzAYV
         CQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695328788; x=1695933588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9HdsDbH7/BYH1yt3a5xJbh+tKoPnezjQwqx5ecLr6A=;
        b=knCfW5FWVJjRt/aSLWSjw11XPP0sPC4kX/b+p+XOlNlwMOytx9vHE5FeMD//NVigJE
         q/gyz4wHrq5M5Aoo7SSa6zx0JXk5LbHsuQuodpQaHQobmwMVQhUp/Kmvuh0gPzw9QuCa
         AfnVRbiZ6bPuk62PQnjj6zwsTqYke/LgJYaDiMk30UNjs8vOkDyLHJSuPJtiJElz/ar/
         l4a5TQTWccfHBicl55IBTo3isbfMFpFeQukr0EQfDZt1pVeqN1l4GY5MDd0fhTmQzabD
         SBJqIRjugVjj8G2mkbLaMUyowkgQq3/kcmQaIG6CQiAB8+jxoSTC0/m4HpE4idFJR2IP
         QVIw==
X-Gm-Message-State: AOJu0YyM3MOS6NnMaSnCs4KnDkp+RxdQUiSzCQwTLu0ZevQOJ6qsapsk
	rcCEG/eTv/OkRMCgcR7DkTDEdpHmCVo=
X-Google-Smtp-Source: AGHT+IHtcfishFLa/SNsBGuMix9bGq/hR8kaN6+TE0j2kDBGIL6c7ZThAhEG3XamnF/y0g2Gdt2JaQ==
X-Received: by 2002:a17:903:11cf:b0:1c1:f6d1:3118 with SMTP id q15-20020a17090311cf00b001c1f6d13118mr7273168plh.27.1695328788371;
        Thu, 21 Sep 2023 13:39:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l20-20020a170903005400b001bc18e579aesm1966828pla.101.2023.09.21.13.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 13:39:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <82429728-7158-ed85-975e-55739de217cb@roeck-us.net>
Date: Thu, 21 Sep 2023 13:39:46 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RESEND v2] usb:typec:tcpm:support double Rp to Vbus cable as
 sink
Content-Language: en-US
To: Michael Wu <michael@allwinnertech.com>, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230920063030.66312-1-michael@allwinnertech.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230920063030.66312-1-michael@allwinnertech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/19/23 23:30, Michael Wu wrote:
> The USB Type-C Cable and Connector Specification defines the wire
> connections for the USB Type-C to USB 2.0 Standard-A cable assembly
> (Release 2.2, Chapter 3.5.2).
> The Notes says that Pin A5 (CC) of the USB Type-C plug shall be connected
> to Vbus through a resister Rp.
> However, there is a large amount of such double Rp connected to Vbus
> non-standard cables which produced by UGREEN circulating on the market, and
> it can affects the normal operations of the state machine easily,
> especially to CC1 and CC2 be pulled up at the same time.
> In fact, we can regard those cables as sink to avoid abnormal state.
> 
> Message as follow:
> [   58.900212] VBUS on
> [   59.265433] CC1: 0 -> 3, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
> [   62.623308] CC1: 3 -> 0, CC2: 3 -> 0 [state TOGGLING, polarity 0, disconnected]
> [   62.625006] VBUS off
> [   62.625012] VBUS VSAFE0V
> 
> Signed-off-by: Michael Wu <michael@allwinnertech.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v1 -> v2: Simplify expression and add a comment to the code.
> 
>   drivers/usb/typec/tcpm/tcpm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Signed-off-by: Michael Wu <michael@allwinnertech.com>
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d962f67c95ae6..6e843c511b856 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -517,9 +517,9 @@ static const char * const pd_rev[] = {
>   	((cc) == TYPEC_CC_RP_DEF || (cc) == TYPEC_CC_RP_1_5 || \
>   	 (cc) == TYPEC_CC_RP_3_0)
>   
> +/* As long as cc is pulled up, we can consider it as sink. */
>   #define tcpm_port_is_sink(port) \
> -	((tcpm_cc_is_sink((port)->cc1) && !tcpm_cc_is_sink((port)->cc2)) || \
> -	 (tcpm_cc_is_sink((port)->cc2) && !tcpm_cc_is_sink((port)->cc1)))
> +	(tcpm_cc_is_sink((port)->cc1) || tcpm_cc_is_sink((port)->cc2))
>   
>   #define tcpm_cc_is_source(cc) ((cc) == TYPEC_CC_RD)
>   #define tcpm_cc_is_audio(cc) ((cc) == TYPEC_CC_RA)


