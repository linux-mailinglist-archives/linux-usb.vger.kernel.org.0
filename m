Return-Path: <linux-usb+bounces-30186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00821C3EDD9
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 09:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A43FF34AD2E
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 08:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3D930F814;
	Fri,  7 Nov 2025 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5gUzf3v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B228526F29F;
	Fri,  7 Nov 2025 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502636; cv=none; b=IPgpcOysVisOiLptE4oAC39tI14irTdh/UXif+GplD9ugUnX+BRfmYK8SZmCI4qzFF1ija/IZRfyYQYdefEt7ID11sQlCaO7RurQEeaqIbA6HLGOOgJkQ6dK42JBBkLIVYuMx2xJsMbxxU97UZ0WPQsBCg+LeEMUntjgJaIWdno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502636; c=relaxed/simple;
	bh=bGskAMY+uWAftqyTkJL9tBJ1uC8eJ0A3f7tgghA9lj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjZr7CnqzN0y/5zwtUTtRxLO89B/zU6ZrOchCZFg4YDxe8wGNsWJlD+brtculrQ4cv3hL2Dnk6jx/Z/Q6HIemfmLZ1CZhtyTsqmd370mnlD8yv2Z+LwknFf0fvbUDEzMAZcp8q2GDVAI1zKzuH1aMaj941KBBq5Yk7aiEyIVCIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5gUzf3v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFF3C4CEF8;
	Fri,  7 Nov 2025 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762502636;
	bh=bGskAMY+uWAftqyTkJL9tBJ1uC8eJ0A3f7tgghA9lj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5gUzf3vLPucsJpiEye0JWTMa+WJISsiJ8JCKTWcgUmngBopdTPmbc+Mx3AQaRCV/
	 Bo1VyLn0R9MutXwwZd9GbLwe6ibHFe096Ao9iFH9vcZSDJo1TZFe4Y6ZoAiYNA/ZVn
	 gT5NGyv1UnbVrcFMUlB/TAyHKlCcc6JWa0Uay0rZlWG+i8uq8htNtqYcsCj/AxOvyc
	 yAUolSP+EErGKkxuGaoa34pW8lxIu3REi2ioR6ArKfzyPVgypqYI3M0CnKseKoZNb6
	 Z0iogIoFH6xsJnG4CcqAfNFDVhTFn/AQPbLRmrY1PY5fE7tPJXL7+K066I4t/+y91R
	 5b2vKDDAjFdSQ==
Date: Fri, 7 Nov 2025 09:03:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, davidm@egauge.net, ~lkcamp/patches@lists.sr.ht, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: maxim,max3421: convert to DT schema
Message-ID: <20251107-agile-alligator-of-philosophy-03d923@kuoka>
References: <20251107001812.10180-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107001812.10180-1-rodrigo.gobbi.7@gmail.com>

On Thu, Nov 06, 2025 at 09:06:22PM -0300, Rodrigo Gobbi wrote:
> Convert legacy maxim,max3421.txt to proper format.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Hi, all
> 
> At this v2, I`m reverting my previous idea about documenting new properties
> because this is just a conversion from txt file. At v1, a question
> was raised about that:
> 
> On 10/9/25 22:34, Krzysztof Kozlowski wrote:
> > maxim,vbus-en-pin, maxim,gpx-pin, reset pin and supplies. Also add a
> > Why new properties? You must explain not only the difference but WHY you
> > are doing this.
> In this case, I`ve kept the maxim,vbus-en-pin prop because it was already
> described in the legacy file and the driver expects that property according
> to [1] and [2].

This is not a commit msg. Apply this patch from the lists and look
whether the information is there.

So again:

You commit msg explain any unusual changes - like modifying binding
while ONLY converting it - and WHY you are doing the unusual changes.

Best regards,
Krzysztof


