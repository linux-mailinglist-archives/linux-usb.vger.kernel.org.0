Return-Path: <linux-usb+bounces-29050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5FBC6983
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 22:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F973A836E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 20:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502971991D4;
	Wed,  8 Oct 2025 20:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gl++Drba"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B56E2206A7
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759955655; cv=none; b=udwi7ijhJQI3qwWXiwFtnNIAWanwYQSfxur2rwjY0OXggKmNXvSKfc+RDPzw/Cl/nFs49WGsS0TDoanDFORpIzGGPmA42qKph0HiyFcyNPF2vMfshrL5EKIRp7JcdiF0N9Ic5wV6sHOq1JjrUPtsxYG+ff4ODOICBekchObRzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759955655; c=relaxed/simple;
	bh=pl5VCyT11jkjeEtVnb5qzsRg1m4x5kYwoKSGldcdU58=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iEDn2+6Vk5AkZhkpIHk/AXKH5hbH+BNmVwGCCbm/HpHpwvs6ZL+ZnVHhsi9q7i8sFx8DDJqvjiSPqxCU0cqrabte2JkYxHIFC4gWDYQfgZnyGe1b8Ewgcdfoo9MsFmOE5OVHfDJPgRmsD7pws+9uZwOic/B0siJ9DZkebUALMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gl++Drba; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3717780ea70so1963991fa.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759955652; x=1760560452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQWAXybBTwMaPBjbavwbV1DmNtun+M6bhE5nxILpuas=;
        b=Gl++Drbaa9QqK1/Nzix3nE54CPHsspvD3pF752W9sIyk+cdoCecXaVGJH0GO96Gbmt
         5MdGryDTLL7tPtMQ33cpxXArfGBIvdqsBT/UJn4mLQ7exyvNUYpQpbiO8u9bfXLdx6/+
         g9+2UAz+CY2Yc7Vh1TqAxYO6xZ9uy3sPtb60ywCfTqJ3HftZUKlLtUr/KK3170aOK9w/
         kHlOe8PNlm3ekBUy68rZRzWW8VXMz44fyQ6bNkdrigox/d0E5kq0elrmNd2VDWivSTyq
         0m6k2x/tuGnmzhOa2jly2h6A9dBAcNkuN7IoBkwXmIYsqHDJCgnXvSoWID87NrEqTK0a
         Tkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759955652; x=1760560452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQWAXybBTwMaPBjbavwbV1DmNtun+M6bhE5nxILpuas=;
        b=aYyWKwU7jLlrayrkdEmFMI9pLhUYB+wUFiSauAtt6Pq55G/dKqeDQPHGutuV6GUsKW
         XXuW1tPYTiJT6RIAyLd37NBvzKG1dxd+UB16MaTsVFRmWmF430rVrFqY8rAp1xlUji+P
         IXuw0FuKzgFD2WDemknS/XE3G8m5EOhaH1Tginct6pJjDfwML2ApDPuX6JafCC9gp1zt
         fU8jwi0dQWieke4tZmGCP9bIuT5JJ1VZXTylOJig7lzNDcz0LrQ4w1nRKmGB809JQR83
         Jz6gfOCF/vIuE9sJnuasA3HcMbHjpjPqF1ZYJMcbVjhsZBrO8AlcrV4CTquYXkR4PEh5
         dpDA==
X-Gm-Message-State: AOJu0YzD8vnvEctXtUdcR8YY3MJm1ihsZW4cPS9yoTBSBlKg++vok+4M
	AlWzaTNfSegSxeynQQgK7ua1YGP6RaJ9LWhld0GsdLqvMEKcyzigDHU/cqeylg==
X-Gm-Gg: ASbGncu9G9Tfm5tBj2l0eNOaJVRP9p2tEQju0Hrl915NQiYmOM60KYwxiVw5gMobw+2
	tZaq4wJPM0dnjncRkLLpn38ojKnU4D5cWGJLWFgBFizzbN2MZhoKxOV21qrw+Iu3vii9DMDI3Bf
	DBLCaBOHqdkoRbXFYZo3kFg5+4UW9Z9LRmX+C9/RmpTFpu71z9yy/TKYC1gdj0Fly56QjHcUVQe
	EbIjfn/Bv8vM/yrTjgeM86BUmVoasZrvXhYH0Ne9xJfpviUsnoRoc7JOaAWr0KYkaN+94fzmQpz
	SvuLyruqb0XNCUHdb2q7nQfqpse2CfxYFCQo+BseV8yjPP1MNVVfKAB2DZNZ07DrwPGLPKzP1jL
	yiOrUxwMr2Rk+ffvBCJ4+y6puG7riRELFHULdei2qI9Tf9wgqg105mSPhZpY=
X-Google-Smtp-Source: AGHT+IGJr7vlHgFJAyj2pUz1CAOl8EkX5m9/FUX3ukXnaqWAsipQzJctExc3ig76naIW4NSaYWIxPg==
X-Received: by 2002:a05:651c:222c:b0:361:8f0a:6fc6 with SMTP id 38308e7fff4ca-37609cfa0b3mr14570131fa.7.1759955651936;
        Wed, 08 Oct 2025 13:34:11 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b63f51sm22874791fa.38.2025.10.08.13.34.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 08 Oct 2025 13:34:11 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:34:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
Message-ID: <20251008223406.13f16f19.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Oct 2025 14:16:43 +0200, Arisa Snowbell wrote:
> I am back with the results, kinda struggled honestly.
> 
> So I tried finding the PCIe address from the good kernel and that
> didn't work out, it disappeared and on the good kernel I have 5x 2.0
> root hubs and on the bad one I have 4 of them.

Looks like xhci_hcd fails to register the USB2-only bus at all.
You probably have some noise about it in the log, try

dmesg |grep xhci_hcd

shortly after booting and you should see stuff like:

[ 2.843799] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[ 2.843811] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus number 1
[ 2.899808] xhci_hcd 0000:0d:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000010
[ 2.900068] xhci_hcd 0000:0d:00.0: xHCI Host Controller
[ 2.900070] xhci_hcd 0000:0d:00.0: new USB bus registered, assigned bus number 2
[ 2.900072] xhci_hcd 0000:0d:00.0: Host supports USB 3.2 Enhanced SuperSpeed

followed by a bunch of "new USB device", repeating several times with
different PCI addresses. One of them will be the broken controller not
showing in lsusb and maybe something interesting will be printed there.

Once you know its address you can also try to bind the driver again
with dynamic debug enabled, which will print a lot more info.

