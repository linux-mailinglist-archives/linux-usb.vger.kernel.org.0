Return-Path: <linux-usb+bounces-2381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC607DC625
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 06:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 772321C20BBE
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 05:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A334DDB8;
	Tue, 31 Oct 2023 05:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O2pk7oQ8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0340ED2EE
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 05:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40E1C433CB;
	Tue, 31 Oct 2023 05:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698731678;
	bh=XbuXcOofB+YYRpzkpEc0cY0O+v3jQnt9AfKHu8wLDNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O2pk7oQ8OQJofOOofISvUW+jJEHoj29SYT6GffWr7gbgZL7jLiBZv1AHj26RAL7hL
	 z/83Twn6THDhyRXHZIh3dqf7jtr4Y8zB46kvfl+11DWxDCx//U9GYnXhzrAuIBLVf2
	 BKn9oYExNzO4Lrcjc5eKmdb7sLnQ6NZsNZz6y7mE=
Date: Tue, 31 Oct 2023 06:54:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naveen Kumar <mnkumar@google.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, royluo@google.com
Subject: Re: [PATCH 2/2] dt-bindings: usb: add no-64-bit-support property
Message-ID: <2023103104-stamp-amniotic-369d@gregkh>
References: <20231031044021.1162403-1-mnkumar@google.com>
 <20231031044021.1162403-3-mnkumar@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031044021.1162403-3-mnkumar@google.com>

On Tue, Oct 31, 2023 at 04:40:21AM +0000, Naveen Kumar wrote:
> From: Naveen Kumar M <mnkumar@google.com>
> 
> Add a new DT option to specify whether a host controller is able to
> support 64-bit DMA memory pointers
> 
> Signed-off-by: Naveen Kumar M <mnkumar@google.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> index 180a261c3e8f..20dc134004f3 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> @@ -25,6 +25,10 @@ properties:
>      description: Set if the controller has broken port disable mechanism
>      type: boolean
>  
> +  quirk-no-64-bit-support:
> +    description: Set if the xHC doesn't support 64-bit DMA memory pointers
> +    type: boolean
> +
>    imod-interval-ns:
>      description: Interrupt moderation interval
>      default: 5000
> -- 
> 2.42.0.820.g83a721a137-goog
> 
> 

You did not send this patch to all of the relevant
maintainers/reviewers, why not?

please always use scripts/get_maintainer.pl on your patches.

thanks,

greg k-h

