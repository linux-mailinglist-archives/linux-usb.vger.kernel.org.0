Return-Path: <linux-usb+bounces-30975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC928C8AE5C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 17:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45D7E3A72C8
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 16:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E81333B969;
	Wed, 26 Nov 2025 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Da/OKTTP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1513093CF
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173641; cv=none; b=iKTBq90/XymndyUZRdYY+ScjAdboqMckSegp6eHKdca7bRK6yoH3opmnAXuVU13sqy3Sj9QsRxulElqI41N69xHxYu7O9kd6jpf7a/cib5pwMC2yiMjgP1i5Bdo5Gf7RvoGv+s1SBE0oFu8rjPO+cb82FLHJlG4pqWcp3xqvg3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173641; c=relaxed/simple;
	bh=UQY0Ehk6jP0rvkpMv+TilhxNopdeQzpEh1t0bOL+s0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq6L7vWXpaNM+d8d44BCTr9iAITsKZljvJZTh2cQU19wIJ8miQPTosnM6oD5h+sfkJDOktcsIu85v5OpugnRb9LUw5cclh16z37lDXEY3Yt6UnnxUBQCWGXaKeWRMzRlzCa5ystt5zsdu01UEMd4IFpGP4PJzJQ6GgPWWh8SbLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Da/OKTTP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7391CC4CEF7;
	Wed, 26 Nov 2025 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764173639;
	bh=UQY0Ehk6jP0rvkpMv+TilhxNopdeQzpEh1t0bOL+s0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Da/OKTTPzjxapR/xaK76SSpMs1hZ04xXy4cjfbweIKYkh5Br4PfObcqt1gjurd7H3
	 LmxRlTbA98EGZypLaRG+miWmQArM/YfADbqeJzpMilusunnWlLzVVdkisv5sxBPobP
	 V9slA8Fw3ZUUa/M2jhwrq0w29DPVhjfyM3nVop8uze2SS+Qiu3/SMr2WWC4G/ZTl6j
	 4REmy8rWcUKeDCzYgTFA8szCzd9UXfm63y/Gg34zi1HGPr6MMp/1eAVrOhvY1OOtDG
	 x+eEX7EvXfos+m7xnV9Xf2LFXkhNmJM4BChFM2IayeQam9wSpeLx/nxlIMf6Jgny1X
	 PU/cuX53Cn+tQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOI9Y-00000000348-3L3n;
	Wed, 26 Nov 2025 17:14:00 +0100
Date: Wed, 26 Nov 2025 17:14:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: Re: [PATCH v3 0/2] Add Telit Cinterion FE910C04 new compositions
Message-ID: <aScnSKzm-LuT3zBJ@hovoldconsulting.com>
References: <cover.1764167099.git.fabio.porcedda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764167099.git.fabio.porcedda@gmail.com>

On Wed, Nov 26, 2025 at 03:26:38PM +0100, Fabio Porcedda wrote:
> Add Telit Cinterion FE910C04 new compositions.
> Also puts Telit Cinterion 0x10c7 composition in the correct order
> inside the source file.
> 
> v3:
> - Fix commit message of the first patch
> 
> v2:
> - Fix author's email of the first patch
> 
> 
> Fabio Porcedda (2):
>   USB: serial: option: add Telit Cinterion FE910C04 new compositions
>   USB: serial: option: move Telit 0x10c7 composition in the right place

Applied, thanks.

Johan

