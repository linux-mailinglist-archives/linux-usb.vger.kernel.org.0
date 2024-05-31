Return-Path: <linux-usb+bounces-10729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB66D8D60FA
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 13:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BD34B21952
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 11:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57462157A68;
	Fri, 31 May 2024 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltQRyQT0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E8156257
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717156330; cv=none; b=iKcZ1GDfNuOZ+EP1RwFD74zYXgKiy8BzYhZkBbJ1alRVFrramgBb4EFPtSx1oP3P8JOYCK39GWQLvsPKndaNQhjapu3xAq3vz+VSGZotpUaIHj5vLpIwF8W/55pOFuRHs2q3zBGEE3nR/PfyXbcCANx3k92tR/jOI4E3uXU1fqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717156330; c=relaxed/simple;
	bh=N4s/dFu0smDrmgkoc3aRlSMPt/bGpx2KChJ3QdF3ago=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHUaz1ucuPB8C1nXh7wpsuoQnx/Hq578pK+QceP/3Y3YKdBXYi9UE4IIVun5qWidqCAsDHEv1aNY3Ydmq4NzUtjMexOzK/gxgPdPRgUYX+TUuaoh7XLUgtw1xDqrvmaDaLW1roHJrxxE+88JUN7t8S0/VvmTaa+4rnAg62boomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltQRyQT0; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e73359b900so22501441fa.2
        for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 04:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717156327; x=1717761127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnSmE8F93G2jDqQiqNdufsu+/TztXC9m7MWh8TNH4H4=;
        b=ltQRyQT0QIGtt9Vh1j16jGYvczk9YnL7NlcucPv8LdK+Rbz9nDP8FCbO8vU+vJenPF
         pX8ls5D9YPHdkBpolAHaZR0vMeP2SDg1co0q2zivliRTvbbdDz5mBYi5yPeBwnLHWZOf
         A9Izi7GoyguH5EDubIIYIz2ht9Znz7yovpPRWQmsuBN+0s0yv2yom+im4c04OuU+mThH
         kr6SsgPYspVXYXuYP8TXpoQijuutRXQSI0fc5P9V/pQYBAuIlmtYKEq6lHx4Fe7/490c
         xeA4WktSdPHV83Eot4GUO49XX234znl1ZuPzik4KFPk2EDfhaHICiLRrrsVCfl/FI5KT
         IKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717156327; x=1717761127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnSmE8F93G2jDqQiqNdufsu+/TztXC9m7MWh8TNH4H4=;
        b=A/XPg2+imLzYTCnp/5nh+XGhAkH2UYsnSjB0/pVUAHMINU+c/xJczdP7YM25jIn3c3
         LTqnaSMtVzqxTuV+t2m5Z/QI2DB0vb4plQEMEgpId/swe5QXME+KKmT5nzEABVonyx/b
         UOSsM9DDwIFHgyQsDiWG1ivkf+sWJGZO7q6UoDz/bXRM9tGubJh6QZnGf/+aYANK1O4l
         /LvIFaxRaSQOVfySZLuAZ5o7N6q8QCD5zAhHtYOZRDwMQTNLjf/VrjdivCtsTOcKsiZL
         Llu4dkBHeIYh9Etdoo09ujicAI3vWrqajEbcA1A/MfNFBpx/TWJO6g1t4boV6yimj4/T
         XUEA==
X-Forwarded-Encrypted: i=1; AJvYcCV1sK0vVEyFcxb+wJaop+JBzwAa8GXYiWJACckS58IHRc8GWUK8Fe71k10E3mZ5Dh5B+M/THVBA359qzJfjDmXbXpT5E6GdjLs+
X-Gm-Message-State: AOJu0Yz/2kSp0I/1oTDvnxSaYAF5sn2/cyiemjoYem63U6uyl82v7Ci7
	CWQ/k0P7RJi56ivoj2mnyoSQH1FonyNhUc7vGLuh69w6lGt77DBswU/G+B26spE=
X-Google-Smtp-Source: AGHT+IH6v+kAk712k0wrG0lSES+DwrUy5A+vJjU8CzLtS89DEGs8M9ogsKLrmQtCUhFRmRfV1VEk3w==
X-Received: by 2002:a2e:9054:0:b0:2d6:c43e:f0b3 with SMTP id 38308e7fff4ca-2ea951d21f8mr10365911fa.50.1717156327279;
        Fri, 31 May 2024 04:52:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cc808dsm2756031fa.97.2024.05.31.04.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 04:52:06 -0700 (PDT)
Date: Fri, 31 May 2024 14:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Ack also failed Get Error commands
Message-ID: <j24oneu2rgjas4rsre7i54svslrofqzttu5izupnipbbn5t5vj@e4llezl36hdw>
References: <20240531104653.1303519-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531104653.1303519-1-heikki.krogerus@linux.intel.com>

On Fri, May 31, 2024 at 01:46:52PM +0300, Heikki Krogerus wrote:
> It is possible that also the GET_ERROR command fails. If
> that happens, the command completion still needs to be
> acknowledged. Otherwise the interface will be stuck until
> it's reset.
> 
> Reported-by: Ammy Yi <ammy.yi@intel.com>
> Fixes: bdc62f2bae8f ("usb: typec: ucsi: Simplified registration and I/O API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

