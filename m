Return-Path: <linux-usb+bounces-12685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E1942935
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 10:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 558FE1F215A6
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 08:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA8E1A7F6B;
	Wed, 31 Jul 2024 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jG8VQcFR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725F018DF92;
	Wed, 31 Jul 2024 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414657; cv=none; b=ErWzpmf8MEqe+psCP0alLhqaPrtBfegXUNRuEVdOY6he2WcEpOtZEVL6c7ef1A3lEmw3lKLsFdZn7Oy805q5h8puH4A45w8brfgDi2nEyDG5NWRI2wMu07rQkWIItTY5nrYKvDgq5+2eIgGCUmr+MlhkB/P8PuSsIVEVQuKpbxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414657; c=relaxed/simple;
	bh=9noKt1gXJuh8lgzIR1ZC4PKp4tydTmDjkcAQeRQaFls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnOKtEd8hUoPXqPGVQ7GZqcgTvhUN2yoLqRO4C8XSVMSbFZ39BFN/BfmpdrVYxfqwAFeF17UtsNuvFwa2HYnvH66agef7eol82ot8LHvhfP2dx5pns6DiEWHAeH7qTX1Xb+TO0ZCSm0trhWmIgrjTDSQgFhEqE7WrfkIudgHrl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jG8VQcFR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE15C116B1;
	Wed, 31 Jul 2024 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722414657;
	bh=9noKt1gXJuh8lgzIR1ZC4PKp4tydTmDjkcAQeRQaFls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jG8VQcFRh39D93U1KZoPssouQGDco1vkfbe2zgQuTIHiZ9c+HUssC3PX5iBpDdOEk
	 IBBiYcgFxJtpO/lSnfyzY+U2w7Vga6J0yRmP1NyWgBa3ds/SA/PgVup5cs0xYkI4lh
	 D5iCMhcNeCEocdUKXDTbwJCC3ttGsE4s1AN4XZ2E=
Date: Wed, 31 Jul 2024 10:30:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, jun.li@nxp.com,
	imx@lists.linux.dev
Subject: Re: [PATCH v2] usb: dwc3: core: remove spin_lock/unlock_* to avoid
 deadlock when suspend gadget
Message-ID: <2024073141-demeanor-amniotic-8f01@gregkh>
References: <20240527170413.1107831-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527170413.1107831-1-xu.yang_2@nxp.com>

On Tue, May 28, 2024 at 01:04:13AM +0800, Xu Yang wrote:
> In current design, spin_lock_irqsave() will run twice when suspend gadget
> device if the controller is using OTG block:
> 
> dwc3_suspend_common()
>   spin_lock_irqsave(&dwc->lock, flags);      <-- 1st
>   dwc3_gadget_suspend(dwc);
>     dwc3_gadget_soft_disconnect(dwc);
>       spin_lock_irqsave(&dwc->lock, flags);  <-- 2nd
> 
> This will cause deadlock on the suspend path. To let it work, just remove
> spin_lock/unlock_* in dwc3_suspend_common() since they are redundant.
> 
> Fixes: 5265397f9442 ("usb: dwc3: Remove DWC3 locking during gadget suspend/resume")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - add fix tag and stable list
> ---
>  drivers/usb/dwc3/core.c | 3 ---
>  1 file changed, 3 deletions(-)

Is this still needed?  if so, can you rebase and resubmit?

thanks,

greg k-h

