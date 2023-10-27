Return-Path: <linux-usb+bounces-2267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD637D9685
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 13:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E792D2823F6
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 11:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7AA18649;
	Fri, 27 Oct 2023 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="L9rBMlOl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1286818AE4
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 11:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2740EC433C7;
	Fri, 27 Oct 2023 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698405902;
	bh=rKwzu2V53xk717u3gOPNPtAEwvK3Ffjl6EeYyEO8Smo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L9rBMlOlLLDmm0BsjAIK6goVkvWLLNn5RNLqi99/Kn9wHxEu23vgQQAuAxESvRL4c
	 3Mi8sxhaxrTV6UJ/GqEGP97sxJUUJt8YdJ+d/LMEdxbFX0cU3WNnhfrbnxhTZ5FGeL
	 DgtPXDgwpFMq17uwvErLOFC91X3fqa7OC+vvpZGU=
Date: Fri, 27 Oct 2023 13:24:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Zubin Mithra <zsm@chromium.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: set the dma max_seg_size
Message-ID: <2023102734-excitable-acetone-db92@gregkh>
References: <20231026-dwc3-v1-1-643c74771599@chromium.org>
 <2023102753-spirits-aerobics-c2c6@gregkh>
 <CANiDSCtbQkEaSFgFCyWDQGGoTzFfiM7QaO_LfWMjqPZfAYodFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtbQkEaSFgFCyWDQGGoTzFfiM7QaO_LfWMjqPZfAYodFg@mail.gmail.com>

On Fri, Oct 27, 2023 at 12:56:49PM +0200, Ricardo Ribalda wrote:
> Hi Greg
> 
> On Fri, 27 Oct 2023 at 12:51, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > What commit id does this fix?
> Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
> 
> Shall I send v2? or you can pick the tag?

Please send a v2 as you now obviously will also have to add a proper
"cc: stable..." tag as well, right?

thanks,

greg k-h

