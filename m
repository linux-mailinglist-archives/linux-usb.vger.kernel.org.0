Return-Path: <linux-usb+bounces-5227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 488DA831B39
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 15:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2841C20914
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29D225772;
	Thu, 18 Jan 2024 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="no/eYB4y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6332575D
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705587499; cv=none; b=hCcSPPmrikWPC8+D3L0QUqkCPVkOUTVvhP9uvwIXHYCErFZUezLt/7wsf+mCyMRTNchZeZudj+7736sxhG+l8ELI8wOqkeIyQT8OTpnBF/mtYCjlEm8btQhCpElG+1GRdn6hrectIdjHd6mbZIx2dbVs3gZ7NCEpj6wRD9GrVaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705587499; c=relaxed/simple;
	bh=Il8/p/TAVxJ8wgUgP7hpcYUisU/tF0pjuS5jkAXQkGE=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=mXdj0BYIWoCJD7YGJ3OCrdFES6VuHGPGaiD/iIYqvSrwENQElI8zG5eQZqDTUym9Nnoo/rtIbW+0V8dc70lnCz9va6VOJ1LCu+tL9EtkPaRbXtRbbPhy4SIsMu1QfVpY7Ci7aBDgZT7HcVleWeopR3PswWpW1sev8ePEufkZ6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=no/eYB4y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C11C433F1;
	Thu, 18 Jan 2024 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705587498;
	bh=Il8/p/TAVxJ8wgUgP7hpcYUisU/tF0pjuS5jkAXQkGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=no/eYB4ygBC+Ia8Gi9du5qYzjwOaI9n67cZbNGygf1rf+CFGROvD6U2QmpKQmvMBK
	 HuiG5+J9mmdgFq3pSiuL11u1ZtEdpUioQy48UC+J8FsCfLmLd7v4mfOrsCcX3E+jfg
	 h7I5ittRCAL9DNeX+vNOKqn8N+yWOZi/MGIVglQk=
Date: Thu, 18 Jan 2024 15:18:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-usb@vger.kernel.org, Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH v2] usb: gadget: f_fs: expose ready state in configfs
Message-ID: <2024011800-eatable-subdivide-18ac@gregkh>
References: <20240118125137.3996800-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118125137.3996800-1-peter@korsgaard.com>

On Thu, Jan 18, 2024 at 01:51:37PM +0100, Peter Korsgaard wrote:
> When a USB gadget is configured through configfs with 1 or more f_fs
> functions, then the logic setting up the gadget configuration has to wait
> until the user space code (typically separate applications) responsible for
> those functions have written their descriptors before the gadget can be
> activated.
> 
> The f_fs instance already knows if this has been done, so expose it through
> a "ready" attribute in configfs for easier synchronization.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> Changes since v1:
> - Add documentation snippet as requested by Greg.
> 
>  Documentation/usb/gadget-testing.rst |  8 ++++++++

Shouldn't this be documented in Documentation/ABI/ instead?

thanks,

greg k-h

