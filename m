Return-Path: <linux-usb+bounces-31070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5837C97A0E
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 14:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 51E2A4E15D1
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 13:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A85431197E;
	Mon,  1 Dec 2025 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eI6Xp+48"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC1B253B58;
	Mon,  1 Dec 2025 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596285; cv=none; b=O488KmZTfbxI1+7cnL5yDnLOwG8Mt05eO+iV7eXR/GlKPB2JOF43mrrY3KAvHgoMPe3Qj8gRpeyCzxpr50fMb2krms7r/xY2m7qRwP3k6LzUbFDrEeBs5nvfNuFjwsYfBHRgnG4tSmBwwHkqIDxCCNSjg/YUgj1jBpW20Ejd2Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596285; c=relaxed/simple;
	bh=Z70NDaPe+lKHzewSCi3t9HKBO5LDjbDqeteLg/sp2yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nw+a+baKdiyXQhOGkXNNb8d/9jUgRc2P/tnegv7LI5nJtsnIfBf6dK/eJ/8RDlE11ay2mswbtBmB4vztwTnJgUf5O0XmThnwUYatfIYCRah//bvNBy/TRD9Zw5YCaq6PUE7uKy1JDONdTdJlszpSk3YdSd9VewRsplpj+ctGXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eI6Xp+48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBBEC4CEF1;
	Mon,  1 Dec 2025 13:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764596284;
	bh=Z70NDaPe+lKHzewSCi3t9HKBO5LDjbDqeteLg/sp2yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eI6Xp+48ZBt4GbOOX4exFrzy6/4TEDRo9d0tLIkHeoBHFr9EohnhCQWTOLfX8D2+j
	 K/RAvkRkTrOtQFqnQO2itCEX2/Ile1ssk4YAOOIx/Yof5vxzenyv0dmvglyseu8nC2
	 hgaD0W5J38EZz/BQpcvYdpTCOucQdsOpyTzucFqgwL6QfyD7KfpeApw+QG+r4ZArMl
	 n3HaL2UyUSFcZ0x9xqDiAT6a4zNLtlgnnwZ3cgVe3mJxIsFufSHE5LxBlO04ZIg63E
	 QtIGT8c6aHBGyfQucmDha3WNZ8J84YXg8Hq++HwHCPSnmOABefp1UpZjeZnFHUPmw/
	 FJeXcvwG6W2Zw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQ46S-000000003MT-3loZ;
	Mon, 01 Dec 2025 14:38:09 +0100
Date: Mon, 1 Dec 2025 14:38:08 +0100
From: Johan Hovold <johan@kernel.org>
To: "Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, tom_tsai@fintek.com.tw,
	yu_chen@fintek.com.tw
Subject: Re: [PATCH V2 1/1] USB: serial: f81232: fix incomplete serial port
 generation
Message-ID: <aS2aQF_6ljhFtLI_@hovoldconsulting.com>
References: <20251128085244.14044-1-peter_hong@fintek.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128085244.14044-1-peter_hong@fintek.com.tw>

On Fri, Nov 28, 2025 at 04:52:44PM +0800, Ji-Ze Hong (Peter Hong) wrote:
> The Fintek F81532A/534A/535/536 family relies on the
> F81534A_CTRL_CMD_ENABLE_PORT (116h) register during initialization to
> both determine serial port status and control port creation. If the
> driver experiences fast load/unload cycles, the device state may becomes
> unstable, resulting in the incomplete generation of serial ports.
> 
> Performing a dummy read operation on the register prior to the initial
> write command resolves the issue. This clears the device's stale internal
> state. Subsequent write operations will correctly generate all serial
> ports.
> 
> Tested on: HygonDM1SLT(Hygon C86 3250 8-core Processor)
> 
> Signed-off-by: Ji-Ze Hong (Peter Hong) <peter_hong@fintek.com.tw>
> ---
> Changelog:
> v2:
> 	1. remove loop in accessor function.

Thanks for verifying.

Did you try removing the retry loop also in the set_register() helper?
Perhaps that's no longer needed after the dummy read.

Johan

