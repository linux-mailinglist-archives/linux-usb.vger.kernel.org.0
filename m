Return-Path: <linux-usb+bounces-8455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B188D6DD
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 07:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C35481C24DA5
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 06:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAFF241E1;
	Wed, 27 Mar 2024 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FlPrLgUM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB8A28DAE;
	Wed, 27 Mar 2024 06:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711522577; cv=none; b=fn1BfdN/RpRCGbFcEr4LRes1WAKfLLV28PnN8h1k8JEno7uohaIQKZkxdlMhemlwIh3DaoAL0Cqd6cdRl6v25tKa53Fp5WZVxUVxgbo+s/AxAfXLHJ4eUqjMHmzNc9nf3OUswUpvaO7h9s1av0WXt5UawvZECrPdlbln7jSsRqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711522577; c=relaxed/simple;
	bh=yJMrSnP28oLmgt6pEJUEbRRxY9vjKtBby7SPybd3Jlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWD4MRNdlqbRJrE2NmK8+sExW/LH9BzKicilQ8u0AUJptL4l8a9Yk7ay2ehUFSVsx9Jx/4UchSM479i0AAwDi/LWvjZLcpPsiGfraQBAgXhcE5pboF+EnxE+vFVennk+TScxd+umdLkqfE47agcD9EmblNGQAN1mQtFCkyIl8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FlPrLgUM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88188C43390;
	Wed, 27 Mar 2024 06:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711522577;
	bh=yJMrSnP28oLmgt6pEJUEbRRxY9vjKtBby7SPybd3Jlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FlPrLgUMT81v2jAQ1AE/apYo6XrruMC0I1dISTBZx7d3iC3MForQw20A/ubyndcUC
	 HHQUAUNoUPeC6uPKpyf0GjVxoifwa1OhvHI+HaY3nPHu5UWC8GnRyWdN5Mm3n28Z51
	 ld2l6QpKuxC0WceQDZgftKuqt/mUJwBNJuHpasGY=
Date: Wed, 27 Mar 2024 07:56:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	John Youn <John.Youn@synopsys.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc2: gadget: LPM flow fix
Message-ID: <2024032737-monstrous-elastic-4c42@gregkh>
References: <c263e2ce619774ec73765e33a1851a5910797940.1711520623.git.Minas.Harutyunyan@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c263e2ce619774ec73765e33a1851a5910797940.1711520623.git.Minas.Harutyunyan@synopsys.com>

On Wed, Mar 27, 2024 at 06:46:11AM +0000, Minas Harutyunyan wrote:
> Added functionality to exit from L1 state by device initiation
> using remote wakeup signaling, in case when function driver queuing
> request while core in L1 state.
> 
> Fixes: 273d576c4d41 ("usb: dwc2: gadget: Add functionality to exit from LPM L1 state")
> Fixes: 88b02f2cb1e1 ("usb: dwc2: Add core state checking")
> CC: stable@vger.kernel.org
> Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> ---
>  Changes in v2:
>  - added "remotewakeup" parameter description

I've already applied patch v1, so I can't apply this as it will not
work.  Can you just provide the fixup patch, and give proper credit to
the reporter for it and I can take that.

thanks,

greg k-h

