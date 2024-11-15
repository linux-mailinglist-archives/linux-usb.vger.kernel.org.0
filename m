Return-Path: <linux-usb+bounces-17628-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8E9CF248
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 18:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48D4D1F245E8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Nov 2024 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CFF1CEE9F;
	Fri, 15 Nov 2024 17:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhvnp+C8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B47824BD
	for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731690035; cv=none; b=F9jKRN+5L0dojACr04LrDLUq6JJ6wd3JozRMKC0ZJOVPaMkVH5Qt10YgCLsJZjKhWvt5e1NWz82wualr7jSBxbcRzUNGAQB4eFaJMJwKcy/AQS7ah19tlzfV6/EFQtGJSBwr6arl1nn4WgbVvVAyULr8vugMRdpYOn0K06/ALH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731690035; c=relaxed/simple;
	bh=7fHXJZ7b5NinPkpC6H0sUbUc7KsfFZpD41FsZYPZOwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KniPQC4lc8fz3v+Nb0LO+fD5VosXTWLxIFPNudr4dSbODP3/pCUAX5qhnwNfquP3jAvC2VwyH184KP6U6ele3W27lJNCWApzHAMedkh/87nSyNbQaVCSZ3XHplWSgBHJwVP01fb8ogsuAs3oE+HYbTrHdqPNWbKnSAB/uHX+GnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhvnp+C8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53da5a27771so2380482e87.2
        for <linux-usb@vger.kernel.org>; Fri, 15 Nov 2024 09:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731690032; x=1732294832; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vp5BxYK8p9Zak2IQUNwDmBirSVmpOKud+gbkwkxz+po=;
        b=lhvnp+C8geewNRuvwASgAr0inkVJHVkp79ufW+3PiqnmpMuth/YHPTMFVx7ACQwaya
         D/KFLr4zhztTEIj7hZdn81tylr/Bzx6yXAf/yxys/6syIrGXwXa1EOewTlrpTBtOLk9J
         JZj6PpUEaqFkb3ub57X29SJjGd1y3dy/vs/BlOSoazb+rY1ZBg5eMyvkBdVZZistZnvB
         bA/0drqI1+7n74oshnpOTbgC2jI9fAQP8V9Y2lwq0lVznq6cUyQYwXbeVp9mdQ5PX4xr
         ojCTdJQid1VIrm1w6da5Rw9kYwXBuPtLa7RkyGKd8GLzj+qKHzgnkijbtLrpMDXtzlss
         q2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731690032; x=1732294832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp5BxYK8p9Zak2IQUNwDmBirSVmpOKud+gbkwkxz+po=;
        b=Cb+vLNE3jEj0vIO/GKu94I0dlMtJRu4RL06kx/jFlTikyWvRClfAjqja9QiIsFezUe
         OYCj91C/l43O6COdu3m6UhTgzS/oEbQf8Z2HWQ9ouPDhvnvQgbAlDcFh1uxCR6aOWLQi
         +Ky9asCMuV2XIeZ5fIctlV7H4ZrooZZKy2IQSd02BQvJRTGxCcwrcP1MN034SiGLnaz7
         t8ScTaH7BvIs1U7Zn92asoLWxXoqA5X2rgfxPf3nOoGrEo6p18nHpAHSIQKp+bh7CpnK
         SYThiAmt8vZ30XL/lxv1WHWUZkTTAlh4ZNCByASeisxnCp0dpCYQF1rNcVT6j89Lmjb4
         uCWg==
X-Forwarded-Encrypted: i=1; AJvYcCUGpB/vyl8/Dv7FtiIApKii+0d0fbLGAZwNbaRFXwkRCDkSCwToSvrQMpnWzuE9oZqSier42df5Bxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+kVFiuON3UWT0QA5Ar2kkqT6Lo1FywK6C3ft2mYxStU532bRs
	KSsMuCtLSWicJrIruPFl5HHPxtv2Y/K9DzFtZXmHTEu6aqD2l/cQ/HD5GQ/VAJc=
X-Google-Smtp-Source: AGHT+IHRrzx4sh1fkJneoEq99zQMT8VlMI4f6yDZI/hglJ3VA6yZDbjQ0cdqMIe9VHzQYIFJD4uwkg==
X-Received: by 2002:a05:6512:3b24:b0:53d:a95b:b2e7 with SMTP id 2adb3069b0e04-53dab3b0f70mr1607911e87.55.1731690031976;
        Fri, 15 Nov 2024 09:00:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6530f83sm626597e87.163.2024.11.15.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 09:00:30 -0800 (PST)
Date: Fri, 15 Nov 2024 19:00:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <jatq645z65hthaud4up6h6mxbggqpm73djtd6t3fxxkwccsifu@bb7bn24b7dak>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
 <20241115155234.1587589-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115155234.1587589-3-ukaszb@chromium.org>

On Fri, Nov 15, 2024 at 03:52:33PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 ++
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 248 ++++++++++++++++++++++++++
>  4 files changed, 269 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

> +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> +{
> +	return ucsi_sync_control_common(ucsi, cmd);
> +}
> +
> +struct ucsi_operations cros_ucsi_ops = {
> +	.read_version = cros_ucsi_read_version,
> +	.read_cci = cros_ucsi_read_cci,
> +	.read_message_in = cros_ucsi_read_message_in,
> +	.async_control = cros_ucsi_async_control,
> +	.sync_control = cros_ucsi_sync_control,

.sync_control = ucsi_sync_control_common,

> +};
> +

[...]

> +
> +static int __maybe_unused cros_ucsi_suspend(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	cancel_work_sync(&udata->work);
> +
> +	return 0;
> +}
> +
> +static void __maybe_unused cros_ucsi_complete(struct device *dev)
> +{
> +	struct cros_ucsi_data *udata = dev_get_drvdata(dev);
> +
> +	ucsi_resume(udata->ucsi);
> +}
> +
> +static const struct dev_pm_ops cros_ucsi_pm_ops = {
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend = cros_ucsi_suspend,
> +	.complete = cros_ucsi_complete,
> +#endif

SET_SYSTEM_SLEEP_PM_OPS ? Or even better, DEFINE_SIMPLE_DEV_PM_OPS() ?

What is the reason for using complete() instead of resume()?

> +};
> +
> +static const struct platform_device_id cros_ucsi_id[] = {
> +	{ KBUILD_MODNAME, 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
> +
> +static struct platform_driver cros_ucsi_driver = {
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.pm = &cros_ucsi_pm_ops,
> +	},
> +	.id_table = cros_ucsi_id,
> +	.probe = cros_ucsi_probe,
> +	.remove = cros_ucsi_remove,
> +};
> +
> +module_platform_driver(cros_ucsi_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("UCSI driver for ChromeOS EC");
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry

