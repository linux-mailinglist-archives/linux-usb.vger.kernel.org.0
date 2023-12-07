Return-Path: <linux-usb+bounces-3808-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69F9808398
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F08221C21D1E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 08:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A7B2209E;
	Thu,  7 Dec 2023 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa5BR4On"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D75B10B;
	Thu,  7 Dec 2023 00:54:35 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50bf7bc38c0so459785e87.2;
        Thu, 07 Dec 2023 00:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701939273; x=1702544073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EiRs0yKlJ/67lCpuOUoZgH8XdcgjhbQ1+ghMbk1xR8=;
        b=Fa5BR4On6yto65P9KxVP68NVYndWbZraNnWWGwHX/Fb5OBbCAdc7wZCwTwzPkF4qlu
         bzCj55nSLv4zIkvqrxOCWkdfmFZjYt6u0Z+xTlVydOlqWZlPUPW12Q5flQpJ7BVIO2U0
         A+aICg9KBJgp4aDQ6JSJwnEb0tMb0bZSjUc1Jb0tQcSjmQ6WvbmkkuROw+UxR8gOQw2h
         9wbOBbHDCxl0lWri442czFGgq9KTkujyFegy99u/pYs6UWpTSgAswISQJ5pM8dHZFXe6
         3ixGdl1l+gOay/PDVpa87uI8eDiK3lukdF5caVfyOxDXBZU+2nW6LEVEEN4j8h/qyyDF
         eAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701939273; x=1702544073;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3EiRs0yKlJ/67lCpuOUoZgH8XdcgjhbQ1+ghMbk1xR8=;
        b=cqYY6x2foFWsRrW0uZP23tjmvtGPVIgJj4czuk7Ve4gEjpU1aQuRpvoGWBET63agLB
         EQQzO3bHHozw3LeW0jHEa1K1+TFQthrA7U5zKm2HONMK/yg9bKDshwR+u8qVAxCJyw8a
         UF800E1ZRXQTHrfTs+aRDUaA/QkRJ3BwOhqe3F6+vM85LZgB1/MdMuBQCTd2hXpx30sa
         /tggPyr7k7CJN8n0Mu3tZib4TYz3/RhlC7x5vHkkL5MDq/9OdSBBRFEkT6CT3nAHSDfJ
         mD1qAvblYhRGuw+186d7ZWW6Fz7et3TmFJXExYESUGh0Kx37695u8iWkhIAjoj9YdCVD
         YYoA==
X-Gm-Message-State: AOJu0Yzsxq3gfTQlFikApnJ8rabCdm5DWuxnECL6Um5aX/0Ey3L9k4DB
	K1q6hwOlFlZQ21I5inUNlGoWOqUYe7E=
X-Google-Smtp-Source: AGHT+IH0MaeQfjMj8y6bVmqtFg2EdC9Pw0xMj6zb8zbGu18Y4G0tn+n8W7nlDcSFx+86bbIJbuPifg==
X-Received: by 2002:ac2:5147:0:b0:50b:f51a:2997 with SMTP id q7-20020ac25147000000b0050bf51a2997mr1060183lfd.83.1701939272656;
        Thu, 07 Dec 2023 00:54:32 -0800 (PST)
Received: from [192.168.1.104] ([31.173.85.22])
        by smtp.gmail.com with ESMTPSA id h13-20020a0565123c8d00b0050befdfd3cfsm112164lfv.215.2023.12.07.00.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 00:54:32 -0800 (PST)
Subject: Re: [PATCH v3 RESEND 1/4] phy: core: add notify_connect and
 notify_disconnect callback
To: Stanley Chang <stanley_chang@realtek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Rob Herring <robh@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Flavio Suligoi <f.suligoi@asem.it>,
 =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20231207074022.14116-1-stanley_chang@realtek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <c0af54de-2664-4c20-2d01-7fc64c98b238@gmail.com>
Date: Thu, 7 Dec 2023 11:54:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231207074022.14116-1-stanley_chang@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/7/23 10:38 AM, Stanley Chang wrote:

> In Realtek SoC, the parameter of usb phy is designed to can dynamic
> tuning base on port status. Therefore, add a notify callback of phy

   To be able to do dynamic tuning based in the port status, maybe?

> driver when usb connection/disconnection change.
> 
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
[...]
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 96a0b1e111f3..a84ad4896b7f 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -489,6 +489,53 @@ int phy_calibrate(struct phy *phy)
>  }
>  EXPORT_SYMBOL_GPL(phy_calibrate);
>  
> +/**
> + * phy_notify_connect() - phy connect notify

   Notification?

> + * @phy: the phy returned by phy_get()
> + * @port: the port index for connect
> + *
> + * If phy need the get connection status, the callback can be used.

   If the PHY needs to get the connection status, maybe?

> + * Returns: %0 if successful, a negative error code otherwise
> + */
> +int phy_notify_connect(struct phy *phy, int port)
> +{
> +	int ret;
> +
> +	if (!phy || !phy->ops->connect)
> +		return 0;
> +
> +	mutex_lock(&phy->mutex);
> +	ret = phy->ops->connect(phy, port);
> +	mutex_unlock(&phy->mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(phy_notify_connect);
> +
> +/**
> + * phy_notify_disconnect() - phy disconnect notify

   Notification?

> + * @phy: the phy returned by phy_get()
> + * @port: the port index for disconnect
> + *
> + * If phy need the get disconnection status, the callback can be used.

   If the PHY needs to get the connection status, maybe?

[...]
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index f6d607ef0e80..cf98cb29ddaa 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
[...]

MBR, Sergey

