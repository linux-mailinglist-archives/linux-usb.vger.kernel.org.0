Return-Path: <linux-usb+bounces-19815-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285CEA20BAC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 15:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 612713A62E9
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 14:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C541A841A;
	Tue, 28 Jan 2025 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBZsSkM1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A6F199FC9;
	Tue, 28 Jan 2025 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738073062; cv=none; b=UnFLwNlO1I5ctVk1k5dccdnsMJN2g6lyp38/w6LHo4AD/4qME8ZWPYjSaTz0Ec1wNxEmFtqJySv8TUzMpjD3MgC1bOki430BVnXMf0TPH5gR3gU8bef/Yx4zB3l9u59GRtVyHLT2got69sRgRyRHmUW2Ivw0lkJguWo8qXgHqUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738073062; c=relaxed/simple;
	bh=gqfGWsNDBK87GRJ5/0UOnsbaSxjNHaAHFKuTMdjOLiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktZqht11Za77/bJjJ5LFdWl9odKsyMFcku22H1i/iHPabWHsEloR0mIisNmLouInf7Y+vqFodTu9ziejWbwwhX6HpjBxInIyf4lnS+y+8NZnnTsQ4Qdpbq6G7Y790xy5iUEuq7EEG4Lr1vzTz5cno49Whml7UYMZCsALRO6Ahw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBZsSkM1; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so57261081fa.3;
        Tue, 28 Jan 2025 06:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738073058; x=1738677858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D3K4gEAr6qm5Q4qisPW4ZT4PDcCxenFWHW5Nb3nHY8o=;
        b=bBZsSkM1wf+afNj/Q1S8oWxPG0EMQlGwBSWleTUKyO8IsdORdAARtQNaKki1AbQy2R
         tzWqYVtk1g8YWZRLuTzrta8wrBz5mBrNDWrEJwJfjreqSu29lX0Hpca42/4AfariYB4T
         U8x1UORi9+OaFXx71vjDVncHA3mrdQZaITewSRsI5XcM3flFbBzkw4wseyNNrK/nE36o
         c95RT2xO+nHZ5mn/w5G2RoJ4gi843fJvJkjCo0Yza/B7Ld8kdMaDO+nBfRnvABTQzI6B
         8yQV3wPhmrSZI5C/OpBTex5XXoTwSdzmNLFVFChAsrw/LX2K9zmTUuSB7EDv1zyimSzc
         REPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738073058; x=1738677858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3K4gEAr6qm5Q4qisPW4ZT4PDcCxenFWHW5Nb3nHY8o=;
        b=fOu41mK4Woi7ms/NcKsOIlCk1een7/RlOLM3537+mq9ZjxP4sDvcwb2qCIXIhJOVTM
         6njomQ35beQD8bxpHAuoEqZdj34mG/5nMM1wImI+sCfpJQT0fR1HHSJUf8X4D8XbliBg
         xisy8q3vLj2RM7xuQccsKVz+Irc2NxGamy9sYsMAboIRShBvXY6ZL8OGkAIZNe35Y8Iq
         2UiJlT/vScVrtJwZTPbZFrO9kQNvGoxjMIGGNsGsbB1/jj8aobvdoMHf0yduYoMie1tm
         k0+rEEuOsDPjKoaRu3df9ysn8Llu6wC/NVaWCxk5cgN0l8YBLg+ZHNM2TA0v3HxSelMi
         +btg==
X-Forwarded-Encrypted: i=1; AJvYcCUH0zvLTgKGy6N8G8szN2MPx7WWJAlb2G61QnnP6Bpfn+E+WYHC478esd6ZOwzPgq/iYSQd+oKctV07@vger.kernel.org, AJvYcCX3R3qEnqDvLV7aEdudExXY5/9navUg5EOsX/BfkC9LKHRVS8/4unac+8CXa7d2lAtXTtqpEZaoyvC5HwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvlKivENWs+AcY35lMz3O/NNPtWnECTyA3Q3ViO6vkd4Zd9fVb
	MeIIECOFQeVSMrtuSrTbj5/Sq+vDsi4fSNLYx+CzVOQKPl4Oe7/I
X-Gm-Gg: ASbGnctaAFajn3aMMJZkj6cbYNXT940lQwxH4KOffJHmW0M4+rrwyugZ9ZbrkT/BjzN
	/So7ibtYVCNLti2PT3gXJ57/xocyQw8X5LxNXYF4VygPmvWKUsliZ3lAf4xNhpdpJRfBH65j9Jj
	SGejBggAOtgyaTZjw1WgjWSvpuzPkPPj/psOb3ma8MJoXtC1dKwS5O/lj730jFpRIY+eA+MQoKC
	FQAFIYEIL+QQS1fD4PwPLdJ1IZzNDdxrjrzHbl3Y4VNYj741uTvI1daZneLloGX2GVm0kHDaK2r
	e3TpIansLYMhWuVHERLFnyIR
X-Google-Smtp-Source: AGHT+IG6kx0zTXRZtZtKJY3JZpW6qk2SYhqLZo2vQGpug8cBQeudBlLJ+sNqB6+cD0IqLHkDP1GMUQ==
X-Received: by 2002:a05:6512:3084:b0:542:2137:3a31 with SMTP id 2adb3069b0e04-5439c24126amr14734531e87.21.1738073058272;
        Tue, 28 Jan 2025 06:04:18 -0800 (PST)
Received: from localhost (morra.ispras.ru. [83.149.199.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c838171fsm1630863e87.247.2025.01.28.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 06:04:17 -0800 (PST)
Date: Tue, 28 Jan 2025 17:04:17 +0300
From: Fedor Pchelkin <boddah8794@gmail.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Saranya Gopal <saranya.gopal@intel.com>, linux-kernel@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Prashant Malani <pmalani@chromium.org>, Jameson Thies <jthies@google.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>, 
	linux-usb@vger.kernel.org, Kenneth Crudup <kenny@panix.com>, 
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 5/5] usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE
 before reset
Message-ID: <377fw2gj3vvn7b5u7riwrhd7vwax3zgrtr3qun6tpsqkmqc5ck@ihayymezd5qa>
References: <Z2Cf1AI8CXao5ZAn@cae.in-ulm.de>
 <ie6okmkyqr7qiydcrcepghs6aewgi7stipcydgcpaoedhgp2ef@ye7y43aceofl>
 <Z5FfE7ps0Cc25qIL@cae.in-ulm.de>
 <coagi34rszmagqfsixava2gkswmdbj5ezfkzbdxoo4yn6nzva3@3bb5a6egkpli>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <coagi34rszmagqfsixava2gkswmdbj5ezfkzbdxoo4yn6nzva3@3bb5a6egkpli>

On Tue, 28. Jan 16:58, Fedor Pchelkin wrote:
> It appears like PPM is not ready yet for communication during the boot.
> 
> Increasing a timeout just to 2x eliminates the errors in my case:

That said, if I manually load/unload ucsi_acpi module later, it also
initializes perfectly without the need to increase the timeout.

The significant delays are seen only during the boot phase..

