Return-Path: <linux-usb+bounces-14462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E74F967EFA
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 07:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8080CB21A01
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2024 05:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2871531D2;
	Mon,  2 Sep 2024 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uYUv+jc2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4763A1CD
	for <linux-usb@vger.kernel.org>; Mon,  2 Sep 2024 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725256626; cv=none; b=pQCad7N9t/QlXnczYk2X6C3wIafQaLaqCNRruze/un9gQxZ/nFoI4c00xx11bqV5GgwaDvOE4SJ+oGB8sswIqdy8eUvdU2RcYqtACKSztRLQdIhfazMlVeQS4wLxxn+TXAY7R76vWw252Vw9O40Ej1MN4B5luN7JHIeOSAk3C8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725256626; c=relaxed/simple;
	bh=y+g/3o7FxDT7cIv4oyYpk1rgjOPQINTW80qTPpwbgrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUdKi7YzI2soLQ6mqeQHUdB+/4B3GBLl8dqQACHsCvBI4zUogcQ9Q6wOWv3kCqvhm1TNiNXdszQSucSlHEy1mN2Neo44S4JSjHFXbPOYtCL0giMuWmsvxnoDtNczRySNk7ccEm90SwqJ3Ny6bSyCwdWO+koO1S8DduJKPGmxr7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uYUv+jc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A440FC4CEC2;
	Mon,  2 Sep 2024 05:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725256626;
	bh=y+g/3o7FxDT7cIv4oyYpk1rgjOPQINTW80qTPpwbgrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYUv+jc2cb04NfqXDidgEXUc8DnX3QgctFLpP2xt+KtkstlnCpR0JeSLjWv6mD8EI
	 PUV3BhGcGtPv+4V7z/fH27xWyIXmPhVTieSKmpM/a1yn/3601Vi7qP2EyMjIoL72Um
	 ACevNtn/3ew9dCaOWQWh2YpihhzBAzg/scsujYPU=
Date: Mon, 2 Sep 2024 07:57:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Amil Sanan <amilsananak@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dan.scally@ideasonboard.com, linux-usb@vger.kernel.org
Subject: Re: adding a new device in uvc_driver
Message-ID: <2024090220-elite-duvet-c6af@gregkh>
References: <CABprV6ReozmBsi5Db-MQw2iHt1mXXjy735yfHwQdeC6RX92RLw@mail.gmail.com>
 <2024083035-recovery-babble-df48@gregkh>
 <CABprV6Rj9VZFFeuA5LSmrw3WR3tNPn3rUs4B3ad=MqDgHx3UdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABprV6Rj9VZFFeuA5LSmrw3WR3tNPn3rUs4B3ad=MqDgHx3UdA@mail.gmail.com>

On Mon, Sep 02, 2024 at 09:37:22AM +0530, Amil Sanan wrote:
> I don't understand what is the issue

The bot said what was wrong:

> > - Your patch was attached, please place it inline so that it can be
> >   applied directly from the email message itself.
> >
> > - It looks like you did not use your "real" name for the patch on either
> >   the Signed-off-by: line, or the From: line (both of which have to
> >   match).  Please read the kernel file,
> >   Documentation/process/submitting-patches.rst for how to do this
> >   correctly.

Both need to be fixed up.

Please see the hundreds of examples on the mailing list for details on
how to do this in a way that we can accept it.

thanks,

greg k-h

