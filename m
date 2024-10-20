Return-Path: <linux-usb+bounces-16460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CE09A5445
	for <lists+linux-usb@lfdr.de>; Sun, 20 Oct 2024 15:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 703832825A3
	for <lists+linux-usb@lfdr.de>; Sun, 20 Oct 2024 13:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F0F192D75;
	Sun, 20 Oct 2024 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRZyw5aJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E3191F66
	for <linux-usb@vger.kernel.org>; Sun, 20 Oct 2024 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729430160; cv=none; b=LdPg+FKP78p4P4GK8uN8kYFwchER25PCYlhHuJuz5zWEDUj0LJLSZsNGYwV5IZFzBJCZ/5rb9Pns+9SedDGi2906eV4FFzreHTpPxG9saKh2lBAOmBsufBnKN/OONgf9uJ2z5vq30HVt9XJoMeoYXrA25jXR5Oh5Z/lF+/RuI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729430160; c=relaxed/simple;
	bh=uKgjva+0ctCwkivt4M+aYeVvXG0QvbFTOwa82+8Ezoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwIpF3XFBr1Va5N3nPjrI7fqZJJsDFcMi5m0xywTOF3IaaQC8r3LQqjs4GE50mlWetGgo0u/gy1ir2RnIoZTO3zzqjC2vPlroI3uH/TIr5WmWe/5FODC5vYS3pGvY2rb5KGHP1E9bNl6bwZrPPh9ylFYuLk2pmpelxNg7PWF5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRZyw5aJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so4013231e87.1
        for <linux-usb@vger.kernel.org>; Sun, 20 Oct 2024 06:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729430156; x=1730034956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYwZIeGEIc7VnkIRXpz4d+bHytScBmaxexHgM4ooyL4=;
        b=SRZyw5aJZwxgCJteX331J+Ygei7AymiR84aR8o5Q7YN5BGBacHK88kqyr5ieXzFx+s
         GKb5nMNlUYnw+nNs4GgIkY1mp52Zt+J3HhYPDvjB3+NKW4VBg9GTeLDl2p7j+xTxuN+c
         5LvREnzVK8DDp5X3biwTPEs45WqYUpRoglTr/z3OPyZw4v0L3t4OxypzvIKQjMJC2VmS
         7InkRCQ7CLwckxh1xlQJJbKoNL0mhdlwblfhXe6RxkKU/4A0IuDQDaOrdYWfqr7PxK/z
         EdUB2kEHtB0JVJCsMk4LCwNuhF9hEZDPRpuH1PiWwR+ZXq92v3mjtckhGFwwM8PFNOKv
         P1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729430156; x=1730034956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYwZIeGEIc7VnkIRXpz4d+bHytScBmaxexHgM4ooyL4=;
        b=Z1a2jJ1i3QC9s3OahddtueqdlCf8OdqTZbH2bQyLRNMcQuaDmDf7QGP7Bf4JbHK2ak
         8NGLPrY+1o4KXIigKmG04ZSYxiV4ZWhZFTlfCxJTj3i3oEo7Upn6z8meZJ5l65G3wUAy
         orTQwRYK5lmh16jAjTbMugcAiwsPon2350BAkPVLr7snPW///pL/V1O8TRLM4aIBagAx
         h9/MSduO3CBEllwui0slX8pXxYI/j5hnIGf9bi8BT6+5z49qF61ynJRJkpxfhQmfONDx
         rsLWVKcmzTTHXEngohrz9dwUbEZVCEZyxCxJctCzYD4S+Szp7y4rSA4Melq6oFJk2QWj
         egbg==
X-Forwarded-Encrypted: i=1; AJvYcCUVZb43IHN7R7AqIsKgrFoPfRCGHq1J1PKs/F1FsylpdzmqrVAs1c0DKPRw2WFNa4H+0O3A0s3IIJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5FHCFWgpE4TNgXwsBI89BFSCwuf7rKxd2PMGocYZQL+qcPQtF
	RJaTtHVMmKkqrLymXEqYV4dGG3B6A8W73N8FlRicggzMeDYY4qMfxxBvR49Ffe8=
X-Google-Smtp-Source: AGHT+IELxOsBj0URcEerkg6VeNl2eSHEE8fsdZdOVwEJm1At+CtbZCT/15/LMiNV6gF6vzcZLfV0qA==
X-Received: by 2002:a05:6512:2399:b0:539:f7de:df6a with SMTP id 2adb3069b0e04-53a15459fc3mr4475921e87.52.1729430155912;
        Sun, 20 Oct 2024 06:15:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e55f5sm220175e87.34.2024.10.20.06.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 06:15:54 -0700 (PDT)
Date: Sun, 20 Oct 2024 16:15:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: qcom-pmic-typec: fix missing fwnode
 removal in error path
Message-ID: <hw2m5c5wakwm4jcihammegpuydm3cbhxyzaln4p57w6ybkaaea@fx6thktwjuty>
References: <20241020-qcom_pmic_typec-fwnode_remove-v2-0-7054f3d2e215@gmail.com>
 <20241020-qcom_pmic_typec-fwnode_remove-v2-2-7054f3d2e215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020-qcom_pmic_typec-fwnode_remove-v2-2-7054f3d2e215@gmail.com>

On Sun, Oct 20, 2024 at 02:56:35PM +0200, Javier Carrasco wrote:
> If drm_dp_hpd_bridge_register() fails, the probe function returns
> without removing the fwnode via fwnode_handle_put(), leaking the
> resource.
> 
> Jump to fwnode_remove if drm_dp_hpd_bridge_register() fails to remove
> the fwnode acquired with device_get_named_child_node().
> 
> Cc: stable@vger.kernel.org
> Fixes: 7d9f1b72b296 ("usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

