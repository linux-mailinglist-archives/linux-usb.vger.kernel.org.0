Return-Path: <linux-usb+bounces-9292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBBD8A2024
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 22:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F07928C262
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 20:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429FC17C7C;
	Thu, 11 Apr 2024 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FR5su2Xo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7C1805A
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 20:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712867155; cv=none; b=t0GBSxCN2YKSmaGEPPFw/X8w+CK1mLONLJIx0Wooe9OvS055Rl2WzEve2F/nUayVC8GrKHpozpegAKzUq8ki6qn1tWjrrJqgZLsUXYTYiB/PDbNAFGe8fRnGW1lhAm6Nr26amrNaOki2KHtgH7q12HNBgDkBN6BmkSqhI+nkig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712867155; c=relaxed/simple;
	bh=q2SFCQQC9kwcksLheVL/nHnYrQUJZrMEdq5AFfHMjtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3fpN2biJ3+9boylT4PGhcvO65z5TUdad9VqKdlSUx/QTVOBgIB18zeujDWo3uhRTCoP2YPUI5AZtYIUMA6CFoGTM0+BMaWRZtIIQVo20wkI4htdAvEUUCZm4b5CgJUNKKDVna0jIfPaqzAzzfL49h3n2QU4lPy6rrlb1ZeBHKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FR5su2Xo; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d0c004b1so311840e87.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 13:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712867152; x=1713471952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fVrCsKfNi5s3/DIyKxG0ZENasWDcns/BOobg8LT9WrE=;
        b=FR5su2XokC5/OqdKLWKg10UlaDjHVlzQvcyiFBn7Epzt8yr3wwsb22pUAVQW+mem+g
         dB133j+xulhhCd2hq0DgAiuf9A0vXdJcf/AyHx5txr8mhYBcW3LV1Hhyxkw25rY6RvB8
         Q92MBxb0UvH6u6y+X/OUz4F0OX6eETcM8/rWFTdHxbs0c1OTStZImqPOHiTJTCficl4+
         dPCyW910G0E2A2u1UXnf1rYrNmsfHj9HIssJ5ZiqEv2XGSxwZ2YEw9OjoOmWRagXyWJ/
         r9FuvdNsX5EHnVUjxGLojpPYA2RgKUvp600SXDbzXMitzRNDebzzn+lljbzbdYNBvqOd
         7HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712867152; x=1713471952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVrCsKfNi5s3/DIyKxG0ZENasWDcns/BOobg8LT9WrE=;
        b=vYaLRVAFDQZCSoMKALM/9HO7KWSQ5oEUi0ICys2p5PQhdwziuYTld9SVVnejy+2KyN
         AAcDBsRD2fq0zC1LfqSz8khDtxXDS+PodnK0zvOlrnlmJhM3DK+AIb1nIFgLozVh6a17
         6oWNNgxAVYgjCkbQGIx+NCwCQfZl3jkjq7xPTEtdSI9RwBZUALCvOlKTb5KotsQVNiqo
         dJC7fR5KEdgT52qoK00j+vXuzK1AhvEmvvWfVR0QIq7fPBIddnQRuYpmfEM8acTgctVe
         WXH33Pv4ZzwJBsnSTY7wt+iEO8PYsrEB44Dzl9GP4nxi4iM+xt0zHilGhlT130Mv7vls
         vZUA==
X-Gm-Message-State: AOJu0YyLKLNwXXXYLxEvNNOfF/cUgIk0VPOJEwIrIeUKvSRMEuAuGIh9
	mgj9P2KClMhgZUkVbTeCbbvMUiHbf4KLnUQUc861FrEWLw5yTlJQiSfjGN7+06J/GX5SWZWxhMk
	A
X-Google-Smtp-Source: AGHT+IHJ6adFpiO5TiDjlOt/FNZoJ2b4mVzNY96XLws1e4HkfQmDSEQPm4HgikalKZbI76niJDN+Zg==
X-Received: by 2002:ac2:4242:0:b0:516:fee0:ae0f with SMTP id m2-20020ac24242000000b00516fee0ae0fmr494589lfl.55.1712867152056;
        Thu, 11 Apr 2024 13:25:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id d26-20020ac25eda000000b0051871ab37basm117776lfq.237.2024.04.11.13.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 13:25:51 -0700 (PDT)
Date: Thu, 11 Apr 2024 23:25:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: typec: ucsi: extract code to read PD caps
Message-ID: <7zonsyhzhpxthhaty7dwhdnm6jniwl4ia46fde63zbq4c4kw3x@jl4w2zn7a5fx>
References: <a3a2799c-04b3-4b8a-b808-5a118b330619@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3a2799c-04b3-4b8a-b808-5a118b330619@moroto.mountain>

Hello Dan,

On Thu, Apr 11, 2024 at 04:20:22PM +0300, Dan Carpenter wrote:
> Hello Dmitry Baryshkov,
> 
> Commit ad4bc68bef3e ("usb: typec: ucsi: extract code to read PD
> caps") from Mar 29, 2024 (linux-next), leads to the following Smatch
> static checker warning:
> 
> 	drivers/usb/typec/ucsi/ucsi.c:689 ucsi_get_pd_caps()
> 	warn: passing zero to 'ERR_PTR'
> 
> drivers/usb/typec/ucsi/ucsi.c
>     680 static struct usb_power_delivery_capabilities *ucsi_get_pd_caps(struct ucsi_connector *con,
>     681                                                                 enum typec_role role,
>     682                                                                 bool is_partner)
>     683 {
>     684         struct usb_power_delivery_capabilities_desc pd_caps;
>     685         int ret;
>     686 
>     687         ret = ucsi_get_pdos(con, role, is_partner, pd_caps.pdo);
>     688         if (ret <= 0)
> --> 689                 return ERR_PTR(ret);
> 
> This is returns NULL if ucsi_get_pdos() returns zero.  It's really hard
> to say if this is intentional or not...  Originally, we treated error
> codes and zero the same but we didn't report errors back to the user,
> the code just continued silently.  Now it's reporting errors but just
> continuing along if ucsi_get_pdos() returns zero.

The code is correct. The calling function checks that the result of
ucsi_get_pd_caps() is an ERR code and if that's not the case, assigns
PD capabilites to the storage at the connector. If ucsi_get_pdos()
returns 0, there are no PD objects, nothing to create capabilites for.
Thus the function correctly returns NULL.

If you think it is better to be explicit, I can send either an explicit
fixup `if (!ret) return NULL;` or just a comment that we should return
NULL if there are no PDOs.

> 
> My instinct says that we should modify ucsi_get_pdos() to not return
> zero but I don't know the code...
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 8abde8db6bcf..427b7610a074 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -650,6 +650,8 @@ static int ucsi_get_pdos(struct ucsi_connector *con, enum typec_role role,
>  		return ret;
>  
>  	num_pdos = ret / sizeof(u32); /* number of bytes to 32-bit PDOs */
> +	if (num_pdos == 0)
> +		return -EINVAL;
>  	if (num_pdos < UCSI_MAX_PDOS)
>  		return num_pdos;
>  
> Or, if returning NULL is intentional then it would be nice to add a
> comment.
> 
>     690 
>     691         if (ret < PDO_MAX_OBJECTS)
>     692                 pd_caps.pdo[ret] = 0;
>     693 
>     694         pd_caps.role = role;
>     695 
>     696         return usb_power_delivery_register_capabilities(is_partner ? con->partner_pd : con->pd,
>     697                                                         &pd_caps);
>     698 }
> 
> regards,
> dan carpenter

-- 
With best wishes
Dmitry

