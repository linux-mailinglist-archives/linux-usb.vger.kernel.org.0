Return-Path: <linux-usb+bounces-28494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2255B93C9E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 03:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7B687AA3BF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 01:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59271E501C;
	Tue, 23 Sep 2025 01:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EA4oY0Xz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5AD1DE4CA;
	Tue, 23 Sep 2025 01:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758589664; cv=none; b=kcMsm0jxnirm6HN9040uaDyEdJcBmJ38ac8rIExkqkma9bszZrFAz/YNPNvkBjmYBoz79qZ3qaZswt1UCowpYQ3DuzwPXTIuhgcer3xpNWzXrNLBQJj6g8nLMnB9jXlzddtRnGPUKbhNGPUUxyH/2ghnYNYCzTlfz/ohFSF2wqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758589664; c=relaxed/simple;
	bh=KfCEe+TsG87YvDPSQorY/miKGure0NErSK1Ry9X9WfY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rFqGbv4rJ7b9SbDRXV7vDT8miQ4qjUTFA9u+uCcDYVIkMw+Wyh0sUtPDclJHSSVIwajCm4idfjw4W4YMbkOTaGH52swfhFKoguRdTcvf1feCve4QEgMdaSYuaqkajCLzuGhZwkHPE7xhPSNzq0SNnEUH5rGOBuCe4lOPMT4l2vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EA4oY0Xz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA84C4CEF0;
	Tue, 23 Sep 2025 01:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758589663;
	bh=KfCEe+TsG87YvDPSQorY/miKGure0NErSK1Ry9X9WfY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EA4oY0XzS87mtk9x1RY7lBr16Ih2Le3KofSD8/RrOiWV1rIZXkA/okXOlMBL+FIex
	 Tr5IRzVBMsyOHajrQRJYFdcNaVLLkLjMAJhJ+6BIvTdDsvMgUB9eCd4dmQKwMY4Oga
	 8aBJHhwfjxo9ED60j+lbMxG3W3Bs7haFzGhXc0MY2WEffjhvvGZD61qdGYNxNx7nU0
	 DMV0kUASaIBEM03Sxu36/OadpmV1Q4NvGM48GDB8zciyUA4Rc9XGpIuB05dj6wfgCg
	 wKWp4ngcBp3MnZBA/G2NOOT/ydczPHijCoddo9rK6KuKEkT4dy3WwToJcfvofVynKq
	 H8Ojha3hhI8Pg==
Date: Mon, 22 Sep 2025 18:07:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net,
 david.hunter.linux@gmail.com, edumazet@google.com,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 petkan@nucleusys.com, skhan@linuxfoundation.org,
 syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in
 rtl8150_set_multicast
Message-ID: <20250922180742.6ef6e2d5@kernel.org>
In-Reply-To: <20250920181852.18164-1-viswanathiyyappan@gmail.com>
References: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch>
	<20250920181852.18164-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Sep 2025 23:48:52 +0530 I Viswanath wrote:
> rtl8150_set_multicast is rtl8150's implementation of ndo_set_rx_mode and
> should not be calling netif_stop_queue and notif_start_queue as these handle 
> TX queue synchronization.
> 
> The net core function dev_set_rx_mode handles the synchronization
> for rtl8150_set_multicast making it safe to remove these locks.

Last time someone tried to add device ID to this driver was 20 years
ago. Please post a patch to delete this driver completely. If someone
speaks up we'll revert the removal and ask them to test the fix.
-- 
pw-bot: cr

