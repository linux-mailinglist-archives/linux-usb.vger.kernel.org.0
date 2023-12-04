Return-Path: <linux-usb+bounces-3686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6D80345B
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 14:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFF48B20B09
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 13:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FB924B38;
	Mon,  4 Dec 2023 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J7VzSKFu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB8241F5
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 13:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EE9C433C9;
	Mon,  4 Dec 2023 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701696020;
	bh=G0IYbsOFSj0fPLYbD19AGVuAzLU0JTbiqEg15Fw1fSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7VzSKFub+6y25l/yIT94Q3enuIw6cbZFNj5w7zWJc+GKcTeO3V9Hj6UapyzFNRUH
	 Ya9h54pisOt1s1X1nvkJgfnaLUNP1JUOCFaQ8+SU8qk0q++VV07ec8KTPz5qFlfxbn
	 KfUwBT+y0Hn8nxoMwlUeRuILlSnVTF9DJuZPqAdc=
Date: Mon, 4 Dec 2023 22:20:18 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 00/18] xhci features for usb-next
Message-ID: <2023120400-scorecard-chop-3ac9@gregkh>
References: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204104534.1335903-1-mathias.nyman@linux.intel.com>

On Mon, Dec 04, 2023 at 12:45:16PM +0200, Mathias Nyman wrote:
> Hi Greg
> 
> V2 of xhci features and cleanups for usb-next, including xhci dbc
> cleanups, MSI rework, and fixing how we reconfigure max packet size
> for xhc.
> 
> One patch fixes a null pointer deref issue, but this hasn't been seen
> in real life. It's a theoretical case triggered by adding a 3 second
> delay in the driver.
> So I don't think it should go to stable.
> 
> v2 drops one small cleanup patch as it turned out to not really clarify or
> simplify things. This was [PATCH 08/19] "xhci: dbc: Use sizeof_field()
>  where it makes sense" in previous series.
> Link: https://lore.kernel.org/linux-usb/20231201150647.1307406-9-mathias.nyman@linux.intel.com

Ick, I just applied all of the v1 series, we crossed emails, sorry, my
fault.

But, to be fair, I think your patch is correct, so let me leave it in,
if it's not buggy.

thanks,

greg k-h

