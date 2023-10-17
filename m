Return-Path: <linux-usb+bounces-1734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4328A7CC467
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 15:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733D11C20B84
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 13:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B5A42C1E;
	Tue, 17 Oct 2023 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SBuaUInP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D81142C05
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 13:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A635C433C8;
	Tue, 17 Oct 2023 13:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697548643;
	bh=4nxP30gbvbNfQrY208MgnErY+n4i02uV5NqlW9QbLzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBuaUInP4tgE2HpRyQ1jcrpnrSEvHJo+OYTaWY8jEOzCA3pIFUmlpBBCqdnZIiNVG
	 PuQqn5WvPSP51VNsRyrto64K9+offURwZ9At3X0w+urQ4G74qaxxUtxnIdVAjio9G5
	 +5OsTi9s1qaxMLnuU4puNkRabM5RBBgcR847JEe8=
Date: Tue, 17 Oct 2023 15:17:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles <be286@163.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH]         usb: gadget: f_uac1: add adaptive sync support
 for capture
Message-ID: <2023101743-repaint-krypton-ba0c@gregkh>
References: <20231017083918.1149647-1-be286@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017083918.1149647-1-be286@163.com>

On Tue, Oct 17, 2023 at 04:39:18PM +0800, Charles wrote:
>         UAC1 has it's own freerunning clock and can update Host about
>         real clock frequency through feedback endpoint so Host
>         can align number of samples sent to the UAC1 to
>         prevent overruns/underruns.
> 
>         Change UAC1 driver to make it configurable through
>         additional 'c_sync' configfs file.
> 
>         Default remains 'asynchronous' with possibility to
>         switch it to 'adaptive'.
> 
>         Signed-off-by: Charles <be286@163.com>

Why the odd indentation?

And why not use your full name?

Please fix up and send a v2.

thanks,

greg k-h

