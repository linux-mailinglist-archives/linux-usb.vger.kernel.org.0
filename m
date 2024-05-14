Return-Path: <linux-usb+bounces-10255-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EECED8C4C0A
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 07:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74EA2B237BE
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 05:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ECD1862A;
	Tue, 14 May 2024 05:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UaBIbgxo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCBA14A84
	for <linux-usb@vger.kernel.org>; Tue, 14 May 2024 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715665694; cv=none; b=R298QjKQAC5tR2JUQQX74zUWu3x/RL9jXZFKlQohxFuGY6j62mOokFy2p7RTPW/hjT6DBU2SYnJs3rAnXLmwkkUPXD2+17w7+0WZ7ja6025KbwtV9AjA0I5gHxYA1cQ+AIEUoTPTDxikq3NLajLQg1+vY6le740fwqv0ymQEjvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715665694; c=relaxed/simple;
	bh=9KQRk8wxPY4uyYKZPsrNId8VP5pXNbVeh5Pc1BXXink=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHNnyNy+IFjI8h7BKbroFURjSFlF/yNsZJPNQrLB1ftYdjww7zi2jlYYbCD3pxWCJpnuXxUlKPMIgCiLo3WXnV50MFWhyFeAco36Lp33egp2Jz0OhA+0n5eEAQPk6KxZwgnVsz3icsNDE8+bbcFCC/QVvgdrY1fEZoWU+0Zh+Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UaBIbgxo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F151C2BD10;
	Tue, 14 May 2024 05:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1715665693;
	bh=9KQRk8wxPY4uyYKZPsrNId8VP5pXNbVeh5Pc1BXXink=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UaBIbgxo+bM5ZCzK78C0sCGeCCmfzJrugNHTg/Gy0XkcECtpT9JxHjIg53kyvHOlR
	 VvhTn8FGpjTx7oCjA1V5B/oSvJRM5KhtAJemFCptGU4b3nDiZ4yPE2X6p70D3jCv/Y
	 GEXhoDThfaFQG9alvanQwVaBA5YP46KhA1mF/2SI=
Date: Tue, 14 May 2024 07:48:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Harris <charles7@slingshot.co.nz>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB Device ID
Message-ID: <2024051428-sweep-lark-3923@gregkh>
References: <befe7135-16f1-4a3f-8164-b15dd748e397@slingshot.co.nz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <befe7135-16f1-4a3f-8164-b15dd748e397@slingshot.co.nz>

On Tue, May 14, 2024 at 01:10:10PM +1200, Charles Harris wrote:
> Hi Alan and all
> Noticed conversation as below on earlier post.
> 
> I would like to know if this code could be used in a similar case.
> 
> Linux Mint 21.3   Using LibreCalc
> 
> With USB RFID tag readers, (2 or more reader)  most enter direct into open focus spreadsheet.  However with no device number.   Have same pid and vid.
> 
> As the read from USB tag goes to the spreadsheet, can the device number  eg 004 and the bus number eg 004 be appended to the data read into the spreadsheet.  This would enable spreadsheet identify each reader and its location, to manipulate the tag reads by the  location etc.
> 
> If so, how do I go about setting up?

Not directly from the kernel, no, you need to write a userspace program
to do this somehow, sorry.

good luck!

greg k-h

