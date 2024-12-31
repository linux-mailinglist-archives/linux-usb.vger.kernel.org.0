Return-Path: <linux-usb+bounces-18913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B399FEFD9
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 14:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C0547A1280
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 13:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7081619DF4D;
	Tue, 31 Dec 2024 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4N6K29c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC3DDBE;
	Tue, 31 Dec 2024 13:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735652833; cv=none; b=HIqONJqPDvChH66WcaSOtir8PhK3U5YtJnmWqLUWGqByeOeVOdYHMApQT/0JwUfm9j5IEJSWnJm4AdfcRHUMSDIjNnLw1Vww0mnsPhRowMJ2dKzpBjRswIbGTY5g8DYV4Ejrh6mcdlDfqg7gee16o5pMmqa3V6tL9fDERH5PpGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735652833; c=relaxed/simple;
	bh=h/y4OITRBIVBoV8Y+I5fjXh2ifef1FM/Rjw5n9Xv8Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJViAymxXp1CMsD/NdNXDrRg8JyIWYwQNAPW4a9i7I+1Sg5Xe38GgDTLkHCpZeTv3gr6mQiqWCTKzQ/usqISrrGorw6232BcntlQYK9gQ7KGTjuoWwh6yOEstzIlkIh9c15wwtUpuHjnhy9pFFrKUVB7BjbJ4u+1jzMxJAJXOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4N6K29c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A01C4CED2;
	Tue, 31 Dec 2024 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735652832;
	bh=h/y4OITRBIVBoV8Y+I5fjXh2ifef1FM/Rjw5n9Xv8Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R4N6K29c8Szog54k3pt3xMLrl3tJRcKSz4gASpe3RYquO5HX3kdIybzajNQLREp12
	 9M0eZ5DF1ExEVUi39ELXTMRfQl+owplJcl4aZ/qQnPnwMaT1F/kIUspJEFtVlwXnX6
	 xNh31+mUequI8JjaUGLjh2oiVCAv27bN7JW/cy39/N83GRtXzuerfpeyjRrRF1JG5y
	 AhuEevbHR/utFlkgwCW3iObl/O31fYHk6e11EK4UlEIiZ3reV8ex6ux4Cmz9YUgNdr
	 IXLqDvc/yZbd4dqNKr+0WFBxd6uPS9r7MoA1umOhUOIqEjI/bULERpsBIzyQcb15pe
	 TB+Qog0I2GUfA==
Date: Tue, 31 Dec 2024 07:47:09 -0600
From: Rob Herring <robh@kernel.org>
To: joswang <joswang1221@gmail.com>
Cc: heikki.krogerus@linux.intel.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rdbabiera@google.com,
	Jos Wang <joswang@lenovo.com>
Subject: Re: [PATCH v2, 1/2] dt-bindings: connector: Add time property for
 sender response
Message-ID: <20241231134709.GA79257-robh@kernel.org>
References: <20241222105239.2618-1-joswang1221@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222105239.2618-1-joswang1221@gmail.com>

On Sun, Dec 22, 2024 at 06:52:38PM +0800, joswang wrote:
> From: Jos Wang <joswang@lenovo.com>
> 
> Add "pd2-sender-response-time-ms" and "pd3-sender-response-time-ms"
> DT attributes to better solve the following test items in the usb
> pd compliance test:
>   TEST.PD.PROT.SRC3.2 SenderResponseTimer Timeout
>   TEST.PD.PROT.SNK.6 SenderResponseTimer Timeout
> 
> This is to enable setting of platform/board specific timer values as
> these timers have a range of acceptable values.
> 
> [1] https://usb.org/document-library/
>     usb-power-delivery-compliance-test-specification-0/USB_PD3_CTS_Q4_2024_OR.zip

Don't wrap this line.

> 
> Signed-off-by: Jos Wang <joswang@lenovo.com>
> ---
> v1 -> v2:
> - modify the commit message
> - patch 1/2 and patch 2/2 are placed in the same thread
> 
>  .../bindings/connector/usb-connector.yaml     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 67700440e23b..83be66f6d406 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -293,6 +293,26 @@ properties:
>        PD negotiation till BC1.2 detection completes.
>      default: 0
>  
> +  pd2-sender-response-time-ms:
> +    description: Represents the PD20 max time in ms that port started from
> +      the time the last bit of the GoodCRC Message EOP has been received by
> +      the Physical Layer, it shall be stopped when the last bit of the expected
> +      response Message EOP has been received by the Physical Layer. A timeout
> +      leads to a hard reset message by the port.

I can only guess that 'pd2' and 'PD20' refer to Power Delivery 2.0.

> +    minimum: 24
> +    maximum: 30
> +    default: 27
> +
> +  pd3-sender-response-time-ms:
> +    description: Represents the PD30 max time in ms that port started from
> +      the time the last bit of the GoodCRC Message EOP has been received by
> +      the Physical Layer, it shall be stopped when the last bit of the expected
> +      response Message EOP has been received by the Physical Layer. A timeout
> +      leads to a hard reset message by the port.

And pd3?

> +    minimum: 27
> +    maximum: 33
> +    default: 30
> +
>  dependencies:
>    sink-vdos-v1: [ sink-vdos ]
>    sink-vdos: [ sink-vdos-v1 ]
> -- 
> 2.17.1
> 

