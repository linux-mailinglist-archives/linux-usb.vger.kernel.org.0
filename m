Return-Path: <linux-usb+bounces-16470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B69A5DC8
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2024 09:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B78F280C79
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2024 07:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587921E1026;
	Mon, 21 Oct 2024 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYad8ACA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4181E1028;
	Mon, 21 Oct 2024 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497515; cv=none; b=CDh6DTyQY5UZ8B+WP4DOfvGBcuNJAtIomlbbsg3l99kLjin1xvLB53RsOgHeYCkQSCnoeIck1WVri4wGCwK1FbKiCj/fYl2kY3N/KXiz0WbE8suB+jxD6CtXZaSmhTLnSkosGHUURaDhyI97C7y6xsinEo0NqfzhdgCh2xLS3l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497515; c=relaxed/simple;
	bh=BF6N0Tw9m2cqoYjZKr6+wjglNc9USslZtMlpF8ZL0F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVv/9cOo6vLcVxEGggcqEQjbG6jUAI3SUUeafAC2HU7XV2IJzJ+DQ22adRJMylJ9JPFWGtiHp/eohpjUzWXCEhcqpaBpTU+M6jMvAMZ67mdztt21ktVRr+Eo9sMKYmPPxDs/MFCsxV+/KvGkmLIs7yJONMPIOrzDV0sql8s+Dd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYad8ACA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38E7C4CEC3;
	Mon, 21 Oct 2024 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729497515;
	bh=BF6N0Tw9m2cqoYjZKr6+wjglNc9USslZtMlpF8ZL0F8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYad8ACA85Qv0eqX9qLoavhjKucHVcdevtM1iV4B40hhzw9Lna6vN1xrYWbnx1V6T
	 STPxuhI1UC9dm/Xtmp3ljrC2c9cN960SPGh/N8z0VBgw9+1FJif8PF5KrZsQK7ntH9
	 asS7kwyqKZxn9V6mWoDEA9FOp4mukvjsuPAjhoiTsatK1IBT7ax2LQphkuUSAI5cdi
	 gN70/j5Ie1vYWHqQNemRCF4HXvaVaJ5/x+AvkBzA/+Bj4Mo58rqZwbmzBnopqVeL7k
	 VDLfkKXGQJtK3CldsijDl6PHIwur6S1mdBKH9c32DExJ+SqlUD4CR+bXjdjmP+OJ1R
	 hsuSq4VS+gUyQ==
Date: Mon, 21 Oct 2024 09:58:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: Describe TUSB1046 crosspoint switch
Message-ID: <l5guykbgo23s4fw52cen3vuewqe4lqtf2zbdt6gxmlkatm4ecx@wpi6so6okizf>
References: <20241018-tusb1046-v1-0-a38312f18691@bootlin.com>
 <20241018-tusb1046-v1-1-a38312f18691@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018-tusb1046-v1-1-a38312f18691@bootlin.com>

On Fri, Oct 18, 2024 at 03:30:48PM +0200, Romain Gantois wrote:
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        typec-mux@44 {
> +            compatible = "ti,tusb1046";
> +            reg = <0x44>;
> +
> +            mode-switch;
> +            orientation-switch;
> +
> +            port {
> +              endpoint {
> +                remote-endpoint = <&typec_controller>;

Use consistent indentation for DTS, preferred is 4 space.

With above fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


