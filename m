Return-Path: <linux-usb+bounces-18316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0963A9EBACC
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 21:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E08416719A
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2024 20:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFB3226877;
	Tue, 10 Dec 2024 20:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YLMAiJDJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB7423ED5E
	for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733862335; cv=none; b=Lq4q/yKID6W5/eRepML47G2F6AmYxtRK4Tg2LDHqHgP1Uk5DYCCrhGket4D+lOTsfAZfqXb4zKtcagD1KGlLrfoeQLiGF0/Aj5bv2KSvT2f5bDczy28eH9WHoaAJ+876axGitCHxAgsmNe/L+pvsnYMO32+apDqgKjN7F+BgB0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733862335; c=relaxed/simple;
	bh=Eftfg8/Dg5TvjrjAPiWy1krsu696melQ99u5UYTA1dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Inqqt+iXAa8jU4IxdjbPLJdSFXqSuYNNgY5awdM9u6zjTWaaQ1WNYHIPBLvGH9VBQl0iQ+oIICTlBpaR55wEwluXKz+iAJOtuaI23H92nG4p/ad6JbTQa3rLr2VDWJf2al16YXjKZ49DdP2fKRt0i9UKRMFoqO35hdT/M0wTZUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YLMAiJDJ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e3778bffdso4464472e87.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2024 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733862331; x=1734467131; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AbCufamCvcmoTO2tkUzwZ6hlFtoLOKL9jj6eQkqSANQ=;
        b=YLMAiJDJrVrSBv8rkTabPe4NpY95ohxjYxEM6i6kOTNy4Y4SiwRXUQP/tiLwZ7tCGb
         hMD6QcrT/0+HqaXlDxBj2fiVVsvrrDUFVHg7LoYvlGNOiA7Am7NJ8XLJ+Jdz3EDl2Sk6
         Jk/IeGc+34wm9Gq+PDUj5ziguztBMRH7+naSpw/SAO4ECnIkTgXgfdJ3GZkd0PI8VpdP
         ghqvzNl82lbSGaYnLCQEyE9LpGdwcgZhuuO8SJoJWwtMsS1HgJqeLP26fabrFrQyROEm
         9iaQtsVd17YtSPsgdaiR35DWsMG3O+PrnDg7vdvCT30H1smBdWZb4eF2r6Hv7SyTmLPV
         uhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733862331; x=1734467131;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbCufamCvcmoTO2tkUzwZ6hlFtoLOKL9jj6eQkqSANQ=;
        b=ruJNU8idWTvXjgxsVIKHLERAOPAzh+htNuSyO4w/JF63jUe2NJrmuoqJT1ANa3RENo
         byp29dV+6NEQjPX1Zeo53XNKPKzCYZqvwac2S2lc6XPvdK75rGnkQLJlSyg299Y87Ulu
         I77RkVZf9c1T2QzJ6avEhCqwiwj5rOGyWrzAjHM/s8ZPVzbGAORKWgVbgZRHgscJkw+K
         K8lc/h4qFHGrvYGG/ptueCmAZFkHyjxpmokitzpvBtiBO6Q0jYtKdYclNoxFfgyOrYbN
         28Q1cJm3pC05aLypexalg1BaoUP1YFyEYd00i6Oub2HNDjQ/4+Pqd57ApN5kWlujawNv
         CKYA==
X-Forwarded-Encrypted: i=1; AJvYcCWSF1tMsMLo+MF0pRwQfhFnlOUd1HIHxWzf9hGHHS/84euFUxxM3rJQkEfmi+/C7HNZAdyGMopV84E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZx5INOFqi9qrBBxEJ/D2nChVVEpLtiFRBBuDfV6Ll2FnGK1O
	tLs5iiDSsWesAn7qJPFbKSHl7gNFEWY6dvm16+bk8erks8Du7v6fhaMicU1IsQ4=
X-Gm-Gg: ASbGncteSfswuYi2NBesrVRAINYaxMaT0hdMV0H6OJmCV/GLL79vqaZ4+inOFGo38at
	+mEwaJkhuALyl9b8GPO476iGIgv75tQGntyGETkLC/8LaijSZahxqNcvxmv2pr4BCL8rBYBikax
	ZjMLahQdpAu7Na4jd/k7mmB3AOMLj5eEvo7a0ZdPjwQ6Gg/80bh34HSOVhQVNVioODdMIsirWcG
	ptWgI1dQ0ote+vnFJQzep//T676HHwnThjykx5Fzhdw8olbTibnml1+6nd8rnzfiKlV+mUdbCdK
	kMqui+mlp2hSAiNmIvH183XLEfWqL5x3SQ==
X-Google-Smtp-Source: AGHT+IE/6a9XGLsme7DQ7TSb4ZPIQEmSjWQFXWPgunivnIT1TRtOnxsoic/g6XxGYnyN7DNbPOeIIQ==
X-Received: by 2002:a05:6512:3194:b0:540:1b2d:8ee6 with SMTP id 2adb3069b0e04-5402a5d6aa3mr61232e87.7.1733862330891;
        Tue, 10 Dec 2024 12:25:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401ea77d14sm783579e87.113.2024.12.10.12.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:25:29 -0800 (PST)
Date: Tue, 10 Dec 2024 22:25:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v11 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <vgywywt6zixcp7mydb6lwixhvtjg7fkv4v3ttac6jjd5ikwphv@vfuy3oo4nsqa>
References: <20241210144527.1657888-1-ukaszb@chromium.org>
 <20241210144527.1657888-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210144527.1657888-3-ukaszb@chromium.org>

On Tue, Dec 10, 2024 at 02:45:27PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 +
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 337 ++++++++++++++++++++++++++
>  4 files changed, 358 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

