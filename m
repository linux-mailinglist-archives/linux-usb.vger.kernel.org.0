Return-Path: <linux-usb+bounces-24886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF86ADEF61
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 16:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 044EA1702F8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 14:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F992EAB6A;
	Wed, 18 Jun 2025 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBs80kN/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59639226CE5
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256879; cv=none; b=pVPC1WkjhM8U74+OmWe+7tCTJ+/+ZsB3BTPnYflTFmFwKZzwSKYky3nHJ9dwTiuEx2ES/F9i8LKte8Vjs+NOjuiFVtVZa5TZ7twH3qNohQtRdmeH2Y4y9wWSoUzw8+mxc61N+tLWjJLD162eQhOGlShE9XiaX1r+HmwOUyZ48pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256879; c=relaxed/simple;
	bh=uqj1j58PjJX1woWZcZv2IUDwMQUfELIbDovsGnd21Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSbZyX0Cv8kMPZtfE9dHiAeiDKs2jE4Krit1JrSyfMv+1MDY43nVfZUUtJ20gcuHrKnzB1Uw9W++uZ1n9AfSHT8p1Vbt/NnQ55FvYR8dE8P7Pi+c7+npSx4VbgmDYbgSy2GQeg0peaRy1SgTFPHrXZnc3udUJ2jeU+QNgDDXpaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBs80kN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9FDC4CEE7;
	Wed, 18 Jun 2025 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750256878;
	bh=uqj1j58PjJX1woWZcZv2IUDwMQUfELIbDovsGnd21Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBs80kN/cIVZcR1cpyuMVIuUaqwZuBBroS5nbv8ha5IRmaM+8hMSOJzGke3Zm3Wh5
	 AKqqSyHlsRM+fyJqBOm1xctJG7KF3We/8MM28juYd35MZKoX2pP1vuzvntBJwc/fBy
	 OkkkkunzGKkp0HvHm1jGibjj79OyYIMC7V/BFRSV+AfXWHag+Z48dOT52vgvw/k7Hu
	 X0n8VNivry9O+aZw/EEwDyVdELuPq7UFfsvi2R4SWxAkm7j33Pq4w+nl115Rx5ZGn5
	 Ue32tjaIs+dYJW+HLgipjJ4Txb2zmg9jfwvfzj/ZP1t5aQBP5xwmMC65uLXbZCii+0
	 4g6WW9B77/hJw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRtle-0000000051D-2Exw;
	Wed, 18 Jun 2025 16:27:58 +0200
Date: Wed, 18 Jun 2025 16:27:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Michael Wyraz <michael@wyraz.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] Add Marvell ML352 to drivers/usb/serial/option.c
Message-ID: <aFLM7jZBEk6a7W-k@hovoldconsulting.com>
References: <aFJzdxe_ykNw6cP_@homebase1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFJzdxe_ykNw6cP_@homebase1>

On Wed, Jun 18, 2025 at 10:06:15AM +0200, Michael Wyraz wrote:
> Add the device id of the Marvell ML352 to option.c so that the
> device is recognized as usb-serial device.
> 
> Signed-off-by: Michael Wyraz <michael@wyraz.de>

Thanks for the patch. Looks good, but we may not want to bind to every
interface of the device.

Can you please post the output of 'usb-devices' for this device? I
assume it has more than one interface, do what each interface is used
for?

If you end up resending, please use the common prefix in Subject, for
example:

	USB: serial: option: add support for Marvell ML352 

(e.g. as can been seen by running 'git log --oneline' on the files
you're changing).

Johan

