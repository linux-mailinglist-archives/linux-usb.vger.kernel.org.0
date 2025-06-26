Return-Path: <linux-usb+bounces-25124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49866AE9E82
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 15:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96303B18BD
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 13:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1017B28C2A4;
	Thu, 26 Jun 2025 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HD4GuiAG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121728982A
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944105; cv=none; b=Mtos+XK2dVcTxpZNV2EKjRirAtxTNcDdO+m2e7PS2NCrumwxeXGN1EFc5iZvUUBQKvuPYOBQAyTS2DQavuDQYYYaAohDQUCV3wMfjhooaPkg8BKTaalsnXw+J+18r8DY1SSK5wkjF206oVYlw314+W6QtLHDSMw3JWiOsX4ENKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944105; c=relaxed/simple;
	bh=d2ynvgpLC9KJpAzvF0WB5ZbHDMmgOpXwsY5NyyE8fxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaaHAYJDPfyAtxFQXYrWefTcX453DJ69JeqmNEq06tLSPeEKa1MO2hQVGT5hMp0Wb1Z9K5MonK/XomYN8hpgVrDZMZqoi8jOvmUjhxRR9LJXLmgw65e7VOTQUJGR9g39AgHUFPjo93zh6tIs8tfe9/74PChEgB6OReDWCuxXPZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HD4GuiAG; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-407a3913049so584462b6e.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750944103; x=1751548903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bOFVRCcBUw+mWK+/Dekm7KTQk+bIykTI3bUscdv9A2w=;
        b=HD4GuiAGNq49KvM6T83C885B0zipbqFxxEVGRMbmbuW6qRSuaLdgmlAP7faMJKpYny
         1ngzXEK4y90dAAWM+rDQxjP8eDVRUx9W7FScg6GTd300gZzJoo7qV5DszmTPiNQwQt9G
         S/L5XQdfgHcSfv2ALF5LvX1B9DDd6+lc8dVejfw4SBYkzJOGE7bwQLMS+bsUpge2tXQE
         o23rVZ2cIGoZciTTw+t9316b+MFiOVCazdL4csVh5YIAeAIi82BxGuR63XtUcjEoJ27y
         aEFCX8DUCxa2gSq+6mMAfXar5EEb3pudqylUCz3aqcS25R7oH7EpAJ/mHMO5efUTnIFW
         CtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944103; x=1751548903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOFVRCcBUw+mWK+/Dekm7KTQk+bIykTI3bUscdv9A2w=;
        b=c26hrXFgYKasF+RimLFUsYn5TlKitW/MQosI9p5YoetEILXWy2p246HfXcU0gtF2AY
         YvsTTTIj4YhqausmdxNCXg2OMUg3dGVujiyDC4D7m6M1FyZqmNKYcvP9AdH/bHcO/9lI
         rnU/jxQ+6GFKtHbm2121oeIS599fd5+vSjgNea970OEeSg2iGMjrxopCNJ3kyEG3ewYi
         FDvqTc58T8dcQJ6o4Ag4bekqSDvgkHzeuT69/TOl1qZ3aDpYFiocMDMnmcTH4OkWmvGn
         OkVlimQmw6qwdftAP/7v2kj1hQ14tV+oj2M9r9+gsolrcHjzRmn+1NP0qPjzHpL8EjAg
         sXqw==
X-Forwarded-Encrypted: i=1; AJvYcCXnwnQcyNxU9T48aWvnrccBpPOXStAW2mDGvIgU+S726rKaPoBsXbH1tWdDbClt0/hWeVuUxmYZDxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuyLJVgoPCigExU7kPQf1DmKzdN1T2mgdlMas1HxAya+ljVfEs
	oPglRgQo8a19IMW1r87tCuFf5nmKILC5vPNFMzCckA+wQHmTTd0PukYvydPcRLdbtQ9BhsBzXG7
	62Tze
X-Gm-Gg: ASbGncsd9RUPQHxiIMdBAFQ58cbvkz8qaDN+8bGFetFSqjVSMNvcQLneYMML/OnLfvr
	krUdcdfiw+2s5EmJC2mAbnRNHb5T5bxxt3hsK8ZXxkUOLe1GaH9FeC0p2wFmCb1P0uY7eUH56O7
	zyd7wHHZ1fBxZ2N9UCsG/6ZRHa+gHjlS1Eji2uFnU3bAQMtRoPVl0P8yRQM9oK7K6C3zEacqZIi
	iwaXODVRoi3s8mAbSysUao6V9MfR4Nwocc1R9f1r+Ukxr/b6BSOfPsnpFkX6aFsxV2dJeFB/U06
	ZhMAE1qHGG4gwjGo2KNulJES5l5/rbmtq5fi27yXtttIloieNyl6VNpsruryJAxtASU=
X-Google-Smtp-Source: AGHT+IGvz6gUhA5u66fVOK5ErmCf+/tRiLHCvux4O1ovgU9jkUorXeS90Wph1Qw856JXzjrMzzPw4w==
X-Received: by 2002:a05:6808:ec3:b0:406:6669:f4c8 with SMTP id 5614622812f47-40b1c3bdc99mr2599256b6e.36.1750944103075;
        Thu, 26 Jun 2025 06:21:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c327c3sm2588372b6e.19.2025.06.26.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:21:41 -0700 (PDT)
Date: Thu, 26 Jun 2025 16:21:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lianqin Hu <hulianqin@vivo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Michael Walle <mwalle@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_serial: remove some dead code
Message-ID: <81a704b2-56c4-4ea7-bcce-831ad2e4d070@suswa.mountain>
References: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
 <fde57cbf-4367-4741-8d67-b569ecb9dc61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fde57cbf-4367-4741-8d67-b569ecb9dc61@oss.qualcomm.com>

On Thu, Jun 26, 2025 at 11:53:05AM +0530, Prashanth K wrote:
> 
> 
> On 6/25/2025 8:51 PM, Dan Carpenter wrote:
> > There is no need to check if "port" is NULL.  We already verified that it
> > is non-NULL.  It's a stack variable and can't be modified by a different
> > thread.  Delete this dead code.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> Perhaps you could add Closes and Fixes tag, but its up to you.

Fixes is only for bugs.  If I put a Closes tag, then I'd have to give
myself reported by credit as well which is just being greedy for tags. :P

regards,
dan carpenter


