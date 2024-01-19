Return-Path: <linux-usb+bounces-5288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD37832BA1
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 15:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E0B288D45
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 14:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972ED53E20;
	Fri, 19 Jan 2024 14:50:03 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id CDCE44F203
	for <linux-usb@vger.kernel.org>; Fri, 19 Jan 2024 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705675803; cv=none; b=cAv/hJaWyJ5kTcx4GoDAnS3ZRiv9Aawsqr5Yre0rEUwdSvQYurLZ2R+zoyiqYEp00AywC3qlFvr9DkHkrozeP5SFiBetpfX8/YPXkC3laWoIH2aJS5ENPgLhio2mLyemkWt9tQBAZjpX4IrElH8UBqtLLkm8HFO18JM3fBKMl3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705675803; c=relaxed/simple;
	bh=WrsWeNGSmUOF+t7juNTo63FBT3jTSfGoEXRDYjcMnQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZocSKfYGKPtOUShReYCEejZSMu+4sYPpvzZGAut3bdv84wa8pwvKOPFxVRuN3ueySK57XRbqnFqvGGrgReWSWXKWrionwibDoFSGEPR/15NZsS25jweZPhs5PQjqeoJPIKTsEL4uq6e0Wac4i0WfvaqPgiI++OhqjvN8f6U5xPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 40869 invoked by uid 1000); 19 Jan 2024 09:49:57 -0500
Date: Fri, 19 Jan 2024 09:49:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: yuan linyu <yuanlinyu@hihonor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: udc: run disconnect callback before pull up zero
Message-ID: <9a483f40-83ef-4476-b94c-21506d94653a@rowland.harvard.edu>
References: <20240119054813.2851201-1-yuanlinyu@hihonor.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119054813.2851201-1-yuanlinyu@hihonor.com>

On Fri, Jan 19, 2024 at 01:48:13PM +0800, yuan linyu wrote:
> When write UDC to empty and unbind gadget driver from gadget device, it is
> possible that there are many queue failures for mass storage function.
> 
> The root cause is on platform like dwc3, if pull down called first, the
> queue operation from mass storage main thread will fail as it is belong to
> another thread context and always try to receive a command from host.
> 
> In order to fix it, call gadget driver disconnect callback first, mass
> storage function driver will disable endpoints and clear running flag,
> so there will be no request queue to UDC.
> 
> One note is when call disconnect callback first, it mean function will
> disable endpoints before stop UDC controller.

Exactly.  So instead of getting a bunch of errors on the gadget, now 
you'll get a bunch of errors on the host.  I don't think that's any 
better.

Why don't you change the dwc3 driver instead?  If it allowed ep_queue 
operations to succeed while the pull-up is off then this problem would 
go away.

Alan Stern

