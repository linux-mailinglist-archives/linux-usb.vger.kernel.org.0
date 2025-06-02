Return-Path: <linux-usb+bounces-24423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95AACB03E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 16:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAFAA7A7237
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 14:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7529A221FCF;
	Mon,  2 Jun 2025 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uanr9LLf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EACB1E0E08
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872896; cv=none; b=VGtMCRwH0GV/uCv9iFZlFQ2vxyWSa7Z2SGwoSHJzjUwmdwsKU2ELrbd1S9fLs6CecG9DoGYwdnfIy/ESn5TGrbZvMyrtpR2jf9r3haf4xTJ2UVjZWFfilHqA7wzLzGMtN5DyFVKm7jkkvGz795F35Qd6rl3YsRhJhXRnwtzZfrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872896; c=relaxed/simple;
	bh=NagQOnPJDvkb2mkYf+XeOB5En0lYB8s9niseheZBotI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mai6HCXcIl4xwzoTczTxKIspfrRJnZ7heZBBHe2GPbRs3uCPj6bxENRuA4LsCc2AqzQRn2FcrAo41cyK96A4tzrg8/heH7RuowUwrMbsO1/yAr8us+9HWYg0Tw9nhsyox29cU2f+npLUu/oBtsUQPOWx9gRSAHjSTagUmytpg9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uanr9LLf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a375e72473so2560521f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Jun 2025 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748872892; x=1749477692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=;
        b=Uanr9LLfoTE01oJ841zWFY8P8MyvuFKYUt8W4IaN94K3MEFNbx580BM2nA8iPXx0b7
         9z2X5cvJx07rQj2DEDyKm49sEB/cRPxF3YGzicESzGPU0x7d44TVIdGUDU8Bczfm3sy3
         NeVVfUPIVATbwsA6vLIPzdunACnwWrxL8477xKe1/7rryRjaNfVte4MYCgWluOO74nCJ
         k6eu2SgQ0alRROv1BzNtIg5ply8gvY8LYYrfmoRrckWaDH/TPL1eehAmJffxua+qBoql
         QA8Rbhm07x2vukGaOP+47O9s4tHTwRn7uYG5ENNkSvciD4S9YX8ZPeyPjApiW/xfdfqF
         VQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872892; x=1749477692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIbBoniHrQ8ysPUakN2ZSVqOUqWXbm4NXe1FWYc3Lms=;
        b=HEUyfEtqCc13j77StcRu2eYCofJDeJ9STbZj7FsphEHMEfp4upad1Jv4QsYjNrZRp/
         aruVKeR1NE+ipiXOuW417VXgfqa32FSv+82Qbo6Bn4fOxhozx9TlLMLWumGSGUtSrwnq
         rOcxnFsr8W/eFpg6ISygMT6zVv2sgeyLJQdKLgsQhzb8OcwG0NUqou9SjticwaXBV9FJ
         7D8bBPcv2+EY9zCs5WF1FNJ0RWssPqtvPkEunwLLig3XB1GYPnwonERSaICX6PduFtHp
         eTJ6WdT8za4M3YsqLAtPnIDjOWDKZUVFiE6AH3xVeDSkutmhWPJpjImvcUSPcBJpmUt0
         URLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3qfVB+9eAN6r+id1NRKP03xgx7PGn5CEUh/zJlt0UOE2ZZfTWydi6CwJ+D05EMe0PenkcFkSO+bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiXpgsRj54Ehy3xXMpzBNHinKoYVg2V9DnTXC4Wjxz5Dc9SfjB
	xsyd04xIoz2JL6t0MxYnHlwR0iQS8GOWqYtm+qQtvnZMSsVWtXSfATfPpo9/ZNWJ4o0=
X-Gm-Gg: ASbGnctaSeoiLPgmvsBTBxRtyy5Ga/lBsFljw4mTdQFSfY3phdxntNgroco7jIH7vuv
	4P+fwbVAasc4Th+/YTcnhV203B30tY0w/Gvt8Jjje+J9+mwV248GK1FpQXz8ZwXjvJNKPU9I6XB
	7b4OJsBEuUTsoA60l7V67VpcpV7Crm3NZzmxCI/xVhNj94suZIMAkUzwQZSLSlMCYJlpRUBU4NL
	D5YibzV3dM9bfVQQ6xnDKso8JHNW8u/OQpHnE1eUG38kWyfhFaKSMA9+40K1VKrkXnB0lod/cF8
	PQ2QslANVYhHXyc0LIkRi6jM12oguYvIo4kh4VeKJy2o18Irgvwj5NDlKghJRL0kdUQ=
X-Google-Smtp-Source: AGHT+IFcK/6ISQPxykPrncma5VHws55L2Y9hI5oNzFpiILYMm6BZyuZo0dKaVkm4FGL7w36sh5Q2lg==
X-Received: by 2002:a05:6000:2409:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a4f7a3650bmr10615706f8f.27.1748872892237;
        Mon, 02 Jun 2025 07:01:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe5b871sm15236681f8f.13.2025.06.02.07.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:01:31 -0700 (PDT)
Date: Mon, 2 Jun 2025 17:01:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: Re: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a
 REINIT_DURING_RESUME flag
Message-ID: <aD2uuP6Tx9NH7wVg@stanley.mountain>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
 <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
 <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDd/pNP0jt73PKtb@lizhi-Precision-Tower-5810>

On Wed, May 28, 2025 at 05:27:00PM -0400, Frank Li wrote:
> On Wed, May 28, 2025 at 10:57:20PM +0300, Dan Carpenter wrote:
> > From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> >
> > The s32g2 and s32g3 chips will need to re-initialize in the resume path.
> > Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.
> 
> why power_lost_check() doesn't work for you?
> 

Yeah.  That looks like it should work.  Thanks.

regards,
dan carpenter


