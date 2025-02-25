Return-Path: <linux-usb+bounces-21043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB8A44505
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 16:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10743B3419
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 15:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CF5183CB0;
	Tue, 25 Feb 2025 15:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1EROIzF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF6175D5D;
	Tue, 25 Feb 2025 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740498869; cv=none; b=nLOaaB2c0o/8vUkpqO8w6pl5anNy1SQzx/I7sTBsiyDXDzH3jECC6fJs0RdNF/UqTsM9RcW7GrF6pAJLuZj3hH9j/9+Mc/iLE4fyrX4fHXhwEOv448+92fu7xYr/Ubpwdlu6Ztt1ljCYvntl3lSlDk0NIrqewBtsChnTz8k0tvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740498869; c=relaxed/simple;
	bh=JFYLCj2a+RezpMJ3sxiliKwrRs+8V3UC4lMf2gVjUZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ct6TWnJnSp0crK0jUziks1cieYc145bVYC/tjxWTkQRzwK89Z0vLJ+J5Kwxnk3lshprXFRUJr/pStAfBJ90nU8iVQz2505BngoZfE75UQcPzbmzQzFdzMuDseZyC+BZNfWw77a/+h8vBgOY9nX6oz0W/r8trGgD+pD9ua3fkGE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1EROIzF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F42C4CEDD;
	Tue, 25 Feb 2025 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740498869;
	bh=JFYLCj2a+RezpMJ3sxiliKwrRs+8V3UC4lMf2gVjUZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1EROIzFxI6gEfZ6wXdzoYlmjkB+CpxW0wGJlpqY4qK8gjy46yDYrLIIlpJ3nNz6N
	 5IUP7YOc+4/PbQNEQMvDsk7GkW31sQ87tXNg2dqlAX7KySUBu4VLV4E7voF7yBk8r7
	 O405pcWrXtjcbrHCTdYYWvEBBRpbWZYzz7jENm4Lb0b25pptAoWAEbrvmJuuP4+Xws
	 q9Aro5yVSdl/gpbtOFMmu0/vYNexKV1ZhfMMGtn1dwsfxXkiK0ebVqkqqgZC8DYwFI
	 UyumTkkA0bP+NEPesQCV2IrImtU7PzvurxDoCJRKlVEFMs9kuAaC1PyWVANZ76aU9V
	 6z7gjYko3r/Cw==
Date: Tue, 25 Feb 2025 09:54:27 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, krzk+dt@kernel.org, kernel@pengutronix.de,
	peter.chen@kernel.org, shawnguo@kernel.org, conor+dt@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	jun.li@nxp.com
Subject: Re: [PATCH v2 1/6] dt-bindings: usb: chipidea: Add i.MX95 compatible
 string 'fsl,imx95-usb'
Message-ID: <174049886689.2562544.3467933311134993488.robh@kernel.org>
References: <20250225053955.3781831-1-xu.yang_2@nxp.com>
 <20250225053955.3781831-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225053955.3781831-2-xu.yang_2@nxp.com>


On Tue, 25 Feb 2025 13:39:50 +0800, Xu Yang wrote:
> The i.MX95 USB2.0 controller is mostly compatible with i.MX7D, except it
> requires a second interrupt for wakeup handling. Add the compatible string
> for the i.MX95 platform, add the iommus property, and enforce the
> interrupt property restriction. Keep the same restriction for existing
> compatible strings.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - improve interrupts description
>  - improve subject and commit message
> ---
>  .../bindings/usb/chipidea,usb2-common.yaml    |  3 +++
>  .../bindings/usb/chipidea,usb2-imx.yaml       | 24 ++++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


