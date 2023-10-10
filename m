Return-Path: <linux-usb+bounces-1335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D57BF2AF
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 08:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFA351C20C5B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 06:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5476B9454;
	Tue, 10 Oct 2023 06:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vW/xguzx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E763CF
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 06:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780FCC433C7;
	Tue, 10 Oct 2023 06:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696917640;
	bh=X9WyEntD/7athhufFyeQ/+WzPIhZSOf26JKEDhlfLwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vW/xguzxvqcO0Z+wp1tblyjgsGfPEBK26uxMYaWROeOwrtL0NVoz3MiPp3IoIM32Y
	 g/NCF5WMqJ7kU5YnYGF1q5Oq1LCYXkB1r2B8CPihVwGIKhBOuAvxafzCha020xn00y
	 N869SbHMArMJlU2zzcGPziVA+JF8E6vAm+UGgZsg=
Date: Tue, 10 Oct 2023 08:00:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: linux-dev@sensoray.com
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, dean@sensoray.com
Subject: Re: [PATCH] usb: gadget: function fs req_match endpoint address fix
Message-ID: <2023101025-tavern-properly-3114@gregkh>
References: <20231009220656.2990612-1-linux-dev@sensoray.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009220656.2990612-1-linux-dev@sensoray.com>

On Mon, Oct 09, 2023 at 03:06:56PM -0700, linux-dev@sensoray.com wrote:
> From: Dean Anderson <linux-dev@sensoray.com>
> 
> Fixes f_fs.c handling USB_RECIP_ENDPOINT request types incorrectly for
> endpoints not belonging to it. f_fs.c needs to distinguish between IN
> and OUT endpoints, not just the endpoint number. Otherwise, f_fs may
> handle endpoints belonging to other functions. This occurs in the
> gadget/composite.c composite_setup function in the req_match callback.
> 
> Signed-off-by: Dean Anderson <linux-dev@sensoray.com>
> 
> ---
>  drivers/usb/gadget/function/f_fs.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

What commit id does this fix?

