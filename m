Return-Path: <linux-usb+bounces-28094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A593FB57415
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 11:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 451507B13B1
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 09:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDED02F549F;
	Mon, 15 Sep 2025 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eg1VOmR7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909102F5463
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 09:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757926969; cv=none; b=lfvThoBYdvX7uJZr/AqAd93L9MzmB2YTWbai+AWsdnufANG+LbQN8J+eblSAdmEQKrMRnJjwCB0lD1n+FRZzwa0NeaXnuaxO8wHa4v2Sw3IOJh0Giuh2RyDcawTESTtlEb/Pqv8ZDmr0LW2zOGUj9PuVMY/0fjIRU25RS9ujF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757926969; c=relaxed/simple;
	bh=C0YkUmrHajMk+TIUliZWVchR3y+Q8yUcd/+iydBLkn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JiQGZ6ZJy0dhCCU6n5b7LUmBn2dMmrNa9Q9JLhP3ciTAAGPDisQQLqY/TOm/WYQ7bW7SrTLYpIKV/JpE8Ioqnqj7A91zZ6MbBejN4vRvKJ6T7fXIiHjZX6VwMwkhKJVLLYa0c/c30XeBHBEhjDSrPnmK/4QhnzkOgvMqU6H5Jm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eg1VOmR7; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62f28b8e12cso2205973a12.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757926966; x=1758531766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ApShfXQF2Oi6G8dmAOghgnsvmVSLzQLwz5wXFZQiKw=;
        b=eg1VOmR7zShmn+hHiqoCSBy9ccujENIgSGAfLe204EOGU+XnJDTA3uYY8umymARXlN
         mJiY1n1EO+fP2t/Yv9+0vIPcSgNHdjRCF0a9bbhCFjuDH4rhR1sWlo30kRcfOH/R0OOI
         ICqhmxH2Vt+03zkTpaeq9H2WkOO2S4PO2l3Y0MrGiBlSLkqn74zgfRTD9/M6DEXBNfmT
         wEkZQ5AVpYlW77o1vaZxEo6SDDGHcAmb6wQ4JQ3BbUiWbFWqLJi7+KX48YYXrFQ8KKNL
         xEM3y9sv2DBW6OBq+2WGpC8ujzyJuGSMaN7LbOZ5S+PgKMdbuFfsqbIVQZS5XOptyuG3
         g7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926966; x=1758531766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ApShfXQF2Oi6G8dmAOghgnsvmVSLzQLwz5wXFZQiKw=;
        b=UBovrs1tcUI8OXO23OxPB9ohzcYeY7lqg04XHQbVl/1wxWO5cvhCFUUfA3oWE70WWd
         mQyQhzQsa2b2/R06HJXTqAUCyDvmP8ocoOCPFlreWW3H50b3JKzPv8MxQ6KVD5kdby6D
         hu2jUQeWK59i8O3YMX084mAniNHFyWVpNiP8lC4g8YWUgHNUHTsnmSxEuk2POkX2GE+q
         PeaboShWa4hM2URtdNwc9ghXsm2oL63vUX/KYnzl4w/tXx6ua/RkPywk88hr+5W4729+
         ZXfkp43+8xpowvHfCuucvkK44fgJd0KsY/ztnVDz4otfVd7LVk5aZJhar8w6j0oPdyhx
         TOww==
X-Forwarded-Encrypted: i=1; AJvYcCUloeP0ednrBkSB4N0s/S3aZoR1lDNr28ccLwU4EJzvXd5P114V+GB11bMhSrY0wGAyn1cxsvo1KIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWAXNDE3jrU7yFxDfJrWA9LPRyqqAvCAuSypBC1qUDfyssn6oL
	fTyqVTtD6heN+RBE8ndlKwomyzQk+ecziBk8RbRJLHUAACh840v+7+UadQhclXI2xkI=
X-Gm-Gg: ASbGncvyXztE4ye/QiNUS41IbmeJJ7sYtzmaHwG5fJfTCgT+ymuVXvKEr+6Clvv2m8Z
	oTEauebzqQozJhF14vn2pDttAhRGw6f9OLT8b4ZfGxvFam8Sal7CcUWNgseUqxQUy11JqJf61E3
	exv3RxjUJgTzehtSSExq4KdXVtHKatHQ5Mz9aELiIWHdXKl9iQcLhbovufdNUKC2LoY5vQhgkDE
	rC3Nw7MyD/Vy3T2bVzwJMZW21Zp7bOhr0MKCnOvdGqObzzt+CbA0u4MlBg+CUEaa4HDhKxKGuyh
	wjh940X61qDo2T78LGnEKrR3/tVw5MtUgjVX/IJHBnYtHAHoo2Rn4lsQVeJUqKQDr4Ou9gyF0lf
	di8BVe55J4MxO+xtLvBSNgUkwV5wIJZRunR5YtRgzutc=
X-Google-Smtp-Source: AGHT+IFJqW4ATs8hpOqhKur7nNuySu2I9qWO2KqW58kjbzZTek7UpaV471VVvj9InZNl3XX07WRoUQ==
X-Received: by 2002:a17:907:86a0:b0:afc:a190:848a with SMTP id a640c23a62f3a-b07c3a78fb9mr1146716866b.60.1757926965242;
        Mon, 15 Sep 2025 02:02:45 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:ab20:75dc:ab3e:bbb9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d2870da1sm574403366b.13.2025.09.15.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 02:02:44 -0700 (PDT)
Date: Mon, 15 Sep 2025 11:02:34 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	=?iso-8859-1?Q?Gy=F6rgy?= Kurucz <me@kuruczgy.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
Message-ID: <aMfWKobwM5bhJEAd@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>

On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
> for SM8550 and update match data for X1E80100 specifically so that they
> could be handled differently in supporting charge control functionality.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> index 008e241e3eac3574a78459a2256e006e48c9f508..174d3f83ac2b070bb90c21a498686e91cc629ebe 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
> @@ -19,8 +19,10 @@
>  #define BATTMGR_STRING_LEN	128
>  
>  enum qcom_battmgr_variant {
> -	QCOM_BATTMGR_SM8350,
>  	QCOM_BATTMGR_SC8280XP,
> +	QCOM_BATTMGR_SM8350,
> +	QCOM_BATTMGR_SM8550,
> +	QCOM_BATTMGR_X1E80100,
>  };
>  
>  #define BATTMGR_BAT_STATUS		0x1
> @@ -1333,7 +1335,8 @@ static void qcom_battmgr_pdr_notify(void *priv, int state)
>  static const struct of_device_id qcom_battmgr_of_variants[] = {
>  	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>  	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
> -	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
> +	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
> +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>  	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
>  	{}
>  };

I think you need to squash this with "[PATCH 7/8] power: supply:
qcom_battmgr: Add charge control support", or move the modified checks
for

	if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
	    battmgr->variant == QCOM_BATTMGR_X1E80100) {

into this patch.

With this patch right now, I would expect that your series is not
bisectable: The wrong code paths are chosen if you only apply this patch
because e.g. X1E doesn't use the QCOM_BATTMGR_SC8280XP code anymore.

Thanks,
Stephan

