Return-Path: <linux-usb+bounces-22023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76165A6CA40
	for <lists+linux-usb@lfdr.de>; Sat, 22 Mar 2025 14:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A36747A6DE4
	for <lists+linux-usb@lfdr.de>; Sat, 22 Mar 2025 13:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6141FCFFB;
	Sat, 22 Mar 2025 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="OhB+ceKO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD71DF26B
	for <linux-usb@vger.kernel.org>; Sat, 22 Mar 2025 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742649563; cv=none; b=ub/sjd/lahPPLm1ZEqOluF1O2zKdBwxqPYCIrb3aXtBk9mZKtJBVNA9deZrlJbQ+bl/85RCUlk5mE5FN4SSu1MAhqrSp/vGSVf5sNobEf+T6emLCvhA/EqTNeLHulj8LuXiY1m6Eg5PnDvMZKyjxpOueNsAOy0FNhAAX5GU3658=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742649563; c=relaxed/simple;
	bh=MnaEr0HKvRTMmFsEGnBABMVlWmcwLBOq06phwGORvbQ=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=lWv6s/+SaeOLwGrE07GjNwW0eF/kaTizd+aozdmMpVSEJfT+ae8AakLmCiC5cqqwdbizPg0G7ZpxT1aPkPLu/tXJAs+aM6TsJB+Y8f3VEeL49aKAAZsi5wAe91LQjYLOWlgp7RFB+uWMJpqXPso6dOGsPiokgOZtrEPcmfeppw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=OhB+ceKO; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742649557; x=1742908757;
	bh=MnaEr0HKvRTMmFsEGnBABMVlWmcwLBOq06phwGORvbQ=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=OhB+ceKOqihTQzv+eMM6O1x6Bj52ZQl25Ovb2EU8EgfMHUORFEIDS9mZutSJwip2V
	 8Q9SrJmUFAM9yqAUEY+Y2qhsyzkKVHIRQ49xi0BpodqqIINmhTFy5aPom7O0itQoOG
	 H1lyxj2oGdrBdCeki5uM+mEPGAzHnZPm+RPVE1me9rpAnkh0jnJbbCf3Wi8rHivk2l
	 1qSINu3I7w1KgaN3TiS01sjCsGT1IlxwCwyLhQ63zGgd7fIkr7R6huFUq3xti+TZjl
	 ttSirwZOTMn5WDjoGvqsABdhlOffjIVaXXNARycMzrEmftXJwPtIMtH+tVgtSYWRSE
	 lzXy7OLrQfE5Q==
Date: Sat, 22 Mar 2025 13:19:13 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: laycookie <laycookie@proton.me>
Subject: USB device enumeration failure after a certain amount of uptime
Message-ID: <tftazqcClYI-2-p31uywrZ6yeCzD8MkfSdzeBlhODA0739v21m4K2sU20aybeXfJiqBFOWz0BjawusLq1vKkZCpHGYSdRxzKoPUGYZSJFq4=@proton.me>
Feedback-ID: 83346434:user:proton
X-Pm-Message-ID: ca97fecf06df34ab70d19953faa2324433f02830
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello, this is my first time reporting a bug to the Linux mailing list so i=
f I make any mistakes on how the report should be formatted I deeply apolog=
ies, and I would really appreciate feedback on how I could have made it bet=
ter.

I have recently installed a pcie capture card (AVerMedia GC575) into my com=
puter, which from my understanding is recognized as a USB hub, to which a U=
SB =E2=80=9Cvirtual capture card=E2=80=9D gets connected, as well as an RGB=
 controller, and while there is no problems with the RGB controller, the ca=
pture card itself disconnects after some uptime.

When the computer boots up, or wakes up from hibernation, the capture card =
spits out some errors but ultimately ends up connecting, and functioning pr=
operly with the following being logged in to the dmesg.

[73087.256972] usb usb4-port1: attempt power cycle
[73087.681433] usb 4-1: Device not responding to setup address.
[73087.887446] usb 4-1: Device not responding to setup address.
[73088.095031] usb 4-1: device not accepting address 67, error -71
[73088.580035] usb 4-1: new SuperSpeed USB device number 68 using xhci_hcd
[73088.649577] usb 4-1: LPM exit latency is zeroed, disabling LPM.

However after some uptime since the boot/hibernation the capture card ends =
up getting disconnected with the following being logged.

[73491.691281] usb 4-1: Device not responding to setup address.
[73491.898772] usb 4-1: Device not responding to setup address.
[73492.106227] usb 4-1: device not accepting address 68, error -71
[73492.857630] usb 4-1: USB disconnect, device number 68
[73493.184176] usb 4-1: new SuperSpeed USB device number 69 using xhci_hcd
[73498.305648] usb 4-1: device descriptor read/8, error -110
[73498.409287] usb 4-1: new SuperSpeed USB device number 69 using xhci_hcd
73513.767567] usb 4-1: device descriptor read/8, error -110
[73514.056885] usb 4-1: Device not responding to setup address.
[73514.265895] usb 4-1: Device not responding to setup address.
[73514.473459] usb 4-1: device not accepting address 70, error -71
[73514.475317] usb usb4-port1: attempt power cycle
[73514.903850] usb 4-1: Device not responding to setup address.
[73515.113863] usb 4-1: Device not responding to setup address.
[73515.322369] usb 4-1: device not accepting address 71, error -71
[73515.817911] usb 4-1: new SuperSpeed USB device number 72 using xhci_hcd
[73520.833734] usb 4-1: device descriptor read/8, error -110
[73520.937385] usb 4-1: new SuperSpeed USB device number 72 using xhci_hcd
[73536.294619] usb 4-1: device descriptor read/8, error -110
[73536.412431] usb usb4-port1: unable to enumerate USB device

I managed to track down the source of all the following errors with the exc=
eption being =E2=80=9CDevice not responding to setup address.=E2=80=9D to b=
eing in the following file:
drivers/usb/core/hub.c

However sadly I=E2=80=99m still very much learning about linux, so I didn=
=E2=80=99t yet progress much then this. If anyone has any idea of what is g=
oing on I would really appreciate a small explanation, or pointers to where=
 I should look. Currently I=E2=80=99m trying to find out what error -71, an=
d -110 correspond.
The following was tested on kernel version 6.14.0-rc6, and the same behavio=
r was observed on kernel versions 6.6.x.

