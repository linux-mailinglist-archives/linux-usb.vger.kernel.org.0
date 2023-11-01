Return-Path: <linux-usb+bounces-2436-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B96097DE246
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 15:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 410E6B2105B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 14:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1597813ADE;
	Wed,  1 Nov 2023 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XvzfVprk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC5D7489
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 14:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EDCC433C7;
	Wed,  1 Nov 2023 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698848408;
	bh=PzUEW4w524QdvWruo3C65kPqW198zzSfCHbbShc+m20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XvzfVprkRxyBXCL2fyT3+f/ZKg3hX1Ss7t1LQCNQEkqIKOANLH43BUvLnOy0DIVoJ
	 cJrywwsRHVVNA9tWb2U0JN6aDQ4uAqkMhu6ucPdjq5DWYgsjQ9zSy9uWM+2+lOkpd6
	 ts0iB/+Y5ul3aTkgNMM9IfyZdAtmcFDhARMAKi14=
Date: Wed, 1 Nov 2023 15:20:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ren Mingshuai <renmingshuai@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	jirislaby@kernel.org, caowangbao@huawei.com, yanan@huawei.com,
	liaichun@huawei.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tty: hso: Fix potential null pointer dereference
Message-ID: <2023110139-spearmint-throttle-ed90@gregkh>
References: <20231101133544.246961-1-renmingshuai@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101133544.246961-1-renmingshuai@huawei.com>

On Wed, Nov 01, 2023 at 09:35:44PM +0800, Ren Mingshuai wrote:
> Generally, the old always points to the address of a ktermios structure,
> so old is unlikely to be NULL. Still check it before dereference as
> elsewhere.

If it can not happen, there is no need to check it.  So unless you can
prove that this ever could happen, this change isn't needed, right?

thanks,

greg k-h

