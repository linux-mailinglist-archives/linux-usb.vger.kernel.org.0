Return-Path: <linux-usb+bounces-15003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0259769CF
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 14:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260EA1C21052
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 12:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9119E1A4E80;
	Thu, 12 Sep 2024 12:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fHny3ysM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC3D1A4E85
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145899; cv=none; b=IYMivo76ENqMbsCtGvEI9vHyRM7SELRK4JZhz/tjbBCT+j8wRFAW4jVu8f91/d+iEUeSXFFpDW0ntSXRDqz/LbA7+Tx5ZaxG+i6sQhTr4FG9TN9PBTUoKMA0luaVpdtVthJMBwUBQqgmYeoN2Jwew7zubYjM/ah+akJ7vbbq78E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145899; c=relaxed/simple;
	bh=JMytHvw3cW5fuz7PGFt/aVbf6j+BbuGj2j5K/qPJfLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7GwhYZHLed4rA/kSu+ck4tP1ctJ09EnY+fG8Q/6hQ22A0Qx7yxQjR/WdkEwMpucEQ8v5xp0QsIawzP8w/+afbMGFHCC6+cXo2AeFtfOvIIgFeNkEkjt4G0gpJZx+V4I9PTwik5PGSQbYZ1fA084kvUJFfGkJ1y/TkG64Ba6HHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fHny3ysM; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5356ab89665so1057051e87.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726145895; x=1726750695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sPNASrfr2JDJuTNCjZzvsAqKcoboxa5LJqI+TTVNr50=;
        b=fHny3ysMfHuzjYyoj280pJeKVrr/Zcy0+/rPlPQ9Yy2/ajH3+IR//nF7WOJMQnbPBu
         0Io1qz1g0RJ6/Ark1/IwLOYRT4x623A198j/LOdEt6osHrhR0y0s1VkvWKyftgwkqF2C
         txv935Q0/ylJzoj0P8mPM7k8AEKMQHEGDYWEs0YbrSbuoFklu7407M3Dnew4phXAG5QE
         0A3W7e/LIulSXZHeyk+UcAJUXEuk51S20mHnGvVqN2eKghzEAX+9PoyDuAwMU9g1uEsO
         nipuv2JpB+/QOce6skCZMmXdJLWboLkxtIXrDLVBowbdqb7mU9Oh5J0TUO7f63aWzh0G
         mVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145895; x=1726750695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sPNASrfr2JDJuTNCjZzvsAqKcoboxa5LJqI+TTVNr50=;
        b=JJhpqZgndwpJCaCqMHt75VQV2ixCKWh7Cx0Vq1j+shKIxiyL8TmOq6HjT0Jna/rpwN
         e6EHEMPEYng4QMHdzUGpt7gZWlp6Nuyaxg42jo/aZHWfGRbhKcNjL6u8xEcqJBU0JWDZ
         qPxMe08sTuFm5LVbXqhck7QXce+uIwEP8CrKpZqQRxKbLyWRC9Qc3a3a/je+9UyKqlZO
         KhUTG9rzHNh8s1C5it6eDhFSWp4YEu1DH7WhR2pD+1ajN/qvWNnz3MTREEyeL6sBPGZu
         xTk4GVxoibX+poXIWjxdQ5QStgzhakkdqyTiPFRrVmdNBDec8x2hD64UjRVbLqzqiJc9
         5H5g==
X-Forwarded-Encrypted: i=1; AJvYcCXOqlu+ZHEQGPRa3WnPMPmw2DzVpM9C48ajXhwwrAGRFwgD7PDqm03KWzRgnsEPNfy/n1zJovGez+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4nbvXYsz0x2u15tyJhIpMc2DE7JryZkrsP+muKUNXCptg4+7I
	0IPg7TznuVntKCvLBeXFkcf23dKJWEgzznFUtvkLEe2jg1gbVSS5h6jKnvQA4Lc=
X-Google-Smtp-Source: AGHT+IF9RM7FJT3xEMac/N766Zoy/DqJgTLXUwbeVf2ff03TgVWgKHdv4rG6j7goNdi57Bh5Mx7ulA==
X-Received: by 2002:a05:6512:1250:b0:533:4c73:a244 with SMTP id 2adb3069b0e04-53678ff8a49mr1446551e87.61.1726145894937;
        Thu, 12 Sep 2024 05:58:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90da18sm1940012e87.293.2024.09.12.05.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:58:13 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:58:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <lqs2y5gvsaij5rg4o4krruseuijinqgzky6kiorjegham4aumq@fx2doq5j7wkq>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-4-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101527.603452-4-ukaszb@chromium.org>

On Tue, Sep 10, 2024 at 10:15:22AM GMT, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 ++
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 273 ++++++++++++++++++++++++++
>  4 files changed, 294 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> 

[...]

> +
> +static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	bool ack = UCSI_COMMAND(cmd) == UCSI_ACK_CC_CI;
> +	int ret;
> +
> +	if (ack)
> +		set_bit(ACK_PENDING, &udata->flags);
> +	else
> +		set_bit(COMMAND_PENDING, &udata->flags);
> +
> +	ret = cros_ucsi_async_control(ucsi, cmd);
> +	if (ret)
> +		goto out;
> +
> +	if (!wait_for_completion_timeout(&udata->complete, WRITE_TMO_MS))
> +		ret = -ETIMEDOUT;
> +
> +out:
> +	if (ack)
> +		clear_bit(ACK_PENDING, &udata->flags);
> +	else
> +		clear_bit(COMMAND_PENDING, &udata->flags);
> +	return ret;
> +}
> +
> +struct ucsi_operations cros_ucsi_ops = {
> +	.read_version = cros_ucsi_read_version,
> +	.read_cci = cros_ucsi_read_cci,
> +	.read_message_in = cros_ucsi_read_message_in,
> +	.async_control = cros_ucsi_async_control,
> +	.sync_control = cros_ucsi_sync_control,

Please use ucsi_sync_control_common instead.

> +};
> +
> +static void cros_ucsi_work(struct work_struct *work)
> +{
> +	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
> +	u32 cci;
> +
> +	if (cros_ucsi_read_cci(udata->ucsi, &cci))
> +		return;
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(udata->ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	if (cci & UCSI_CCI_ACK_COMPLETE &&
> +	    test_and_clear_bit(ACK_PENDING, &udata->flags))
> +		complete(&udata->complete);
> +	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> +	    test_and_clear_bit(COMMAND_PENDING, &udata->flags))
> +		complete(&udata->complete);

ucsi_notify_common(). Why are you ignoring these functions?

-- 
With best wishes
Dmitry

