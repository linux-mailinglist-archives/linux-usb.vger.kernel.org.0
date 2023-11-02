Return-Path: <linux-usb+bounces-2470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3428B7DF8A9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 18:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E40D9281CDA
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 17:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D975200D1;
	Thu,  2 Nov 2023 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFzMsrzV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7611DFFC
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 17:26:02 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD54197
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 10:25:54 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50797cf5b69so1393196e87.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Nov 2023 10:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698945952; x=1699550752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkn3ND/+4lRJR4Hkr4BWfJwvOOQfWf9I0uQuF9lSK00=;
        b=LFzMsrzV5RW1AQP3KoGncQ3Jtf70U9ZIjgPa7HNGIzXgNUIfL51LQ6IHx36xhW1cjc
         q0Sh6AWjl9ru53O4XFZHLAnoWxymp6MxaUUZSTabnEinJne3KdPs1PumLgH6B+sIX81L
         a0ysOj093lRPZab134b/iV4Sw8StraFMqcv6TueSKpwudHH98aZTZAkkLSZhNFYkSp0X
         r4+HIPqpowrmhk4qG7P4px8dWgDV0iPjCCZaMVe37Clf4HsTMbcoWB4PNGBcV5JGVOcz
         VUmMFWt+nP/b4lafHt6BDD1CgHmTwIvmOK6xo2sB7eJ3uEHz0g9xHMVUEQ6APUAtWGGo
         LVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698945952; x=1699550752;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkn3ND/+4lRJR4Hkr4BWfJwvOOQfWf9I0uQuF9lSK00=;
        b=xAwkEK3LZsvmSBCBRLoj//LDJ/mXBXH5a5WWy+L03syxstr4JT5v3OqyCmAmABjoF2
         0e2tkQOu2Ozgc8zO9ObJL/NdvuBbya2c8LeIjlYTQYIFXOi0idawnvZYXDOntRbtrMPo
         lLSifKDcu8ZhHS1r3lT85eSZaVwSIVLATtTuioRyd76/vX+uaaef3/3l3DoHQN3OA7fj
         jSzgUBikalpmJLbtKvOP3FYme4cG+CyM4yV4SJCqsRzuqbM/UbKrs+va4CVGyMftwrgy
         h3zloM96+r/ahdBHNqy40NHmpJjRAu1u1nepWwizpQ9zoU/JBA+ykXd8fFNG0dPWcwMN
         NETg==
X-Gm-Message-State: AOJu0Yz3Ge3Nb5ljbXcG2o+miFUcW/B3EO7KIKf4aCWYMI4nIjdfxBbf
	ED1mW1f5e72M44RzhwaKgAWhfTUyPjM=
X-Google-Smtp-Source: AGHT+IHGDBh5rcw4VquN8oTaTMEgoqxqos3CSdBjl7DQUfUiTVgFyNixTaWr/+/UDPJ97qtNNJw+TA==
X-Received: by 2002:a05:6512:1093:b0:503:1bb0:a658 with SMTP id j19-20020a056512109300b005031bb0a658mr19123396lfg.32.1698945951707;
        Thu, 02 Nov 2023 10:25:51 -0700 (PDT)
Received: from [192.168.1.103] ([31.173.85.72])
        by smtp.gmail.com with ESMTPSA id j14-20020ac2550e000000b00507a66f747csm31772lfk.30.2023.11.02.10.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 10:25:51 -0700 (PDT)
Subject: Re: [PATCH] usb: misc: ljca: Fix enumeration error on Dell Latitude
 9420
To: Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wentong Wu <wentong.wu@intel.com>
Cc: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <20231102164817.547128-1-hdegoede@redhat.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <1027800d-7740-c52e-e372-9993888ecd8e@gmail.com>
Date: Thu, 2 Nov 2023 20:25:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231102164817.547128-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/2/23 7:48 PM, Hans de Goede wrote:

> Not all LJCA chips implement SPI and on chips without LJCA reading

   LJCA chips without LJCA?

> the SPI descriptors will timeout.
> 
> On laptop models like the Dell Latitude 9420, this is expected behavior
> and not an error.
> 
> Modify the driver to continue without instantiating a SPI auxbus child,
> instead of failing to probe() the whole LJCA chip.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index c9decd0396d4..24f781782c56 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -656,10 +656,11 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
>  	unsigned int i;
>  	int ret;
>  
> +	/* Not all LJCA chips implement SPI a timeout reading the descriptors is normal */

   Comma missing after SPI?

>  	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
>  			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
>  	if (ret < 0)
> -		return ret;
> +		return (ret == -ETIMEDOUT) ? 0 : ret;

   I don't think the parens are necessary.

[...]

MBR, Sergey

