Return-Path: <linux-usb+bounces-17472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFAA9C565C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 12:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F7E1F212B6
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F3BB2123C8;
	Tue, 12 Nov 2024 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IWuFDsLT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98624230981
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731409673; cv=none; b=Ox8T24PIa5TJxrfqEJNW0rgIAExfqn2Zs/oDRg0oK02eUoCy6CCefR8Up6BuR9OPbYy9CD+81EtqHTNyXudFU34RniDR7nDYZP33qmQAVMzRfR2ggIGigH7EzwwFiPx/3vqcHYUnxESWMwYydU9M+diB1xKSgmjRbRxuxeATBjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731409673; c=relaxed/simple;
	bh=jZrO83ey7MPCI1/2RZN76YejmSOeO6vSxBcnlq6ZNbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svz9cN1D/UFvPxCimJb9PCb0o36X7gW2jTHFusNB1ZG7TjDhneSOvHCug9Q2ThYsG5b2/w5VmnxiclhgmBfrMe9umgF5ofo84tfZPinZoDmx3tO3RSrKC1TQ2dCT1uvhkmxClP1lvKX9DmFKn72gzUM2rOVI2iYDUejxPRY1qC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IWuFDsLT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB61C4CECD;
	Tue, 12 Nov 2024 11:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731409673;
	bh=jZrO83ey7MPCI1/2RZN76YejmSOeO6vSxBcnlq6ZNbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWuFDsLTC/fFJzuk8Tty17i9OsMfpL+BJ035OTmRiLwp2JwjlWkd5FAxFem4jweXV
	 dD0l3mLgzAuPUP7y167twD3+hjVfYWPvDlnmcISFTfW14ojcbMYUGIm7ZljBw1aoif
	 po+43760QYoaxUGG/7bSKDuvg88Q9FcSYqbf9a6A=
Date: Tue, 12 Nov 2024 11:33:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v4 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
Message-ID: <2024111245-ardently-proven-02a5@gregkh>
References: <20241112075514.680712-1-stanislaw.gruszka@linux.intel.com>
 <48a4d4c6-0c85-4daa-952a-808829a6cfc7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48a4d4c6-0c85-4daa-952a-808829a6cfc7@redhat.com>

On Tue, Nov 12, 2024 at 11:13:55AM +0100, Hans de Goede wrote:
> Greg,
> 
> This patch 1/3 + patch 2/3 together fix an issue causing the camera to not
> work on quite a few ThinkPad models.
> 
> Can you maybe pick up patch 1/3 + patch 2/3 already, while
> Stanislaw works on fixing 3/3 ?

Yes, I'll do that later today, good idea.

Mixing new feaures and bug fixes shouldn't be in the same patch series,
again, Intel developers should know better if this were to actually pass
their internal review process (which seems to keep being ignored
here...)

thanks,

greg k-h

