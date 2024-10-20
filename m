Return-Path: <linux-usb+bounces-16454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2DE9A537E
	for <lists+linux-usb@lfdr.de>; Sun, 20 Oct 2024 12:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E8CB1F2269D
	for <lists+linux-usb@lfdr.de>; Sun, 20 Oct 2024 10:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CBE18D623;
	Sun, 20 Oct 2024 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZIS2PZh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A5812FF70
	for <linux-usb@vger.kernel.org>; Sun, 20 Oct 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729420839; cv=none; b=exogbfPaI5p/pzV7tdx/lGjwgi1X0o16owo6ELmrYqyxrho74L6rblfFvppAfVjY7vnD5p39I1rXabi6pskVu1KoQMaGn7HL1L1c7vIY0dD6iLWSKn88/vMcvFg5f7f0FuKzhEhOoPspO1jMWqtgIPbci43xo2FqpJLVjGuK3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729420839; c=relaxed/simple;
	bh=e6Zx+YooRSyCvyeXZGGGQhAAfGoOuT2cf3p2UYYwbfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i87475Umoaw7jSYXHhFCoeGknn9edkqqH3QqZ2A+MJl6K8LvOORVu4Y7j89dbnGGBZunpTUoz5fY2elgHGptILG2pkgueXCBYzb+nzCkdn6JGPLyR8QOZOPUnILsVwUIUkILbSF1Q8VzclqBbUXAzoEL1F4OBgXCe0oWB+E2niw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZIS2PZh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb518014b9so29966191fa.3
        for <linux-usb@vger.kernel.org>; Sun, 20 Oct 2024 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729420836; x=1730025636; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Big7GRyU+UAfruB67dvDyIF5xLwYENedGA5XWw38ccM=;
        b=HZIS2PZhnWzv4IJs7BMXfbMz0ge8OFJmcUmGx+y3mme3E0yxQt4v4tFNl65ypfnKzA
         0iIqzZ/U3ioS4KHo6/iwfuW30Uum13VCOC9JJismiU0h56/B67PKHBy1VzzzRRWy7YUD
         ZpfuccJ9nMzIUWf+OOmlEf6gw5omZKZzAOJGyw8g0HavQs8sY3CF3LglMa+uaNN3nVKo
         7M1UO4vZp/7OufcCYdTHZYCffcbmdmTMn/6oUW9FD45RThOUInALO66x8EdUdE/twcHT
         Dkk2fB3bDJNA3GOMPZwiAkkjrP8gn/SMethvC/MlQDIOns2R1ZcEl5N10hRTZwXSV+l5
         qKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729420836; x=1730025636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Big7GRyU+UAfruB67dvDyIF5xLwYENedGA5XWw38ccM=;
        b=J0DxpOULaECnSQm9CrwGpONGIuaOTUpODxV/yZmDjdViRDg6zS5MM9UorCLbKuJqkT
         TgTrO+pd2vEteVRw3dZXXR+ZV4hyH4tzs5lTpDOSae5+WPKVfJ+vn16AHX25fWu2rcvU
         SR8eaP+p9+5pGJhcaDh1Ji/fGJzym6OPd4fopcQgIhOWwh52l8/GtIqWRhhrhhCfoVAO
         nzkiKXz1X2DZoRQAGJkiVzd/O9fXguFGYqQ/2iyO0e/LZFtmmwc2R6S2sdmnPJYynr5o
         wEOcY5Yld0ejSs9rxouyng9jHMImhdIuLvpNQhvu9q4xpU41TLvnT4JzZ4QD5YpURSU0
         OCGg==
X-Forwarded-Encrypted: i=1; AJvYcCVB8Q6e0wynPDZwd/oF7W/YyUVn+Vd0imW8ECMs8L6ImaVD+hYrZaCvfHYKMyIhXBqjiFUUZBkswOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXuk9OScgxy2U82qgZ/GNQRI3G9sXchQHpDxpcUmHx1ZDoet4
	q/D88IBpFMcgUPgefjQZLME66s6VJR8gusrPgG2HujqIkgIAGMkGL5OVMfNK1AEz/pGtL3TJR2W
	TQJ0=
X-Google-Smtp-Source: AGHT+IF7RhC0ss4D/GUbjaVcpKS0Kwjy6EO8ydxnPbYU8S1RzlzA0UxTIbmGS1nJrZQfTQTYhR/O+Q==
X-Received: by 2002:a05:651c:1986:b0:2fa:bb5d:db67 with SMTP id 38308e7fff4ca-2fb83260f85mr36077151fa.32.1729420834784;
        Sun, 20 Oct 2024 03:40:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ad91535sm1978321fa.72.2024.10.20.03.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 03:40:33 -0700 (PDT)
Date: Sun, 20 Oct 2024 13:40:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: fix missing fwnode removal
 in error path
Message-ID: <nsmpyy736kfdn5h727bfgfd6lufecyi5kz6kfiyzndgz3xiei5@7uzrrve4q3fb>
References: <20241019-qcom_pmic_typec-fwnode_remove-v1-1-884968902979@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-qcom_pmic_typec-fwnode_remove-v1-1-884968902979@gmail.com>

On Sat, Oct 19, 2024 at 11:10:51PM +0200, Javier Carrasco wrote:
> If drm_dp_hpd_bridge_register() fails, the probe function returns
> without removing the fwnode via fwnode_remove_software_node(), leaking
> the resource.
> 
> Jump to fwnode_remove if drm_dp_hpd_bridge_register() fails to remove
> the software node acquired with device_get_named_child_node().

I think the fwnode_remove_software_node() is not a proper cleanup
function here (and was most likely c&p from some other driver). See the
comment in front of device_get_named_child_node().

Please add another patch before this one, replacing
fwnode_remove_software_node() with fwnode_handle_put().

> 
> Cc: stable@vger.kernel.org
> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 2201eeae5a99..776fc7f93f37 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -93,8 +93,10 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  
>  	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> -	if (IS_ERR(bridge_dev))
> -		return PTR_ERR(bridge_dev);
> +	if (IS_ERR(bridge_dev)) {
> +		ret = PTR_ERR(bridge_dev);
> +		goto fwnode_remove;
> +	}
>  
>  	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
>  	if (IS_ERR(tcpm->tcpm_port)) {
> 
> ---
> base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
> change-id: 20241019-qcom_pmic_typec-fwnode_remove-00dc49054cf7
> 
> Best regards,
> -- 
> Javier Carrasco <javier.carrasco.cruz@gmail.com>
> 

-- 
With best wishes
Dmitry

