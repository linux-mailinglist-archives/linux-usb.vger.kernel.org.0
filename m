Return-Path: <linux-usb+bounces-1659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F37CA17F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 10:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A3CCB20D37
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 08:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC261864B;
	Mon, 16 Oct 2023 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU6sygjz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7606D1549F
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 08:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0D5C433C8;
	Mon, 16 Oct 2023 08:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697444635;
	bh=fWQiGBvgRpsRaTQ5ejv5AbcJbuEEhftS4vCnBsTePG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PU6sygjzBYRaRhHy+epfx0NhmHaN01XdPLN2P2lrscOsZ0oihxRoOLbuVS/nU3OP1
	 +zZkdBfPzpqpSuOW0D5HCST3NNfWGtgOsvhKOHkCIKDxio/8jRtN4v6BOfxvtNtSMa
	 24wn1D3fMR5liJmBrg0RkZhZvm67+82jasW0wiR9v+j4R8jKPLkrSqBxlcdsLkwDIF
	 xS+l43x66Xidgz1SJCZycMsN8IqEAHmgasLUJEYFnvCAnXRUtpDxASqSmsJfWgoHus
	 sQgbXqIqFVYFdiKuJW0Wcf0c2QNwv5Fj1KcSF/lfw9Vy5se/00NJA/BrWBaaFznR2e
	 Ic4gjUGBr4K3Q==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qsItC-0001rU-03;
	Mon, 16 Oct 2023 10:23:50 +0200
Date: Mon, 16 Oct 2023 10:23:50 +0200
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?B?TC3psoHnkp7kuq4=?= <puliang.lu@fibocom.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Fibocom to DELL custom modem
 FM101R-GL
Message-ID: <ZSzzFvmATauo_6aH@hovoldconsulting.com>
References: <20231016073616.519051-1-puliang.lu@fibocom.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231016073616.519051-1-puliang.lu@fibocom.com>

On Mon, Oct 16, 2023 at 03:36:16PM +0800, L-鲁璞亮 wrote:
> From: Puliang Lu <puliang.lu@fibocom.com>
> 
> Update the USB serial option driver support for the Fibocom
> FM101R-GL

> T:  Bus=04 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=413c ProdID=8213 Rev= 5.04
> S:  Manufacturer=Fibocom Wireless Inc.
> S:  Product=Fibocom FM101-GL Module
> S:  SerialNumber=a3b7cbf0
> C:* #Ifs= 3 Cfg#= 1 Atr=a0 MxPwr=896mA
> A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=(none)
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms

Thanks for resending with the author address fixed.

You did however not answer my question whether there could ever be more
vendor class interfaces (e.g. for adb) so that you should be using a
more specific match for the entries (i.e. USB_DEVICE_AND_INTERFACE_INFO())?

> +	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R, 0xff) },
> +	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R_ESIM, 0xff) },

Johan

