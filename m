Return-Path: <linux-usb+bounces-3358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AD37FA0D3
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 14:22:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6990281305
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 13:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF072DF9E;
	Mon, 27 Nov 2023 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YC2PyYm4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7983D1A702;
	Mon, 27 Nov 2023 13:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEC7C433C7;
	Mon, 27 Nov 2023 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701091330;
	bh=VMQtEdCOVaS38Wu6iEj4lCJRQZ4TyTyCmYz+FNCaYOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YC2PyYm4dkKVLgr7iY+QbR57yyY3WkKWh05Vumr0W2xzgOAPDikIYQys0hoceviqD
	 V0PhTMls3rZLnalsDFEvc1EGbtwf5HKhf9lXXdei/NdCNV5IgZFfXwLBqmG6V3YsRG
	 MCXEOPht9SodhovpMQqve5pJHcTis1f/Jtz/qPF8chRQaMZIwLebhj0bBD5RHFqqKI
	 XDNRylIZvGV9XbfhpywsssvCGyPyAJY8F60aHK3eaL0FTeT8sS41WVUPnt7zOPTpN8
	 n0sam5Q1P6Sss6B00aa9gKFBOgc1r7zp7PJtK3URzHyETTk7fHQC60DKpPNzIG09Lf
	 8KC63klPATSbw==
From: Vinod Koul <vkoul@kernel.org>
To: vincent.sunplus@gmail.com, kishon@kernel.org, 
 Su Hui <suhui@nfschina.com>
Cc: linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <20231120091046.163781-1-suhui@nfschina.com>
References: <20231120091046.163781-1-suhui@nfschina.com>
Subject: Re: [PATCH] phy: sunplus: return negative error code in
 sp_usb_phy_probe
Message-Id: <170109132717.42536.11844523525705275991.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:07 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Mon, 20 Nov 2023 17:10:47 +0800, Su Hui wrote:
> devm_phy_create() return negative error code, 'ret' should be
> 'PTR_ERR(phy)' rather than '-PTR_ERR(phy)'.
> 
> 

Applied, thanks!

[1/1] phy: sunplus: return negative error code in sp_usb_phy_probe
      commit: 2a9c713825b3127ece11984abf973672c9779518

Best regards,
-- 
~Vinod



