Return-Path: <linux-usb+bounces-28229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48911B805BC
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 17:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B3D43BA240
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 15:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D301ADC83;
	Wed, 17 Sep 2025 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iyOk5hTd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500CD33B481
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758121049; cv=none; b=ogRpnJE9333lAG/O1ofsF00U71XSKWT7lZUnh+bdvIoQk9ukwoV0Tw6ggQz44X2KiHXdL8ewKWrgq3CKsoNIgjEzKcxclpIFlBmyf0J86/j1F1QiPgW/T7tUjTOJBLe6/j668CYkHS7GHF4qw6BuhbFilYj95DtLN/7dptjc1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758121049; c=relaxed/simple;
	bh=9OJQZq6bHCOGv02hQ9NPzIP7qKBnKi5yAR5CrQuWy6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRVB9PY6jcEdmAeeP3HAHYARwpfm9sjTUOLPnNyLtUGnu17GC3cqaRpDsqXR4+u2/6mMruyoRldqz6A/Pzd8UWId7GaliU3SPvUsbSJtGT1Rv3giP/rGPkmqm2oTu8jxCU71+SQnW3G7FzOinVFmxPBwOv6NpWp6pD5n9iKw2CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iyOk5hTd; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8127215a4c6so101695385a.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 07:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758121046; x=1758725846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W8HN1UTZvELIwcpsDbtiuDd2WLyYOA0zppT13Ez3H28=;
        b=iyOk5hTd0RGR9IJYHKGcrhnycmh/4ftPLUaqp3uwYYz6uA9kAqIbgGODrL6+WBffg0
         ASlqAudM790xLRDtuWWVwGyscKIBeOCecYaxuipegTHgeE3O2ZwrmDYwfAcZmOhtrYQs
         gfKdsmskHqq3krQtsNfAaxiEd3Hyp41ZR6lsxwJBmigCoKmRuSdQChvKcyJjfMq4K4WV
         hK30HKK/+ZfvEEt4CWApkQQB5nEMOCD3uJYt57jUsnemEI1SeaoBf8fSVBslYFyb4zJ/
         qKaDohT80/SXOdXnCUU+ZFDXbAaoyRjUz6d3wNqDRh7pDiGVCollGDl+dZzXX1RK185h
         9o8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121046; x=1758725846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8HN1UTZvELIwcpsDbtiuDd2WLyYOA0zppT13Ez3H28=;
        b=ia7ywZu9ISEz5/VHD9iMPfDG5KzMW7YBsm+FIFB+axqhDpz8SMA2xLycgQDI834GvC
         k2e7eS4J/XshTfTtmZBqVLRWWMnmerjg+mv0c+OanDEJ0SiahZQFdOCE/NNudfLF+0xV
         8c1LY2a+AGNMb7Qa1r0bXAFRu0ZJlsNmQaGkyzjLyhdKGrjWAWxoKttrtRZdBu3fN8vs
         1sXdxxoNzVA3C20KuCmnw8sWBu7Ie9s4d1+33JOfx6mJEgUOvk2A8S+XyR+wh0BAVoCE
         XJnZj6mvud/O2D79xG57IBVEVPfdGrPU7t30r22R00/STJqHEQwRx+aX4YarGcurTxXs
         QSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTia6Kd1rRvtyatH24EaiKCRlEVUmIhgdJ6BScTcjnA0W9oNygMIhRVPDgIVPmeeABNXl4eJ74ADY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xgGmrNrKqQSZnwLsw6mS7B8v4ot5KTrMSnarhcM3RXEyKwbA
	p0DANjMYj5JwyRgOb7IAM8bCcHMsdClQsPf0tu/noDPY/e7ZXi1s7E7SmfxicageEQ==
X-Gm-Gg: ASbGncvO0MEPZoPCce3DqAC8FgcuqPmvEvKgvmQPDism8/ZXvfOJFK7GcmOkeLlwfFl
	9jqfsPZCRTXZgHoxli/WoGWPiCzagMUV/u7VPCqh9igWxm7rd7GPw08OzO0OFZICyb9ymt5DHRP
	qdlFoCSCwK0mu8RBkFz3I92mXa4wtyvRi2z6TlMsleO8nOd1CPL4kpnIvDy/NxXFlcy7R35G4Cd
	7uVuh5Q4KOecKsxH23zzvC1DJ/wHleveDmaFUW39guXmPbRJP+ZBgiWYq7ppV1J0QsoPjSH509U
	SjKcjhK7Bm0/8XWFRlU/elqPKppWgbbFYiCLhU+7rdpm9h56fweSZz4PID5u+MMavjxeoOiCY9W
	bxOuDk7nEQ258yODKWadZqbMuS3N9uwbbN2OGdx3ugmE2otwGuBYOfwBZDraOQ5syyNHyLFxZze
	mF3pBRbzEHLl7iB5EhC9KL
X-Google-Smtp-Source: AGHT+IHSha0l2uy8bY+NcvRiDKKxmDF7lfi4/yLSRxZTDI+PO2c2F0E2cv/USSjdeL4NWU7Va2vk2w==
X-Received: by 2002:a05:620a:4713:b0:828:b2ab:a50e with SMTP id af79cd13be357-82b9e38f41bmr799576585a.31.1758121045894;
        Wed, 17 Sep 2025 07:57:25 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c974dbbbsm1145829885a.21.2025.09.17.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:57:25 -0700 (PDT)
Date: Wed, 17 Sep 2025 10:57:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hubert =?utf-8?Q?Wi=C5=9Bniewski?= <hubert.wisniewski.25632@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Lukas Wunner <lukas@wunner.de>,
	Russell King <linux@armlinux.org.uk>, Xu Yang <xu.yang_2@nxp.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH net v1 1/1] net: usb: asix: forbid runtime PM to avoid
 PM/MDIO + RTNL deadlock
Message-ID: <ccfd7d48-401b-4f25-ac8e-aa6aa9654956@rowland.harvard.edu>
References: <20250917095457.2103318-1-o.rempel@pengutronix.de>
 <c94af0e9-dc67-432e-a853-e41bfa59e863@rowland.harvard.edu>
 <DCV5CKKQTTMV.GA825CXM0H9F@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DCV5CKKQTTMV.GA825CXM0H9F@gmail.com>

On Wed, Sep 17, 2025 at 04:31:40PM +0200, Hubert Wiśniewski wrote:
> On Wed Sep 17, 2025 at 3:54 PM CEST, Alan Stern wrote:
> > Are you aware that the action of pm_runtime_forbid() can be reversed by 
> > the user (by writing "auto" to the .../power/control sysfs file)?
> 
> I have tested this. With this patch, it seems that writing "auto" to
> power/control has no effect -- power/runtime_status remains "active" and
> the device does not get suspended. But maybe there is a way to force the
> suspension anyway?

I don't know exactly what's going on in your particular case.  However, 
if you read the source code for control_store() in 
drivers/base/power/sysfs.c, you'll see that writing "auto" to the 
attribute file causes the function to call pm_runtime_allow().

If you turn on CONFIG_PM_ADVANCED_DEBUG there will be extra files in the 
.../power/ directory, showing some of the other runtime PM values.  
Perhaps they will help you to figure out what's happening.

Alan Stern

