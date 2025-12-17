Return-Path: <linux-usb+bounces-31529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B15CC6A11
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 09:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 532103042B0B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 08:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E801933A028;
	Wed, 17 Dec 2025 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBd47GPw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E27833556A;
	Wed, 17 Dec 2025 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960875; cv=none; b=F7HPnD2/GkCAOuTsiZTQGsAqXqOmRk8RXhsvpFJ8S5J47XCkWZD/oBNb35lfuzBxbTTDWtFvG9uDpNSFArIItDSt+H337Y1nWEDg9xNLUZ2WQx+dVgoPOcTLhLj2EafWkS44P0cREXR37iX3MSljHD4Csm4AdyH+L6VfRDcJCw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960875; c=relaxed/simple;
	bh=DN/5cKBtaGIrVKiQZDzWQJCgVuIv85Fy4hIawsRQLaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pC07mGWzpA3XwV3KpnptVv8Ql4Gs7OywP5JPcyY57k4L1SmlLcDWIKC4KdPacnSKnQZkHVcmF+VBSCnkPEepgoG+Y+A0XNDtCLt/YJcF2HhZEJZUArs1AL9xss3qat8b3SYzxX8vatbPL4xBm1GIwGvYdv8M0hds4vwZkGmhGrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBd47GPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA847C4CEFB;
	Wed, 17 Dec 2025 08:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960875;
	bh=DN/5cKBtaGIrVKiQZDzWQJCgVuIv85Fy4hIawsRQLaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBd47GPwYUg5mBMMBWuTJSfEOq25j7huM70fNagLxwI3otkKYlqd/NaZIP8Gks0UQ
	 RFDYbZgGBYj7yMg6ksJSgbCmAwUQgoKdjW8c+sCTg/zxaOyv4aeZPC4qnCdYc2Z3xo
	 cpmGkNCfjcxjghRiRZ2pLji6WdelJ46wAUUbNCAkVr040hhwlVVf97oGEpzyyMzlBJ
	 0XUbaRlypee61ajRMrp5jVkSrdEg3d6HfgtPkppvWbvg/EqhDHGtdgrjzvlEkj6EwP
	 CtZzVBr0r4b3ECfIQQ7a76nc6QbMWVI47vP/k6/SPiQHST28CaDACIe2ZviCjselbJ
	 Q2oTGeJDpTPxg==
Date: Wed, 17 Dec 2025 09:41:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ehci/ohci: Allow "dma-coherent"
Message-ID: <20251217-classy-refreshing-wombat-897c57@quoll>
References: <20251215212515.3318052-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215212515.3318052-1-robh@kernel.org>

On Mon, Dec 15, 2025 at 03:25:14PM -0600, Rob Herring (Arm) wrote:
> EHCI and OHCI controllers can be DMA coherent on some platforms, so
> allow the "dma-coherent" property.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 2 ++
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 2 ++
>  2 files changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


