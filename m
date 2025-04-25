Return-Path: <linux-usb+bounces-23426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA42A9BC41
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 03:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B8C59A040B
	for <lists+linux-usb@lfdr.de>; Fri, 25 Apr 2025 01:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F42935959;
	Fri, 25 Apr 2025 01:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Z9yOrtVc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4130D21348;
	Fri, 25 Apr 2025 01:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745543920; cv=none; b=MqVkpFwfXkasc4IHhqgyv1AJgx+eGVJJzc/OTZhG4FJLJe1YVzhWzi2xvXXh9ECE51YSoM03qbEDln0xNJOpQckhEVsdnKlO3lbpM0Inr/q/TONi6upvAC/C8Y3//hepZoW53WiSMqvlrHLy5dL0VAQB+xABRJbSrr93j74sCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745543920; c=relaxed/simple;
	bh=Jxp45A9XWR7TbTq/yUz9Mgl2ntPywWb3OElHS/fnb98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc6Ua3KXvMfLJpKukNJOgr8A9O/Cs+Nxx2HdzFyaRODfn8IRJdZTFd2JrglEh5LmKfPOJs3s+fg2/ykrxdMVlX1bwAtCMGIQz3Hvl0+RSXYoT7vEXhwMvJK2y3T37C3oiVBQm54Sl8xXB0LzhedyFlEh5ifx5W9U9p2E+hlG4FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Z9yOrtVc; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=diYpJ2woDLLxcXdyjY3RcNcSCXx2a5zJ/H9nkUGQOcY=;
	b=Z9yOrtVcngcb81qVOfFkXq3ZBqSYnKjxgmC1uKv+xPoBlPCbRdTxIRwpbiF1gK
	zecgsT0Anl/oe9d8ydZEekmW+WSvnw+aCGRDVaoNa6emWsO/H5Qs/MOvoM45OSWT
	coDpP1q8bjx57D0taf/fQf5Wmv8K4mYLh+LzpiSdLY1vo=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHxdu94gpoQNzrAw--.35608S3;
	Fri, 25 Apr 2025 09:17:51 +0800 (CST)
Date: Fri, 25 Apr 2025 09:17:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v6 1/3] arm64: dts: imx95: add USB2.0 nodes
Message-ID: <aArivYrUcsiyYV/A@dragon>
References: <20250410064907.3372772-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410064907.3372772-1-xu.yang_2@nxp.com>
X-CM-TRANSID:Ms8vCgBHxdu94gpoQNzrAw--.35608S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIxpnUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQk6ZWgK0Y1ElQAAs4

On Thu, Apr 10, 2025 at 02:49:05PM +0800, Xu Yang wrote:
> Add USB2.0 controller and phy nodes.
> 
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa95xxSA
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied all, thanks!


