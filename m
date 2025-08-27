Return-Path: <linux-usb+bounces-27317-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1242DB37DBC
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 10:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DED0D68106F
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 08:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8432431812C;
	Wed, 27 Aug 2025 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mra659Ip"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B392304BA8
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756283150; cv=none; b=nMwMOTtTCrMUKJLLi+9sLm9SE1/n15uKCuCz0OUw1/4twh81RdPIM20V5LYLPsTWpDxnlpkRJxnfcS+ZNEYC1Pca6eVsHXCofhIcDR4dHqHY+F5DVbqbXD/NsZkCmfbcgYmZ8aCPx2t7xsn2qyCxxWjApp/7RUcmH6FMlI+JAp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756283150; c=relaxed/simple;
	bh=AG2MX81BrDv6NptTkiXXM/C8VbaHY8mmTbbQmdmiCSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Alu7R/gAJFxGf4xFtobeZRvHqQ3772R6yr9T+Tt5MVVPpa1RExXE+zIoO8NeySWzkNa49agnnNoFBlEjUJWgBXmiVEG+U/sxrPkaLMUVyULW8DMz5UeQr8WWNEdWsoF1R+a1zIbjeDGc71xptH5j1uEBw5PBCjB1Nz/N84fh+Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mra659Ip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC38EC113D0;
	Wed, 27 Aug 2025 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756283149;
	bh=AG2MX81BrDv6NptTkiXXM/C8VbaHY8mmTbbQmdmiCSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mra659Ip1VE2Dy9aMfbqeaAdbmzdkP0baGVvsONVhIg/u9I2i5Kw2CZyW0G6NRnmM
	 Z/hidnGwptUxws5feQJfMVDXxBCr6y1Sm3akJorA3jdY/71vgVv7tw6wm/oXCEPcG1
	 jtfGtp4Wx9fWDk30o1WTvO3OHp++wzTkfQ+rhxN5BEHzyV/YY4H+XVMty0mK4w6qhU
	 GgiXAs8N36btvpNPthlqTObHRcvfWXNPC0Ddt5fb5PL1RezniMMlZnK0ouyjTNtlGc
	 fn5eg/EUfbsKQJpi7G2dlFphZz55VWOhWnJTRMWtIuxSF7T2ymZQDfenXMPhCL5zjJ
	 Qh0qGT8hqQfqg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urBTM-000000000zA-1uGi;
	Wed, 27 Aug 2025 10:25:37 +0200
Date: Wed, 27 Aug 2025 10:25:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Ulrich Stoehlker <ustoehlker@yahoo.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: pl2303 converter - unknown device type
Message-ID: <aK7BAAo8xW-3fAaP@hovoldconsulting.com>
References: <585146173.2802367.1754377623142.ref@mail.yahoo.com>
 <585146173.2802367.1754377623142@mail.yahoo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <585146173.2802367.1754377623142@mail.yahoo.com>

On Tue, Aug 05, 2025 at 07:07:03AM +0000, Ulrich Stoehlker wrote:

> I have a Multi-Channel-Analyzer (MCA) interfaced via usb.
> This device cannot be used on more recent kernels.
> I get the following error message:
> 
> [663822.490455] usb 1-3: new high-speed USB device number 17 using xhci_hcd
> [663822.616495] usb 1-3: New USB device found, idVendor=0557, idProduct=2008, bcdDevice= 0.01
> [663822.616501] usb 1-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [663822.682309] usbcore: registered new interface driver usbserial_generic
> [663822.682326] usbserial: USB Serial support registered for generic
> [663822.686383] usbcore: registered new interface driver pl2303
> [663822.686402] usbserial: USB Serial support registered for pl2303
> [663822.686423] pl2303 1-3:1.0: pl2303 converter detected
> [663822.686431] pl2303 1-3:1.0: unknown device type, please report to linux-usb@vger.kernel.org
> 
> Linux host1 6.8.0-64-generic #67~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue Jun 24 15:19:46 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
> 
> But it works with older kernels:
> Linux host2 5.10.103-v7+ #1529 SMP Tue Mar 8 12:21:37 GMT 2022 armv7l GNU/Linux
> 
> Would it be possible to correct this problem!?

That should be doable.

Could you please post the output of "lsusb -v" for this device?

Johan

