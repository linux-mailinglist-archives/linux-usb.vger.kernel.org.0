Return-Path: <linux-usb+bounces-9929-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE218B671B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 03:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C14891C21B84
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 01:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2505C28F0;
	Tue, 30 Apr 2024 01:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jiTgPDIQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777788C10
	for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2024 01:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714438808; cv=none; b=s/0g00MTK/XjrMVz6NlB0Pyjeq1wYHCiAkrcKEh2TkgnvybR887dCmaemB0/mVT/tNMlpZ4sKuXGTUGJzaOt33TEMFs+HAcS3i/ZK7lKnydjifkC2vGv3+80Cu+SLFpU4OpEuzymMKWbMCFzRKIipXd7C/+B6JE0doStAG+mrxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714438808; c=relaxed/simple;
	bh=v/3ypErDQNVa5jM2PW3ZxxHtoGiydoIMw9j2sXoqxmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ka2shd5pkMfL6BFZnxIUyVL9e+muJqRz7rm3gmsMvbXTf++SzCe65YFAiEaN5Te9Qc0/WrMdJiqorqJJRMmv+vDPbubwuyk2w9KWvGx0S4+nAz1doxj5wQCgXMKXwE2O0LsoDw96LMs6FYpEfaxDNv+b9xrfu18d4/W4RAES1gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jiTgPDIQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51c077cfc09so6012326e87.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 18:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714438805; x=1715043605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MW0gqjW4MurI9jv8tMts5CfcO8yjTWyj1BIw62uNuSo=;
        b=jiTgPDIQ+MNSOlLlWy8wkW7sZ5gw87ziGmOWuvVa8n322C1Myl5dQptoW6aCiTwxN3
         COmx36vMCaP9g/4tI9Eo0WZpFZXpsCkHtQOK3kKzWaapc0vbtLexh/fTAXtD/XjVPVGV
         47w9SPUC+dcjhidP8C7AXaGaO2TaP1G9r0pyzzIH0nxRnU4i9AMpuwmNGdrqaUI9Tb1S
         5VKRclT7pbVOubMOoVGE8KzS2WNcml/Dpy3VZt02smOIl+Zv9E3MGiJX4wlkiicyEwkS
         LldffE9PXP0GtmMuEZf0/+Mq/ncneyulcruZn4xZ1tv5agw025Il2cFuZ/ccDjgGVB0Z
         3oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714438805; x=1715043605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MW0gqjW4MurI9jv8tMts5CfcO8yjTWyj1BIw62uNuSo=;
        b=IpgZbjl346fJnFlbOZ4gMsqTuiHys7kDQD2BL0ixnWtA/3qonby/0SS8n2m+CURwEP
         yqwV9ib6LLrfV9N9sc9qSbQ8P0wR89yD/rfJWwcK2ZF2lyrHrFfEQ3nWrdQgOpe4B9A8
         FruPWOd89VuspeJ2ZQ6FcHhON7dynHE8WJ4N3/sSSbkNwf3cDlpdqNRpuDl3idi9Lvfb
         3TSfebXNWanVGASAiBsaSrBTL5x5oui5etWvOFfg8sy5IPyHJNWFWg5a/OSwEJuTIcji
         PsMjkHWWAOtx0o+7fvU//Ps1GwJyUBiGMEbYtCwAJHckxnHAj6fmQqfnt6TdBaf0a8h4
         AQpg==
X-Forwarded-Encrypted: i=1; AJvYcCUyCSMzZHCNkQlv5PMlaO6U7h4N4ndqV9fo78XmZjJ4EjwlmTtEzoBDNRreJLoHAR/HXWD+Cx5qUAC9nxhOAnKcxLo1C/vpyamV
X-Gm-Message-State: AOJu0Yx7K/XZFuOPP/lrrdgnzU+x381PNf/7VzXRmTzMYfBRpnNrxIpL
	K6wEq+53Le5SUeskRY+Nd3fN651wu7nZo1VCyX3odmQCSEuzBYB8UczhLndgPEQ=
X-Google-Smtp-Source: AGHT+IEq2ipl3ls8zb9TZIFgBvt6x/YPQAoaIZznDXqzZLSoP6flW8/WnEU4hDj/Dy2Amhe1YlDM1A==
X-Received: by 2002:a05:6512:5d1:b0:51b:6d63:e0e4 with SMTP id o17-20020a05651205d100b0051b6d63e0e4mr7208497lfo.29.1714438804631;
        Mon, 29 Apr 2024 18:00:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id y21-20020a199155000000b0051d108efcbfsm1088936lfj.81.2024.04.29.18.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 18:00:04 -0700 (PDT)
Date: Tue, 30 Apr 2024 04:00:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jameson Thies <jthies@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Benson Leung <bleung@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Hans de Goede <hdegoede@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
Message-ID: <bs4r3zdc52l7zfwphiycljucjb6hqcuadq3ecgipxjgs3wj6ch@7em7rhspi7j7>
References: <20240424014821.4154159-2-jthies@google.com>
 <6e028bfa-9063-42ac-b40f-cf17a81c2af2@web.de>
 <2024042547-shimmy-guileless-c7f2@gregkh>
 <CAMFSARfOYWy0a_iZyuh9e8++xHdAYXcs2pT1_yJaJ60tHR17xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMFSARfOYWy0a_iZyuh9e8++xHdAYXcs2pT1_yJaJ60tHR17xQ@mail.gmail.com>

On Mon, Apr 29, 2024 at 05:43:16PM -0700, Jameson Thies wrote:
> Hi Dmitry,
> what are your thoughts on Abhishek's comment? I think we should
> attempt to register the alternate mode when CONFIG_TYPEC_DP_ALTMODE is
> not enabled. It would give us a more accurate representation of the
> partner in user space. I understand your point about ignoring a
> potential EOPNOTSUPP response from the non-stub function. What if we
> leave ucsi.c alone, and replace the stub function's null return with a
> call to typec_port_register_altmode(). That would register DP altmode
> as an unsupported mode when CONFIG_TYPEC_DP_ALTMODE is not enabled,
> and fix the null pointer dereference. But, it won't change behavior
> when CONFIG_TYPEC_DP_ALTMODE is enabled.

Yes, this sounds like a perfect idea!

> 
> Hi Markus,
> thanks for your feedback. I'll update the commit message to say "null
> pointer dereference" when I upload a v3 series.
> 
> Thanks,
> Jameson

-- 
With best wishes
Dmitry

