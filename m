Return-Path: <linux-usb+bounces-9226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DC289FEA0
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 19:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 532611F246A1
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 17:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 138A017F378;
	Wed, 10 Apr 2024 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZfyQ2y5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021B17BB36;
	Wed, 10 Apr 2024 17:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712770465; cv=none; b=S+4kLXmhIvAjEmG4YrM34c7+4bco0ju4AAF3qyCmq4UYd6wOC2xtJ0VDscSamZVGR3yDsOHg8dwkZXMTCUmlv7b5uMuJC4P5PCXjG6EewNJ2SCIND7O5vwyKuJHYFvoQd8fH/isRBBVqxQNmD6vH/PwA0HkrwoG7an0Y2TsHjVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712770465; c=relaxed/simple;
	bh=K4zB+3O3ghGQKRCYN+KJYONwtQiBqC1WCVKLSct6Rns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4/xoXUdoNS5rUXhR7s+K598NZ24xNZvKn3IX1d6yH0zZpCOem9zgH/6w9MqZ3SYOkVkl5UOsPJk55CV3plNKEWMG14/9d6KagAjP2Wgzn2VLpN9gEQzOo2ErgFg44+X11EkvFyO3k5aSc/WnOkFjHCGxDAVJD1rrpM6tXP16n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZfyQ2y5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A3BC433C7;
	Wed, 10 Apr 2024 17:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712770465;
	bh=K4zB+3O3ghGQKRCYN+KJYONwtQiBqC1WCVKLSct6Rns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MZfyQ2y5Rh/j7+BCOr/unKlEOWOqLGQc0Yiw1669mVtzrZ3OSB5q76ycBlz5IzwuM
	 +Dbcw1INPZR/yIDX5OvNKpTmdyidFolhTiqZReM2UbPrxsspSZdRUYhsGo6pR0xfDA
	 jaGwbCxA27tK5DK0K0Y+rOoL30I370/y7WdPQtN8rgGdMyoHbiGqXh7kuqNbxlpVzP
	 RvTY4yENXmhhv6xQR1HR4ab0SchcXqa96DFZSfosScy0qhl/M2LuypJwYi6C8jDU37
	 nMGwdvFtiGRsRIaP4pzXKqC31GGnfFP+FylEebzRHmxNDau5seGcnhL+LKSoVrExAi
	 MzaHNfn3PsQsw==
Date: Wed, 10 Apr 2024 12:34:22 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk+dt@kernel.org, Fabio Estevam <festevam@denx.de>,
	conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] dt-bindings: usb: hx3: Remove unneeded dr_mode
Message-ID: <171277046094.786793.2246186660037803294.robh@kernel.org>
References: <20240405195051.945474-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405195051.945474-1-festevam@gmail.com>


On Fri, 05 Apr 2024 16:50:51 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> It is expected that the USB controller works in host mode
> to have the USB hub operational.
> 
> Remove such unneeded property from the devicetree example.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


