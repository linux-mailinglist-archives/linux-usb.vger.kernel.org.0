Return-Path: <linux-usb+bounces-32400-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2520AD27E4D
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 20:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68F223142708
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 18:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC8B3D1CCB;
	Thu, 15 Jan 2026 18:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZmAMfTK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B026F288;
	Thu, 15 Jan 2026 18:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502982; cv=none; b=GydWerYFHbrscNRfJ2n/Wfm451ahrazqfze2Rw8LdWkPo7uKteZs9VpSaaV/D9zEvKqv8JLFWee9MNHyMthpK299VOg/h/Q9zIfQuDFLYnxQbwBg++OBk5KvhKgBDnU836nyUXvQkOwhub8dyuPOo7uEwrkt7el2kRpDpAv81v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502982; c=relaxed/simple;
	bh=/Osq23AR+uHAg6Wn2Bu5hfId6iSeb1FurWhcNFY/6S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYDWhL/RXzHUNFmo2e7QkxDiZP21r19dCyVeYv/YbZNTsbukKdiw4Ppd6arMHN/GGoaA0ecy7zFA5OahwAUJKbPJA8S7DaPljfLyTjKaPLv0dmfjIdsKNA3YL8kI2lRUPijC7trnjyYbaoAAzJ26DYkavVS+W6GRxSzsotpcbFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZmAMfTK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8ABC116D0;
	Thu, 15 Jan 2026 18:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768502981;
	bh=/Osq23AR+uHAg6Wn2Bu5hfId6iSeb1FurWhcNFY/6S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZmAMfTK8T5nx37mTBT9Po59BKbzwkz7TrBkCoamVi1abuY6Yci+AKFjRj837VRYz
	 wBb+HvI/wNC+9ZxTzoUjeGXEA20YBwP+7wjr0OXZhyZfeZNRdiwjsI224NS0QCg8oE
	 BDCQKemUIzTyJdO4TXqoASHarD/rmFDYQOmGTkNFS9KXUBkIj5Q/DaYQ2qPGABtcST
	 dT9nMGfTmQZOZI/aYT+lNU8ei3ebjxx7qEMzrKsDspchlxJb1TzwP+AWDnjmGsRzZ6
	 +UUHFhjmNb61n4xurOjOTildJ28P+5RiBu1DEdtTOEWuMwYWPelY5GFDZOSQjJK/qg
	 OJfJzrNao2tuA==
Date: Thu, 15 Jan 2026 12:49:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	linux-usb@vger.kernel.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add binding for WCH CH334/CH335
 hub controller
Message-ID: <176850297993.998584.15053974313992638434.robh@kernel.org>
References: <20260113095827.115-1-kernel@airkyi.com>
 <20260113095827.115-2-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113095827.115-2-kernel@airkyi.com>


On Tue, 13 Jan 2026 17:58:26 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The WCH CH334/CH335[0] are USB2.0 protocol compliant 4-port USB HUB
> controller chips, supporting USB2.0 high-speed and full-speed for
> upstream ports, and USB2.0 high-speed 480Mbps, full-speed 12Mbps and
> low-speed 1.5Mbps for downstream ports, supporting not only low-cost STT
> mode (single TT schedules 4 downstream ports in time share), but also
> supports high performance MTT mode (4 TTs each corresponding to 1 port,
> concurrent processing).
> 
> Add a device tree binding for it.
> 
> [0]: https://www.wch-ic.com/downloads/CH334DS1_PDF.html
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> Changes in v2:
> - Fix the incorrect reset GPIO polarity.
> - Use a more meaningful supply name.
> ---
>  .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


