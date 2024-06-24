Return-Path: <linux-usb+bounces-11603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C46915660
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 20:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B046A1C20E37
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2024 18:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A4D19F48B;
	Mon, 24 Jun 2024 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OwNBbgoa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VnOsdav4"
X-Original-To: linux-usb@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6844503C
	for <linux-usb@vger.kernel.org>; Mon, 24 Jun 2024 18:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719253060; cv=none; b=V3oQWXEmOxDeG10A8Y0tm43D+mLHAzm6hbxvgsD8pyHuBeIZRz1SepVIkiVJThpwAv7FlRPAgrzxAPBg9Yu+PG2UhZ6nzFsgXPV9QRyUt5Mn+HDchcdXzWD4PnbE+ZDaOJMHGQBIJnP2N3HLRis6aPrew8xFV2chx6Em/02IGiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719253060; c=relaxed/simple;
	bh=BeE4o0VRiS3H2IPWd/5rBtreRdWHOzk+K+ZaxJwuUs8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cvTRYl7wmNsBDbLnoYZ7wfGxruSSt21gL9OHzykeWea0/NBk/ErHsh3TEMzrkaC34Ycs9huTMDrtLyx0+R4nSR5FbCucSX8cyv9v3FIiBLfFKT4ocagJOmy+Q/JB8Hu4CnfdrrBhcWAiIT0wyhYdJ1gCmdJBFEZrH2O+AVXDh9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OwNBbgoa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VnOsdav4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719253055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/iPmOTkGjykZ4AMKtYHGBwt7zSsm/N1pTR71po1nYQ=;
	b=OwNBbgoaFD8FoYEU63bvSEkTqPvLTUe/pmzgfMOtmO13w5aOWUw4OttQAqhFFiaRMpatHR
	l8lpyFWPosP89TlchbuQL9hrGws6FePtV2VD3HCyjUtsZvWqi3XXl8sYa/gmYMTRoBHC0l
	RMx8/+ptkM9E4vktPNJNcgyTRFzaH8Mhwgx/JSP6zweCwqx4kEGLic60o29YO7Xq7W+U3L
	PvJxsHuIZaFhBo0ZZelNTJ47WInKsv8ggl5WOckekPOzIoG7pGYmzohhsceXaop1Dg43Z4
	RY+FLSbc/2jwrhFT3ujRiJNglRkbnlaTt8cb8P5XDNcjDMvSpYzoJvl++J3S/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719253055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h/iPmOTkGjykZ4AMKtYHGBwt7zSsm/N1pTR71po1nYQ=;
	b=VnOsdav4Xy6Q4tA9dBdOuZXEnqAhBN2E1fZCWg8u1p9Zt5Jk6AH3Pq2eAc8uPAuOLAALU9
	aChSJ8Wqmb+3bSDA==
To: Stefan Wahren <wahrenst@gmx.net>, Lukas Wunner <lukas@wunner.de>, Minas
 Harutyunyan <hminas@synopsys.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: dwc2: irq 66: nobody cared triggered on resume
In-Reply-To: <3fd0c2fb-4752-45b3-94eb-42352703e1fd@gmx.net>
References: <2bcf7fac-8e8f-4d7a-a837-08805a0076e3@gmx.net>
 <ZnccVLINb_xQcmZG@wunner.de>
 <eb4a0b47-b382-4ca9-8008-94feb1a34c03@gmx.net>
 <3fd0c2fb-4752-45b3-94eb-42352703e1fd@gmx.net>
Date: Mon, 24 Jun 2024 20:17:34 +0200
Message-ID: <87y16u6w8x.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jun 24 2024 at 19:02, Stefan Wahren wrote:
>
> Is disabling the IRQ via the upper layers an expected behavior instead
> of letting the DWC2 controller driver resolve the situation?

It can't because it's an interrupt storm, i.e. 100k unhandled interrupts
in a row. So the system would just stay there forever.

So one way to solve this is to disable the interrupt accross suspend
resume and only reenable it once everything is in functional state
again.

Thanks,

        tglx

