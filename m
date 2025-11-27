Return-Path: <linux-usb+bounces-30984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A13C8CB02
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 03:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A88C3B26DD
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 02:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6A828641F;
	Thu, 27 Nov 2025 02:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hd6RiPGB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D61B35979
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 02:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211572; cv=none; b=gN06oCCgtMl9gKejYxX0fCDgniXcG7iHmC5i5s7kqi1eR9czEMY6c6cmIzfbaH3QumHttwC3HU+kmtTEk/x4q1LWdyqQq37Mf77vD/ViKXZNGK/20LKTukWHREZ50YEH6IXUr0Yn2nHGzPclGg3f5ISytQ/8IKkTD6RXaBaaKIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211572; c=relaxed/simple;
	bh=YKvxaFTOfmploXyBJI/Yb9hiou+Rm1ktRAO6666Wvuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeVt7WBWYITC16mkcZFo6+aJbr1nO6P1oMU4PsuDVTgBJjsMXQv2IPdZowdHVHrex2IHZstee54gtyV2E2L65S/zJy44gTEqLiE1zZIAXKry6Qe+dQbOHkssc+6ia9WFJcMC/F+YypGj+Q3psLCynDrCPz+nb0eTuWnG8jVsL0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hd6RiPGB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBC8C4CEF7;
	Thu, 27 Nov 2025 02:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764211569;
	bh=YKvxaFTOfmploXyBJI/Yb9hiou+Rm1ktRAO6666Wvuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hd6RiPGBLkk0U2JVvbGWSGaXBzUnwraRSr0YoeWzVOI1zELWBEecJsIPZzI70CThb
	 UDnOeJtApDWknuhrLWyvXp52bcqA6B1pAceOnt0IsDXuVR1O9NfN+O6GXVMKjzJubJ
	 r9fpuLQMgpECHBrRfR2NNHEXyQHETpNRpNcAHpoMfv/3xFL+ncaVwEgdW+jnkb2Ncv
	 /rBJew2HfQkmaGsSimq4zJRT/LJx6ypOOPUTGhtrVzxtMhkTP9pLrzAqcX2rnYia0i
	 DTUtI/EiNk0VZ8AW1A5sAc/dKRs6ce6Pi5tAP37i27Ir4m/TJJOJIdeke280ZaaNIU
	 nKgA2PWfUd/iQ==
Date: Thu, 27 Nov 2025 10:46:06 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: "Uri.Trichter@nuvoton.com" <Uri.Trichter@nuvoton.com>
Cc: "tomer.maimon@nuvoton.com" <tomer.maimon@nuvoton.com>,
	"Avi.Fishman@nuvoton.com" <Avi.Fishman@nuvoton.com>,
	linux-usb@vger.kernel.org
Subject: Re: Maintainer of ChipID
Message-ID: <aSe7brbIyYtsO5Ir@nchen-desktop>
References: <KL1PR03MB7053BF80E52FB7C409F5AD3C85DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
 <KL1PR03MB70537F6998668F54F407E29985DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <KL1PR03MB70537F6998668F54F407E29985DEA@KL1PR03MB7053.apcprd03.prod.outlook.com>

On 25-11-26 08:15:50, Uri.Trichter@nuvoton.com wrote:
> Hi Peter
> 
> Are you the maintainer for ChipID USB device driver ?
> If so, we would like a quick help from you

Hi Uri,

You could send your question, and see if we could help you.

-- 

Best regards,
Peter

