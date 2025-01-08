Return-Path: <linux-usb+bounces-19132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84400A0582C
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 11:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AAA61885D92
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2025 10:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172D41F76CD;
	Wed,  8 Jan 2025 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhj7ubTz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2A21DFE0F
	for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2025 10:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736332442; cv=none; b=Bfy8q9Z8U3FUidZjouv/Y7kBCUCBl7Hv/qrdc2nPhoCU/FT8BL7vOCW4LEx964r2IDVIC4ALIIm7nyFjeEPOBVlOJRNnSrI2gUQIlOYRqk8N/xV/MAPFbpIXfbm/3jnzll/IQTq0f/bDe+EBTH1CBXB/hniUaZpzEonwnfu3wbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736332442; c=relaxed/simple;
	bh=qMSXuYjlaTCclN1BxgRXGLsJhLzgs7rO6/bShlWyHIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3tc0Gf/XLxCmzoJKZEUhRcOeeO2Dll4hVHPXOmp5E68QOAFytlj5XS+XoJxMuerpUkns2V2Teou1pse8U09UmZe+8+5vO59S5KzJfJmFuUqnOuzhkTQgePrERqBY3Bsv4yWyoU9ucYouoCxt1QxvQgef7M7yP89XxPC0DtWToI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhj7ubTz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2172FC4CEDF;
	Wed,  8 Jan 2025 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736332442;
	bh=qMSXuYjlaTCclN1BxgRXGLsJhLzgs7rO6/bShlWyHIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhj7ubTzD+4BmFnn9Jp/e9jak02A8IyUvbLLbfokBU6i2LoLe3K3TUT7/mZhuXn+7
	 RPIFLq++bRDO6keIx+rYK2zR0NnjAVKL7vde9ev3PdX5yo+wSP5CM/mpDfkIhBkbxA
	 BtqFhCf+7WMQ9TzO+8ybF498RviSyjJNFdi9k2XVIweGMLh/e0qB6h6Uxw3D3GtHnq
	 DTzpmW/3GaPjUQHyOGLtBzGLLwFRVqUI8tNzssOYDjL3e+MJssbpS63VpA7vUD67/9
	 w7BreZNLNsAqBaOGYKb9ICBg1cDWseCn+8IuIKZN3vc7C9spF2xOLnk0deLVwQWLUh
	 jIMx/QGE+QeqQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVTNy-000000000ED-0Rmi;
	Wed, 08 Jan 2025 11:34:02 +0100
Date: Wed, 8 Jan 2025 11:34:02 +0100
From: Johan Hovold <johan@kernel.org>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, Blake LaFleur <blake.k.lafleur@gmail.com>
Subject: Re: [PATCH] USB: serial: ch341: Add product ID for CH9102
Message-ID: <Z35Umg4mgUd-9SPY@hovoldconsulting.com>
References: <20241208081115.4036852-1-blake.k.lafleur@gmail.com>
 <Z1lc8O22rnS_e9w0@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1lc8O22rnS_e9w0@hovoldconsulting.com>

On Wed, Dec 11, 2024 at 10:35:44AM +0100, Johan Hovold wrote:
> On Sun, Dec 08, 2024 at 02:11:15AM -0600, Blake LaFleur wrote:
> > Adds a PID for the CH9102 chipset that can be found in some cheap ESP
> > development boards.
> > 
> > Example: LILYGO T-Display (and its S3 variant)
> > https://lilygo.cc/products/lilygo%C2%AE-ttgo-t-display-1-14-inch-lcd-esp32-control-board
> > 
> > After patching the driver to include idProduct=0x55d4 the devices work
> > as expected.
> 
> Thanks for the patch. This is the first time I hear of CH9102.
> 
> Are there any errors or messages at all in the logs when you use this
> device or does it appear to be perfectly compatible with the older
> models?

For the record, Blake reported off list that this device is in fact a
CDC-ACM device.

There is a vendor driver here:

	https://github.com/WCHSoftGroup/ch343ser_linux

Johan

