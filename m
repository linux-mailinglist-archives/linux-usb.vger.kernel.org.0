Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5AA31FD58D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 21:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgFQTtR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 15:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgFQTtQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jun 2020 15:49:16 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9305DC061755
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2020 12:49:16 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d66so1647805pfd.6
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2020 12:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=2BRxeAR+U6q8t+VU1Iu1irJtfc0+1W6flWjeS/gZ7T8=;
        b=hDONFDdA35jwcrsrcwtljPYfAXJ+ZmME34vuqf3PAughzKJZ1/OAdT5pImyJiR1tAa
         H6ZZjZniZRTl0cff2Pbfi/effw6aD5YvJ0bViib0/ViMh+lVhNKJ3QrtrkUSmGwSOpwG
         kpJlOSnb+SyKLA5yi+j/aNOkhYgCdrt7CAC20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=2BRxeAR+U6q8t+VU1Iu1irJtfc0+1W6flWjeS/gZ7T8=;
        b=ABfZcTSDTOAWSUM60Aq/Bf7jxvYiaQqTZOcH5eKuWF3cGBG8PMcQcpJGh27EOAQypJ
         3PTmHDzbEYlBcmF2NIQc+LJ81Ajv+/gCCXHdl5P8zz3JNpR9jI4DZkz2ZO3/e9EA6YEL
         qzOnOPG65wGUMpeXvlq+dacr/FhEBHAdmLJhGGmLl9L26VUCkqc6x3nKd8g4uEdkBG59
         50KM1v4bOhiw6Al3pI1pvHN3c2kOznElEklpd9cMd1XPSki3bbUIWdueGiOeQ8QD+pWK
         qFswsulIG82Sq4LB4mBxWuQqVDKNimLpCHNLOtulFcMqz7cEcmscOSRpPz/7muIafIgQ
         tRzA==
X-Gm-Message-State: AOAM531GNf4FgW/B47LHIEhwkq1dy5FA0JxilNp7+NmD7pAkavCupoEk
        mRn/Pc31pXpytUltD2iNewnESg==
X-Google-Smtp-Source: ABdhPJxunyHTm899ykNDEVyFYCetYC6rQz0rgIj2zO9ixuXYkV5AOgtWHO3XXmVghGaFh6muOUaZmw==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr372814pgr.418.1592423354823;
        Wed, 17 Jun 2020 12:49:14 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m24sm530608pgb.78.2020.06.17.12.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 12:49:14 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200616133734.1.I1902d0d48e4f3d4c5b5f1a2008108a4cd3c5ddb5@changeid>
References: <20200616133734.1.I1902d0d48e4f3d4c5b5f1a2008108a4cd3c5ddb5@changeid>
Subject: Re: [PATCH] usb: dwc3: qcom: Make sure core device is fully initialized before it is used
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>
Date:   Wed, 17 Jun 2020 12:49:13 -0700
Message-ID: <159242335325.62212.8113067612959846891@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Matthias Kaehlcke (2020-06-16 13:37:37)
> dwc3_qcom_of_register_core() uses of_platform_populate() to add
> the dwc3 core device. The driver core will try to probe the device,
> however this might fail (e.g. due to deferred probing) and
> of_platform_populate() would still return 0 if the device was
> successully added to the platform bus. Verify that the core device
> is actually bound to its driver before using it, defer probing of the
> dwc3_qcom device if the core device isn't ready (yet).
>=20
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver").
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> depends on:
>   https://lore.kernel.org/patchwork/patch/1251661/ ("driver core:Export
>     the symbol device_is_bound")
>=20
>  drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024cd06b..5a9036b050c6 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -537,6 +537,16 @@ static int dwc3_qcom_of_register_core(struct platfor=
m_device *pdev)
>                 return -ENODEV;
>         }
> =20
> +       /*
> +        * A successful return from of_platform_populate() only guarantee=
s that
> +        * the core device was added to the platform bus, however it migh=
t not
> +        * be bound to its driver (e.g. due to deferred probing). This dr=
iver
> +        * requires the core device to be fully initialized, so defer pro=
bing
> +        * if it isn't ready (yet).
> +        */
> +       if (!device_is_bound(&qcom->dwc3->dev))
> +               return -EPROBE_DEFER;

Isn't this still broken? i.e. the dwc3 core driver may bind much later
and then device_is_bound() will return an error here and then we'll
return to the caller, dwc3_qcom_probe(), and that will depopulate the
device with of_platform_depopulate(). It seems like we need to run some
sort of wait for driver to be bound function instead of a one-shot check
for the driver being bound.

> +
>         return 0;

Also, what about acpi? That has the same problem but it isn't covered by
the dwc3_qcom_of_register_core() function.
