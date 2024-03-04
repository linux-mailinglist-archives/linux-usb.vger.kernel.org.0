Return-Path: <linux-usb+bounces-7469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5D86FEF1
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 11:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7DE81F25EF8
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 10:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C93D24A0D;
	Mon,  4 Mar 2024 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ni22rTZM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D4225D2
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709547692; cv=none; b=tAfq9pggBSHm54rOKTwBm/OdXHvk69VeCzBafYLrQA/TB2o9N9kA1IgoJB4RuJO3ZmuWm+nOrPvTLLVybPAlioV+WebJYd+mzqgwq5u/jHtj+dWiI0KBJ8e7FVTjagaGVrey5GH0c6GCwwnCIgD4yqLZ2+MVKCbH+eG/zCMDMpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709547692; c=relaxed/simple;
	bh=WumH4WZk7ff/hemxLr7ZSHU49W20i3tsm7MUnVoVuX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9wn3pkxgTCKUbg7VNWYgxx7EphLu1T/USUMMdp7R1cuBdx7rPn56bWZ3erVoCbP11H3U+xdPMTgBqaSdLiwdVc3htyyYyl834kyXtmads8K8CCUw1LLxRbeHU0Ml/WQqvxFxmBXFmRGVFdgNyKPn2H3/pTnKxfmRdNBM8cE6A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ni22rTZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A494C433F1;
	Mon,  4 Mar 2024 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709547692;
	bh=WumH4WZk7ff/hemxLr7ZSHU49W20i3tsm7MUnVoVuX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ni22rTZMPk55XxLsfuZ1jzzlw1Oi0Ul2dAR48Hb73fJMr7oERSgbJZQkzyeOoZIeU
	 hKhBXSenG0Ri6z8HhcRmDQV6ZxEYJxC/WBnBAlH0vgCmO+0mT0CAcwqb+8h/UBs+89
	 jiwHuKSSDVj/d0JEjGuKJIG/Yzir1ivgjUtbn3RNHqR3CdwL06PcZmlXQgmSeFP2vM
	 pU9FXlK4hDZ64yM6ABtsyAw72rLw3z8gYpXpoKINDAQ2Ry18dPOi5JiqqScE3kUkPS
	 jjIyoEuVFAQjSVDZYnysan2YslXSnpkei0pTnLjDB1kqW30mG9ie8roOfFlDi6cRrE
	 p7Q4EEK/vJuxQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rh5Rz-000000007Zm-3JsF;
	Mon, 04 Mar 2024 11:21:40 +0100
Date: Mon, 4 Mar 2024 11:21:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Mike Miller <u492758@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Tell linux-usb@vger.kernel.org to add your device to a proper
 driver
Message-ID: <ZeWgs0ZClpCwE5lT@hovoldconsulting.com>
References: <b133097f-0793-47bb-953f-4c31a721a5c6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b133097f-0793-47bb-953f-4c31a721a5c6@gmail.com>

On Wed, Feb 07, 2024 at 08:48:12PM +0800, Mike Miller wrote:
> I am only doing this because dmesg has told me to :).

Thanks for the report.
 
> I am struggling to get a cheap arse Chinese knock-off Arduino Nano 
> working on my
> 
> Linux MyLinux 6.5.0-15-generic #15~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC 
> Fri Jan 12 18:54:30 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
> 
> and I get the message
> 
> [ 2840.099780] usb 2-1.2: new low-speed USB device number 8 using ehci-pci
> [ 2840.210523] usb 2-1.2: New USB device found, idVendor=16d0, 
> idProduct=0753, bcdDevice= 2.02
> [ 2840.210537] usb 2-1.2: New USB device strings: Mfr=0, Product=0, 
> SerialNumber=0
> [ 2840.211335] usbserial_generic 2-1.2:1.0: The "generic" usb-serial 
> driver is only for testing and one-off prototypes.
> [ 2840.211338] usbserial_generic 2-1.2:1.0: Tell 
> linux-usb@vger.kernel.org to add your device to a proper driver.
> [ 2840.211340] usbserial_generic 2-1.2:1.0: device has no bulk endpoints

Hmm. Without bulk endpoints you shouldn't be able to actually use the
device with the generic driver.

> This something you really can address?

Can you please post the output of lsusb -v for this device?

Johan

