Return-Path: <linux-usb+bounces-3364-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F119C7FA53A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 16:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD3BB281730
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 15:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406A9347A0;
	Mon, 27 Nov 2023 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WIPkkKv9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF3F3455F;
	Mon, 27 Nov 2023 15:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E98C433C7;
	Mon, 27 Nov 2023 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701100337;
	bh=5u1FD6v6ixPZgDy+Cll9ZwyPBlwrxX8SjGva753EFHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIPkkKv9CLGKKc3kD0b1mtlSxoZoSf4b2NDd2Jpm0qDbNQpwxZlKToKjicFGQbk6f
	 HNSHhf4ZTSq7IVQKS27sD8z6/3ZjJcoqy9T0LXFcz8O9j152SXOmvUEKO8s770kPIx
	 ARtPWL+xbpx6SuEr+VunYzxIIrCLdMtUjsyWgYB0=
Date: Mon, 27 Nov 2023 15:52:13 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, imx@lists.linux.dev,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	"open list:CADENCE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] usb: cdns3: skip set TRB_IOC when usb_request:
 no_interrupt is true
Message-ID: <2023112748-coveted-enunciate-cf13@gregkh>
References: <20231027183919.664271-1-Frank.Li@nxp.com>
 <20231031084521.GA1948529@nchen-desktop>
 <ZWS1ucR7dXs153R1@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWS1ucR7dXs153R1@lizhi-Precision-Tower-5810>

On Mon, Nov 27, 2023 at 10:28:57AM -0500, Frank Li wrote:
> On Tue, Oct 31, 2023 at 04:45:21PM +0800, Peter Chen wrote:
> > On 23-10-27 14:39:19, Frank Li wrote:
> > > No completion irq is needed if no_interrupt is true. Needn't set TRB_IOC
> > > at this case.
> > > 
> > > Check usb_request: no_interrupt and set/skip TRB_IOC in
> > > cdns3_ep_run_transfer().
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > 
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> @Greg:
> 	ping

What are you needing from me here?  Blind pings do not provide any
context :(

thanks,

greg k-h

