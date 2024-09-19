Return-Path: <linux-usb+bounces-15230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F286497C63C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 10:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 183B01C20D59
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 08:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905F21991C8;
	Thu, 19 Sep 2024 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzd1oxp9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B10B194C61
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726735881; cv=none; b=hDWSPtZlWKWWySXgo+20eTnf5lLveNJ+9TxVVJPRCd37unw3hitRg7FwgnauRXzTWcdpIiXt25ArfcxO5X5ErFcAVT1DDPpIflqmrMmEFNuUi4LvMnye8sJ0DAjqtSO1/wTyE32w+ehDhHD1i+NLKuQbyQ9xSHnOXXLWzwcFyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726735881; c=relaxed/simple;
	bh=AnH2+fDMdJDfT2wT7eStlGQyoxprTA7rE2T3QoCF3LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfxTrcpYuk1J9rDSJasorgqIIcuzHQRwrfcpUpU9UM3af3BcUEgiT29FIfKokj1qVkRyaVjSSXUMZAUzO/jZ5HbGeTbWyUHmQqpeDnFq3pzb6O9ItH5LtdEP5vcRX90KA90aYG9wNuRtpjHVxbfF81HY0dHjLUVpACC/1QTTmdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzd1oxp9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f75c6ed428so6095791fa.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726735877; x=1727340677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GFHiL3BgzhxbZK16C89HqTbhSA1DEHRKJHHzop0uZPs=;
        b=mzd1oxp9ele05k6dGl5bOp+7I6TPbO3tp3tyAGz/icDreMz2QDT/qlkPL7S5Uic2wM
         CPcYZO3f+YgpE3A2wfxU8K+0OEhDSlkjEJ4UXppEgLX6Ivdqqq7CJ8MUWTmuL40vgAeV
         T5UNr2Tei77zk/9sylZw0HIKjLEKmCbPp4AlC0c6nNp1mjLY3S5Vcojh2Q3cYfadYh7u
         dpMGRMjPmmb1vZ5w1z1nv8PstPFcBUD8KWCSk75OUCi2LNvmYh2Ed+BP0ir01NGRmVU2
         DaeUSFYxHmsBOFAAqvXR4RqgnRz8+IhTP/5HmkDkUfUavnLeIs2eOb4NZXDdVCj9e1FE
         xsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726735877; x=1727340677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFHiL3BgzhxbZK16C89HqTbhSA1DEHRKJHHzop0uZPs=;
        b=SFkk8aj8+FNI9DPOqhoE+JtVFusJgH+WqnwmHb93Usx/fYKORtVC6vKdCaLw6810IW
         tSrH3wxSYlAdZQZ8bZ4Q8/tayk8EbYaXu+sm6uok6+abDqW4mz2FpI1pt6LLNCqqvFCP
         5qO+T7V8qmJvqBTa23C9M4uwnHEeAIiZpm1BrPCaycZ8wx8fGD8iXBC+TiAKjOxpYmwR
         eemdxdwfZZ/GGNFEwEKjY1AIC9cDodOP/AgQRyjs0D+NIgOjLr3+ksmjuECCWEU9fQbl
         v6gFFvYbyM7ZcDq1SaH5/i8FjCqdtnPuQLk+q3zv/qrtsMaQPanbZdj3g4qY96MocqpL
         ESPA==
X-Forwarded-Encrypted: i=1; AJvYcCVtyDJc3IRlwk1u6G8BtPkmK1BytIRreS9y/RFjyMPtDYM3eqRgH+IK4ThmKSRA+QJnjL/VsHL2Qu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1TGvBBcdRp+/Z1jIHgXSepHtrJIrqlUcGJFpawHi4n17NZE7y
	Fs+OrZ12gfBYbbT9OuOGjAkbaWl+nCa4gALodI7HTHikJ2bJWSjq+yU2Fxz91WU3sm+HHmVr828
	jDZU=
X-Google-Smtp-Source: AGHT+IGf49cI4YyHpgiDrXf1LO6sQkn/+x4wD+WKELy6/BrsBTPxz3H1KWGaL+L8fLNfM/X9ym14hg==
X-Received: by 2002:a05:651c:2206:b0:2f7:4ccd:891e with SMTP id 38308e7fff4ca-2f791b4d3dfmr125869561fa.34.1726735877460;
        Thu, 19 Sep 2024 01:51:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d37fb34sm16211381fa.86.2024.09.19.01.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:51:15 -0700 (PDT)
Date: Thu, 19 Sep 2024 11:51:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com, 
	badhri@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: Fix arg check for
 usb_power_delivery_unregister_capabilities
Message-ID: <rqnfzpe6hsvsjznbvnr4woso7i33lfye7sqnzkvh7ejnfzgwu5@zbbzsu57w7cv>
References: <20240919075815.332017-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919075815.332017-1-amitsd@google.com>

On Thu, Sep 19, 2024 at 12:58:12AM GMT, Amit Sunil Dhamne wrote:
> usb_power_delivery_register_capabilities() returns ERR_PTR in case of
> failure. usb_power_delivery_unregister_capabilities() we only check
> argument ("cap") for NULL. A more robust check would be checking for
> ERR_PTR as well.

No. The calling drivers are not supposed to pass ERR_PTR to
usb_power_delivery_unregister_capabilities(). If you check the TCPM and
UCSI driver code, they check return value of the register function
before saving it internally.

> Cc: stable@vger.kernel.org
> Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Type-C")
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/pd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index d78c04a421bc..761fe4dddf1b 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -519,7 +519,7 @@ EXPORT_SYMBOL_GPL(usb_power_delivery_register_capabilities);
>   */
>  void usb_power_delivery_unregister_capabilities(struct usb_power_delivery_capabilities *cap)
>  {
> -	if (!cap)
> +	if (IS_ERR_OR_NULL(cap))
>  		return;
>  
>  	device_for_each_child(&cap->dev, NULL, remove_pdo);
> 
> base-commit: 68d4209158f43a558c5553ea95ab0c8975eab18c
> -- 
> 2.46.0.792.g87dc391469-goog
> 

-- 
With best wishes
Dmitry

