Return-Path: <linux-usb+bounces-16217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3908A99E273
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 11:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7361B23345
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 09:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A741E906B;
	Tue, 15 Oct 2024 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxi78ZIp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4031DD54B;
	Tue, 15 Oct 2024 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728983452; cv=none; b=Y7F2ZdtvYppZgacy0wcnTfud32+BEkrpARAcl4jJbQTifVY61MhuRRBD1eu6bviiVUofgT0OUbpuwoG0Fn8tur6QNOtbBsndo8IvRGf4Z/kDYFjETAq9Srctv8PQVHjZ0cA3pUujgUlnc3U6p8Mp3AEOa2m4CMdiKTT4w3E6qWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728983452; c=relaxed/simple;
	bh=k1LiA3BCF5wyeMAvTq/3y+Ybip1M2IRvg3kDHzr0Vys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HZ3PPlUfOXTAjPY9SOVNP1/DTjwNxeQ+2nT/3ruu8Y64NQu+j6XgKjrFxlUEoyLD1rxHj//mUg37UVvoqTecrbvyOU4a2wJeNALUM4bC7UAJ/OYE7jQt5xfi32ga6B8B9pQutj8AXWNEVGrGBYr/Qd/H7027GFi8nLgQbpZPgxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxi78ZIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CEDC4CEC6;
	Tue, 15 Oct 2024 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728983451;
	bh=k1LiA3BCF5wyeMAvTq/3y+Ybip1M2IRvg3kDHzr0Vys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dxi78ZIpgAhC2Rx65cRI1JQIYb0Kb3X1iIC3pZXFK2zHxRjM06MwNOSvLhSpDfmcr
	 He0Q5k1unakGn1q9STpNCoIUsWNenQrlYXk9XJ49o2gBZPJtovonC6hvvqYx1n3nua
	 /vMmZtLEjJdDva9Wj8fdTXQOEKPoGYIXWp2dzaqUA/qZbZ5xWE8eKxHwWcA6x2xDJC
	 /muXzQSFoUZmfqtr+wSa+LLVxaYoJyaZKkvZt6zL7wfYE2Yfkcb+wxJA+kGEW4oP5x
	 GXZWvjx93I8jmMaUNtTFUwG9OjE4D49FD7m7nXaZC1fo7OhVg//teL60aYXP8DSJ+M
	 zWIKn07efsn/g==
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
Message-Id: <172898344882.410225.1061336270757807613.b4-ty@kernel.org>
Date: Tue, 15 Oct 2024 10:10:48 +0100
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

[2/8] platform/chrome: Update EC feature flags
      commit: 04a6116a36dfb86c80c930aaa03c66c2deb8e434
[7/8] mfd: cros_ec: Load cros_ec_ucsi on supported ECs
      (no commit info)
[8/8] mfd: cros_ec: Don't load charger with UCSI
      (no commit info)

--
Lee Jones [李琼斯]


