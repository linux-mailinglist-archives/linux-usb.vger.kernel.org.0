Return-Path: <linux-usb+bounces-12358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A424F93A297
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 16:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EDDAB24A52
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 14:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2280B15444F;
	Tue, 23 Jul 2024 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dt/xtDZC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C6E152E0C
	for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721744486; cv=none; b=Tg2QD7nba/QCZOtnvAAKrqU38Yhh2oV1hEaTatLeDW10Asxb/PnkKSbVS5AkYUtCkVl6qPsOk1PDU0NzlvHWKTeLYyUeadlNkupfjly8/oORtZRd8SIDV7dAdjpSCO9dawLQHmiFVpGbUDPf36V2eOARQpf7oqA2REp12dlgOJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721744486; c=relaxed/simple;
	bh=DNGKRnq6yefqDwFq4dLFSptbWIrv/56iYPZ/WODQ1aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eakbZRsw41cuBjkHLSuK2UstV3ATXV0ZaCbPs3ve+Y+oHLEA3nHo7fElqP1f0btRSpfFJNrRALT2MIqWTHNpk0WVlfCAPbyaRqSwYLmQeqF0yeb0O/0tmFRInN/LuQV9ND1xSdTGyD8/kjZAkKwlrxG19/ZLUTM65aTU1BuPkas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dt/xtDZC; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so3587009e87.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721744482; x=1722349282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBuLRu+sHV1exWh6bc0Ae4uSAoiJuU9OudmglQ3Nm9M=;
        b=Dt/xtDZC1T8TmUocqyRdmEvNZJb0i7He/RaLEhTk3gkfOOWIwAJIM/meuFsgrKcdQM
         1IXfViZ6BIOvfkNEqDPgbDIVT45KbWmuB57+3MQaN4hmob0ROC9jmyy86w26frchD35/
         i5a5wKBf7s55kAMk/dgelxlArcS9FwzdDeZC+SXisQ6igDN9mYc0OAjkp5Y1JCmdl8MH
         fdYLj/peGVqCtkvwdJ0FLjcX5j7WDTS9hSWbjJNnBM6UwoF4NBYxMV/no6h/CtGRws2j
         wTjvlHTYcGq4bk6dBQOVKCVT01klBka+nQoBYYRHSb802+XX5UHLnn+fLt0nVwxE7TGZ
         oHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721744482; x=1722349282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBuLRu+sHV1exWh6bc0Ae4uSAoiJuU9OudmglQ3Nm9M=;
        b=eVH/WN+E1K9lPUPrPfkO0AhU++y2X+j9/xAqBnL5uliXsI2pisaTjP7cvoYMlRoMQ8
         5GSM1SchTVSmMBfbQ6aKIqn0Qv2ueNIfGaqbTnRoOgNAukJx2iyni5Fm5VSyOEkZBbv0
         qxqtH+67kIhBeRFBMnSlbuI3uaaaOmcW9Q/pMSDfLwUgSQK8Wb7KiNX4iHNDdhSnu+0v
         UifU/hzCy/Zlb7QwkD0SHptXDpuCBBtRuKBF48YWMOlWqXNTOYV4U7+7UiIvMzEBmWqC
         0708VBRCnR92blWO4U0l5iUXSA/DmX+qSUv/gpeX7KleqHecNKVvpc6xWRx/Y+tRE/g7
         ZXMA==
X-Forwarded-Encrypted: i=1; AJvYcCV1ANZYqdheDgFWjVwH0JAvCUmktPOVxGr5L/fonGirbdZF7NoaW8WdlTZsAEyyNkfx0JpS5u03EzO62EnCFA5Kfg+5eDu956fb
X-Gm-Message-State: AOJu0Yz5F7aacOMg1IKeQBQ+yrw4Fec+iU8CTZpSEuXYVHIl47YlI9YD
	4UhycbuwsexyTUtOb3+lrtNGuJYVuFthqlVhhA+fMRcTI568y7cJxXOHP5tzBr14gShfVgGl1bk
	L
X-Google-Smtp-Source: AGHT+IFxHwfhLi/9n7Rf6nSVfmpgHMm3WiEWbHO874AANBpqTHNp5aTg7Ckn1tENldoqD+expnN1yA==
X-Received: by 2002:a05:6512:1281:b0:52f:214:79b0 with SMTP id 2adb3069b0e04-52f02147b57mr5060911e87.13.1721744482286;
        Tue, 23 Jul 2024 07:21:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef553c8c6sm1616527e87.76.2024.07.23.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 07:21:21 -0700 (PDT)
Date: Tue, 23 Jul 2024 17:21:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	utkarsh.h.patel@intel.com, abhishekpandit@chromium.org, andriy.shevchenko@linux.intel.com, 
	kyletso@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Fix NULL pointer dereference in
 ucsi_displayport_vdm()
Message-ID: <pva5d2tl2zxeaugahq7rih6o2w64pr5kuu2yyhdvcb264t3uyf@42whgfttylzb>
References: <20240723141344.1331641-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723141344.1331641-1-make24@iscas.ac.cn>

On Tue, Jul 23, 2024 at 10:13:44PM GMT, Ma Ke wrote:
> When dp->con->partner is an error, a NULL pointer dereference may occur.
> Add a check for dp->con->partner to avoid dereferencing a NULL pointer.
> 
> Cc: stable@vger.kernel.org
> Fixes: 372adf075a43 ("usb: typec: ucsi: Determine common SVDM Version")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - added Cc stable line;
> - fixed a typo.
> ---
>  drivers/usb/typec/ucsi/displayport.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
> index 420af5139c70..ecc706e0800d 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -222,6 +222,8 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
>  	switch (cmd_type) {
>  	case CMDT_INIT:
>  		if (PD_VDO_SVDM_VER(header) < svdm_version) {
> +			if (IS_ERR_OR_NULL(dp->con->partner))

Usually IS_ERR_OR_NULL is one of the red flags. It is either IS_ERR or
NULL, but not both.

Also could you please describe the path how we can end up here without a
proper dp->con->partner.

> +				break;
>  			typec_partner_set_svdm_version(dp->con->partner, PD_VDO_SVDM_VER(header));
>  			svdm_version = PD_VDO_SVDM_VER(header);
>  		}
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

