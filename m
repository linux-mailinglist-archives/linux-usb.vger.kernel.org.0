Return-Path: <linux-usb+bounces-28290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F4B85846
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 17:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74830165F8E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 15:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E7830CD8F;
	Thu, 18 Sep 2025 15:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTkRzD95"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73921D590;
	Thu, 18 Sep 2025 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758208612; cv=none; b=HkBwRN2C3vcyy/4vJXeO7odkGJq0qORnojFaM2vGZxqoGTYO2T1bsilSwJJKawpo8lvYNr8tkeBR6IVtXtN8Z7EarQPC0883ZW2/AJp4RdDMZYN/YFx2dTqtcAZPNOROIXnRhCr70YK6jXtFQyHUE5IH/I1ZNTeM5YHTvFec4ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758208612; c=relaxed/simple;
	bh=+y2XjvrZWRm/NClN851RwZErZn1znenBebdqAfPBjsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZe/ibE4cGyzWdbNt7NzR1tCmjMzxJ2JPwBNVTWQAciNAiR95J7rlj2C/4iw6I7922A5pZ9TxFJ4oh62jeDOC365+n0d8Bj0StTmf9T9tZN6aBKGCzc2ennzli4QinoivGpzw1MRbZM4Lz+005H3KoEcrty0QCqcRlxXzUntZ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTkRzD95; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A8FC4CEE7;
	Thu, 18 Sep 2025 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208612;
	bh=+y2XjvrZWRm/NClN851RwZErZn1znenBebdqAfPBjsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTkRzD952iQSSmqp3QGmQhtrP7UYTgMoQjGAhBIvPm9gw0HCJRDqdBoDLxwFC7/16
	 69d+VjpMfvYT/PBNfwB/xmv4hyoVoWlCewO2eQ4C3NJ93WULXBScT4Hugpzv2XVSEj
	 45ceYgvCwYTaQoVEjQ7KrJz7/AOQAvgOLKKWUuUsLYu8IiJ3BCEUuGdsMa81fzLRaz
	 VXbQwplS2ZpqJG4HDcZUBDcxBLuHoxMGxYDFi4P/W/dv19Y2UxhVVpfAJF8ZPfWgrg
	 otYdR9afl4KUhzImZehrc20EI9cwwVj2LuDlo6tsUNFJ3cIA8pdpz1udxXEaOGgNuS
	 0F84uOnJyqy5g==
Date: Thu, 18 Sep 2025 16:16:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: ehci: Add Aspeed AST2700 compatible
Message-ID: <20250918-prevalent-repossess-a04c661bad5d@spud>
References: <20250918064919.224927-1-ryan_chen@aspeedtech.com>
 <20250918064919.224927-2-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xwj6gubmpH3vqK2o"
Content-Disposition: inline
In-Reply-To: <20250918064919.224927-2-ryan_chen@aspeedtech.com>


--xwj6gubmpH3vqK2o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--xwj6gubmpH3vqK2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwiYAAKCRB4tDGHoIJi
0rJdAP49HEdrWgLuTBLXGn7pi+F6QZmqKvqasAHyebnYrx0zFgEAy3Xf4zokdJxN
M+GDZdt+ee9FgiHBgN2LGIsihjOTOAE=
=4kOT
-----END PGP SIGNATURE-----

--xwj6gubmpH3vqK2o--

