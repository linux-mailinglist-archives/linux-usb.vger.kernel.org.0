Return-Path: <linux-usb+bounces-1440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7257C4E7D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 11:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06C112820BD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 09:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388221C2A4;
	Wed, 11 Oct 2023 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bvF/RxIm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923FB1A27A
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 09:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4938C433C8;
	Wed, 11 Oct 2023 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697016283;
	bh=gk4V8UZLKT4DCzpvkyODPILbITWLEGLCVvRKJr63fLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvF/RxImxfRhAyXH/4o3y5Tq8nSj9pJw+v4IGiUuOXvt8hSUDHkE30c/jaOgFcy/6
	 x3ZpmxmHeo2J/uHJAVBLJTTbcaIxdzQIjQwmx1FMBvm7bpCRfo7aRSfm97Lh3OEKke
	 0hO9lxDg7W0mY7qvGeI92ibCbAa0aYuv2z5qpevo=
Date: Wed, 11 Oct 2023 11:24:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: host: xhci: Avoid XHCI resume delay if SSUSB
 device is not present
Message-ID: <2023101111-acquire-dosage-65c1@gregkh>
References: <20230919224327.29974-1-quic_wcheng@quicinc.com>
 <5f491814-c105-64e3-93c0-5fff89160ac1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f491814-c105-64e3-93c0-5fff89160ac1@quicinc.com>

On Tue, Oct 10, 2023 at 12:01:05PM -0700, Wesley Cheng wrote:
> Friendly ping to see if there are any updates/feedback on this patch?

Please do not top-post.

Anyway, did you not see my bot's response to this patch?  If so, why did
you ignore it, that's why we didn't do anything with it...

thanks,

greg k-h

