Return-Path: <linux-usb+bounces-29281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE429BD8B85
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 12:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52E363B636F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 10:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0622F6187;
	Tue, 14 Oct 2025 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fCod4r4Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03C42F547C
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437192; cv=none; b=sF66KPAAWlqoDvliK+HxSsa03o7uIPkZegeT2RAFpzYsqXzXxWXOrcIGgOLd9067JxZ0gZ5QZ8qfAF5siBxWY3ytbqGiCAj8mBG4wNFkD+fnSynPDhhL/uzpHPWBxmGpuEdtvTLqVSmaR+ovJXjsTt/s6OEhgxJZkI+SKY2ITRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437192; c=relaxed/simple;
	bh=S1cslhnBoJ7bdhSLk1Fg2guqKFa5OddOQh9j9QF9dfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qh9nbWOqcck7qpSaaQrlaBd7iB4VnJKa4BiIBk3C4f1vqtJpeoVHV0rG/hGuH+n+klDddGdxj55Bby6e9zc9ckcUFaFD7OZGbUJSH6w9Ca8Pba5zWv86gObAOQLgB78ysJXU2UdlnNlQblquOr1DxdiXiSh0IPnmPRTDjZCnerg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fCod4r4Q; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <3f3c759d-ce49-4d52-922d-aeab3b3c17f1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760437178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4qef2SGmUoAoANFEF7b+uaZMm3jeXBZevs3J+1AksCA=;
	b=fCod4r4QRfdlsB8+eJlWE84Xy0a7WQRtbRp1/uu+nbdyLAH5Ew0EPzU5N0H8TWRYAAcp4a
	QZK429n8BsnD/JOJyWsJKwJodxJ+q1uFj7/c5GQv9XIhxILMNrIo5YmNfOznXug8Favjaz
	4L4+73OMDe/EyFpX4IDrhAvDx2x4y9Q=
Date: Tue, 14 Oct 2025 11:19:30 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net v2] net: usb: lan78xx: fix use of improperly
 initialized dev->chipid in lan78xx_reset
To: I Viswanath <viswanathiyyappan@gmail.com>, Thangaraj.S@microchip.com,
 Rengarajan.S@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
 khalid@kernel.org
References: <20251013181648.35153-1-viswanathiyyappan@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20251013181648.35153-1-viswanathiyyappan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 13/10/2025 19:16, I Viswanath wrote:
> dev->chipid is used in lan78xx_init_mac_address before it's initialized:
> 
> lan78xx_reset() {
>      lan78xx_init_mac_address()
>          lan78xx_read_eeprom()
>              lan78xx_read_raw_eeprom() <- dev->chipid is used here
> 
>      dev->chipid = ... <- dev->chipid is initialized correctly here
> }
> 
> Reorder initialization so that dev->chipid is set before calling
> lan78xx_init_mac_address().
> 
> Fixes: a0db7d10b76e ("lan78xx: Add to handle mux control per chip id")
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

