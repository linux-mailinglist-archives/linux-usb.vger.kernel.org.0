Return-Path: <linux-usb+bounces-15374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007B984EAA
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 01:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9DEF1F23769
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 23:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29052186E2E;
	Tue, 24 Sep 2024 23:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIMSly7w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCFE84037;
	Tue, 24 Sep 2024 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727219068; cv=none; b=LwiySRjbLFPnLmrwxqvYyf3qA3LWvYtqJQkJHIOIf3YLTkcTisVtfrtj/rg7RsrOcRycGSzzFz7Z3vJ3uZ6jOiiTimZ4mAq3SYThXfQtJTO0c8jYksGlTXvRKJJju/5Nxh9E7FW+xIzxq7OyGHYsC+6o4KLkI6jC8rIhkOK9Uv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727219068; c=relaxed/simple;
	bh=omR4aQo5N8hQp2ef7WhVX5x82/fg/iIJ02ElNWRIix4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuWohx1s8VhXXBDcT2rjUgLfZ/Ckbp1i/fO3wXgjzkSsVS2sncdbjZdV3O1/GEfTLm410BnAdQFXrdaBCTmh0D7lBAoAfJ5DvMz1LQr6CrkaxFzsSgGeVYTWD6ICvPLPzYRaZqkTcz15oQ1wYuwAThx1g+1C8kSwCXzYLSReUlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIMSly7w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120AFC4CEC4;
	Tue, 24 Sep 2024 23:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727219068;
	bh=omR4aQo5N8hQp2ef7WhVX5x82/fg/iIJ02ElNWRIix4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIMSly7wo/1uWpc2ce6SwgvjZJ0wHi2j31aIsjIuVxamrjnu28FjvRi7ibeWI4DJO
	 M623vedlYsTCsDPSa49Q4JegdSjpxNavcPpBU59t0VZRbeuhiwwZykQ5KXS/X57VzB
	 Dx1PVT/+9N/P9spcfQrloRHcA+224579akx2k/sIFwUc0qdQ3K+HyKwi4uRE6K6Jqq
	 KY/e6DV89pOu18w5AuX21Hw5RcbPZboS7wM49MlVETdAWWWw+H4gU2tFJnzhYm1NYt
	 3PsD3gwywTV/CountrkrgT67amNgGR0SbjmY7ZhozIJlHONuBR2u6VlQ0qsLPaaUuk
	 KHSbgykOtdxeQ==
Date: Tue, 24 Sep 2024 18:04:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: badhri@google.com, dmitry.baryshkov@linaro.org, kyletso@google.com,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, rdbabiera@google.com,
	linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: [RFC v3 1/2] dt-bindings: connector: Add properties to define
 time values
Message-ID: <172721906660.459503.12738294708498951192.robh@kernel.org>
References: <20240923224059.3674414-1-amitsd@google.com>
 <20240923224059.3674414-2-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923224059.3674414-2-amitsd@google.com>


On Mon, 23 Sep 2024 15:40:50 -0700, Amit Sunil Dhamne wrote:
> This commit adds the following properties:
>   * sink-wait-cap-time-ms
>   * ps-source-off-time-ms
>   * cc-debounce-time-ms
> 
> This is to enable setting of platform/board specific timer values as
> these timers have a range of acceptable values.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>  .../bindings/connector/usb-connector.yaml     | 35 ++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


