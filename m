Return-Path: <linux-usb+bounces-20706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E7A37FAD
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 11:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D7C03A2C38
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 10:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC1C216E20;
	Mon, 17 Feb 2025 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="S8LWbg0K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECED1A2380;
	Mon, 17 Feb 2025 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787405; cv=none; b=DowSWxyZNBn1hqxOoRszCb9JeIPhjmG3a5x3TZn3Rtod7slC2N3VXl01fo/zfIZSsX3b7CGZmwHU2k6H6eqkGB4K/WwmzNQ5M0G9qLMu98MEXAlaTmeQJjqzHM+/RxdyZ2bB6cTH7H32iG1EtaLlKjwDWSjFVNs/lCDf/3NspQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787405; c=relaxed/simple;
	bh=2b0ssJvspuRRNhPxDbjfaOIMkY8T4KS4iFr9njlmkNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/B1MX65UOB+6Dil2lRj5YFh2I1wd0qSD2pIZ3E98A8s2vbEdmG556eUDFN8x9LV+vJCR29SDy+25u0pQjw1318nZ+Ps+w1Mt2G6th3R6Ha/osllfx1RiZBrJyH0oRiblnCbzXGMH9yIL+oduYa9+yziQimzvT3v7ZsGI7jImI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=S8LWbg0K; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yQZncXsJ08w6dn/CQGrI9m/CtWBS9ZgdPyo1uxiw8q0=;
	b=S8LWbg0KmjlKxqeavmtEOa0jvDw8mdjl6dxM6NqrBFnjaVjyyZne20ehuDXVcc
	FaE33ud6RKBqUTurRhCoD8l8w/xTQFEg1SyiXSPVJau2uyNGSV3EH7T9vMpIPLtm
	Qsgi+qMtM10EVC1iFDh10iSuCbEYnh+l9HU7DVFz5m9hY=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3SshDDLNnYyAUCQ--.17238S3;
	Mon, 17 Feb 2025 18:15:33 +0800 (CST)
Date: Mon, 17 Feb 2025 18:15:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, jun.li@nxp.com,
	alexander.stein@ew.tq-group.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v11 2/3] arm64: dts: imx95: add usb3 related nodes
Message-ID: <Z7MMQ3bqIJ9nFqpl@dragon>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
 <20241204050907.1081781-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204050907.1081781-2-xu.yang_2@nxp.com>
X-CM-TRANSID:M88vCgD3SshDDLNnYyAUCQ--.17238S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVMmhUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ32ZWey5vCopgAAsa

On Wed, Dec 04, 2024 at 01:09:06PM +0800, Xu Yang wrote:
> Add usb3 phy and controller nodes for imx95.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied 2/3 and 3/3, thanks!


