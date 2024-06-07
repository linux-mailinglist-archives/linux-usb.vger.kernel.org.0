Return-Path: <linux-usb+bounces-11004-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62088FFB7D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 07:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 547DF2866F1
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2024 05:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7502618049;
	Fri,  7 Jun 2024 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVDDYZbC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B229428
	for <linux-usb@vger.kernel.org>; Fri,  7 Jun 2024 05:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717739724; cv=none; b=sp6yZYHOn65DCn/mp94NW7d+baPRV0ptHJf+6S1C8Czl2hbROoS8nk0TDwJxdGTtBg9kWVEBilbwiynUjiBYg6ebJgD81n+ULhr0R9CwkDVF7B50bZQ8oZYTSxSx8lkcMhbUc3WBBQ6Rm6LpEPe4JxktMTr+xeGQKw3FuMMdhrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717739724; c=relaxed/simple;
	bh=ZhXwI1cGzdbG3/xPhux84aeXE5uygV37OsetZ+A49tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtQGiCPBn+2pvQS9CzVan5df5c9/6UUm2UivQiKlw5+ohe3HRMZK/4OTP7tRpsmJKCbyINxsIi9V2TiESos5NkQZ+BKBvbzVO1WeoSde/wRgFX+qr4m5fyP3jgZe+6ucovguibZv68XqNYDSHiDbh+2zjuGtRPKXT7q/eOQmkH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RVDDYZbC; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e96f29884dso18217191fa.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2024 22:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717739720; x=1718344520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9BPHj5tjsy40u5xnIOS+sJiXd9TZKhkHWvmbm5XCXCM=;
        b=RVDDYZbCHjjSb1ysoxB8BQxmkpI/NReyrjiApQ1a5ucarQr4KM2V/kiXNnIkcBcD58
         oMKVojybysSXvLaQ3Nq4f7iyV9DoJ6dUnMWQyYWtYFe9dPW0qpwx29IvLJL6nhulVR9p
         I+BB2JU6pejVBI+iE4u2X+H+CEP4V/RUHSEQJ/om125O6T+R6NOdLu8hdQYeQKH9C7ZS
         xuESyungs6DPZmOfLSOToop1EveK7BuWTubGewGjQEjpzzxKDWZ+j5cBMBMas4IlGCul
         JXh9wcYGP+I0pKHdAOAcUmkxApEW2YudQ9chdntdv2sUcFSVoLCIn7XHTd9WgtbN8T84
         bxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717739720; x=1718344520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BPHj5tjsy40u5xnIOS+sJiXd9TZKhkHWvmbm5XCXCM=;
        b=SYl3S+g7IOqjT9MkUbOWA5baeaz39mVMs/Elh4iD36ubaGT27WS3eWcExJcHu2Ix1m
         fFdBnlq+NTV+06mEB95R7J4/g5G5SbdsmNeWUfBcK5QHV0mALqvaCMeyH0oDC2ifb/pn
         ePYsv0LfgxBuGwysrlmKtJRoiFz2Z5r7Lp4oEaaXaMcTiM8VcBAoGzjllsJm9L+DF5MJ
         JXLlb89L9NJg6yGWiofmapIYLyXLpnUVmRY4oDOvx8WXmXT3q1X9PM3WVbc5EoVb/PaA
         XmpvI34DQNpeQLglYFAuwRLWSBMFXHZ1F1wPAQ/BfGN6VLo0JYpoWA005vg8m9DvMfx0
         BtDA==
X-Forwarded-Encrypted: i=1; AJvYcCUzuiuQPvFiT4eI/WqmNEimRwRbe1giYxu8O94vQqtAqR/79bqZeXEfoQuFY1ya0jyrpRUszbEt/jCjyJntIvLcmBgQabaXCo+a
X-Gm-Message-State: AOJu0Yx4CcoCJOubylf7kHKHD7RefRnmG6etXM0WHUG0SA2BhMbhxhL5
	CzOWhTsv8sO8Q3WUfEHrJ/U1DGG/sRrJ6s0w194ORD0iFaJqwpF3prazOY1I/3s=
X-Google-Smtp-Source: AGHT+IHoz1Kc5/yTC4dbwlAKkn/RxZ/i22SG7V2m9thfEVSDlUh/a8lngHbXSPt7qixcRb4bTIg8IQ==
X-Received: by 2002:a2e:99c2:0:b0:2e9:881f:66ac with SMTP id 38308e7fff4ca-2eadce34e53mr9065441fa.21.1717739720539;
        Thu, 06 Jun 2024 22:55:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ead40f11b9sm4233071fa.11.2024.06.06.22.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 22:55:19 -0700 (PDT)
Date: Fri, 7 Jun 2024 08:55:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] usb: typec-mux: nb7vpq904m: broadcast typec state
 to next mux
Message-ID: <i3ampmzac6rsbvjkysfcu264jhhzre4rz5jkee4ktqlwxnpbor@n2jjzv7sklz5>
References: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-0-c6f6eae479c3@linaro.org>
 <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-4-c6f6eae479c3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8x50-upstream-retimer-broadcast-mode-v2-4-c6f6eae479c3@linaro.org>

On Thu, Jun 06, 2024 at 03:11:16PM +0200, Neil Armstrong wrote:
> In the Type-C graph, the nb7vpq904m retimer is in between the USB-C
> connector and the USB3/DP combo PHY, and this PHY also requires the
> USB-C mode events to properly set-up the SuperSpeed Lanes functions
> to setup USB3-only, USB3 + DP Altmode or DP Altmode only on the 4 lanes.
> 
> Update the nb7vpq904m retimer to get an optional type-c mux on the next
> endpoint, and broadcast the received mode to it.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/usb/typec/mux/nb7vpq904m.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

