Return-Path: <linux-usb+bounces-15464-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89E986546
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 19:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1C8A1F265E8
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 17:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F5E49624;
	Wed, 25 Sep 2024 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8ytr4DO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CC01F94C
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 17:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727283893; cv=none; b=kb/gqTInODYPT8xP+3pJmBh5bqFD2pnhXzuC9d9CLKoGXEzGkfEkoxhPFIyOz2ivkqNWF3e5ghymX4DlUCWAsq2MXCoialdobaestSvqXpQb2685zntJPgzfAanpu4GMR9oMfkbhJBhzpTMX8isSFrA1DtqTy8yICUrdepTU95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727283893; c=relaxed/simple;
	bh=8htXylArPWCddqvf+J0dcpViSY2vryMcT/YAeNTS0LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpSwy+hJJ0MGw1D1U90LFX1e7ADhT34f8+bWJkIyMpg4GYrpioNKnbgq3Nq1OXmOCiHG4f5pC3gxbIbDXKJL5XWdBq9FWwmwbjdILaGE1UAoEce9oW4feyWq1sG+waGYaEVwQcz/6p0I8ED/ztpdy1or1hedx77d/5hbgImPWhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R8ytr4DO; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-537a2a2c74fso1130779e87.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 10:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727283890; x=1727888690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V2R4XJj4ap59FotkDKZ4Pzl2VkV0YoUjK1G8PYQt3fY=;
        b=R8ytr4DOhzQ7lpjs72KL2Bq5oXwDnYQ4FLISeDVur5NJvjMRvCoXuZG/B8JluDHgHv
         eIA8jIfAq7hbFoEgnXhvadjlkLifGKDP0o/UBBzGj7nPJ0tY2sOKf15wqxWoVB1C+Cpd
         m5uHDQL9VGkswx6Ous7Vv5A6mFlMiTjGB0pnVBgC1T6vYNBcrF0noqBzt0CLBf+Jj5a1
         q3hKTgMZsty7WZlzFkHALoSYAACRb80uG/Wb3/T0FRwmEOob4IcdFq11QrU+Cg9r5u9k
         qs74T91TwnmIgcThVeBSmI5oK4eKd5OfSWDPStH9NkHRQEjeijs4SHwCCnBawisC3O8w
         YhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727283890; x=1727888690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2R4XJj4ap59FotkDKZ4Pzl2VkV0YoUjK1G8PYQt3fY=;
        b=jATSAGpqq0SbDeF2ysaVPZbmBToaNp5Eq96pEab95/lhFbgDmtdkvRPqHngeKFIlN2
         msKp6TR2C58yRWFFdyYwPocZH21TBj1NLF9fUHpeYp9JTpPqIbyK+2tSlTxU372305fT
         2lGFQJprTgdy4rDxSEoGXw+lws7HUgmZtjsyoz8oe7ikriuAY5j9zkNiQeWABFQt4XSk
         LkYWKDDI2bMJa84tl4DJSqf7h+0fd8zL/rf2vDK5AcyDYLJkaxG11sEHK8UBUoepgist
         W2+9FhmFLmoV/MPDUDCehvdUXc5aDesTkvlcrFouwc79YECHNz8NhSyh1AMS55eHFVRt
         fzQg==
X-Forwarded-Encrypted: i=1; AJvYcCXye2YpkMdjd+zjaIa1IGNmrCcQeNeJCO7yQG6+qmuKPh/zbXj8t2DNaebtWxySjYejWxoQJjTKmbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFcxDNrMxxxo/3JO9jV9z51hlcA0qodTKrKdyvRgkb+c9qK/of
	wn5I8mI3GT2Z4wTWqyKyhymQXUaLT73htm+pNU9v0hEVl66i9IBMJNwyL1HPeDw=
X-Google-Smtp-Source: AGHT+IGtoM0NgqWQa2JzRXVwBmyXvSTpUmC3TfaVStQslIHuIU9YRDspCg6CF9GzIcIQ/etCenGkhw==
X-Received: by 2002:a05:6512:2c8d:b0:533:3fc8:43fb with SMTP id 2adb3069b0e04-53896b91cd0mr136961e87.0.1727283889782;
        Wed, 25 Sep 2024 10:04:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d7a2sm570052e87.249.2024.09.25.10.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 10:04:48 -0700 (PDT)
Date: Wed, 25 Sep 2024 20:04:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: glink: use
 device_for_each_child_node_scoped()
Message-ID: <erdwuk77ju5tvixlyxjjcapgg6x6mpwcswjs26shj36wrypmjo@dhxdh4cvvv7k>
References: <20240925-ucsi_glink-scoped-v2-1-a661585fff35@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-ucsi_glink-scoped-v2-1-a661585fff35@gmail.com>

On Wed, Sep 25, 2024 at 05:49:46PM GMT, Javier Carrasco wrote:
> Use the scoped variant of `device_for_each_child_node()` to
> automatically handle early exits.
> 
> This prevents memory leaks if new error paths are introduced,
> as no explicit refcount decrement via `fwnode_handle_put()` is needed.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> This patch is a follow-up to the recently introduced commit c68942624e25
> ("usb: typec: ucsi: glink: fix child node release in probe function")
> to account for a safer approach to iterating over child nodes.
> ---
> Changes in v2:
> - Rebase onto v6.11 to apply without errors due to the previous
>   patch mentioned in the cover letter.
> - Link to v1: https://lore.kernel.org/r/20240623-ucsi_glink-scoped-v1-1-f0fdcfec69bb@gmail.com
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

