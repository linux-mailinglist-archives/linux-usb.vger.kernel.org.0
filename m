Return-Path: <linux-usb+bounces-30805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23542C7AD66
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 17:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769433A129C
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 16:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC99A346FBA;
	Fri, 21 Nov 2025 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a/4EvMYW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875C33E341;
	Fri, 21 Nov 2025 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742412; cv=none; b=NaIzkpafHdWGxIHz9bl0xonXcQez24fG37FcUrQPLvlXUIRt+mhJtrgnHPz5FSXgPKjpLCnFtrPkDcGOpMIWknW5LOKqyqqxO0n5fp+Ges/LWf5hPrNQfI7WxAo1xmxz9lirANhSSi/Tnu6tL1BAsnBlRW+MDneBTdGhObsr/b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742412; c=relaxed/simple;
	bh=SpLzKcnYvBcvKfOqyZtcEjKMFCjAjvaLYOYMDv8snqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxrDgGM8a1/7SWkP7tX9CBqoIh0I11ZIhMtoV8MjoHLzSkk+L8lzmBZ9pny9UgeDp65fYyvS3lkuQUM13vpn9LZNjewt1mC+pvgGVvdKPWPmaFiWZff9oD/uSE3mohYQUOl8AKdwPCsl4R2V1Gg62a47jHb/Yw0I0LJ9wSmr444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a/4EvMYW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFA1C4CEF1;
	Fri, 21 Nov 2025 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763742411;
	bh=SpLzKcnYvBcvKfOqyZtcEjKMFCjAjvaLYOYMDv8snqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/4EvMYW4g0eZ1imc2/CWTg8nVYQpRM+ihrYODbf7AI0bJi+gBjjo7uCIUYIx0D2b
	 jT3P/pz9a/KXhj9uwJj4Ww/L499Ao4bp7c/K/AUf7IifPnnOTNIa5+P4bUmhqKt/y6
	 BZci1erKZoAGGcVhMpXDmR7/cLxbK/g2995zLgiQ=
Date: Fri, 21 Nov 2025 17:26:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sameeksha Sankpal <sameekshasankpal@gmail.com>
Cc: sumanth.gavini@yahoo.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_uac1: fix coding style warnings
Message-ID: <2025112110-faculty-subtly-84a3@gregkh>
References: <20251121161240.25818-1-sameekshasankpal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121161240.25818-1-sameekshasankpal@gmail.com>

On Fri, Nov 21, 2025 at 09:42:40PM +0530, Sameeksha Sankpal wrote:
> Fix several checkpatch.pl warnings in f_uac1.c including:
> - replace NULL comparisons with !ptr
> - remove unnecessary parentheses around simple equality checks
> - remove a redundant 'else' after a return statement
> - clean up superfluous blank lines
> - use 'unsigned int' instead of bare 'unsigned'
> - enclose a macro with complex value (USBDHDR) in parentheses
> 
> These changes clean up coding style and improve readability without
> altering the behavior of the driver.
> 
> Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>

Please do not do coding style cleanups all in one patch, nor for
subsystems that maintainers do not explicitly state they want them for,
as it can cause unneeded constant churn.

please do this in drivers/staging/ first.

thanks,

greg k-h

