Return-Path: <linux-usb+bounces-30870-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 041F8C816FC
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 16:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 035D4346115
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 15:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF0E314A9B;
	Mon, 24 Nov 2025 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjbzVOYF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB2314A7B;
	Mon, 24 Nov 2025 15:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763999638; cv=none; b=hFIdOvebX3Zxg9qm2AiqOCU6OH3htC7zoMFMPfJRcGMOllZlPTxrfF0HSygzbe7lsP92CVr5ZVmEmtyvtQ3LUPgkDLXNfiPxNhl3/dGOggk/zAO1RzOKj/ql+4+b56vjpJom/F7NkflgmQbQt2VqiyHQKPwiVh2Lfs+jG0RiHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763999638; c=relaxed/simple;
	bh=3AgzSL7TSXfTHRTiolRGZ2y+93hLgCTVv6i0T1UUhUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlQk1LcNdiaCoxX7YjfvH5t34jTa0ctycqYZqX+JbTKMJTsTwIQL83ZNh/oPi9W+ZyN3vPT1tnGd8TrXuX0a0Z72B8O6EJyLYbwVDOeulBdBkHQzYaGSOBSXTbzg0ZI2cUJXzaWp2AQgRGCqvj5hb3weZP04mglLAS1cOZZvDis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjbzVOYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E55C4CEF1;
	Mon, 24 Nov 2025 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763999637;
	bh=3AgzSL7TSXfTHRTiolRGZ2y+93hLgCTVv6i0T1UUhUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjbzVOYFfuNEmrBX7EgXwx0VyLraFkKAs92OZ2VWZ6kDLP25ZXSVRrnUzYcaBVdZI
	 loAC6gt3XFjWmvuO83ytp0mnoACcNGGiehIezvt2N0/WSh9ypb18f0DluQyLvZSFfc
	 +eCSSEYo65DKVB6JYxx5yOAYBdhpHVRrLBuxtAAotvm38U74COlh4Ak8jqKfy1FtPr
	 eJLWdS5zBVkXFYI8OopA7qP1n+IgQxrM1q6qnDoXVloxjcnirwN0FifKsYKy/etnx6
	 T+rmhyDhefPFLtWOM0e3BQgI9FA6/GNSa3A6PFve9JKDb98voTTrs+yphqu7dd36kJ
	 wBs7eOJTeJKrA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vNYt3-000000003zD-2F7V;
	Mon, 24 Nov 2025 16:53:57 +0100
Date: Mon, 24 Nov 2025 16:53:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Foxconn T99W760
Message-ID: <aSR_ledly9vxJs0K@hovoldconsulting.com>
References: <20251118064528.31491-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118064528.31491-1-slark_xiao@163.com>

On Tue, Nov 18, 2025 at 02:45:28PM +0800, Slark Xiao wrote:
> T99W760 is designed based on Qualcomm SDX35(5G redcap) chip. There
> are 3 serial ports to be enumerated: Modem, NMEA and Diag.
> 
> test evidence as below:
> T:  Bus=03 Lev=01 Prnt=01 Port=03 Cnt=01 Dev#=  4 Spd=5000  MxCh= 0
> D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=0489 ProdID=e123 Rev=05.15
> S:  Manufacturer=QCOM
> S:  Product=SDXBAAGHA-IDP _SN:39A8D3E4
> S:  SerialNumber=39a8d3e4
> C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=896mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 3 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=85(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=88(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> 
> 0&1: MBIM, 2:Modem, 3:GNSS(non-serial port), 4: NMEA, 5:Diag
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Applied, thanks.

Johan

