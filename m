Return-Path: <linux-usb+bounces-18232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 780419E86DC
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 18:03:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A0C1642DC
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 17:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C6919005D;
	Sun,  8 Dec 2024 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjVgxFJe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92C158DC6;
	Sun,  8 Dec 2024 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733677384; cv=none; b=AnSUMeHV7ejqIOcKR9Qu1dzikhMMUwrRuYYDXIVbX5cKXdnpbJ0HeuTtH6+uHfg9lCRDsDLZF9avw2R+lAAMpzC54q/ft+eQDh/KdLtMVByH29eyi8+HtxYAvcH41D1D+LykjF06//X/TX207Ty13uIyrNlDUTTMY2e8RaHl4fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733677384; c=relaxed/simple;
	bh=yfk7T0TUDNqEF1duZz7ptN/DD8iP4vzBIsj5E+zO3aE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qqar5ni67RZEdmTBv2z0EpsD9RDYRNOr1QXrefOgahzoeDFsYtTsSMPmFvbJdP+J/oYcx/Z3bmw2NmR6T20LkTs78wHrEM/ihBEPqLz4xPJxRbcdTIVp9AhmCk6F9pmtbWTmnuYcLTOe84y3EstJJ3yNtY63598+n3XAz9cWQ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjVgxFJe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5DBFC4CED2;
	Sun,  8 Dec 2024 17:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677384;
	bh=yfk7T0TUDNqEF1duZz7ptN/DD8iP4vzBIsj5E+zO3aE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZjVgxFJeKvtcy/DxrsYAciOdNWe+9W3V6CDIYNrd5U9J9KBTxv8YY+KWnSuaM3B2q
	 soRoWaxXE1N/UVErcxg0UzPM++PHSpf5nIIB9mErIX5PcWV10/jr8kp+I/KmRZHOB8
	 iU8yMXZXX4Ar4LM2a+x4xbt0bxARRxHVovS2NTwq4P9LT1yTuGeX/QDnG5Z1FfLdtj
	 sKgq1sTnTxjMjz/PAIoAEAkGKCvOYhobMwUkyvzIdiy9bw+EHP1a32IfV1/ASeOKg2
	 XoLVqQy/r6gdGHZq4UfOQ/aaGNU+JChaQxD1oJi5s8n7BD+iPF28Eh6tFTo4bdbX6J
	 kAQnBY98yrJQQ==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, gregkh@linuxfoundation.org, 
 jun.li@nxp.com, alexander.stein@ew.tq-group.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-usb@vger.kernel.org
In-Reply-To: <20241119105017.917833-1-xu.yang_2@nxp.com>
References: <20241119105017.917833-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH v2] dt-bindings: phy: imx8mq-usb: correct reference to
 usb-switch.yaml
Message-Id: <173367737834.1042266.7257733372756734157.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:32:58 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 19 Nov 2024 18:50:17 +0800, Xu Yang wrote:
> The i.MX95 usb-phy can work with or without orientation-switch. With
> current setting, if usb-phy works without orientation-switch, the
> dt-schema check will show below error:
> 
> phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
>         'port' is a required property
>         'ports' is a required property
>         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: imx8mq-usb: correct reference to usb-switch.yaml
      commit: 2318ca5994599bb4d287e9e00ae87e0855cba712

Best regards,
-- 
~Vinod



