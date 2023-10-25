Return-Path: <linux-usb+bounces-2186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5C27D73CC
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 21:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB73A281D56
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 19:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DED830FAF;
	Wed, 25 Oct 2023 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQl6a6s5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38A610FB
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 19:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308ADC433C7;
	Wed, 25 Oct 2023 19:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698260564;
	bh=/9iWr4f/dsLFRv2le/lOb5v7vmV4yJB6T0i1GKy1FFQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JQl6a6s5ih0P9/E6pdGs9Pi0hfBJPAWvXW5nSLnzUyEt3o0M+ZgIa4wuo1n15nfFq
	 4zPF5waP9ScISnJEgUJOGkTPOGvDQ9PkBpa5LuYD67qDUTEcnMTudNcmI6lysfHtxF
	 QG2kzm5/GgO5cnkxsxSi5V+1Xp53Wvbvb9P+4V9eVzRQwe4E5s9G/Kv+tYOgA7C+4c
	 Q8KY3/WV8W0vTGbVt+MGS2Ecj7/Wsb03pnPRzwredLsgpp1ukc5wbwsd5O7cy7QQVa
	 0UhPky7SBhcHBRj9xDW/8gw0w3mIcopnMfpXfS6ZVO+ifo7INcbMLlHW/BkWrH6CoS
	 EeBzHZJJMO5jg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org
In-Reply-To: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
References: <20231012-hid-pm_ptr-v1-0-0a71531ca93b@weissschuh.net>
Subject: Re: [PATCH 0/4] HID: remove #ifdef CONFIG_PM
Message-Id: <169826056250.336761.2729314989598019924.b4-ty@kernel.org>
Date: Wed, 25 Oct 2023 21:02:42 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.1

On Thu, 12 Oct 2023 12:23:37 +0200, Thomas Weißschuh wrote:
> Through the usage of pm_ptr() the CONFIG_PM-dependent code will always be
> compiled, protecting against bitrot.
> The linker will then garbage-collect the unused function avoiding any overhead.
> 
> This series only converts three users of CONFIG_PM in drivers/hid/ but
> most of the others should be convertible, too.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.7/config_pm), thanks!

[1/4] HID: core: remove #ifdef CONFIG_PM from hid_driver
      https://git.kernel.org/hid/hid/c/df8b030d82dd
[2/4] HID: usbhid: remove #ifdef CONFIG_PM
      https://git.kernel.org/hid/hid/c/f354872108eb
[3/4] HID: multitouch: remove #ifdef CONFIG_PM
      https://git.kernel.org/hid/hid/c/fc2543414c3e
[4/4] HID: rmi: remove #ifdef CONFIG_PM
      https://git.kernel.org/hid/hid/c/eeebfe6259ba

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


