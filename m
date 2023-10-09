Return-Path: <linux-usb+bounces-1292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCC7BE8BD
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 19:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D348281991
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD81938DF4;
	Mon,  9 Oct 2023 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Fugsy4PG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD28374F5
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 17:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DDCC433C8;
	Mon,  9 Oct 2023 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696874044;
	bh=PPCdcumr+UA++nlG83Y+uutcu7c6YH7gfSHrX1LBEaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fugsy4PGaY/O6EQUhUPCPNBxTT5ZhVVpD2V6xnTzGWIrQ4iQEpPAyKJppVYRXdHws
	 U/czILVQj+Dx99beegFEjvy2b0+qwK5knakS65UN89uuxQEPSwMggMffgFOGJTMqa0
	 ueQeCCWdqneoBuN2yVeBduVMDdez00ovxrVGlJ4k=
Date: Mon, 9 Oct 2023 19:54:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	onathan Corbet <corbet@lwn.net>,
	Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH 2/2] usb: gadget: ncm: Add support to update
 wMaxSegmentSize via configfs
Message-ID: <2023100910-used-unruly-f750@gregkh>
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <20231009142005.21338-2-quic_kriskura@quicinc.com>
 <2023100931-reward-justice-ed1c@gregkh>
 <a9efdc23-0417-48dc-aa17-ef7b1459b85a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9efdc23-0417-48dc-aa17-ef7b1459b85a@quicinc.com>

On Mon, Oct 09, 2023 at 09:02:32PM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 10/9/2023 8:38 PM, Greg Kroah-Hartman wrote:
> > On Mon, Oct 09, 2023 at 07:50:05PM +0530, Krishna Kurapati wrote:
> > > Currently the NCM driver restricts wMaxSegmentSize that indicates
> > > the datagram size coming from network layer to 1514.
> > 
> > I don't see that restriction in the existing driver, where does that
> > happen?
> 
> Hi Greg,
> 
>  In the ecm_desc, the following line restricts the value:
> 
> .wMaxSegmentSize =      cpu_to_le16(ETH_FRAME_LEN),

Ok, so is that 1514?  I don't know as I don't know what ETH_FRAM_LEN is.

So how about saying something to the affect of "the max segment size is
currently limited to the ethernet frame length of the kernel which
happens to be 1514 at this point in time."

thanks,

greg k-h

