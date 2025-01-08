Return-Path: <linux-usb+bounces-19133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC12A05873
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 11:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA2371888855
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 10:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B21D1F8938;
	Wed,  8 Jan 2025 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQVdCfAo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48291F1307;
	Wed,  8 Jan 2025 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333001; cv=none; b=Uyzi/accmIpYWyanZ0qET9LQsC+aM9A9YGYIoVMgm373tXCWwK3Z3ZgRLGZNZKPVH608qi1HIBO9dNml81Rco2pIGHHec5bNtryKn80FpAO6PRak1wCkIn7OZh9EW7hVgG2/nqX0Bb57/4CEzcTuUv0tuocwHQODezNG2J8nXTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333001; c=relaxed/simple;
	bh=JOM/2216VGqbCxVhunXvCv5WUTfIlC790+eQQXJxS84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2U5p/50UvLLI7s55yPy8g+UEVWeJVr5ffMiLWWtGqw9aO+PciCsnMQ8wy6MQhKrlH+HLyKv3grHTC/uVEN/4zs0lt9pmq3NLhWDFfN4QqcrOhmvolHtkVPz3N5lK85wZrBoiT0fYa8vzTmkMx1C8Vn+oo6DiERDkp+4/MzyXi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQVdCfAo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54150C4CEDF;
	Wed,  8 Jan 2025 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736333001;
	bh=JOM/2216VGqbCxVhunXvCv5WUTfIlC790+eQQXJxS84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQVdCfAoZMOqGl78SlPjZsKmtHD3SIcHSJGdbQLToJ0PytjYmWWtI8XZEEC5LFxtQ
	 j8LLd+K6N4tndRY5wjimQc0dDi/nHQ32fSaAOSG/DIlBQPeR3HRVm4Lx/8EXu5inaG
	 omQpj7TKip0FqiCAgFlnARIEUf2h7aT9ftbVvXfkW2MdmdStW13l8/H2po203V5uGg
	 eQuWDqdi1iF6kZRbAMtKTcWVczEe0fOtDylqMKZmpIQiEyKxYM0J2JnyPiLAwTzAZ3
	 E5TV678xG5TP/Z0DeQK4FwNZaokzA2w0EhKrdSWRyqR0n2jHJvTYafMtU6UTbtrTTP
	 uRbBzFceoL1ow==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVTWy-000000000ZU-1az7;
	Wed, 08 Jan 2025 11:43:21 +0100
Date: Wed, 8 Jan 2025 11:43:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Lars Melin <larsm17@gmail.com>, ZHANG Yuntian <yt@radxa.com>
Subject: Re: [PATCH 1/1] USB: serial: option: add MeiG Smart SRM815
Message-ID: <Z35WyJY2Q6SXaa2E@hovoldconsulting.com>
References: <20241215100027.1970930-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215100027.1970930-1-amadeus@jmu.edu.cn>

On Sun, Dec 15, 2024 at 06:00:27PM +0800, Chukun Pan wrote:
> It looks like SRM815 shares ID with SRM825L.

Yeah, Lars recently reported that as well:

	https://lore.kernel.org/all/4333b4d0-281f-439d-9944-5570cbc4971d@gmail.com/
 
> T:  Bus=03 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2dee ProdID=4d22 Rev= 4.14
> S:  Manufacturer=MEIG
> S:  Product=LTE-A Module
> S:  SerialNumber=123456
> C:* #Ifs= 5 Cfg#= 1 Atr=80 MxPwr=500mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Now applied, thanks.

Johan

