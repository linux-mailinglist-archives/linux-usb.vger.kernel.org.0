Return-Path: <linux-usb+bounces-5642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722884274D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 15:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E234E1F25884
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 14:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DB77E571;
	Tue, 30 Jan 2024 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ca9frE4J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB057E785
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706626640; cv=none; b=VPTKLfKDJzB0fT4Dp3RtiuH97C3x7mJ04msPspPNJ5WnqHrGp6imj6g7iX8z/pT2I+n2TGepuIn9wAcW08CAvrJCyOWk9ZgY2QvZ3Zcdn91xJ1n1Ih+czU/h91LxlyMh6V8hHPsIhP2rT1Z5tJEnwPiw6MvjKDzUffxxS8Zr8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706626640; c=relaxed/simple;
	bh=Aug+5Mxlw6i8W4uIRNMvCQRVMr8antrfiwX3XUeeMTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ky9YqV7CoJJk3ebQ6EQ2mR7v1y3CgvWihxg6eKcXzd4SY8O7aR0VUP9eTGRHKLxnMaq5Mymtj2VK1Q1uRF02CAUU7ki3p0oHdGNIphrcumxRubM4QMYtfEwaqWa7pScErMKS2KssTSxcrmRKrFA536PRNVkU6VwRmTUrA01Zqz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ca9frE4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DD1C433C7;
	Tue, 30 Jan 2024 14:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706626640;
	bh=Aug+5Mxlw6i8W4uIRNMvCQRVMr8antrfiwX3XUeeMTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ca9frE4JYLaGLLydq+FmcTt4RNKe1WPIs7Yh2z9P6hoU1Brv2jpffhh68UPBN4dwq
	 LcB7doO2fqikkH6jCTSENre8xxTufM0lcUHEsok6Xy6wE732FKjap1AKQrvUahGZiF
	 goOEIznnvE4dOJehpWsEWn3Xowu+Dp8x14FfSVZ0aulNj4acL//b0tQnGeTPISExfM
	 SKQtpiTVc1qcz2MGTq6dfZM8gyqbS3qXkR3Bifz+qS3pK6bs4co4fWGW0OT8/LDcI+
	 kzex4gwtdvmRNBgs/c+ZwtuwCldOl7d+CxMTwkTeT0IEM/Q0gt7n9nexbKfGPfUrqB
	 Xea/Kmn4a7+RA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rUpY5-000000006LD-0E4J;
	Tue, 30 Jan 2024 15:57:17 +0100
Date: Tue, 30 Jan 2024 15:57:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Rob Winn <rob.winn@integrelsolutions.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB: serial: cp210x: Add VID/PID for Integrel Solutions OEG
 Controller
Message-ID: <ZbkOTUoQkC7CJ8A9@hovoldconsulting.com>
References: <CWLP123MB6443E84799CC3972B5317E589A722@CWLP123MB6443.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CWLP123MB6443E84799CC3972B5317E589A722@CWLP123MB6443.GBRP123.PROD.OUTLOOK.COM>

On Wed, Jan 17, 2024 at 11:03:20PM +0000, Rob Winn wrote:
> Add vid/pid combination for Integrel Solutions OEG Controller to cp210x driver

Please wrap the commit message at 72 columns.

> Signed-off-by: Robert Winn <rob.winn@integrelsolutions.com>

Nit: You From line should ideally match you SoB (e.g. use Robert in
both).

> ---
>  drivers/usb/serial/cp210x.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 1e61fe043..d1f993eea 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -163,6 +163,7 @@ static const struct usb_device_id id_table[] = {
>         { USB_DEVICE(0x10C4, 0x8A5B) }, /* CEL EM3588 ZigBee USB Stick */
>         { USB_DEVICE(0x10C4, 0x8A5E) }, /* CEL EM3588 ZigBee USB Stick Long Range */
>         { USB_DEVICE(0x10C4, 0x8B34) }, /* Qivicon ZigBee USB Radio Stick */
> +       { USB_DEVICE(0x10C4, 0x8DDC) }, /* Integrel Solutions Integrel OEG Controller */

Stray second "Integrel"?

>         { USB_DEVICE(0x10C4, 0xEA60) }, /* Silicon Labs factory default */
>         { USB_DEVICE(0x10C4, 0xEA61) }, /* Silicon Labs factory default */
>         { USB_DEVICE(0x10C4, 0xEA63) }, /* Silicon Labs Windows Update (CP2101-4/CP2102N) */
> 

And the patch appears to be whitespace damaged (tabs replaced with
spaces).

Make sure you can send the patch to yourself (and apply it successfully)
before resending.

Johan

