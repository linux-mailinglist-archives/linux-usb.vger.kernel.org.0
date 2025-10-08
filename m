Return-Path: <linux-usb+bounces-29019-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A324DBC4801
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 13:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8416A188ABDC
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 11:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EE32F7479;
	Wed,  8 Oct 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nslv/BJP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD62F6582
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759921541; cv=none; b=GA9zRpwsk4izubVMpMCuiXudkh4kjAb0Z7pVuTIVdYAF8BbosVAdG9NsD/O+oAVzyZ/q8Fgw0bvsuCkI34g5VmN5s33h3HrMKD6z++L9ITEdlmpSs245n8iVFgeELCuXBSTSniKgckbNym+Qpd45XgV3R/B6JWZaV0ul+iBZgwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759921541; c=relaxed/simple;
	bh=MCLypvcUCqxCSri8y0hSV1zE0FDlcOv6mg3LlxDDUMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sxliY56LxmXvPyjKH6XVQmDSUo//mdHhD89MPki+f8pzOZv+Scc2b2jZPfIbEzX5ULs3j8QWTo7kVXvIp/XQYFZnxAwtva9ZOrGHUf+ApQpi4VQDKZTYCeLJZse1jeykXilGY5OjecmSMEQqbYsTji/dLjiMqKeFaD1ZjeQ1NxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nslv/BJP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-57a59124323so2470918e87.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759921537; x=1760526337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cunl60s02zzCAri5rtMP9EOgINzWgkvKilD9GCJH0A=;
        b=Nslv/BJP+niWvQFtZhphrVr4ENZOGYkIOJmtgo+JDHChfUOQGsAy7uVmHq4GQUNz7U
         HstUXlQ80pXQpb2NTSQnTV1EeoJTaUE34j2vpb5B8kRsKjX4I13Hwn+Y9DHcdVYaU4e7
         N6ALeOQq2koi2Y6gWpD7Jk0HJBMuBxz3fNbbxG2IShjaikFG5eQWQVkrQNxUC9T0xPX5
         Pd1vCKFM4G/T/wFUQP53jSUe4XdtWf5zFF+grdG/4TxPCMGNG3B/x+7Ru6q4udrvr//x
         F+mgcU/GqeHHx9GZX5TgG/MG7kFKnO5calxiLjgdts4M1gU+uHxax7Z3DgMP8qOFsFJE
         GYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759921537; x=1760526337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cunl60s02zzCAri5rtMP9EOgINzWgkvKilD9GCJH0A=;
        b=KdhwOItJl1QCKbVSvqyBQmyJMA/SNk4gw0a29RKzv9S2OrI3IoErEXm4VMjizECbF8
         Yjl6T5/GJl8yLudUC161ix3wddPNjgRhyV5Nfp/IPSJGLQcT5C+GlUfLuEciWsipDzET
         HQUqhI2reYpCphN/zqLVjiGOEyKXM1Ew/wXCp7eEuYhLHM+Rs1CvWRzG0Q9+GMEf/gp8
         b9MajJxr0fEuCHyzcr/pUPbpiKTSKRKm6ie4BU6iYYkneIYvQhF1zgkJWWMUmupvqGZP
         dYNa9ZuOSWsfX3Az3v1ErXW5jaldh24WFJonQ2VpWa7pnHxo5sBXVJC215OwSK4WElwq
         lPig==
X-Gm-Message-State: AOJu0Ywf6/50EWW+zpjrx4hddo6lu2L1JmpwRDLKNvqsAEQgbQXilXri
	vJjTyVx10dr/YOVvh8MUo7Hq6MHHIxJv3WrzOdnZ1tF5D8GmzsoivwTM
X-Gm-Gg: ASbGncuv7JrsJnGeu0sjuPLvWfrmD4ztIlHSybz+w+PYEQXb8UmScSSRRlO7uzfFyVq
	J+bxSfa4tYrEF0p8GkDGNvfxexEY/SXOSSv4RKXJdPZTxoqdgjO7S+HvGcw8EpcNPx49uubZPXZ
	mpshl+hwFMUuYuW7GLWjulgutF6UZmC6LWqmiGGv1eIyUDlI5nsittdmdRgRflfDjnq/x9cgUW4
	yy2XQU4+ttbJL5OqHzNRxaluRV9xT6O09zl+MA5zaMqtLoupvZox6/BtRKPQNv33Q97fYnNVA5n
	WUfgH3bj/G7/dZub7W+LcPy2k84snroRkUKUVix2FSr5vQHqGjIhUfn1SekTIeMSyBTkPE489eQ
	jo4Vbgl0pZVxZ/WcIptYY6E4+udaP0IAdLqSMT2FJ0Q6bcUMUZ64R1ZZ5X47BGf5cwlPGeg==
X-Google-Smtp-Source: AGHT+IFNModo0T/aJEgMsL/aTK9vMSfWaMxSVH2Yrn4KRhEDmybHujoDpbgGlI8aeClWYLTlOMbIGA==
X-Received: by 2002:a05:6512:4003:b0:585:2a9f:8597 with SMTP id 2adb3069b0e04-5906d8ed926mr822703e87.27.1759921537089;
        Wed, 08 Oct 2025 04:05:37 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124951sm7122949e87.25.2025.10.08.04.05.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 08 Oct 2025 04:05:36 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:05:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arisa Snowbell <arisa.snowbell@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Mathias Nyman
 <mathias.nyman@linux.intel.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB
 merge
Message-ID: <20251008130532.49922d58.michal.pecio@gmail.com>
In-Reply-To: <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Oct 2025 11:02:43 +0200, Arisa Snowbell wrote:
> Morning,
> 
> > So the issue is that there are some USB ports on the motherboard where
> > devices work when they are hotplugged, but nothing is enumerated during
> > boot, correct?  
> 
> By testing a little bit more now in the morning I found new information.
> If I replug in the USB 2.0 port, no, it doesn't work. Only if I plug
> it into the 3.0 port.

Interesting, the patch was tested by people who reported the original
problem (empty USB3 root hubs on USB2-only controllers).

Please do this:

0. figure out PCI address of the USB2-only controller, possibly use
   a good kernel if necessary (but PCI addresses sometimes change)

1. boot with some device on a USB2-only port
2. echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
3. disconnect and connect the device to the same port
4. do the unbind/bind thing on the USB2-only controller
5. echo 'module xhci_hcd -p' >/proc/dynamic_debug/control

Then upload dmesg.

