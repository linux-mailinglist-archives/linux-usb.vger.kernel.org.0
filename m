Return-Path: <linux-usb+bounces-14996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0908F976683
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 12:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0A962832FA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 10:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095851A42CE;
	Thu, 12 Sep 2024 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pj8+GotI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E691A0BCB
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726135724; cv=none; b=RvTPD6uqteMIgirrB9Bnfh2B9YTNLxNHP4C0DtJ1REc9UD8xMRa7F4vgq5LL6zu1J+NodJSLTcyHan1X9Dz6+ztl0UgeB/LSd6yLymNaPbKTrznVXzgXWax36JRMVhjdp9HMIi3wGL7vmlD0VEgAfXb0k56ieTWpF0mAVD2aLX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726135724; c=relaxed/simple;
	bh=UO3UeASm8qiOCWo9/nnnckcqBU/AfdZGHlwE3YcFB/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkreMirrhVHFNupCbG6tQIYZbSBgZdcDK0muXRMFntOYReS+xmniyoOcQz4LAAieBsXhfPku5z3nT1pJ/cs0Ml6KwlPkge6X2xcCDAIfubvJ54/RERTKa5dMe3mlVLTnlBdQhStyyeKyLh14QzQZxzaVVApq2TjuYDT3+5j96aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pj8+GotI; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f75aa08a96so9083831fa.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 03:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726135721; x=1726740521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=un6MZ9fAnspE6NELwo02+xyByn65Uvrwt2NPUk6Q1ik=;
        b=Pj8+GotInoRtt7Zhe3XwI92KPwLHUyGKIxO7R7RTDj3/Nsz6xhJfY10zCKajwxyDR/
         j4vE2bzUouvaYaPIrsUhZlqozzUvjOrvgJAgc8Ii2zcGfK1HJjplJCPGtfiaAKYC4dw4
         JOd1AAt6gAzutguKoczVkcFGh3Cl1thgXkujZv/Y9bHJGe5hsmcv044+dy8+jtbwVWSF
         nsMBEfFml7yrMWTwvfE+yHKhfq4kfAHgbiKFz9VtOydG1XmYXtlM748zO0hxBhLkZSaa
         3BxP7eesrtBEt+82984dSk9+Y8sSWj026BFBMQu248d3+glbIc91OX7H2CI9kMowsaut
         pdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726135721; x=1726740521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un6MZ9fAnspE6NELwo02+xyByn65Uvrwt2NPUk6Q1ik=;
        b=q0eEFOaOpR4/5Th1Q9ddPsMxx0c17W7A4kQVoDsuEfa1giDxUQNbR6WF5U1pQja9z5
         VSkga1yTKBOjL+yLWLaZ3U5+4s8WkfJg51+OIa8Y9VFaUAFAp1zOCXyoSTPcL/Jv/xpG
         70x6QPf/46dCxR1MmaDF/tkXApk12gzXUGY2KK+32gqggvK/SNORybZWl+Huxenj9W/X
         JS0kWQqZOmAbWEzEzvDcMF5jxcOqrK63/iwgJ7IUtdViP7xCajR77GNIdVImBzlDy+HR
         A0TzgBQPdzm6OtHPWNvPjlE3IrOKTfW4VK6MC76sByy7HlYXR4dAPM1P1bGLEyQaxTL6
         92Ww==
X-Forwarded-Encrypted: i=1; AJvYcCW9MKdkYakWCcKx0iUkHw0jHSj1UP99jgqZDPFx/4w8h3tSKRCDB1IYFjqhUZizGVWabxRX6iqmnts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4wtgj+6q/V/5vJL1EO5Fe7AznbdDNGXHW3B+b7KqppzeRLgg4
	+9DdIr3Fpqxq10reK1EgwAi0Hoflo9DZ6RqDeuHlKkPcXSvkMYsQ8ViPbN4eFVA=
X-Google-Smtp-Source: AGHT+IED6f/zL1JdG7Yu24l8tiFLX036iXwpaFCRuAn/x+C0osip/yRrbRwzvapfTZi3+wF4Ovqu0A==
X-Received: by 2002:a05:6512:3088:b0:52e:9b68:d2d4 with SMTP id 2adb3069b0e04-53678ff4b1cmr1312459e87.56.1726135720562;
        Thu, 12 Sep 2024 03:08:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f8cb7a1sm1836030e87.120.2024.09.12.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 03:08:39 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:08:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Bartosz Szpila <bszpila@google.com>, "Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>, 
	linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] usb: typec: ucsi: Helper for Get Connector
 Status command
Message-ID: <uwfqytzktyd4xj45rxzqm4xkvxdrvj3jtmbfwqmc4r2woig47z@jcrgzie4rz6f>
References: <20240903145342.3449969-1-heikki.krogerus@linux.intel.com>
 <20240903145342.3449969-2-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903145342.3449969-2-heikki.krogerus@linux.intel.com>

On Tue, Sep 03, 2024 at 05:53:41PM GMT, Heikki Krogerus wrote:
> That command is executed from several locations in the
> driver, so providing a dedicated helper function for it.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

