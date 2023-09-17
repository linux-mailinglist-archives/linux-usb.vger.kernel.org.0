Return-Path: <linux-usb+bounces-265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E17A3436
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 10:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6202817C0
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 08:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29F11C08;
	Sun, 17 Sep 2023 08:01:52 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F9815BA
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 08:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FE5C433C8;
	Sun, 17 Sep 2023 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694937712;
	bh=KtyNyn4NLvVFuuvZBHaP1dYgJRTZxuTk9o6GHIYJ1Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2Ysa0acW1YmvFL59v1B39xVKM1008Wu7m7qCThlfchMMcIoU4TRpp9JPalDbD9kEN
	 YoJBsIAODlKrgRM5Gi8HfhfRt6jac0E267bTS7dvJo5Kms6LC5TLukobTG5MCvjYtU
	 y4l+xsz8IRck31WaXlaQFxgd3QnXVhXpFWdK0O9I=
Date: Sun, 17 Sep 2023 10:01:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 1/3] usb: gadget: add anonymous definition in some
 struct for trace purpose
Message-ID: <2023091712-cahoots-saturate-dc9f@gregkh>
References: <20230915052716.28540-1-quic_linyyuan@quicinc.com>
 <20230915052716.28540-2-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915052716.28540-2-quic_linyyuan@quicinc.com>

On Fri, Sep 15, 2023 at 01:27:14PM +0800, Linyu Yuan wrote:
> Some UDC trace event will save usb udc information, but it use one int
> size buffer to save one bit information of usb udc, it waste trace buffer.

How much waste exactly?

> Add anonymous union which have u32 members can be used by trace event
> during fast assign stage to save more entries with same trace ring buffer
> size.

Are you sure?

> Also add some trace event purpose macro in this file for all possiable
> use.

When you say "also" in a changelog, that means the change should be
split up into multiple patches.

> +/*-------------------------------------------------------------------------*/
> +/* trace only, data in __le32 format at trace event fast assign stage */
> +#define		USB_GADGET_SG_SUPPORTED			BIT(0)

<snip>

This will not work well at all, and is probably broken as-is, sorry,
please rethink all of this.

greg k-h

