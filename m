Return-Path: <linux-usb+bounces-3682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF3803277
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 13:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF76280F77
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 12:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0509B23777;
	Mon,  4 Dec 2023 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IH/bWRpY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F4422F1D
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 12:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D5FC433C9;
	Mon,  4 Dec 2023 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701692517;
	bh=q2qokKhhb+l2+fpibhJQ4mLaYZ6hTVk4dOrwd6JmHfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IH/bWRpYzy+eFGMSC7FaoXQJHYB+xoNsJsFrTHNOSQKrlclTxc7l59ROvpug/ZjRB
	 bAs16tKUF7FzOhGVTq1+Uf4zxV5RrT9bKU3FzQQusQa5Nry5D6SelBXtVCvakUaNK+
	 Wr9LE6YYU/tBuxi0hw0BgD0RVGTi1WRUJDNzn5sU=
Date: Mon, 4 Dec 2023 08:04:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] usb: storage: freecom: drop useless assignment in
 init_freecom()
Message-ID: <2023120412-observing-affluent-9432@gregkh>
References: <4d3fb70f-bf2f-96cc-a8fb-1ef658a24920@omp.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d3fb70f-bf2f-96cc-a8fb-1ef658a24920@omp.ru>

On Wed, Nov 29, 2023 at 11:43:50PM +0300, Sergey Shtylyov wrote:
> In init_freecom(), the results of usb_stor_control_msg() calls are stored
> in the local variable and then printed out by usb_stor_dbg() (if enabled),
> except for the 1st call, the result of which is completely ignored.  Drop
> the useless assignment.

Instead, you should check the return value and handle it properly, don't
just drop the checking entirely, that's not good.

thanks,

greg k-h

