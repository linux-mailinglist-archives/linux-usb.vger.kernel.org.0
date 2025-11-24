Return-Path: <linux-usb+bounces-30871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE798C8195D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 17:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40A5F4E84C5
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 16:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688B9305053;
	Mon, 24 Nov 2025 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX5OuGGf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0302BD02A;
	Mon, 24 Nov 2025 16:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764001879; cv=none; b=K+ELUjoSBz89rDlRv6efo7SBsGhocufFGdAyjqpPRqLlfQGTTTjywAVBrO4ZRGd/jLKEG8AL42Baifus39ZQQ7NI0l6tV6sXWxPIU/KoCTbgjkinjVd7EkgJwqYc3jkBhbNc9vx3Y1wClcQhViKfmeDEvJssVX93xAHGHyVeuWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764001879; c=relaxed/simple;
	bh=6UqEu5UiE7V77fFuKKCY6ipyzdENTXQJlskr6MqVoBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAuonqucwqJvjaT6CRNA3vrSphQxUF+3t3zOqkNRBgsQESYDElxD+YYmaYERUdCZCIw1y/Lg35S9hTZOCEuW6l0Haqj9Cayo2r5rYQ4KJhPZEqy79o+jRlDsGSXbHkD5P5h0uGGowirPQqh+kWKFH3aF0yzxkG0UOEyqPNeCvvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX5OuGGf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4C1C4CEF1;
	Mon, 24 Nov 2025 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764001878;
	bh=6UqEu5UiE7V77fFuKKCY6ipyzdENTXQJlskr6MqVoBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX5OuGGfiDM/Yy+LTD6eW1vayQ3OgblzdxN8otRRwUpTwX9IN1f5pc0l9+s1JjCZ7
	 IRhIDnFWz6jeYqvDPkfDqYypfgrlqUJT5HprWF3NgfmLWAqFWpmCmaKw+kyGUzo4OS
	 DI1lBr5zcfmygi8CfZ1WlbqMfUT/DxA9eVG90oDxj2RFj/xBVRKafTPaN99X6ZjBIz
	 pioDCjPBY2Q1dnFRm3yn2AxPxb7yiG0F6OETZiCuYdNnvBhEt6f6HmUocD8XIJn3UA
	 kWssDamAyowT58/fuTp/tJ2ddZZiReE/GRbFSWNcijQzYRR1Kc9GrA/3mkeo6zzm+6
	 QY6F0mYxzcvRA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vNZTC-000000004lv-04XM;
	Mon, 24 Nov 2025 17:31:18 +0100
Date: Mon, 24 Nov 2025 17:31:18 +0100
From: Johan Hovold <johan@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V3 0/1] USB: serial: option: add Telit FN920C04 RNDIS
 compositions
Message-ID: <aSSIVppGyFktr5g7@hovoldconsulting.com>
References: <20251121053956.263364-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121053956.263364-1-Qing-wu.Li@leica-geosystems.com.cn>

On Fri, Nov 21, 2025 at 05:39:55AM +0000, LI Qingwu wrote:
> This patch adds support for new Telit FN920C04 RNDIS compositions to the
> option driver, ensuring serial interfaces are properly recognized.
> 
> Change in V3:
>   Fixed the compilation error.
> 
> Change in V2:
>   Removed the unnecessary reservation for non-0xff class interfaces.

You apparently also include another composition in v2.

> LI Qingwu (1):
>   USB: serial: option: add Telit FN920C04 RNDIS compositions

When sending single patches its better to skip the cover letter and
include the changelog in the patch itself (under the --- line).

Johan

