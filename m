Return-Path: <linux-usb+bounces-1560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B17C81E2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 11:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87648B20A51
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 09:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DC110A23;
	Fri, 13 Oct 2023 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPKh6o7h"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF456FB4
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 09:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F61C433C7;
	Fri, 13 Oct 2023 09:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697188955;
	bh=0IICjsHru85+qPhGyOECjDC4TXr3Pa9V1kZA3t24K0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPKh6o7h9bPCYKzcZEVBTkwm1pPVFAj78NtQz8euMqTcj+9ce2ohdi08Dhx4F+f32
	 9kCFOfBR6LaC8zXKvII1frOxnrLAVsg1xpSEn+n3q8Y+DH80IWPE9M+E+PDQuyqjh1
	 EunHQe2eB82+nPv7OIn7vEPzd9Ya7kFeuMudWZmQh7ReOgzP4Ff5/nDhlRrzJVGgTx
	 01jR/IKZNj112s8N8JDCijM6iDj7AosXoK4YRIIsFtAe7KMaOC0fILJrPUdvcmjeRA
	 AJK20TT/wgtj3qToDtLFWZFwaCT3gYnpkWMMe1kSGiHfi8gOy9fzLFqeXFpX1+6Hsk
	 lFCTcJXqL7AcQ==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qrENu-0003RJ-1v;
	Fri, 13 Oct 2023 11:23:07 +0200
Date: Fri, 13 Oct 2023 11:23:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Puliang Lu <530194200.fh@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Puliang Lu <puliang.lu@fibocom.com>
Subject: Re: [PATCH] USB: serial: option: add Fibocom to DELL custom modem
 FM101R-GL
Message-ID: <ZSkMenm5jC9H_sxo@hovoldconsulting.com>
References: <20230901093610.67438-1-puliang.lu@fibocom.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901093610.67438-1-puliang.lu@fibocom.com>

On Fri, Sep 01, 2023 at 05:36:10PM +0800, Puliang Lu wrote:
> Update the USB serial option driver support for the Fibocom
> FM101R-GL
> LTE modules as there are actually several different variants.
> - VID:PID 413C:8213, FM101R-GL are laptop M.2 cards (with
> MBIM interfaces for Linux)
> - VID:PID 413C:8215, FM101R-GL ESIM are laptop M.2 cards(with
> MBIM interface for Linux)
> 
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

Could there ever be further vendor class interfaces (e.g. adb) so that
you should be using a more specific match entry?

> Signed-off-by: Puliang Lu <puliang.lu@fibocom.com>

The SoB email does not match the sender address (e.g. as checkpatch
complains about). Could you resend this one from you fibocom account so
that it matches?

> +	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R, 0xff) },
> +	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R_ESIM, 0xff) },

Johan

