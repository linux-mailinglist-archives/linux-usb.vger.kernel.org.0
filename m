Return-Path: <linux-usb+bounces-31846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEE3CEA29A
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 17:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86D773024E6C
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 16:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1842F320CB6;
	Tue, 30 Dec 2025 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qcZmRhKd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462F320A0C
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767111826; cv=none; b=CNX5EhlVVhhBkWLY9V+fuMIBGeG0CGAMTHxiJYgZ95j6MP9aROURjPEeM80C0zNJt+NGXLI2QDXh1kJ4UIgc6RcQHEd9WwA/PnJkEZB3JVaNDEyPQ4QtaXIt+8QXDXTVfFwf1UU/xfteO05V28UnDge5goKoknom4HW+St12N8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767111826; c=relaxed/simple;
	bh=w/UY/Tqc8nv76sUPAN4wSJGcnbTSXqungYAUKKX2WLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLwtgyZVfYdRMoOlzcd398v8dHWRQebpvPOMGGgTDqT+DNDrJbYuWWXagtnpO9fV0Gwp71Pcg5804mFxJzMBSmWb6SqpLsAfTHEnYQl6Vv0PZ0/FL7y9dZU11WHy2nGQfxJl1SYzl4nwbJG3nPhqcjTFlFUq1JDPCa1LFdq3o0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qcZmRhKd; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so142774931cf.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1767111824; x=1767716624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L8ZJ6UdkcT8zvPOgleU/+NxmdakY1tW7lnTezQizIX0=;
        b=qcZmRhKdZ6mnfAJjB1e0ClRECcA7OcrxH30DlVqadsh83930xdAo4wda2YMJtYfH1X
         4jUM/eQKvSKSZ4AlEydCt4qDB0VWkNXWZxmYYUvGsTxzizY8lV9oEAvikFxd1O8aTgD8
         o9mL/riB1+zt2pc5VkHbruH9s9g7DYm0ApDUdrIOMgb7cuoeHdaNdHR3fZxATb8ZnUBc
         F2etNWkLXuUbLhxdNO3vGY2uRkazMaHlsgaudIfgAhiWvjJLVoAo0TfkuumHcQN2FeHa
         orXVH/HFjEH4G0vSFEnlPBVJMMYHo4mg+1vcqX1qsGYXvYznxRXocnUYJT0kMsZ0i58D
         MI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767111824; x=1767716624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8ZJ6UdkcT8zvPOgleU/+NxmdakY1tW7lnTezQizIX0=;
        b=pYRb+7d51FWYO/4+d336e4DrHpyNwnp8DTjec1rvOEkJCyVMMvjvvNw8ctw0SwRcsQ
         JL0ymCw9EkjA/o7HmwOfOL27BBRoeJSjiXxK0wRs2Hi4kE4IeHpZr742Go0c1NrwUY4M
         l5FoZElL5tIiLx5UiB8HuA3DQsSk3kGjAOGrdwRdJI+eZa95/XGgHEud/s0eEU1Os31G
         XIec54gGu3N+frTGSAcW5/NnJVb33YRfN8jRJhmmeejqW+6sQcjExy5Tw+2/m+8LKXd+
         6j3fWWhtsh0Q5WG0yVaO/VqsUufkbnYaXhwvDCCvmNS9l3aGIeBcCGDKDERADl4oqDe+
         Y0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWFBAE8Ye23XR32Y/eazKnCS15yUKQMeoEulZAHDDbkMxzQzippY8YMFXP9gfnmpCTcjIFnnaj26BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCe60lYK5Jr/FixHFUFCMBnihHjjUOqLttQD614g1qXeWyeOL1
	YtRL8H1OKgs3xKe07lS0/IBuMMUyVVIk4sMRUY6pbm7MXpWq0nx1E8p0j/liTGfKUA==
X-Gm-Gg: AY/fxX47Xs8F/I+J2RxEgfli7cwUe95LZLIJynuPbYYctJgnr4JcIU1pGPwd57QTPB1
	RAiqk17E/qlCdfXbsTXCGzeZ364PRAVEDu4P3PdbVOU9bHuy+IoheKbKcyGJzDsvphVe/l+0KYw
	rSO99xwBRm4mB/9PSN2dSLBu4sge7sWQJ09RfDaWZYQPRj8fReX7N4P7Y4DAlFgNdrnxNTOv7wF
	rcBKFfr0cuKZKpvPk/Z3hPucqYfYkaxIiDHYWO0IAmvAlsOIwKx/zOberAG53qbKqmSXBX+TI43
	1LXj+fIt6m6zQQXmxGZ6tZjOgHnnjIrl/9Z4M83p0KeA21WE98fgav3fGEuSrz+PzgSaXFHAtA/
	mz0LdG+rzx/4MA4Zo/lhEP7+cbfsyvXSY3i6fKHyKSuBqUvRMt1NrrCO6sq2PTZbxv7EP6ZndRz
	bBCB60//sDmjDf
X-Google-Smtp-Source: AGHT+IE4eYTdSnAyo5iG9/+4AqV9PlulJB/GwNSBfqZUk9N3H2dXBeYrhPObuREn/1kzzFbfj+tGkg==
X-Received: by 2002:a05:622a:1e92:b0:4f3:5827:c96d with SMTP id d75a77b69052e-4f4abd6e4a0mr583133491cf.46.1767111823755;
        Tue, 30 Dec 2025 08:23:43 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7e72])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac531081sm254829061cf.7.2025.12.30.08.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 08:23:43 -0800 (PST)
Date: Tue, 30 Dec 2025 11:23:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengwen Xiao <atzlinux@sina.com>
Subject: Re: [PATCH] USB: OHCI/UHCI: Add soft dependencies on ehci_hcd
Message-ID: <af0e1bc5-d08d-4b66-9a0b-4c39f17a043b@rowland.harvard.edu>
References: <20251230080014.3934590-1-chenhuacai@loongson.cn>
 <2025123049-cadillac-straggler-d2fb@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025123049-cadillac-straggler-d2fb@gregkh>

On Tue, Dec 30, 2025 at 09:15:36AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 30, 2025 at 04:00:14PM +0800, Huacai Chen wrote:
> > Commit 9beeee6584b9aa4f ("USB: EHCI: log a warning if ehci-hcd is not
> > loaded first") said that ehci-hcd should be loaded before ohci-hcd and
> > uhci-hcd. However, commit 05c92da0c52494ca ("usb: ohci/uhci - add soft
> > dependencies on ehci_pci") only makes ohci-pci/uhci-pci depend on ehci-
> > pci, which is not enough and we may still see the warnings in boot log.
> > So fix it by also making ohci-hcd/uhci-hcd depend on ehci-hcd.
> > 
> > Cc: stable@vger.kernel.org
> > Reported-by: Shengwen Xiao <atzlinux@sina.com>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/usb/host/ohci-hcd.c | 1 +
> >  drivers/usb/host/uhci-hcd.c | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
> > index 9c7f3008646e..549c965b7fbe 100644
> > --- a/drivers/usb/host/ohci-hcd.c
> > +++ b/drivers/usb/host/ohci-hcd.c
> > @@ -1355,4 +1355,5 @@ static void __exit ohci_hcd_mod_exit(void)
> >  	clear_bit(USB_OHCI_LOADED, &usb_hcds_loaded);
> >  }
> >  module_exit(ohci_hcd_mod_exit);
> > +MODULE_SOFTDEP("pre: ehci_hcd");
> 
> Ick, no, this way lies madness.  I hate the "softdep" stuff, it's
> usually a sign that something is wrong elsewhere.
> 
> And don't add this _just_ to fix a warning message in a boot log, if you
> don't like that message, then build the module into your kernel, right?
> 
> And I really should just go revert 05c92da0c524 ("usb: ohci/uhci - add
> soft dependencies on ehci_pci") as well, that feels wrong too.

This might also be a good time to revert 9beeee6584b9 ("USB: EHCI: log a 
warning if ehci-hcd is not loaded first").  Firstly, because it doesn't 
test the right condition; what matters is not whether ehci-hcd is loaded 
before uhci-hcd and ohci-hcd, but whether ehci-pci is loaded before 
uhci-pci and ohci-pci.

And secondly, because if the warning hasn't convinced people to fix the 
order of module loading after seventeen years, it's not likely to do so 
in the future.

Alan Stern

