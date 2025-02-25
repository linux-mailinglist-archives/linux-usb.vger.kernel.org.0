Return-Path: <linux-usb+bounces-21044-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D3A4450B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 16:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54A86860858
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 15:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16227155757;
	Tue, 25 Feb 2025 15:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDWXGG6e"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA315539D;
	Tue, 25 Feb 2025 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740498892; cv=none; b=DdlFerTx88a2e9/beh+D62JeM+1PcNhHJYdV5ZTyBsEHX7riU8h918bjrdPxOBxT+4rkn47bpBvwcKbt83nwohPkQBFGxzl01JcMp8+gSF+ShUfe79oOHgprJvXwZJBu7OwLrP5AP7ao5FzDVRNRrlVFbLKcYiDHxiUSL7q4+Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740498892; c=relaxed/simple;
	bh=JfxDYuUElX0vet5OAT17toee3SRhFOg1uKAsynXvBmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmZdRkrvefvb7lZbJ8hZ52OIV/o8AOWI2YXvJX1ADOATjf/+a38gjZtOLzaX3KoTx+sgIC/kl02qLBklAX8en3vE97qIPiDugGRNEwmUw6hPPHD6X0kxSb8J/MhcEu+2vfZuw9Un2hHPHVbr0QJj8liTYkHg/nhHM74EmThuusU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDWXGG6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45E1C4CEDD;
	Tue, 25 Feb 2025 15:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740498892;
	bh=JfxDYuUElX0vet5OAT17toee3SRhFOg1uKAsynXvBmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDWXGG6eQt1CmWiksbFNg33l9gWCNCB+BiWZ+ZdHhAlCkyusuPv/UEwRlJ6mjphoM
	 eS7Asrro6qMERpgWFj8JVO2jr7+UiOmoOl4UxhC4BZFY9SxdQmywF4sfLXPiT+13wF
	 9h+zVTOomluh1PmcnQpfaiJkbA5dwyOsDFHqBgBjD3UwpbLTP86/NwJDqJAKvZkkqc
	 qNawo8JK+g8pT1P/4N0QzBXzzPljIC/T4Aee5iiJ3CgkFvT75gZqfRRCoDXQaw7YIS
	 BuPktr1pZyWBjrA+JiX8P4WYiG0Xxph75sal1aycwl0mXghcf2ao3zyRSoCYzImHN+
	 6Cd6THvyDJgiw==
Date: Tue, 25 Feb 2025 09:54:49 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: s.hauer@pengutronix.de, peter.chen@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	conor+dt@kernel.org, shawnguo@kernel.org,
	gregkh@linuxfoundation.org, kernel@pengutronix.de,
	festevam@gmail.com, jun.li@nxp.com, krzk+dt@kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: usb: usbmisc-imx: add support for
 i.MX95 platform
Message-ID: <174049888950.2563045.17446599441921480072.robh@kernel.org>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
 <20250225053955.3781831-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225053955.3781831-3-xu.yang_2@nxp.com>


On Tue, 25 Feb 2025 13:39:51 +0800, Xu Yang wrote:
> Add compatible string "fsl,imx95-usbmisc" for i.MX95 platform and
> restriction on reg property.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - improve subject and add Rb tag
> ---
>  .../devicetree/bindings/usb/fsl,usbmisc.yaml  | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


