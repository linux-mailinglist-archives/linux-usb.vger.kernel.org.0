Return-Path: <linux-usb+bounces-11278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6C9070EA
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 14:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 367971F22FB8
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 12:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F921EB26;
	Thu, 13 Jun 2024 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hv1ir7F5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BE2566
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718281916; cv=none; b=U7hvMeEzyb5EDWC2tP1H8Gp/zs/gpisz7ZtYCeg4Cd03Tm5LTiXVn+uB0Tjnqm70PR3i6U+lAB1faJZ+DfHJvL4IPMct/hHFGOUh7MIWjlrXYShT5EXm98/D6du17FXpvq1b2ZEe7MsbEZ87ggzRqzgOJ3ta6bXooq6uFrr2ipY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718281916; c=relaxed/simple;
	bh=V8V25mHe3o3dnQMzJHzUOo+mYsYHzL6B8ZGKBhsc9Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyQ3eZ3vJGkf7KZiBvGN4Z769FiwP/ruVR0jECQHQ2qRhqy2fkwcBrTfFQKqsNtGzi6k4gkh1vsgIv0zcCTR5XKsk1jHMBT4wHsLgb+mL82SuwE521txVXITkRTbckjX3Cp6mugvFAl0aqBCNsqKWluWCBkqE4lthnB3ejJups8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hv1ir7F5; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so9510121fa.3
        for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718281912; x=1718886712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vsUrIlTW6nGOTZobooi2Rw2dAWLou1HKoci8poY+DbY=;
        b=Hv1ir7F59zmgva0ffRY5aGBHjHE5pNOtq5gIep1bUhID33+/LClKaucoZod9jZzTfq
         0C+pfhinXRDcmdLUMqBmJGopyLhb5EvFX66z1Z6/s/XMDLTZ7aRZFss+E1+VbxaKCe/A
         L3DFqnmxFXu7sR5p598RJX22lcDOctqwiOynFi0ddxAjHtGpHohQkbZFMPAdNQH86sqk
         90LMFcH0uqsz4Kyrgd1/uYwiA+X6Ryel6aYvbYIkokcSUutVp+GIPe0P8C6VS2fsquHZ
         j1BJLgo9MX8rQLrWxsBssFCs0RP42jRhqT47zm1WV7ODXeYgYZ4ZwkT7xrP0EwfNhUZd
         Yc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718281912; x=1718886712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsUrIlTW6nGOTZobooi2Rw2dAWLou1HKoci8poY+DbY=;
        b=WdmGd8j9YILFa3SO2E5ury/zORhrlbYrZVUyX1nySj+qCcpDyZ+Z6LsrAL3851wahA
         VT0fIa9J1/2xH1YXjk4F5LJRWnsnMu6XKn767J95CggMa2vFusA4/+OPYyQUmEtBceqM
         D9skplu9wd6sm45CgHTFztpV3uMnFSJhdyk12n2NAg/oa7HI0wsSxs+Qw8ghc2gigreS
         ASxwapY8vz0uSSPcocSS1HitVlDtwoOu8utunxTFbfZhgVB9dP6MZtzhNF4xbg5z7Puh
         0E2YEnCWuH3KQs3FMXSuBGGPOdqUqglrizXmrW107uD+PRWnXsLkTV2MEcGK+feTYxXQ
         YnFw==
X-Forwarded-Encrypted: i=1; AJvYcCWgFAY2s+BZ2Cab5hw0SFCQu0ulJUGWk/dxvzEfT+I8Nu1XS35xdrJrsAk3AfbXH3YD34cz+3RVYD/wH6CtAPwECNdkMTwoYRKZ
X-Gm-Message-State: AOJu0YxYFdXpTgR6AksNSs2RwLMhgmyz/1nFOXJMAqK+QHGKuJB7Lg89
	31tiwzofj6jnL0gH1IHTysg1gToJU2EOhDXoaSTYHfnBedFU/CopKAL7pcpHBXk=
X-Google-Smtp-Source: AGHT+IEU9KxKELVXLWfJkodtYnVXSyXkK5gIERXu1+MCu7JJm3O/m+D3Cy2CeuCHgC1aKwmurCr0nQ==
X-Received: by 2002:a2e:9211:0:b0:2ec:67:8647 with SMTP id 38308e7fff4ca-2ec0067882amr20415521fa.2.1718281912500;
        Thu, 13 Jun 2024 05:31:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c7813dsm2004091fa.76.2024.06.13.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 05:31:52 -0700 (PDT)
Date: Thu, 13 Jun 2024 15:31:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: glink: fix child node release in probe
 function
Message-ID: <fuoqdo3s7vxjb4edctkgmvqmzd4bcivos2crotbl6iyhjtylii@jyqk26c7quxd>
References: <20240613-ucsi-glink-release-node-v1-1-f7629a56f70a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-ucsi-glink-release-node-v1-1-f7629a56f70a@gmail.com>

On Thu, Jun 13, 2024 at 02:14:48PM +0200, Javier Carrasco wrote:
> The device_for_each_child_node() macro requires explicit calls to
> fwnode_handle_put() in all early exits of the loop if the child node is
> not required outside. Otherwise, the child node's refcount is not
> decremented and the resource is not released.
> 
> The current implementation of pmic_glink_ucsi_probe() makes use of the
> device_for_each_child_node(), but does not release the child node on
> early returns. Add the missing calls to fwnode_handle_put().
> 
> Cc: stable@vger.kernel.org
> Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> This case would be a great opportunity for the recently introduced
> device_for_each_child_node_scoped(), but given that it has not been
> released yet, the traditional approach has been used to account for
> stable kernels (bug introduced with v6.7). A second patch to clean
> this up with that macro is ready to be sent once this fix is applied,
> so this kind of problem does not arise if more early returns are added.
> 
> This issue has been found while analyzing the code and not tested with
> hardware, only compiled and checked with static analysis tools. Any
> tests with real hardware are always welcome.
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

