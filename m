Return-Path: <linux-usb+bounces-7465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8425986FE6E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 11:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FA33280AB6
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 10:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FC7224DF;
	Mon,  4 Mar 2024 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyde3t/J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF7E20B33
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709547006; cv=none; b=KhCKGfF9ePQThkSdX+TK5Fz7STph1riZD5pHUiBLcct1JrNeEmgh3HH6DmuXzGtlI/6a/Cx5CbAUVOYt9uVigvdoxNspMeQE93CXOSDDX6SfvwuVdZYEaJRaZ7OQmwqJnZ/wY1dcyizEBRHI6MgFxskYxH/9tS6SS+lFfe19730=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709547006; c=relaxed/simple;
	bh=7rD8/990B1Ks5Im289lqsU2U9FSY1flqJ5ZsE+0MKdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXR53yBc44o5J22VyBqiM9ybkIxvbMWCeVaYScIkbUObc8ovhNT3stsy1OWMXNLwJvgbKgZx7Lb/8/bylptoUK28E3uP4iHCT9GaeXlTUpEhiY/i7PZAzRm7QF3UgIC1vkbDuDuAer9QvIjcI8Gmc28R8A3CWSzsC5DDfTTrDL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyde3t/J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B5CC43390;
	Mon,  4 Mar 2024 10:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709547005;
	bh=7rD8/990B1Ks5Im289lqsU2U9FSY1flqJ5ZsE+0MKdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyde3t/JoEXjwuAzC5J3X2uJw3hV/3UshTS3PM1B27TLFN8dLeINPcsNlmQikjp1X
	 zX5TkUsoE8lwpe+jUtFWj0dcVpqEgOkff9WV4vA/lqk/zokClOoASbgY6a/KKj2a7A
	 KzWULsOJ5jLHwKLjo+tpEnpxhw+Tejgy44F8jFOMXYsqXpIEQrnW++iNG/yRV/SnFr
	 wXr0hZ0BwLtOtvg1li93+GKHAuIYNmiNaOIbN4thW7KwcstCc6l27aI30favkX5NBy
	 kw4vQ5l2s2AmWGyYKcwlV9unYQ/C4kNAVhQKgKW7v+ORJm2iX1Pf5ZdHAQm6HQU4a1
	 FjsXlpKSoS4lw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rh5Gv-000000006Kl-3H2S;
	Mon, 04 Mar 2024 11:10:14 +0100
Date: Mon, 4 Mar 2024 11:10:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Daniel Vogelbacher <daniel@chaospixel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] ftdi_sio: Support for GMC Z216C Adapter IR-USB
Message-ID: <ZeWeBcHr1-v96OND@hovoldconsulting.com>
References: <20240211144245.2469439-1-daniel@chaospixel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240211144245.2469439-1-daniel@chaospixel.com>

On Sun, Feb 11, 2024 at 03:42:46PM +0100, Daniel Vogelbacher wrote:
> GMC IR-USB adapter cable utilizes FTDI FT232R chip.
> 
> This patch adds VID/PID for this adapter so it can be used
> as serial device via ftdi_sio.
> 
> Signed-off-by: Daniel Vogelbacher <daniel@chaospixel.com>

Now applied with an amended commit summary and message:

    USB: serial: ftdi_sio: add support for GMC Z216C Adapter IR-USB
    
    The GMC IR-USB adapter cable utilizes a FTDI FT232R chip.
    
    Add VID/PID for this adapter so it can be used as serial device via
    ftdi_sio.

Johan

