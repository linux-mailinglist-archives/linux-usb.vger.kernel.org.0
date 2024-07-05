Return-Path: <linux-usb+bounces-12009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FA99284A0
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 11:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D70D1F21DC7
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2024 09:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73C2146597;
	Fri,  5 Jul 2024 09:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJayOQP1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB613665A
	for <linux-usb@vger.kernel.org>; Fri,  5 Jul 2024 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170278; cv=none; b=JJgu01c0G1tDoKoicRYNe8SAknaG0JmsupeaIPmUrMfDNW1Cn8DCKEEf6wk+SYK5jGg2e/FL3yOkTPsIA8UcNGZevvI53XE3Rrsrln+mYLI2S/pjCL/iYDxf53C+d8b8/RlfV92uq7X9vJGXHUPixsL6lCYajIccr8jySSZ14n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170278; c=relaxed/simple;
	bh=cpl/k9SkzN3FWjQr/yGhrq6iMugCjL47e/N7+rYsWIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu0vitMjLf8op6V3OxCTZdvcX4p6qqouzW5AB0phOCForlERXHzBfWhVoktW3jxMBOJeWWYD6u3uNVCWCOsWEy2QdwhaQaM3m8YCEtD7OXYvhfN2eHv6LkCL7G/L3ka6hZc/3yuVbcoL/mjBIR+BVbaG+F6fAkBQsgApSvrEV4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJayOQP1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3259C116B1;
	Fri,  5 Jul 2024 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720170277;
	bh=cpl/k9SkzN3FWjQr/yGhrq6iMugCjL47e/N7+rYsWIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJayOQP11s6fcBLk4qTmbAd8s9+qMa/4MrYclPJ+kju9uESk6DwelZoki1/Sbio/I
	 hUF9AzuoV1e8y87RtScSL2AuNRRZh/NHifZbYLkDxHC57k/SjnI6jDGggEWfzyRl6o
	 mkX8ZEdfyFYCvLxd4z78njN8Xeyz1bAIFCDLiIg/wwDoJ1oeqQd7ovvU+xxkcB/hwb
	 dCRctdNhcK5BsnOSxZryjWlGJqfEGA3xA7LqMpkSiv86juW+ktJW2Mx/o4ZqY6405Q
	 OXVnH2NOiJJTBdZuY9K9LyBtmrN5t9AjTWw6FJ0I6ijWrojoQX/DuK1fG1aTJ2zNal
	 Kxk0UP9WfQq3Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sPerw-000000004xv-0yOY;
	Fri, 05 Jul 2024 11:04:40 +0200
Date: Fri, 5 Jul 2024 11:04:40 +0200
From: Johan Hovold <johan@kernel.org>
To: Mank Wang <mank.wang@netprisma.us>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V2] USB: serial: option: add Netprisma LCUK54 series
 modules
Message-ID: <Zoe3KPnvOXFLQuok@hovoldconsulting.com>
References: <CH3PR22MB438518FE39766ACDBFE6748081D12@CH3PR22MB4385.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR22MB438518FE39766ACDBFE6748081D12@CH3PR22MB4385.namprd22.prod.outlook.com>

On Sat, Jun 29, 2024 at 01:54:45AM +0000, Mank Wang wrote:
> Add support for Netprisma LCUK54 series modules.
> 
> LCUK54-WRD-LWW(0x3731/0x0100): NetPrisma LCUK54-WWD for Global
> LCUK54-WRD-LWW(0x3731/0x0101): NetPrisma LCUK54-WRD for Global SKU
> LCUK54-WRD-LCN(0x3731/0x0106): NetPrisma LCUK54-WRD for China SKU
> LCUK54-WRD-LWW(0x3731/0x0111): NetPrisma LCUK54-WWD for SA
> LCUK54-WRD-LWW(0x3731/0x0112): NetPrisma LCUK54-WWD for EU
> LCUK54-WRD-LWW(0x3731/0x0113): NetPrisma LCUK54-WWD for NA
> LCUK54-WWD-LCN(0x3731/0x0115): NetPrisma LCUK54-WWD for China EDU
> LCUK54-WWD-LWW(0x3731/0x0116): NetPrisma LCUK54-WWD for Golbal EDU
> 
> Above products use the exact same interface layout and option
> driver:
> MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

> ---
> V1 -> V2:
> 1.Use comments instead of product macro definitions.
> 2.Add more NetPrisma LCUK54 products for different regions.
> 
> Signed-off-by: Mank Wang <mank.wang@netprisma.us>

Thanks for the update. Next time remember to put you SoB above the ---
line (and changelog) as otherwise it does not make it into the git logs.

I've fixed it up manually this time.

Johan

