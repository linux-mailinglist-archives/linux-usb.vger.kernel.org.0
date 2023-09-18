Return-Path: <linux-usb+bounces-322-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E77A4930
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 14:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A12281812
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 12:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C4B1CAAD;
	Mon, 18 Sep 2023 12:06:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7D1CA88
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 12:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46C2C433C7;
	Mon, 18 Sep 2023 12:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695038799;
	bh=JA8ImSCoa1Akn2EcO+w/VW+LE8TU6wMpSL+lt9FkX60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LwH9rlId3WpcRM9/GuMshIoS21LpqWu+G3vjeb1s0cm0ueidndqX/Hw+w9bW8tEjc
	 3knTVBvD207NWx6uF9mWAMayCVmPkw3OKdJ6m/IZ6sZC5ROAVFh93Y2DEUR7iXNqBw
	 B+7Nxxx9rilLzV2lV3PxWFWY6VuLGG1wQPuTts64=
Date: Mon, 18 Sep 2023 14:06:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linyu Yuan <quic_linyyuan@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 2/4] usb: gadget: add anonymous definition in some
 struct for trace purpose
Message-ID: <2023091831-applause-headless-8e91@gregkh>
References: <20230918112534.2108-1-quic_linyyuan@quicinc.com>
 <20230918112534.2108-3-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918112534.2108-3-quic_linyyuan@quicinc.com>

On Mon, Sep 18, 2023 at 07:25:32PM +0800, Linyu Yuan wrote:
> Some UDC trace event will save usb udc information, but it use one int
> size buffer to save one bit information of usb udc, it waste trace buffer.
> 
> Add anonymous union which have u32 members can be used by trace event
> during fast assign stage to save more entries with same trace ring buffer
> size.
> 
> In order to access each bit with BIT() macro, add different definition for
> each bit fields according host little/big endian to make sure it has same
> eacho bit field have same bit position in memory.

typo?

> Add some macros or helper for later trace event usage which follow the
> udc structs, As when possible future changes to udc related structs,
> developers will easy notice them.

This isn't going to work at all, there's nothing to keep the two in
sync.

As you are using bitmasks now, wonderful, just use those only and ignore
the bitfield definitions, that's not going to work mixing the two at
all.

thanks,

greg k-h

