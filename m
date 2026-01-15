Return-Path: <linux-usb+bounces-32405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC85D28495
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 21:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28D5830635C5
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 20:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB12313E0E;
	Thu, 15 Jan 2026 20:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrTC0jBH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA97D1D61BC;
	Thu, 15 Jan 2026 20:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768507419; cv=none; b=Y20cIIes5v0jpZ7395Ei8tWl42ujOhHoY421sSs6JV8/4EDtVBWMZ3J0PBCHPn3czEO4LqX/NeBE3bO85ofbHngvdMX4f2FMb7yXt9MzgohQPpvG7A4ADdQ/cojoL9v1kmYCkHTTidGSQAU5ky0IR2z15i6rVwoamJtgRt3PQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768507419; c=relaxed/simple;
	bh=j0KMSJRPUjr0OGr37u5/m98sK59dQ45lZHv+bXjm7mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQ2IeEzSy55AuZJGsh6FtC57CqyQhynGXo5U/ZzuyCcFlPqjtV0iO/NqIExjTKLsSMPdqFC1u2JMEmqxtMFjN+P8Yd1qIQxLpzwlIlnyqwFO/IpwU0TQWO0DRiEARv9nbBZDOrU07qT/W2jVEVTMxKAm6YyuwsGIogP+KAQ7OFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrTC0jBH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172D2C116D0;
	Thu, 15 Jan 2026 20:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768507419;
	bh=j0KMSJRPUjr0OGr37u5/m98sK59dQ45lZHv+bXjm7mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrTC0jBHSmn8QGKzqMX8HTO4kXIUNriQQwBPluePdsYnmgqz2sotFCffJGTzS+xcZ
	 mrj1zD7uV9XIDRVGtq1CXXlTtKz0zu4H+YDfiDCxp8AQWbS6fQY3B+MKnQvv+lS1hi
	 4HRBMAt3fPwlMOSxY4J8dqXTgNyX8cQCPFUAdiZS/jPdle+sx9Sp3GUnZCFi9UsWV5
	 rEKhpfwuNywvLmfEEXl4kb1d9XRhfCXlNujxVJ7kbLu1IL1J/uGjpUW9C0XtNMPaD2
	 vRIU2977NPMb48Ct3kGIyHEVwlq17Wy9Ipg4ZqpEuk/qnNIrz3KzpVQC84+ABHY86a
	 G9B6KF4lKkOog==
Date: Thu, 15 Jan 2026 14:03:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, TroyMitchell988@gmail.com,
	linux-usb@vger.kernel.org, conor@kernel.org, kingxukai@zohomail.com,
	linux-riscv@lists.infradead.org, alex@ghiti.fr, pjw@kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	gaohan@iscas.ac.cn, cyy@cyyself.name, gregkh@linuxfoundation.org,
	linux-phy@lists.infradead.org, aou@eecs.berkeley.edu,
	neil.armstrong@linaro.org, conor+dt@kernel.org, palmer@dabbelt.com,
	18771902331@163.com
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: Add Canaan K230 USB PHY
Message-ID: <176850741658.1095207.11658679131593700073.robh@kernel.org>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-2-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115064223.21926-2-jiayu.riscv@isrc.iscas.ac.cn>


On Thu, 15 Jan 2026 14:42:19 +0800, Jiayu Du wrote:
> K230 SoC USB PHY requires configuring registers for control and
> configuration. Add USB phy bindings for K230 SoC.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../bindings/phy/canaan,k230-usb-phy.yaml     | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


