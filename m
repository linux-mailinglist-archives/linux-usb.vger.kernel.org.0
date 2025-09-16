Return-Path: <linux-usb+bounces-28147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9DFB5925E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 11:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78F377A2B66
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BD4296BB3;
	Tue, 16 Sep 2025 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvOFL8pJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B7728B512
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015423; cv=none; b=YpoLYyIZkmA2Iv5KlbNdMWNMGNfV2hWIPJNPhqx601w0AQdH+TRN+6WZOVPv1S2jq/VKwifGFD8vN5Bgrqwc3DTxcYwhW+tTTKz1qgjvNcTmmYIYsQf0lFETlxILw6BH4eARsVWyzXQTh85gmKeu0Uw8HYvmQj3Ed7LNHbW7hns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015423; c=relaxed/simple;
	bh=mWsnCrEDAalNGqXAfVcIDDRpBiqvwaX28D7zH61ufXw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rt4ek53msj+w5Uxd/4BZALVWiSfHHKEcJUuX3asFGCD4pdpJ8xf9FbWHRuaNg/l31KyPnDgutta0ZBdUMu3I66OPdaHNt6cZeHLFRNf2a9r+wWWMOX20tWoa//KwcZ1WTLTJIoBlf+qTsZUkJyOpMopwDpDacPza6w7Z3JIILw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvOFL8pJ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so4712282e87.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 02:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015420; x=1758620220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT+kkcda487lBQ7cJVBhIs56BiILPBuoH396o2tlSMg=;
        b=fvOFL8pJJ1gKXMKmeLJvmAa7o+/oENlER+0D+GSEbEOGhvU3z3WNUqRmkAh/Q0kMNn
         0hRFAZoBaHeB8uja5g9Hm0S9iBt1L6m/L5csNQvArR254RB52u0e9zE1cIqnjviY8UM5
         YqnoU7iMNr4VfNFL9AZrDWOqzeCE+Q1KzjLEe7Y95U5sxjzXXwhnAMWAwG/JBVXM04ss
         5ttZfVgSTAnx8N1y1EVqSGK18aKO44RY+GILizMyw/hGmEGr6E/x89mKl+Mh3BStS9Wp
         sq8F85biZ5ejcHwVy7aSO71Ay86NmMrDdsARip1E/XQGn5La8yns7BhpzN/N7u90B7IG
         hqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015420; x=1758620220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT+kkcda487lBQ7cJVBhIs56BiILPBuoH396o2tlSMg=;
        b=ZM1X7LUacvlzhRe+fMXr4v1jwv5HLzP+9IQSEBnZ6IRka5MVAvovvelAcsnoQtMkvA
         5gd7jrhsa7lx77U9YbDXYojTyDQDQx55tGgUa0VGLN0N615QC8FHXCLQ+sMxYcRx4Jb6
         bTUeW01yv32R8GLQxDpZbP3hIq/g4YCjCggw8fIk4Lhjh9lLZVr+25OwQ/k3hHh74J44
         loJ01/upRjhG3TGEMdIoszRhnMWsXM6TXLou5NYYH7Vxgp5evoL+fdqjlLvNZm90lukk
         hnelfMdmZcrrHfsV3aQqsam6VFP8t1EpwMpDkIUcGDwhwnl0x7andezcfMu0zqYMeqdz
         0oeA==
X-Forwarded-Encrypted: i=1; AJvYcCX1wPRaSwfg/JaiijH8RDiaJPbO6X2JuW3JzaBIV30HBbqPhCyIvlnPwcmzj10qSTUp1dLZiN9o1Cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqXhrT349dysNqkuLCwirxUowntxY3nna4BpvkX+/OK6GuBvkD
	2yA9e9mbq/QsFLNilRqfy0e4yAdsS57ts/TfWoeEMcjD7fHGSOzLLMMD
X-Gm-Gg: ASbGncu07X6ZekkexAZEFvnRJ0bD7x0jwyUnCsDWMkv2vkhG8mGb8zPigOgx0PTfoTY
	FqJpSna1okKKI/oGbYQQ/AREjIKfB0rTsUbEVrxc2vofHv//miSxe/i+pP2W2WJ4nXS3gJn+leH
	RYAcIhiNFvPVJjLeR1sukbN3Jl+PDtRhnMCYm3UnjfpTyLwMvfYttd24o4/UCFpgwORYh9OYdU6
	Ibl+69F4KHmNpKYrL+5I6Hzgj6l7lo1PD3ReAS3U1/ZutJiC6YhPOdsePoA4NK2M85D9UHeoPyS
	qZ2D7mZvc1XKZ41rbGbG+p13s1HauzVWCxcaKu6di8CLRJxkz66SehbC7mVIDYGCXqzVPOlXxPD
	cBAKG5ABul5NHTx9m1cIqETP5txZVlBD8qf0=
X-Google-Smtp-Source: AGHT+IFYENCNVxyxAvta2asHRQN3nJUY81Ix83uVNfsxWaH3rbakorkJ6NanevaEDosEMxicuKV+2w==
X-Received: by 2002:a05:6512:3042:b0:55f:71ad:590f with SMTP id 2adb3069b0e04-5704f99adb7mr3959374e87.53.1758015419608;
        Tue, 16 Sep 2025 02:36:59 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63cc6sm4343438e87.66.2025.09.16.02.36.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 16 Sep 2025 02:36:59 -0700 (PDT)
Date: Tue, 16 Sep 2025 11:36:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250916113655.2e61d0e6.michal.pecio@gmail.com>
In-Reply-To: <20250916113210.11b77abd.michal.pecio@gmail.com>
References: <20250909115949.610922a3.michal.pecio@gmail.com>
	<aMAPkH5-4rLdmx_9@smile.fi.intel.com>
	<20250909224416.691e47c9.michal.pecio@gmail.com>
	<20250910075630.0389536f.michal.pecio@gmail.com>
	<aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
	<20250911113451.1f5e5ca4.michal.pecio@gmail.com>
	<aMMtgsAa-dovMqdG@smile.fi.intel.com>
	<20250912114644.7b9bfe37.michal.pecio@gmail.com>
	<aMRgL4fus--v4QjP@smile.fi.intel.com>
	<20250913101246.515abfc4.michal.pecio@gmail.com>
	<aMe-QcrnE5hMHC5E@smile.fi.intel.com>
	<20250915122251.333b4db4.michal.pecio@gmail.com>
	<b5631366-e3a3-4bb8-b543-c9c0be12589c@linux.intel.com>
	<20250916113210.11b77abd.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Sep 2025 11:32:10 +0200, Michal Pecio wrote:
> This compiles, works on x86, and is wrong:
> 
> 	u64 addr;
> 	xhci_dbg_trace(xhci, trace_xhci_dbg_cancel_urb,
>                        "Set TR Deq ptr 0x%llx, cycle %u\n", &addr, new_cycle);

Sorry, I tried to do one thing and I did it wrong.

Of course I meant that ("%pad", &addr) is wrong. Basically, as soon as
formats are converted to %p-anything and variables are passed by ref,
it's game over for type checking.

