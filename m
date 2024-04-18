Return-Path: <linux-usb+bounces-9467-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCDB8AA152
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 19:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA701F227DE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Apr 2024 17:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E345317556D;
	Thu, 18 Apr 2024 17:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fb97ymLN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B6617556A
	for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 17:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713462359; cv=none; b=SmANnkp8jKm/Ex/sdl8ZWf5pMgZG7Jk7+/9zzDrHLDE7jLcEbWnwUw8aYoVNcejxZfgU6z1/QaewdwjWHpz4BPor4kLzKe2Y5TLjRzzW9huyLoLlrEGPWslTs9lDxLTf+caBF6Rzu05jAob9pyZnJlVodYGwNsb3D4Mo7IXi2HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713462359; c=relaxed/simple;
	bh=cmVM7114Wg4c+eTojAQNT4khmmHaTED7X82UXWToh7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxdyJZHfyp9w2Hz9l6GbOrovYjpY92KORUU8yZuyReiIqWD5OQy+9sR8nOI5YG0HqNpibfLv5tcZXZhi+HqImd2DBThtdBDfCl0WJCei+OBlLXqQtHXCZkJDmzx/kUWVwEmpKWC8iezme2/CTYIL2RsayPHHYQ4UBZIT48eKXLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fb97ymLN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-518f8a69f82so1417005e87.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Apr 2024 10:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713462356; x=1714067156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CnaZqLleXkKRQtG9lodbPU6Ant05+dj1iWTT1GEt3P0=;
        b=Fb97ymLNSS5pF2oHoQ7M0Sm+fkc/FR3rdNIvTvsbwpSoF3WWpo33jhDtk0+hIt8w31
         S2+F5D4wujYAy9rQW56SIs1qqd474avBrGtcXVKGJ5uePCx4RB4je04c3bYszeEt2V1O
         Yhw4QH3Uxl8ghxBYzEqPftCWhsDctReLp1srgLyHHQl5bPANL8rWCjJLsTVh7QeIOM/g
         9962+HvpYUzrRQLscSS/ePxU5k8Nsje6YvP1yiC1njbHcleyW9+GT97KptvBHEvRdk3R
         Op9CRvIrvIAJ/Ke6zW42Gt0rVIqICN26O+jw6A+GGcGO4LeLKk1wZkmWAHJUWliHYpmm
         Akwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713462356; x=1714067156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnaZqLleXkKRQtG9lodbPU6Ant05+dj1iWTT1GEt3P0=;
        b=PIwW3bxtTeDLsm0mjUKgsko4xECNVI4EscFFkq0Y5gT22+FtLx3sJheMjAH8/jUroD
         v0xbyCTc+6eoHPo5exH/FN74nezC+GVfBooveMU/uHrec87NIpAH4HTwedEzFOOYvw3B
         gZAfkjqdQDXEmHzmZGyoMbj0PyA9VXYotJ9aW5re+Tlys1BbT2Nq2CpZLXGe1Hb/nWvj
         apdTD7TovdWDfOrzevLNwAWxeGe7lafzZ46X+x9SaSsf743kEY3gf8gMvw2lx8RC72EF
         bd2T5/t70TF2aSUtJNhvG+kG5KbD+9ngAarn6W1Ct+6faWI7VSAsj01bxPDToPmuCayR
         Du/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQLm0R743szHl+tEf8h+Mfndcu69q1GRxJldttHHMVO26iPRu2zhPVXbhYlQgv9/mav6pfCbZVaxdPnZOsCfdf6ifFZJt3HbRx
X-Gm-Message-State: AOJu0Yx6kFcknewvRZP8VyBBO93Z5Z1R3lsjGQDYWsY9maKOkUeF3v07
	hDwkB+Whr3GirB4KmHhSvvagAEVu6umX8s9E8KbW3WOJshCTQakmRqwxd+OLZjg=
X-Google-Smtp-Source: AGHT+IHyMINeDJMq/yGej8du0gbVkUuDu458MwsKllIzhnyz9PhEDktjd7blUOHB5UnvEw9HDOFp0w==
X-Received: by 2002:a05:6512:2809:b0:518:dc5b:6f5e with SMTP id cf9-20020a056512280900b00518dc5b6f5emr3078202lfb.43.1713462355939;
        Thu, 18 Apr 2024 10:45:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id q18-20020ac25292000000b0051a20afb4d9sm171124lfm.255.2024.04.18.10.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 10:45:55 -0700 (PDT)
Date: Thu, 18 Apr 2024 20:45:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: typec: qcom-pmic: fix use-after-free on late
 probe errors
Message-ID: <whokqg6gei5knc6kpmp6jidalljlfvf2kpa4xwjyh6xfsfj4ql@rjkweiqeu5fq>
References: <20240418145730.4605-1-johan+linaro@kernel.org>
 <20240418145730.4605-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418145730.4605-2-johan+linaro@kernel.org>

On Thu, Apr 18, 2024 at 04:57:29PM +0200, Johan Hovold wrote:
> Make sure to stop and deregister the port in case of late probe errors
> to avoid use-after-free issues when the underlying memory is released by
> devres.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org	# 6.5
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

