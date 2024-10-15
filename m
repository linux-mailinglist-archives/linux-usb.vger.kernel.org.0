Return-Path: <linux-usb+bounces-16218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8142D99E275
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 11:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B9A01F229B0
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 09:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901D31E9080;
	Tue, 15 Oct 2024 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxLxKMtT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B361DC19D;
	Tue, 15 Oct 2024 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983454; cv=none; b=IHpVgHfnpuC3fxM0JKsklvdzgsezIYkTs5MnYEqcpru/k0/v6RfYaTfV4cpq5QU+3ox1TIDWyfhyzhFbVkCVqDPgRJGWLW5MIazHf8eIbdSuFeQIf6tr8V3XzG277CG8QtG9Cozebir8Yfb5dMEzZDGzJb8PFFmfNhY0m03NNZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983454; c=relaxed/simple;
	bh=iLr6gyKSWN8UCzaJK0XMpvdK9cwhsVHi0f6Hmr0HvMg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t7mM1QA3logolYFdtHpAKSpemimdpNQlS/DMO0OQlMZkGZuEsIqm5Y7Mor5oXhhJIefHsldGtM/ijVeKgKW0azqQfCmFVcCob00s8igNErVR9WJfXy/lhwV3R65gSPUYnJT9/RrK1muff/xj2oRyS7otP5bA7lo+18jqVIj5udU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxLxKMtT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90971C4CECF;
	Tue, 15 Oct 2024 09:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728983453;
	bh=iLr6gyKSWN8UCzaJK0XMpvdK9cwhsVHi0f6Hmr0HvMg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pxLxKMtT7x4isTpe52QLmKcO9gxFAmHJtizmFwEvjt7PXKKZqHE7E9p3ENqV80NpO
	 Bzd/T29fxIbZTz/xEd7W5dsTvLKKMxikOf375hkR6Chob88m3PTGgq1EDumAZ1Ip7V
	 hLv7kxVUPDjYaMl3TlpeuLDmwt5wBeGcu+/5klsbt3aoPoOQfo1eIO7q0XfgFAuUAI
	 mbAgTutnpEmS5wzYt1tBfcHtWYTZ+6SgvWBvl242ou98NBAJ2gICYGr3IUsdNQDIg8
	 5I9UrzLSK//ga0rK6S383ED46WiLckG7oyI6p0YOzeZ0oOPZyWT71hoEyE0+ozC73c
	 KxqEcLIn63lkA==
From: Lee Jones <lee@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Pavan Holla <pholla@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
In-Reply-To: <20240910101527.603452-3-ukaszb@chromium.org>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-3-ukaszb@chromium.org>
Subject: Re: (subset) [PATCH v6 2/8] platform/chrome: Update EC feature
 flags
Message-Id: <172898345133.410225.2069268276654424403.b4-ty@kernel.org>
Date: Tue, 15 Oct 2024 10:10:51 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 10 Sep 2024 10:15:21 +0000, Łukasz Bartosik wrote:
> Define EC_FEATURE_UCSI_PPM to enable usage of the cros_ec_ucsi
> driver. Also, add any feature flags that are implemented by the EC
> but are missing in the kernel header.
> 
> 

Applied, thanks!

[2/8] platform/chrome: Update EC feature flags
      commit: 04a6116a36dfb86c80c930aaa03c66c2deb8e434

--
Lee Jones [李琼斯]


