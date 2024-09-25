Return-Path: <linux-usb+bounces-15463-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F01D98653B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 18:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2122CB23225
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B9A57880;
	Wed, 25 Sep 2024 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEIBzNPj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35430219E0
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 16:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727283294; cv=none; b=FCP4rMKC4i7ulS0xm9BoZ3Sl2IB2zUF545hIBJXpeBO7AE5hDpD5V50nu2o+lMNo3jDHz7wZFtFcaeSNyswYPUhGjpFELiaBtXemViR7ZFrjtkcp9kZXa4SQsCHxmHdOroVtlk4CYGQihQ/sZyzYHDy0Rwhvl64IRTmPOrMUAiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727283294; c=relaxed/simple;
	bh=/iLPgj4TgYR6zK/EXYJGwX6BILDDsI6Z4336i4QtFwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtz29NKVo4VL9IXCCkO28kmrS1kAgdhHY1+q+gu5tINBdtW0daa8FcVg7I55Wy9DgbeRXXQawWc6ee04Y7Q8QWQGZrv5laGyJyAT2hrEiYTLoMkFGr1uflRfNJAEekZYVNwGHcw8qop1c6J5kwOtG4N2pvDO0svkxyzHbpa/QUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEIBzNPj; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f78b28ddb6so601771fa.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 09:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727283291; x=1727888091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IlESbvCtsozYGqIWP4A8GOe0yGJ0eMmcD1MWPRH068=;
        b=KEIBzNPjkdofMb4Dbvopc1Znir28MvO6HjYkpEu6g8Dc+47CD5CKAsiB7kpeFjwM55
         Zq3bR74gcXRo76lbtQdagEF8mDxGyuNg4PFf63l/8nymEoyhGmMkKoI/VRKyHJP0TVrT
         UK8pATtDA0vGzwKwFRg+P2JYqSB9ZIxIydhtClmWcgXT8BX689bwS756QzVpaMXjxyMD
         /pgaemfA2FlqogDR+xdODmkkaTCOZNYK4GLStzDJC8mlaxZLzPawV9LJhdT8IMbhzoUs
         IefZIScqnwT95ljAQAk2GleKrBgfWpi5s6luClPla6AH+NjN1hBGNr+xp9Rngk/wP8ge
         YGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727283291; x=1727888091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IlESbvCtsozYGqIWP4A8GOe0yGJ0eMmcD1MWPRH068=;
        b=UvBAOfiVoe4P5dHVRqiu420CVOt6OIQT/80oQ7zcNh5zSaD1ba+BaURpHsuwuwqfJF
         8B3afNC1hqtvIwIlpBK2HHS/AEEf0ArWLJNN3EdYjb+vaQH6midFLCyJxeBeKYgSqkxC
         r1FDzp0iuTCA+TvojxXPoCzoQiAp8ZnDxFVtNuspTfoQU0SV7z2tE29fzKro0VbrGtf8
         K51Elb+4XnGDTs9BYkLkwhQeM61ksVJrSFYCQJx8z0smzC0hjwmavU67OPoT8ynglEnG
         U0iLYlFi8oEaJ/ZQwAb3GJ15EnsATf4Si9wTOq+vWH5ZnTzfeOoMfvO2M4Uu9SwLMRT+
         xx8g==
X-Forwarded-Encrypted: i=1; AJvYcCWp8xSWBvem39yaDkrNu66PeJtlgSFsOCkeZYy4KCOSNsU2vKO71/FLMyzEuKFuG0kG6HNcRe3wBlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfH2nw1o32EkF9oov/JGzL0DmO8yGibCqlHwAn7yT1WBMv57zc
	+xag9B4sCaWLATPbay57sA8aq2CM3hZTLGojw6DEUTpBF3exxRbC6dcuHfmy9Ls=
X-Google-Smtp-Source: AGHT+IFC8+iguBkPY2hlX/42by6M71fGPgkoAf4V8t7QcKM5Kqno4xffyH88fuIqCHiJ13r+fVSzcQ==
X-Received: by 2002:a05:651c:210d:b0:2f7:6653:8044 with SMTP id 38308e7fff4ca-2f916019192mr22080881fa.20.1727283291132;
        Wed, 25 Sep 2024 09:54:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d288e2c8sm5715931fa.92.2024.09.25.09.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 09:54:48 -0700 (PDT)
Date: Wed, 25 Sep 2024 19:54:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: heikki.krogerus@linux.intel.com, tzungbi@kernel.org, jthies@google.com, 
	pmalani@chromium.org, akuchynski@google.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/8] usb: typec: altmode_match should handle
 TYPEC_ANY_MODE
Message-ID: <oedfq4fkjlbalytba7fxg462tyutgxxk5wnhg2mhkfevclv33q@ugc472nkwpo6>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
 <20240925092505.2.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925092505.2.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>

On Wed, Sep 25, 2024 at 09:25:03AM GMT, Abhishek Pandit-Subedi wrote:
> altmode_match is used when searching for the first port altmode that
> matches the partner or plug altmode. If the port registered with mode
> set to TYPEC_ANY_MODE, it should always match if the SVID matches.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Fixes?

> ---
> 
>  drivers/usb/typec/class.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 9262fcd4144f..179856503d5d 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -230,7 +230,8 @@ static int altmode_match(struct device *dev, void *data)
>  	if (!is_typec_altmode(dev))
>  		return 0;
>  
> -	return ((adev->svid == id->svid) && (adev->mode == id->mode));
> +	return ((adev->svid == id->svid) &&
> +		(adev->mode == id->mode || adev->mode == TYPEC_ANY_MODE));
>  }
>  
>  static void typec_altmode_set_partner(struct altmode *altmode)
> -- 
> 2.46.0.792.g87dc391469-goog
> 

-- 
With best wishes
Dmitry

