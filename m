Return-Path: <linux-usb+bounces-23162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B8A90AB1
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 20:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68AA4476E0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 18:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E00217657;
	Wed, 16 Apr 2025 18:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKy5jIN+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC9728373;
	Wed, 16 Apr 2025 18:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826485; cv=none; b=rBoh1arROI5nX+dFSkEPsO5/5BUBr3vAkN1Ogd09+TZ9yWNMXu3Qlyc5/OAf/JHSqcXJaR6rEe2a2eRI/7AvJ4G5yUYe1mgcSqs8MVXCvPcvkZaIUlbdRqfTklVYY4FNgzbbx/Sp1afCdmSqIWMRhHHgEn8xXTPVabzEIYg0xss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826485; c=relaxed/simple;
	bh=ou+C4e6bXqBL2PzQ5WovjFqxQSEgJjK5auA6fY/WUrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHQTLHoR/87ahgBLfaubQXTZNMuIbYdhKJI9CC8k5bL5PrZ7sx0Jr+EagHqtXGVhXhiSQoNoV8J8pHlQbEsu6hym8P73bz/A3pMyvPefYwBG0QV0F/7D831Unb8paaXJvXKXhlKfcCFsoVxguAxuelFX+y5PzrTZHk5fZ52qNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKy5jIN+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1DEC4CEE2;
	Wed, 16 Apr 2025 18:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744826485;
	bh=ou+C4e6bXqBL2PzQ5WovjFqxQSEgJjK5auA6fY/WUrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKy5jIN+IkYTNJf90za19g48rtLjr5/BzpkxH3zIRXnTdSZdfqrAeXhR/2yGpfmxf
	 5ZkOWqRgRIlAU36Rz5B/kfb8oMGCAY7aFJkk6P0TnkOqsMwwMgkZEhrb//cRD/ihqM
	 PASYViR9cDS1ciH1v2520s8vC3ZfWtEp7tP6AGNEx52oBERBibNnYe9M48J1/HiEd5
	 XB2DF5MFi1SmjwCUpCCT7tsppIGWbpl9/3bqgokTylawleL97wL1uYxNhR1CU+GuJD
	 szGjynRnRyqInmCtk4gQcb6avxS8wPqK0lZ+aw90fz0utvVOfZQ4UUJXsAtteAwnkY
	 5INk6Te9+x6ew==
Date: Wed, 16 Apr 2025 13:01:23 -0500
From: Rob Herring <robh@kernel.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: usb: realtek,rts5411: Adapt
 usb-hub.yaml
Message-ID: <20250416180123.GC3327258-robh@kernel.org>
References: <20250415094227.3629916-1-treapking@chromium.org>
 <20250415094227.3629916-4-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415094227.3629916-4-treapking@chromium.org>

On Tue, Apr 15, 2025 at 05:42:00PM +0800, Pin-yen Lin wrote:
> Inherit usb-hub.yaml and remove duplicated schemas.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v2:
> - New in v2
> 
>  .../bindings/usb/realtek,rts5411.yaml         | 47 +++++--------------
>  1 file changed, 13 insertions(+), 34 deletions(-)

Similar comments as patch 2 on this one.

Rob

