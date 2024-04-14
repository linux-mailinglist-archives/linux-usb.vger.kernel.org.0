Return-Path: <linux-usb+bounces-9324-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 746D78A4227
	for <lists+linux-usb@lfdr.de>; Sun, 14 Apr 2024 13:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 104B2281DCF
	for <lists+linux-usb@lfdr.de>; Sun, 14 Apr 2024 11:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F177038DDD;
	Sun, 14 Apr 2024 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhpIkn9N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3A28E11
	for <linux-usb@vger.kernel.org>; Sun, 14 Apr 2024 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713095558; cv=none; b=E+/jIgg+2X9oxfgV3NBTqpDU3F8kRQWHcASncQ173TURFf+qaugY4Ey2juR4SuUPASIunQQuE3cKdt10A1UzVDYo0yzUTQ9ib3nWjhr13gXSzFhiggScbyj4egDAZgXHmHbv25dO7oeHSlicK3Fk2QWOo0SNGJWN0gNCkNdnk2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713095558; c=relaxed/simple;
	bh=OELcq+3E5rZnu7FGd0dwphEipyMW4/g0gWXRzZgKZwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kG+Vz8ZvIMGfQO396L2fSxtZ0R+mp2V5XGikZbDZoeUnbhrGQQnluQksjRvKWl5IUEFlLt5XQiQQDV68v1kh1kiPXDgYjx4KZrFymcidfadsRvuuBnUxX203tcOP19ichg7/3Axrjv/AggkTxeauEjK4kL6nVfogcQHPt2GGcMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhpIkn9N; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56fffb1d14bso3154308a12.1
        for <linux-usb@vger.kernel.org>; Sun, 14 Apr 2024 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713095555; x=1713700355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=79xLAucvoZZkVPMEczdcHBfvH169CNfN69pSBZhSInY=;
        b=bhpIkn9NPTrulE0f8OoaNj1rSDIH0a4m1e1yar4dirTyrPYXxX8wJz7A09UoVbfgA2
         o2M2QwWSVLGSQgVkfc+5rkKIlZLwatrB1voHlrarMd+VlQZUI5gqCHQcusnvUbulmk4X
         V6uO7pFQdKP1I2KP3mrWwAQNICw1o+W0yqeAfGfu+7RTRI+PA4BA8siUbFjKHz/Vkz1F
         J4SSqXeOkKODto88uBotKSm7OHYA6HlXuxoUVJASyWKQ/ZweMWfuGo1DWd0Ilcc/B1xh
         ROqkpwTb+pFGNdsVWbmn3t/C4Mfwsf99CEkgRqYbNZ2zpOO+zXmEEN8cMcs3VDCARqQO
         RzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713095555; x=1713700355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79xLAucvoZZkVPMEczdcHBfvH169CNfN69pSBZhSInY=;
        b=FpwQ55o1zkRsBhOMpDLe3bpw37Ja5cInXidAZp8Yh7Ub1LxaSxVtq/Sm6dpxN5hDxc
         G1A77RjaqDoG165llgwSZ75sqPg1mj5kJkXrrpQnaNaJI/auHGY9rgBzsut01I2e0vhb
         /wb5QTV09WUBSXYMvWUUVEjvV70S+FXqEyXJjlKar02UiI2qnUMAbsNTqZrUPuLbZbRF
         Hj2cxFkRD7kAWDrZ4gHuVWjHH+B6/2A4tG0tY/Xp6B65Ges7KJQjuk3dAeRrTMAHG+hl
         nMeUf/PJVjQ3zEmINXbj0K3GyaVkn1Xopc+3j3cx1/3blkKWw27DfPuK4G9X8UCRlJks
         KeBw==
X-Gm-Message-State: AOJu0YxZKxCdyDoTMLDirAp1/F1Jh9kVsWiiYwJ8XnHDVWXSJKiSDcWW
	gSJyjzGRECazw7VmFILal9cyIWPXD/le/AixWYto9zu/xC18ImtTY0LnJ0inPOM=
X-Google-Smtp-Source: AGHT+IEU1O5/XWjQJ4h1x/dPdIF8zf/7GBd6qYMxKueXTgNRqR3bFx0nIFnRB5ynOcSTtgB0gxFI7Q==
X-Received: by 2002:a50:f68c:0:b0:56d:fc50:ec50 with SMTP id d12-20020a50f68c000000b0056dfc50ec50mr3938456edn.13.1713095554419;
        Sun, 14 Apr 2024 04:52:34 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b44-20020a509f2f000000b005701ded12a8sm944615edf.69.2024.04.14.04.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 04:52:33 -0700 (PDT)
Date: Sun, 14 Apr 2024 14:52:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: typec: ucsi: extract code to read PD caps
Message-ID: <b00b229b-5191-4157-814a-8f9e57c36def@moroto.mountain>
References: <a3a2799c-04b3-4b8a-b808-5a118b330619@moroto.mountain>
 <7zonsyhzhpxthhaty7dwhdnm6jniwl4ia46fde63zbq4c4kw3x@jl4w2zn7a5fx>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7zonsyhzhpxthhaty7dwhdnm6jniwl4ia46fde63zbq4c4kw3x@jl4w2zn7a5fx>

On Thu, Apr 11, 2024 at 11:25:50PM +0300, Dmitry Baryshkov wrote:
> Hello Dan,
> 
> On Thu, Apr 11, 2024 at 04:20:22PM +0300, Dan Carpenter wrote:
> > Hello Dmitry Baryshkov,
> > 
> > Commit ad4bc68bef3e ("usb: typec: ucsi: extract code to read PD
> > caps") from Mar 29, 2024 (linux-next), leads to the following Smatch
> > static checker warning:
> > 
> > 	drivers/usb/typec/ucsi/ucsi.c:689 ucsi_get_pd_caps()
> > 	warn: passing zero to 'ERR_PTR'
> > 
> > drivers/usb/typec/ucsi/ucsi.c
> >     680 static struct usb_power_delivery_capabilities *ucsi_get_pd_caps(struct ucsi_connector *con,
> >     681                                                                 enum typec_role role,
> >     682                                                                 bool is_partner)
> >     683 {
> >     684         struct usb_power_delivery_capabilities_desc pd_caps;
> >     685         int ret;
> >     686 
> >     687         ret = ucsi_get_pdos(con, role, is_partner, pd_caps.pdo);
> >     688         if (ret <= 0)
> > --> 689                 return ERR_PTR(ret);
> > 
> > This is returns NULL if ucsi_get_pdos() returns zero.  It's really hard
> > to say if this is intentional or not...  Originally, we treated error
> > codes and zero the same but we didn't report errors back to the user,
> > the code just continued silently.  Now it's reporting errors but just
> > continuing along if ucsi_get_pdos() returns zero.
> 
> The code is correct. The calling function checks that the result of
> ucsi_get_pd_caps() is an ERR code and if that's not the case, assigns
> PD capabilites to the storage at the connector. If ucsi_get_pdos()
> returns 0, there are no PD objects, nothing to create capabilites for.
> Thus the function correctly returns NULL.
> 
> If you think it is better to be explicit, I can send either an explicit
> fixup `if (!ret) return NULL;` or just a comment that we should return
> NULL if there are no PDOs.
> 

Just add a comment.  This static checker rule is going to have false
positives, and I did think it might be a false positive, but it just
wasn't totally obvious.

regards,
dan carpenter


