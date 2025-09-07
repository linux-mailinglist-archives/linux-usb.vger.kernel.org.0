Return-Path: <linux-usb+bounces-27684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23175B47B87
	for <lists+linux-usb@lfdr.de>; Sun,  7 Sep 2025 15:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2E7F3B4063
	for <lists+linux-usb@lfdr.de>; Sun,  7 Sep 2025 13:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95EB27147F;
	Sun,  7 Sep 2025 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="mFfJk3jP"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455DE262FE5
	for <linux-usb@vger.kernel.org>; Sun,  7 Sep 2025 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757250942; cv=none; b=IRru3u4I+uRFoE8p7nykAqu77JI4gP5irTlu46ztTXP8Ph+BdU0oc0y5xxygpd7V/YmBhh58bJIojDSlqQtankSVnr6Sj6GWoSix+GWXhbpkS7CtYPUd5wjIsS5F/VZ/ZlQyPHgpcyNykBdlqJUEV9i+6fHZjE9JdRnzAzf29Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757250942; c=relaxed/simple;
	bh=S/KUq6pSTXq+6IeioXoPeuwVExsq2hrUKmGGJELtuVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BF1m6nXJ3Thp7GNYtDVEyQCdF/J7QtI69j+EnzpR4RWutit0u4n4xm42grDcEfFglJSpi6k3H079JAsE22Ip6H/wQMQII0eub0Dsr2IksNqQCV697SL57v0xd211NihNEPks9oIm7LsDRRxez8N49/ZJ2PXh0My9SFPdTXoeLZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=mFfJk3jP; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Date: Sun, 7 Sep 2025 09:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1757250938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S/KUq6pSTXq+6IeioXoPeuwVExsq2hrUKmGGJELtuVI=;
	b=mFfJk3jPrq2PSVa5pryxIo9DqIP/tWcI51vlOz3BNmXJL/QW5ixV3gvPtQMTqLlhfFWoAj
	VyJs++CEOPsdCfp+Eb3m7RmwPM9ep8GBaKxBeBskm0o6AEvLj6/xNXMvXmJECEKnr12NzL
	8pd/TRi5r2iNaHU9W74lLCd9byKepNk0KGM1lRqaHRsJ2VuutCPFTYczDxhOJYBN/Otwhc
	HPb8MEZXCVHbh1lmNiRCvjkhMC0OvoSThpecM++4MbfBhJJcBfsGBcP0mKMbq7LojgXwfk
	Wq2OUStSnlP7T3L7CaEGPi4CLQgmIvIGgePoxVs1LRMbiKx9dmQCKnbjg7cINA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Anne Rosenzweig <alyssa@rosenzweig.io>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 18/22] phy: apple: Add Apple Type-C PHY
Message-ID: <aL2Fdd2Ls26pksJN@fedora>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
 <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
X-Migadu-Flow: FLOW_OUT

In functions like atcphy_dp_configure_lane, I'm wondering if we want to
pull out individual registers like `void __iomem *tx_shm_txa_ldoclk =
tx_shm + LN_AUSPMA_TX_SHM_TXA_LDOCLK`, likewise for
MAIN_REG0/1/IMP_REG0/etc, just to make the actual pokes below a lot less
noisy.

Incidentally, the txa_ldoclk_bypass handling is another place where the
cond_set32 helper would shine.

---

Also, do we know what _OV means?

