Return-Path: <linux-usb+bounces-20645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA25A35ECD
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 14:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C447116F27E
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 13:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0308B264A95;
	Fri, 14 Feb 2025 13:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuGQ4m31"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7054B264A64;
	Fri, 14 Feb 2025 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739539065; cv=none; b=h1qkx1yzX1PZzHbpDfIUeOwR4oMH1yQUsDA03Dmb5nNZa35+mR8VE3ekhbSyjhJxC4Q4HLekSp8aKxZgeIcVbD4cy4RbZhY/YIqxZEkykkAtucfrBp8IMKigm9XMxLvtpbILhbv3bCooVHgg9wEZCQOoLJJZUhMTNW8ehGLJPpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739539065; c=relaxed/simple;
	bh=BJ86edZvh8jpGptX1hyjS/jbHr4cYEIltrPXc2Bwabw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vGdVD/BHP+YGwCp0jM41DPK7H+7CD4BkIVmY1OpenVmdmm7PQV5nlPw17uMvQKGXLoRKtCZfO2z6QV0R0lNA8E/MR861sx2tWWT8IvHOneIl0CajVqiuQzXAP2s/9fN2AWh/sZFCefRE9w5jj4CZJiZdIFf8tAvkMwKfgM5lUG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuGQ4m31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB9BC4CED1;
	Fri, 14 Feb 2025 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739539064;
	bh=BJ86edZvh8jpGptX1hyjS/jbHr4cYEIltrPXc2Bwabw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LuGQ4m31RLZgTi45838TutKOvFwDvAt2O/z3OB5N0iI8yDKNOmh0kSErJqgjdCikx
	 cTe3mzjgUZDFNnUcz99zeA6uQpJCUaEOnMYSwRXq2f+vRrR8O/VwmZPEPrRkd9XsOs
	 UiYVBzRoWp9HIQuAfjLtEed10lEKFZDdfn+tfJ1wltf0bk8AUnvyRiYQQhAFmqlvyy
	 N5DnI9RRItxGAUd/FrXyrU86hiGr0xJc2q+k2Rb+q0tI7q8GsNQJhcHR1EiffH+PDH
	 vtMTvBFAP1Lnur2MjH3cPmdF+TyWf6m/NSM9a/Zthr0RAClvZZE92RO97HFZobNxzF
	 ESlYyCG8RLGIQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, 
 jun.li@nxp.com, alexander.stein@ew.tq-group.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org
In-Reply-To: <20241204050907.1081781-1-xu.yang_2@nxp.com>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
Subject: Re: (subset) [PATCH v11 1/3] phy: fsl-imx8mq-usb: add tca function
 driver for imx95
Message-Id: <173953905899.3648.13979952904818516353.b4-ty@kernel.org>
Date: Fri, 14 Feb 2025 18:47:38 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 04 Dec 2024 13:09:05 +0800, Xu Yang wrote:
> The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> two functional blocks (XBar assist and VBus assist) and one system
> access interface using APB.
> 
> The primary functionality of XBar assist is:
>  - switching lane for flip
>  - moving unused lanes into lower power states.
> 
> [...]

Applied, thanks!

[1/3] phy: fsl-imx8mq-usb: add tca function driver for imx95
      commit: b58f0f86fd6156d7b084257f5c91ceaf7d760927

Best regards,
-- 
~Vinod



