Return-Path: <linux-usb+bounces-3905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE280A376
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 13:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B986D1F213CB
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 12:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2976A1BDC5;
	Fri,  8 Dec 2023 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U3xKEXqq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8ED1985
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 04:38:03 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d8ddcc433fso16988157b3.1
        for <linux-usb@vger.kernel.org>; Fri, 08 Dec 2023 04:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702039083; x=1702643883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IR7p3VCuqTrXdfqqAHl0q0Bm2x8PVy01TiFzisyyuoQ=;
        b=U3xKEXqqOqr8kYcSF8ySZC1idHPI678Z8Hv6U2cYF+aOvzbHT7nVWHGXY4w0C5Lmqd
         jVK2iC42/uQf5jGO3daHIizo7iBfhTpBllT9GD2WuSNJYJHJO17YopQd4l3tTeEpBKg2
         j8oThaJ48fgdN75HWqiPEsXO9N04Wjr2UtvuCqpEocQPOFku5PlVT+I3M0tehzNlyeuK
         225f35ntPlfnqeCOWQQFJ3L3PQB994R80H37DUA6hwjhjwPnXOSxKgEam0KvlPmjcvkb
         Q1g+5DJx7LJUZndgHJBJKu9QEG9pdTehTZxIaVm4Ehrly7lRkT3bK52HTrAkxgEev/yE
         ymUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702039083; x=1702643883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IR7p3VCuqTrXdfqqAHl0q0Bm2x8PVy01TiFzisyyuoQ=;
        b=HmBX2OQWU+gWbmXbycjDM6O5kElG1Ph+chYcIhE0sl7aaoWXlsyDNdsg2MFX1gaoJa
         YG9vRUN03yequWWbin7CaW5ditzvwG+FjGfZ/W9D3i0CLBlzYPYWG1oqfaSSvwJds9Uk
         dOyUMXD5mIA0+nkVJGfT1W1xm1aqlLLjZLualnQOGr5LpGKRoojRgSL9yrJKKM6FX9OO
         DHA6//ADf92LMZJAKrRzQC7oCeWkWWUO39Sf1aWGsBK7IPQnMFw4VaNux/wQwthOZ+qP
         dpz53vSPSxCmYPEtg/a29H+TEPhgvbV2MHJE2OyxkTJxsWLWsuYcVMixuGk6vuzXJYoG
         qoLg==
X-Gm-Message-State: AOJu0YwBBDDynS7W4CleKL8CeDFxNCusNp7WD/RCv6DR0WIVl606lAh6
	hzbW7Vj3NsXBLsPYL6h0Xxzv+h0qn3NFRCyiZDpBVg==
X-Google-Smtp-Source: AGHT+IF0UH2sSQEBhchSZl4V91/za1XaFiXUOZ2Bew0ljWKjs7t8gKn2zMfV8GKpJyu2LPXASRcEXFTBMQVPbMqgbkw=
X-Received: by 2002:a05:690c:fc2:b0:5d7:1940:8dd9 with SMTP id
 dg2-20020a05690c0fc200b005d719408dd9mr3633060ywb.64.1702039083054; Fri, 08
 Dec 2023 04:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208123603.29957-1-johan+linaro@kernel.org>
In-Reply-To: <20231208123603.29957-1-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 14:37:52 +0200
Message-ID: <CAA8EJppxG36=dRHkpuZfUu-H2L93iTU3fY1bdA0gN5w6KW3x2Q@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: fix gpio-based orientation detection
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 14:37, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Fix the recently added connector sanity check which was off by one and
> prevented orientation notifications from being handled correctly for the
> second port when using GPIOs to determine orientation.
>
> Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>
> I found this one through inspection when skimming the driver.
>
> Johan
>
>
>  drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index db6e248f8208..4853141cd10c 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -228,7 +228,7 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
>
>         con_num = UCSI_CCI_CONNECTOR(cci);
>         if (con_num) {
> -               if (con_num < PMIC_GLINK_MAX_PORTS &&
> +               if (con_num <= PMIC_GLINK_MAX_PORTS &&
>                     ucsi->port_orientation[con_num - 1]) {
>                         int orientation = gpiod_get_value(ucsi->port_orientation[con_num - 1]);
>
> --
> 2.41.0
>


-- 
With best wishes
Dmitry

