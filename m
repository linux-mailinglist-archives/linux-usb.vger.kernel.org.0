Return-Path: <linux-usb+bounces-10527-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C015D8CEAE0
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 22:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC7D61C21799
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 20:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172B871747;
	Fri, 24 May 2024 20:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJiCJmMb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34B7E796
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716582685; cv=none; b=IErxDWEE6qwp/xeV5nMhyKyu+aorS+/OGxVZ//1NqHejKDa2ujCOAtnL2yFFLHoSvEDbcw8e/YbCd8jKDOvWPMdO5218uXv6q+dbHwBncvzT6XIgO9ZgEaa3WLvpUddJYD7tvt6uj/rxFopi7h1xBCbkJj0gzyk9lF/QviL+1og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716582685; c=relaxed/simple;
	bh=u623NnOrxHXs1P61/2nyV6Lnky4xicwHtkxYnmWEW4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmRaWQclc1/9SSbPfMnqFEuqCBcosOkTvCyzq0zChqF7fz5ggzEstzmIcoIYLnMQcgSTgKky7cjeq8evPvW50Ofo+kaeQ3kj1NYxE5go70I3L/QQSQUPgryCCyHwLnmqjqCkzRSqsx8ZD+zkp7AyNgIh4RmTTaAlz7YnF6a/Pqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJiCJmMb; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5238b5c07efso8851217e87.3
        for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 13:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716582682; x=1717187482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ent61cnCBQEKDoHe1EVzbi0f8AGZW1QPoDRi482kpkQ=;
        b=LJiCJmMb1rKdehyc2lXOl1cGWa/8l6oIt5oVjUFFOC0sBWrUPVSKgGcsUu40W2hrnn
         T3fShmDoVZdnHz1JgSQLKp0/M5C8HWRwge24GEVh+DZfAWNV8CSvQjJ1H5GLwp1hfx6Z
         Az6g65QYAcFM2cReMz9QotQYfmv77Qg7Yqk8OsiRagjXd7Ozv0ckg9knqyl9YGBkZFWQ
         e1Q80UZv49RtY3J+YvU5zBxT7Tmkze8OmtQ0ZGfOsZ8srKjynb8tkyEGHcPoCnykaxbW
         UBx11dZLvjycJTchywkG5s9Yr6AjKQXgd+w1vXKWcWtc/p8euSldclynHLDADLLBXdJJ
         0XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716582682; x=1717187482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ent61cnCBQEKDoHe1EVzbi0f8AGZW1QPoDRi482kpkQ=;
        b=CDHGVrgC/dANeeOWLrsRkdhiJ6GeKJ/6G9SYUqDAKigO92ctp+NUNxmT6tte/QMrfG
         KZo67slWY5c0JYDKRB7mTF9gVgvrgRqMzEkcqt8gWYJuWIX7Br1/c2HsUHQXJf6sRD9R
         dYETy4T9z9XdH8gF3Ji1V3MvFzIlJ1ScQmQO/WK5h2PjsMDXK3XjbGiyjRnFaksNFigN
         rrDFQIEeQfDChxiFaUiN1YO4oatyPJfCFeakoN/7ZtaM6hM1pmn+7tvP1cLy11YhB0/x
         SdVbImxb+vnovqXr0eXkGw3FNvCgjBHkPNCBmlNCW5nvnc20K5v1BGwuMqepId0PZLVC
         PiLA==
X-Forwarded-Encrypted: i=1; AJvYcCXAQqLIo1IyEXiqVkUr6NP7EpZDl6Ox5WjzS1XmowiQdTdfpZvS+vNQY2gOPNC9QAREHyyf4J8KbVGFcICVLBYaxpdyS5AM18XC
X-Gm-Message-State: AOJu0Yws+VnPaTbFMOl5PbzviuOo6FzbaIDsJDzjVxzlXb4ze9gfqPOx
	T2d3/yfrDNhMnjziAwxjywQ0m7Xbe50v/p544WdSOs0uey+J7rlJ1Ek/Gi5K+DE=
X-Google-Smtp-Source: AGHT+IHUh2xKVsKGi0rWWDq7PVf3HdmkRF+5+JPD5w5onVGIxZmixczonLc501QvT4fpDyDbWAym7A==
X-Received: by 2002:a05:6512:3682:b0:523:91af:12d9 with SMTP id 2adb3069b0e04-5296410a579mr1742608e87.9.1716582682274;
        Fri, 24 May 2024 13:31:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b05csm235117e87.170.2024.05.24.13.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 13:31:21 -0700 (PDT)
Date: Fri, 24 May 2024 23:31:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	jthies@google.com, bleung@chromium.org, abhishekpandit@chromium.org, 
	saranya.gopal@intel.com, lk@c--e.de, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pmalani@chromium.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: Enable UCSI v2.0 notifications
Message-ID: <hf64gs27pyevjqijgsgrnilzzbag4dnz4w7lpqkf7viqw63s6e@6vgylbyiibf2>
References: <20240524105837.15342-1-diogo.ivo@tecnico.ulisboa.pt>
 <20240524105837.15342-3-diogo.ivo@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524105837.15342-3-diogo.ivo@tecnico.ulisboa.pt>

On Fri, May 24, 2024 at 11:58:21AM +0100, Diogo Ivo wrote:
> UCSI version 2.0 and above define new PPM notifications. Update the
> logic to determine which notifications to enable taking into account
> these changes.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

