Return-Path: <linux-usb+bounces-18822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BFE9FD174
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 08:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88A103A061A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2024 07:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104E114A4D6;
	Fri, 27 Dec 2024 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwiM6IUb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81935142E9F;
	Fri, 27 Dec 2024 07:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735285167; cv=none; b=a8g+mf8fXTDy8CsbxlFCzMggBTR3Gq2EclOSbUC6AsHVrXCb71XRlA1ZTKrzVQjJvC5327x21EgNWo5DVPVcryRJkEwAvE/cWh/NDvHuBM39q462UkknZ3Rni9SMT1WRSITngLrvYY7h3Qnq4ZO4LW9he0gFaojd/GerWT9p4Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735285167; c=relaxed/simple;
	bh=gQ5ebTsOQtWDt8Z7Ny+2t/5IIUKmtgwKFmqxGlnwaps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/z3Esq1COaxgu1hb1lM1sU16psqYBQwUVK1kVKtAgZfZjdX/5rIJwRrp2gh1jpukhcFFelc3NgndocbGeMh6xSytYPSSnjSF9L31OiVs5o/G0eSrYUwO8f7KgVJWhZXy2XCn5ToOSMVfQ/PQNEUFhLf+fE6hSJ75N+2BEXaO+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwiM6IUb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3600EC4CED0;
	Fri, 27 Dec 2024 07:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735285167;
	bh=gQ5ebTsOQtWDt8Z7Ny+2t/5IIUKmtgwKFmqxGlnwaps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwiM6IUbWmgXoFS2V0a/ymMvISsGXa8l74PzDSpBGCeRvRCyo+Gf7SxqUY/vStCSG
	 wS4/4ySdSNv0Nzvh2Zi62PmXxXvVLHznqRtYNqgH3zWnHpB+cK11Ygig6P2Wr9/gyF
	 wSQVn9BR4SeAHaWhhjTH+6r74rxNFSNkLYQlcAVqay0qaBMbcSfKyucZ85xNvkQjIt
	 z27gJNeKGDj5wlUXw2Wps02PNhtUBacLkkDcAWRMhmZoF3GCg5tMFbNoZJAIMLQERA
	 B5c1Zo7M/42uvNtGgWFUik6tN7dbLULNZDK3nNvhYSLksHSrn6z/cS17P2maH4eUyj
	 /hku/0L85utHQ==
Date: Fri, 27 Dec 2024 08:39:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 10/17] dt-bindings: usb: dwc3: add compatible for
 rk3562
Message-ID: <nzfzitfsf2pybh2tjzctz5ady5mj7z4mooymcktozwkbeuvr67@zdshqr7ub5qx>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-11-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-11-kever.yang@rock-chips.com>

On Tue, Dec 24, 2024 at 05:49:13PM +0800, Kever Yang wrote:
> Add "rockchip,rk3362-dwc3" for rk3562 SOC.

This we see from the diff. Say something not obvious. Where is the
driver change? Why devices are or are not compatible?

Best regards,
Krzysztof


