Return-Path: <linux-usb+bounces-18816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5289FC9A4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 09:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 280E6162040
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 08:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430141CCEE7;
	Thu, 26 Dec 2024 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ye30HQOZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61E14A60C;
	Thu, 26 Dec 2024 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735201205; cv=none; b=jsSYX4QGCaYxCAbIP8O62MhBDIRnIucs+yVbWkTpIRREfs5baq6Ir75HZ5QzoN/ugZEyeM56DRa0jw3dwftmytCJB+3fj375qjcVWlwxQb/nD3nH5Fl+LKzugwZ3XtYcOmGrjnvJnaMLqbrEyydO9eKlxre+PpAXWtVXu0/vkB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735201205; c=relaxed/simple;
	bh=P/iq5bg4ce6U/WzdEdo8P+SW20P+Bfcwf5GrDJqOMEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJlFP0QlaOiHC78Cjh7oB21/IbOflgPq73Pd1UuUJsAEMEcd71RMhxfXBbLSI//UZt7ngSei4Zzeog/25yxJcox3UAN1QAIleAulaKT+xye+pY793e5/uFZ8QOa4rtCWG82BOc0zrI/3Gz7A7HcLOTKT9mcrnlwO01yRQZYMlcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ye30HQOZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE398C4CED1;
	Thu, 26 Dec 2024 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735201205;
	bh=P/iq5bg4ce6U/WzdEdo8P+SW20P+Bfcwf5GrDJqOMEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ye30HQOZCib9BL+wBIaTHHRfJ5CQY1THi5O5f6HuXfS4qMcEbVsuFJ1AYAcN9VX3d
	 rQwHukGVV57e0kytehmyK5zVW9eF2U8lBo8L8Y2yWtF4O8SKVCNBK08rfUQGnA26C7
	 Q56dGCNmaCwI0PsCA2p1fq183pHsRSuDK4fvXr/4=
Date: Thu, 26 Dec 2024 09:19:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] usb: gadget: m66592-udc: Add check for clk_enable()
Message-ID: <2024122634--ec5b@gregkh>
References: <20241224202217.114436-1-zmw12306@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224202217.114436-1-zmw12306@gmail.com>

On Tue, Dec 24, 2024 at 03:22:17PM -0500, Mingwei Zheng wrote:
> The APP-Miner reported the missing check.

What does this mean?  Please explain it better as the documentation
states you must do when using random research tools.

> Add check for the return value of clk_enable() to catch the potential
> error.
> 
> Fixes: b4822e2317e8 ("usb: gadget: m66592-udc: Convert to use module_platform_driver()")

Why is this only a Fixes tag and not also a cc: stable?  And how did you
test it?

thanks,

greg k-h

