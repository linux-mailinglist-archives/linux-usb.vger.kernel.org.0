Return-Path: <linux-usb+bounces-3249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF7D7F5EC7
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 13:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B79DA1C20FB3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Nov 2023 12:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A230124219;
	Thu, 23 Nov 2023 12:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwYb4L6L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD72224E7
	for <linux-usb@vger.kernel.org>; Thu, 23 Nov 2023 12:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840CEC433C7;
	Thu, 23 Nov 2023 12:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700741463;
	bh=qnasH8UWNMPUtgjQEvW2eT8JgdXzZT3PCcSdRHKQ5FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwYb4L6L98d49s5xNvMsX7zGFPCoBYTo1wQG0I8euS89JMXzN+8gRPehOFOIn4+lz
	 ZJbnjK8ldOQJhpK1D6p4eR92PBW0vlEe39JypbhneDPtG6idrh43EDztMXlJgIAS1j
	 5U+lQVL/OhR5HM176K/leiM2vchDv5vaRL2Ccph0YumHY83vFYpdZobhLBbBBypPJT
	 RqUFC2xEK3lkvoPM32d+SiaAcWb/hpd3YWjKgzVME/V2QUtFCosQSVD3grdh0oG7Pq
	 GGAMS2O+41+yjWkDF70N282fimA3fd/7oIAmMRD8g7RYKNpxfUG3nEsGmRFfCeZna/
	 f46nRHPHbhRtw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r68YC-0004Cf-1m;
	Thu, 23 Nov 2023 13:11:21 +0100
Date: Thu, 23 Nov 2023 13:11:20 +0100
From: Johan Hovold <johan@kernel.org>
To: Asuna Yang <spriteovo@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2] USB: serial: option: add Luat Air72*U series products
Message-ID: <ZV9BaBBrn78i0x64@hovoldconsulting.com>
References: <20231122141803.82844-1-SpriteOvO@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122141803.82844-1-SpriteOvO@gmail.com>

On Wed, Nov 22, 2023 at 10:18:03PM +0800, Asuna Yang wrote:
> Update the USB serial option driver support for Luat Air72*U series
> products.
> 
> ID 1782:4e00 Spreadtrum Communications Inc. UNISOC-8910
> 
> T: Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 13 Spd=480 MxCh= 0
> D: Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs= 1
> P: Vendor=1782 ProdID=4e00 Rev=00.00
> S: Manufacturer=UNISOC
> S: Product=UNISOC-8910
> C: #Ifs= 5 Cfg#= 1 Atr=e0 MxPwr=400mA
> I: If#= 0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
> E: Ad=82(I) Atr=03(Int.) MxPS= 8 Ivl=4096ms
> I: If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
> E: Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E: Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I: If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E: Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E: Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I: If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E: Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E: Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I: If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E: Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E: Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Co-developed-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>

Thanks for the v2.

Can you say something about what the three serial interfaces are used
for (and which is which)?

Johan

