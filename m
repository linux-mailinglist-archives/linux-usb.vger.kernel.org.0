Return-Path: <linux-usb+bounces-13809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 749EA95A328
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 18:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 046741F24C4F
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 16:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA79F18E353;
	Wed, 21 Aug 2024 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLqZxbKE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A41386DF
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258979; cv=none; b=rqzAncjkI51uJksXEuaxWHRB9YBZrZXWioQeRPwvQH5b1kRkCG6M0Zj4TyEy08ryuNaQBV+mSNrx+c7zFIrlDRyCgfWJOW5zlFG1NLp/7menzKQErF2mK/hpsdU6iYUJhk/PGKwuC0CWXDTN+JlMalWMzDkj7DnqarZQdqyZOPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258979; c=relaxed/simple;
	bh=9mRwXUlGGe7run2WbYleS/Eboh+ZPGjjrQBeZmlDmBk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uV42TJ/A24IQyoQ6ObybJhPgvUweEByjuUnbo8CmUaaubo8W4/E3Hh0m0eCNupwSMhG8aw8Jnqm9ATrS24KXzzs//BuHDGSCe7TX/tuio4z1NfAejUuiTiYe1Byrlae2sLunr76yvGoArWIkOqynUoEe3Ma9EM4KwHA4Xhe8DHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLqZxbKE; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53345604960so1933549e87.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724258976; x=1724863776; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wBA6veuqQCmZrCh9voqCi9eAGyHMHoPfVH1OJDG5YYs=;
        b=CLqZxbKECG05NhLGLFIbLcqxDJJaXnHIeKThJ2sKYU9eJes+sNbpys/IszTVKdZ6dE
         +WjEWVkjnKcV/ZB7mA7PbXFu72jhOfQ+MfmMvwF7DfAb4q8hi2sFwfLJDnRaK1QQ6CAV
         GS1td2r3huF+8+WdVcR7OByEEXHhQ8QuMtIR8f9fVUtkRJdnMywneie/0pXGts9GD60s
         SQIo6chMbQ5th8RsAkU7ca2atHO1jyhHJVfQZXdzaIqi3r5AHYcKA026bY0dQaVCNGBi
         npEYNT48dzJSFFoe1p0pt8ttb7195sb+nELnalTKdjHk4ZMwp4lHadfn4GajUZIHdFiR
         LbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724258976; x=1724863776;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBA6veuqQCmZrCh9voqCi9eAGyHMHoPfVH1OJDG5YYs=;
        b=MCf1nUMP0qTB+YaAQTtRcY0T+7l41KNE5zPEorcyX9exyyzIEwTvDI83MDTAcnwn2c
         F7g/H8xqAjrxwvFjQPDFFgMQvRkH53ylNySr/FIOkKXDueThYo0NVeAO/RCmEDuAPOtJ
         LSuJMwj/ivUROQCdKUWvjML5qNkW4RNz6VylLXKLZfvpaE2toPM3+kchTLyScCy0CN+W
         4mmg9BUyJ0/nuS51Jj/Ku74OsPLz8KfkZJzpJekCubCVf9OKhq6c4IYayRjRr2A9Gyo1
         xWrWq/GxYNNRjZHSVzFv4E+1m6LxLsRw3JWLnmLg6aE2IVx3PH7imOe9dACqtlQTQQe0
         qmig==
X-Forwarded-Encrypted: i=1; AJvYcCWNsaQowkTnJTrKjyIi/oIg1KDzgPJgcUmb5Hli6/3Vwx2/m0XrziNf2Gzm4goExA9vB2ZTt9gzsyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxONzw4+vY78f3ZaxH80NoaOpgEobYQl58PCt60YHF6bkVTgPS/
	i3vPCO95rUMlfqPqBkk76dRFNmxANLjsx1JMlCsUECATMHt15LPD
X-Google-Smtp-Source: AGHT+IGhgruRMYstNBWjmVGn8Cp21LE9U12jnhlYsulcwDCkFocqfoO2Y157gVXq8pS4BWVk8u/agQ==
X-Received: by 2002:a05:6512:3512:b0:533:45dc:d2f0 with SMTP id 2adb3069b0e04-533485f33d1mr1331141e87.46.1724258975006;
        Wed, 21 Aug 2024 09:49:35 -0700 (PDT)
Received: from foxbook (bfh246.neoplus.adsl.tpnet.pl. [83.28.45.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334c75384fsm27712e87.131.2024.08.21.09.49.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 21 Aug 2024 09:49:34 -0700 (PDT)
Date: Wed, 21 Aug 2024 18:49:30 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: FPS <mista.tapas@gmx.net>, linux-usb@vger.kernel.org
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
Message-ID: <20240821184739.19092f3c@foxbook>
In-Reply-To: <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
References: <20240820130158.339b4d87@foxbook>
	<bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
	<20240821150233.4f8f66ef@foxbook>
	<e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/VHM7Gz9SnU7o4uYpP52_1mu"

--MP_/VHM7Gz9SnU7o4uYpP52_1mu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> My best guess is that these are caused by a full xhci event ring.
I'm not sure. I'm testing with a full-speed audio dongle which has two
endpoints with one packet per millisecond each. Doesn't sound like much.
There is nothing more on this bus, besides hubs (part of the PCIe card).

(Is it possible that the hubs are causing issues due to TT or whatnot?)

/:  Bus 008.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 480M
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 002: Dev 004, If 0, Class=Audio, Driver=snd-usb-audio, 12M
        |__ Port 002: Dev 004, If 1, Class=Audio, Driver=snd-usb-audio, 12M
        |__ Port 002: Dev 004, If 2, Class=Audio, Driver=snd-usb-audio, 12M
        |__ Port 002: Dev 004, If 3, Class=Human Interface Device, Driver=usbhid, 12M
    |__ Port 002: Dev 003, If 0, Class=Hub, Driver=hub/4p, 480M
/:  Bus 009.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/2p, 10000M
    |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 10000M
    |__ Port 002: Dev 003, If 0, Class=Hub, Driver=hub/4p, 10000M

I tried 6.11-rc4 and cherry-picking 28084d3fcc3c on 6.6. Neither works.


An archive with short traces and corresponding dmesg logs is attached.
One run on vanilla v6.11-rc4, one run with my patches (don't skip on
underrun, do skip immediately on missed service if ep_trb_dma != NULL).

Regards,
Michal

--MP_/VHM7Gz9SnU7o4uYpP52_1mu
Content-Type: application/x-compressed-tar
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=traces.tgz

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

--MP_/VHM7Gz9SnU7o4uYpP52_1mu--

