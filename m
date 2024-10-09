Return-Path: <linux-usb+bounces-15913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5929966B4
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 12:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04A1A1F2181F
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E32190665;
	Wed,  9 Oct 2024 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFZj1R9l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3590518FC7E;
	Wed,  9 Oct 2024 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468666; cv=none; b=aKLBjh0K9+dUmqheEEfuLRfUGZFgDrNp0av8JiLOpJKMR9DmgbkKRj0tHzObL0hO+X9C5ROtgZtbKm2Q6i7Xvwfjp3SeRl4lIwRKBzolRnjI8ZaepKw8Iicndz+l8pvvUZuFiGemRjtelWKc8wnPsHZL1XhwiaAKbUOPPplDCFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468666; c=relaxed/simple;
	bh=2FpyaUxHRRsI4uf3W0hQRxO0Febu/KOlzeer7zqRyO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kDs6NpJ0137Vgrml9Sm82aR2RdVen4QSIDOSXdCNPMaLjE37mT2q08naBvEJ95ZzflmQLkhj4etmUmlaNV95ymNzRdD/klLeoMTjS6eb3hz4xIIMl0GNA5NtUTKlREEPpF21wqbtLJR8YlBerfYKYfdJDKtsdXS3Ga6Oa54pRGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFZj1R9l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99177C4CECC;
	Wed,  9 Oct 2024 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728468665;
	bh=2FpyaUxHRRsI4uf3W0hQRxO0Febu/KOlzeer7zqRyO0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TFZj1R9lPWiCQzvBcWHdeUGQuUeN7dKyJQtozVDRIQVi1x62glxYgXIj0I4w74BaX
	 9WBjB0RnvWiKIiUAfpLV4bl/kTIT/UMu4Q8MBStNU9e4slflrXezn7kRt6E4lsECGL
	 anAuSKukQuXMdED4LiKvBsB/mQpV+1GWzXE133W4uWQeplZOQbk/ImxrnDe0DZcI3W
	 s1AdXEdjnXqng6UHbQXjOJEXYDjzW86fk41la6NoBMPtlSRgsguEGu0WrJbGf/FAPt
	 LeQ/tr8RCY2EhvTUHFZdUSomA654Cs2vo7p2+VmFKkBdJR3+/l/HqgwagojBuTR1rz
	 9jkOfvAvJt8Rg==
From: Lee Jones <lee@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
In-Reply-To: <20240910101527.603452-1-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
Subject: Re: (subset) [PATCH v6 0/8] usb: typec: Implement UCSI driver for
 ChromeOS
Message-Id: <172846866335.473980.17533014614189523766.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 11:11:03 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 10 Sep 2024 10:15:19 +0000, Łukasz Bartosik wrote:
> This series implements a UCSI ChromeOS EC transport driver.
> The ChromeOS EC is expected to implement UCSI Platform Policy
> Manager (PPM).
> 

Applied, thanks!

[7/8] mfd: cros_ec: Load cros_ec_ucsi on supported ECs
      commit: c2b9dd2fcd15b6cddaeb9559720a67a6268b2fa2
[8/8] mfd: cros_ec: Don't load charger with UCSI
      commit: 1b11529097cebae663b36b45886600a14f04eaa1

--
Lee Jones [李琼斯]


