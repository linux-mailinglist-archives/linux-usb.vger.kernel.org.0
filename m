Return-Path: <linux-usb+bounces-29962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC779C258F3
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 15:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDAE756514E
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 14:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AF533E353;
	Fri, 31 Oct 2025 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fHBcc4jJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A5930100F
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761920031; cv=none; b=GGMRPerd88hvRyzxmy3Wr+vx4rCahxjXtpDxgSsWXPYHnrCg7JhZLzVXEW/ixM6WQ1RDqbXZJtug4mUbhZ7Tc8E+L4tOuaQS5782XHU45PCF8uhP4rh9UnGtsnY8CzcWLsm7yESI3ozJc4nU3y+MnwMVkiHVDF/y47EsJYBGC7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761920031; c=relaxed/simple;
	bh=5IkfxjJZ4r9JL3RHKmEuNeI8JfBtFUokKvT9TMT3Zl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=soe7gGtV9A8kR+gWiLzBwqQjNJeGyuAdhEWXHzkwbZroLpcHwiKbsso61KHT3LfWB7V+ZkQHLECSTuFQ1Ge7P9HxZDr6cR7eWsq0ajQRKTB80ABqwPc3BaZnoSRtUX8sX1eeCUDLi/JC3UMih82geCFC2ZcZmtHMJBLPbmcCevs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fHBcc4jJ; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-935134ef989so652985241.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1761920029; x=1762524829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pDa5fR2h0z+rmz32KUZOMrbkoBXGhQsX0WYRDCHkFfs=;
        b=fHBcc4jJa7Wb+sEL6wly90c1odJUBgQPhSDO/YRTvEp35O3G9tO3x5Cokt1Q8CnarN
         HF3ZOrwUhpU6vt6atg/6kiTvTR1z+QqiknZY3lPeTsiH8jkOBlPJI9OpjenX6eun9QKA
         9VI1Lfa1KjijOeHXJuirSqmpyYbrv2rGgqwlcsahWh9bJzFPcOVo6yvStr6fExbCIh9p
         bY4lsd7ujRHid/XoPS0cpSas/SWEP0nc5wOIZzj8SSdcJbltyibjIk/2v3Ap0he7BVpP
         O2gCCqkCPBJc3r01rbVRT8NZ4x5BygMskx0AsoCR7EYvJ2bzLZ1GMGWUsZhXK7xMZZdj
         sCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761920029; x=1762524829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDa5fR2h0z+rmz32KUZOMrbkoBXGhQsX0WYRDCHkFfs=;
        b=bihzVlL9rowpY/H/U4fdmFTtwegtWrE1/etMu8sMQCzvVccl3/bYy5m8t7S5B3u1GD
         evanORTmqLd0gcjP5ev3zKgvuRu8fiqn4C/XVIfzOwyjxiGp5WBFkq9D5T1vqGKuznss
         6O9wP7FKlFuj+wLlUnycWpE2T7jwFeP+zxEv78XtYV0z3bHRGkQxNVg5dntYIB97f8Vt
         uw9EyprrYFdb9cvXQyEzAWWsAjdwcEkm+grWitlnWVy10rWnXxjLTPXGc+q1CJqr9Mic
         5kDDhjG6uIfD9mwK4txj4pQnr/B9ubrgU9LlBt1+aT6ktCnZrbc74hpGZqMd/bM1/KYb
         STTw==
X-Forwarded-Encrypted: i=1; AJvYcCX4aKfIm/kA5tARfUFM73WBrv9vOvAq1uxfy8hamwnQgCIvfD+WZP1DR8tCOt2HMC7ikSCfpkHf9/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YynsZCuRa89wLLvdSAh/kCO24GKy/e7P+rYgYyDxs4lxKwUr61r
	tefaQPzgBrColPMxZTpJtas/hVx6IRckq0zfj3L2prpQIql6Evpr1GGmJYi1s4r5l3xaSRP+Z9z
	FtZc=
X-Gm-Gg: ASbGncsBzTVkWzIGWgUTTM4GHaBsNiEeciuLM3jg+dgxDGjTA2ljz0qqAYB7gaLLqq6
	4857rB8Dk/a9VsTKRP0K2GAejTsKDBP5HNZJLaSPWJXRfSc4nS38ouKo8yszFUt2HW1i90KpwbP
	cUQQ/zocKrd2Q6oD9funKxP97kL/5yUbVyTPs7L+nXLBuLtCNqQBXpi5gYGNp6cU/MYoizBHNKo
	Qlwkb+SqDMxi3+gIyMzBPNZT/qvFWCNAjqdnjaTflSZm42i7OHuNLvN/xzP9EV4Cxptnx8rqpQV
	ZzYJdUqueryuIsiaIuo6DfghFnSsVd6h1RT9QP5GY52OlUDHBY2iKtNPorEsofBAwsbP2dU5UIA
	KGjrvH+UWgweLzpF58aDdk3C03+oPoOfyg20M3mI+J/SnJ9/JXu542ktagJwxp78Q9cTwWh7gpi
	zwBg==
X-Google-Smtp-Source: AGHT+IGo4scF0aeVTx9EAY8LQ4pBPDZX0toR71iJZDoumY2K4E0RX07ncJjkg0VKEHLHrCsLSrejmQ==
X-Received: by 2002:a05:6102:e09:b0:5d7:de28:5618 with SMTP id ada2fe7eead31-5dbb11e0f91mr1298048137.5.1761920028703;
        Fri, 31 Oct 2025 07:13:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88035fe28c8sm12037696d6.8.2025.10.31.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 07:13:48 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:13:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: vsshingne <vaibhavshingne66@gmail.com>, skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: prevent double URB enqueue causing list
 corruption
Message-ID: <6c81d455-a4f2-4173-be72-9d77728378c1@rowland.harvard.edu>
References: <20251031134739.222555-1-vaibhavshingne66@gmail.com>
 <2025103118-smugness-estimator-d5be@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025103118-smugness-estimator-d5be@gregkh>

On Fri, Oct 31, 2025 at 02:59:07PM +0100, Greg KH wrote:
> On Fri, Oct 31, 2025 at 07:17:39PM +0530, vsshingne wrote:
> > Prevents the same URB from being enqueued twice on the same endpoint,
> > which could lead to list corruption detected by list_debug.c.
> > 
> > This was observed in syzbot reports where URBs were re-submitted
> > before completion, triggering 'list_add double add' errors.
> > 
> > Adding a check to return -EEXIST if the URB is already on a queue
> > prevents this corruption.
> 
> This text makes no sense at all, it does not describe what this patch
> does in any way.  Please do not use AI to generate patches.

In fact, the patch doesn't do _anything_ (except maybe change some 
whitespace).  And it does not apply to any recent kernel source.

Alan Stern

