Return-Path: <linux-usb+bounces-1268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A017BE3D6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F54281948
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 15:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9533589B;
	Mon,  9 Oct 2023 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rXLplTQV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C997493
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 15:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B52C433CA;
	Mon,  9 Oct 2023 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696863930;
	bh=v8H8KtMbRpy4gPQgyenbPvjH4WB7JHMF7vacQWWv7JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXLplTQVk/NWiWxqYYAUJGEv8qQJKeAk+HlFHjMoBKMWOrZD+eG2JsO4XKaMtLjg8
	 qDcq89qZdW1LHNxWuSxiNMTDuYGLqdfB1iSxHun444yd6XEY7vDkz3XkkMSTlRjlu4
	 yUCKhsXd7ccSob4n37VT24EDr3j1oVOJLs96Uu8o=
Date: Mon, 9 Oct 2023 17:05:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	onathan Corbet <corbet@lwn.net>,
	Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH 1/2] Documentation: usb: Update NCM configfs parameters
Message-ID: <2023100942-drop-down-abide-f8fe@gregkh>
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009142005.21338-1-quic_kriskura@quicinc.com>

On Mon, Oct 09, 2023 at 07:50:04PM +0530, Krishna Kurapati wrote:
> Updateed NCM configfs parameters by adding max_segment_size
> property and describing its effect on MTU configuration of
> NCM interface.

"Updated"?

> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  Documentation/usb/gadget-testing.rst | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> index 29072c166d23..6e5d96668e8e 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -448,15 +448,17 @@ Function-specific configfs interface
>  The function name to use when creating the function directory is "ncm".
>  The NCM function provides these attributes in its function directory:
>  
> -	=============== ==================================================
> -	ifname		network device interface name associated with this
> -			function instance
> -	qmult		queue length multiplier for high and super speed
> -	host_addr	MAC address of host's end of this
> -			Ethernet over USB link
> -	dev_addr	MAC address of device's end of this
> -			Ethernet over USB link
> -	=============== ==================================================
> +	================= ====================================================
> +	ifname		  network device interface name associated with this
> +			  function instance
> +	qmult		  queue length multiplier for high and super speed
> +	host_addr	  MAC address of host's end of this
> +			  Ethernet over USB link
> +	dev_addr	  MAC address of device's end of this
> +			  Ethernet over USB link
> +	max_segment_size  Segment size required for P2P connections. This
> +			  will inturn set MTU to (max_segment_size - 14 bytes)

"inturn"???

> +	================= ====================================================
>  

What commit id does this fix?

thanks,

greg k-h

