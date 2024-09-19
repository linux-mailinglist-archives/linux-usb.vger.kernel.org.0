Return-Path: <linux-usb+bounces-15253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FDB97CE5D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 22:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44329285111
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 20:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F10013E02C;
	Thu, 19 Sep 2024 20:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQeU6//D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5D013B5AE
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726776057; cv=none; b=dHIdDdz7MH5mPwY4fuWJ7d/P9J3/Ybo0Ct3TdEG7EMzIYOKL+NBNevWjRHVYuWmv0VylcuiWqmv/vD4OgUzsV3qMdeKOJKNIr9u4OfAH8JDwaD8Xta9vSn3F0sLl1dhmUn7FFDnVRygov2dgl9q4cobBcKVb3On27EaKuW4+G08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726776057; c=relaxed/simple;
	bh=RFVxadnFs31MpYCZW3HGd22hr61t6wT5W1HJygEmxv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKeBbdzUBrt8J309v6G/Xa+kQG+JYL4+XlzTFOUwGewCUwevFqdgw2mod++DbBjVyIuYPNoFWLeqOM4xjo5/a5/BZz3+e7tJ2ZpOGcl1ARyu9wPARJpwM43LYLtvuVi/9D3SlPIZc6l1H33cOoASLKBagw7Y4mB/8Pt4ZNeGVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQeU6//D; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365b6bd901so1458105e87.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 13:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726776054; x=1727380854; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaVBunmnbZVdq/qwLaTcD5ybL6Hmaz/2JnQ80TsIRDw=;
        b=oQeU6//DLSPh4hwxdv8n3xIE4M5xihHzc3x0YVmq7X2Lc6HFvGA3epn3eauAbD3ejD
         kD3uit+cLgUqd0SyjET73XbbJ5entvYnjnq9JH92CA6sPIuRgsPRsNj4xjCd1zcn3J3x
         8Z7T9IvxwdMpuyhQdWG34Gsq5Am1vS9PHXg84vczfYB5gAjPbkgljnPA259V6e2TyZ53
         hyKLqRbbdao0HxvPRzUyMUr+QTTeDts953WqfNsZNP7RbBKl39ofI66KiXcnsUf2DHqI
         hU1hJvOhGUoX0jmxvsUF6raUGgVQyI1Ex0078kEujTwLQLrLZAn311ANYmuoayviosQc
         fI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726776054; x=1727380854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EaVBunmnbZVdq/qwLaTcD5ybL6Hmaz/2JnQ80TsIRDw=;
        b=QnPe8qI0bpfQg9lG7L+wJtzO27Vwu1c1CMfmv1bt3qNI9J4kPOZBZ1B05OJRgA0v6Y
         uVxFj3/pWTy9VrG0Ua3HHdyx7o3Eqt1uXwgXqD0zcxKwwhg4GhbA9R5C2v6+mGmdOR0i
         O+s66q1TiPzwwKS0SGznx3Fsj9h7h9UgkBZyKEkGk3tSkJK4gAAgIonAwWeXLswTeqPR
         Aqh9XmAWEpFf1BLX5tqJRiuaECB+MI8MV1J5LmbmZCsPkoG7P+/XN8Qz3KyV00umKgSp
         LHVTZyU8EngOEqhhTsSc1cv8ULJ9+Nj8B6teD2Od1YzS0U7Q9fgglbPdWQHwKfIPJ00y
         rWwg==
X-Forwarded-Encrypted: i=1; AJvYcCXoFlV1EakVHqht57XFt+nnxznmwKxtufLpmpem7WYDzdhjWfcc2Hj/tEbUAWW5dLeDottc7NhvxYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI4oagaJXCHZwegn1obzKlaKnaH70jFnBeKQShqvjkZp/r2FE4
	BkCSDbozvZwxINOZw5YlJTe6Wt7ELUNdRNyl7XlxVXnt5fd837NnnQwRIumz784=
X-Google-Smtp-Source: AGHT+IH/OgvV2NHf628qjdXYPI581cfKDVffxsYLBlLGj2tiaXFgxuBsk9rKqPPRpqHhRmS/LNqQkw==
X-Received: by 2002:a05:6512:39d0:b0:530:e1ee:d95 with SMTP id 2adb3069b0e04-536acf6a767mr90866e87.1.1726776054184;
        Thu, 19 Sep 2024 13:00:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b8c26sm1931392e87.267.2024.09.19.13.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:00:52 -0700 (PDT)
Date: Thu, 19 Sep 2024 23:00:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
Message-ID: <rpdbzy5ldlsq2ahvuyrzx6tprgtgxpftd4xbos7cd3wwnhapvu@2hstbs5qg65h>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-7-ukaszb@chromium.org>
 <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com>
 <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>
 <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com>
 <CALwA+NYmKm0sVT=NPfJU7Ena__P5ec451nhViXFhK9BYu87jxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+NYmKm0sVT=NPfJU7Ena__P5ec451nhViXFhK9BYu87jxg@mail.gmail.com>

On Thu, Sep 19, 2024 at 08:03:37PM GMT, Łukasz Bartosik wrote:
> On Thu, Sep 19, 2024 at 11:38 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Sun, Sep 15, 2024 at 12:08:45AM +0200, Łukasz Bartosik wrote:
> > > On Wed, Sep 11, 2024 at 4:09 PM Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Sep 10, 2024 at 10:15:25AM +0000, Łukasz Bartosik wrote:
> > > > > Add netlink to ChromeOS UCSI driver to allow forwarding
> > > > > of UCSI messages to userspace for debugging and testing
> > > > > purposes.
> > > >
> > > > Why does this need to be cros_ec specific?
> > > >
> > >
> > > You're right. Netlink does not have to be cros_ec_ucsi specific.
> > > Would you like to have netlink in typec_ucsi ?
> >
> > Does it need to be netlink? We would then have tracepoints, the
> > custom debugfs interface, and this netlink interface.
> >
> > I think this information could be exposed via trancepoints (unless I'm
> > missing something).
> >
> 
> Hi Heikki,
> 
> I agree that there is a common area which is covered by both trace
> events and netlink.
> However netlink also has advantages which IMHO trace events lack. One
> of our cases is that
> from userspace it is easy to forward the UCSI messages to a Wireshark
> with a plugin
> which can decode it. Another case is to use UCSI forwarded messages
> through netlink
> for testing and validation of chromebooks.
> 
> How about leaving netlink specific to cros_ec_ucsi driver ? Would you
> consent to that ?

I think having it specific to cros_ec_ucsi is the worst option out of
three. It should either be generified to work with all UCSI drivers or
go away and be replaced by tracepoints (against, generic to all UCSI
drivers) or some other mechanism (e.g. TCPM has rolling log of
messages).

-- 
With best wishes
Dmitry

