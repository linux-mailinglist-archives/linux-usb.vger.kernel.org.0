Return-Path: <linux-usb+bounces-29090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 759CEBC94B6
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 15:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 653D54E4ED1
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 13:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6391C2E8DFE;
	Thu,  9 Oct 2025 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myX0o8FH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9D2E8B6C
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016431; cv=none; b=HSx3QTYy4H6PtWuidihpTNBNthN4UNm3xq4dT+VlhndbqNA0x++udUeKLT7A78p/ns1ROsCWJcqaC5RStgEP7yU3IAWpgnqpPtjRN/5F46JuDT284GFXed7zXQhZWYdhWzahkJm8/gisvWetkCydL2xoQKZfanPvSv8eqYOf5wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016431; c=relaxed/simple;
	bh=pK8K/WbHwPwZivX6tSUsXo2Jw21mQfQLrVFjbOAYGDg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qBZNT4e270OErJH9OP5viG1Hsd8/MyPbbfCWPJXa9jln9l75D8J1HJq563WlfepkYr9UCTAr+sGIVdA1ucclXLNfJD/3B4gLZESRFnL6b0M0aP7aHjRp3Cj6nTDDAZ4qaYGx01yk+yeDJYIvHypQL7BmWcC1m+5ES0uvEWhjERA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myX0o8FH; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3e9d633b78so73047266b.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Oct 2025 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760016429; x=1760621229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK8K/WbHwPwZivX6tSUsXo2Jw21mQfQLrVFjbOAYGDg=;
        b=myX0o8FHVLzFhWtxTmCwSXcqNjR0lWnl1cGc5JY7SqPApCyH4uIfmLx77v9Wz3yLKb
         nJUeYZtT0pr6XtzCrBouXkaBKZ4jrsLShAtqc+XK0vtyJLVqDXW3p5PvfCUiNnsa9zLx
         XOL3sGcwJLJiqZvxndFnRhUhcPv+dDRxfgVT40qDCsbBTSKGQrEpIVhEYHdoycjmSsDr
         DTYCAQxFOWJSKUmkVMhNBI7tpgYQFQOZBVptIncctOqdGJsfGaaWOoZODId5BWAyA3Y+
         7v5+qmSuz/gA9Un8a2Idpfzq3ZBuOSZ8fQozGDDWVUNMxWkSx5TPSuNmCS9BYo0OpeRn
         hHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016429; x=1760621229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK8K/WbHwPwZivX6tSUsXo2Jw21mQfQLrVFjbOAYGDg=;
        b=s1JGhQlV1FGE32omWFMpbv/kr8L51ciKeUVChzWSlGJO2oYLV41cHjNMn5/+qHLzCa
         COHW5nuzfbDyEDB8eiaNLN6udQ0FFCg5eJ8RXmVABXE9mtDG9T5Uyo+EaZquxFBQC3gv
         V/pHp8dLiXwSWsGK3jA66I7VaV0Mqf/01h20lXBcfTCMhWnLxGGWeMGJJFePdNlCTFqD
         thLzrot3sqAa1w/2dEtz61GxvF0dOMYNwH4b5JYUfdumJ/NlMycpc75vdpAnmYQuxV5o
         nxa/c1L5ItUvss5+sS9gHSGWLYeBLmlM0mm8Ls4Zv0ei3m3RNU0PeVpnuLPMb/9sYxAY
         NV1w==
X-Forwarded-Encrypted: i=1; AJvYcCWNZdkss3mFFDYqwey2jwNXI3YiVV+LPVPFlzaIECgSN5WnAwr4iveLPtAQgRDUjKakCU4ZlhY54mU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmA5hlEVWhUU2diG+E2BlOyhRJHhMp8QH22r/GcPANHN/Ri0Q
	wYFfmgnBYs5Mc/mfWTVBfeb4xpXOXgVG/DBKm+7Yb8p8KVh05nUPYg62
X-Gm-Gg: ASbGncuw+PkJEjJtdeozKOYHppUdazyWrkn/s7Gc6Oxzhn/sV4q91ae+QmdmwomojsS
	b4wHTl2d55pdXeJCZ337zQ2qKkhpkXwuf3rhMKxD1WSlG0nRF2N+3G2Hi7CzYsQs5xdDoRsNoml
	VYDQHSNNplQJovsIBPR9BMM8S83jtEcMob8W08y2XwPVmebXIMcuIq0a8887jFexc4STlDhMUrV
	ENkEpO+8tyQfGEAMxI9VgDfsITaR8PK/Zj7SgwDHAIbot2fay6XPwrLCcV4ZoO0jtE0Dr36pWJz
	TYHntMig5pl66z8TKhaa7M8qZGyKTwUlrTTWSXcqsO86eDZYzdKurWPbeI1a/oXffqRLyWrefFT
	IWErjMkNentyRraJxofRFcZbMUWdfxNPPGXHguCZo2pbmNriz4ZLrl/ngpWoJlpETSFbSJg==
X-Google-Smtp-Source: AGHT+IGtI8GEj+nLXCZCa6XbXOaSH9K657FNCc1DbTs+1bDecAX+bU9i3XEbHg0iBZzJAU3vTMmYaw==
X-Received: by 2002:a17:907:7b8b:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b50bd2454cdmr922900566b.14.1760016428139;
        Thu, 09 Oct 2025 06:27:08 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5395d748c9sm344572666b.73.2025.10.09.06.27.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Oct 2025 06:27:07 -0700 (PDT)
Date: Thu, 9 Oct 2025 15:27:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
Message-ID: <20251009152703.72e780b4.michal.pecio@gmail.com>
In-Reply-To: <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
	<20251008223406.13f16f19.michal.pecio@gmail.com>
	<CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
	<CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
	<20251009131444.2c221922.michal.pecio@gmail.com>
	<90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Oct 2025 14:30:20 +0300, Mathias Nyman wrote:
> Maybe the xhci->allow_single_roothub = 1; flag could be set in xhci_pci_setup()
> when called for primary hcd

Oops, I put it at the beginning so it is now executing twice on
two-speed controllers.

I only understood this remark when I saw my confirmation printk()
appearing twice after removing the "hide USB3 ports" hack.


Should I do a v2 or leave cleaning it up for later?
I suspect that imod_interval should also be moved a few lines down.

