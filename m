Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57DBB19551B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 11:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgC0KYO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 06:24:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgC0KYN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Mar 2020 06:24:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9319A20705;
        Fri, 27 Mar 2020 10:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585304653;
        bh=lF/JY9ZVPOd2GvsK5POWvp9v/fpJ4aUeUUUE0LLiT5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cGsbdW4AfZk74llKktuJuBgvMAnTth5VSaNK32PplZn/Un0/A8h1qEA20gOXHdeHy
         PV2+veX+oDFxPV3TmzxPLiYDzrzmjdIJ7oFCXg0e20Ivf/L/txU1h2DEv8ZobLSBcf
         CHvzxL+4ZBTPq/78Dk+qC2TW9Onu4EUUKVCpUFQg=
Date:   Fri, 27 Mar 2020 11:24:09 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RESENDING RFC PATCH 1/4] dt-bindings: usb: Add
 snps,consolidate-sgl & consolidate-sgl
Message-ID: <20200327102409.GB1700570@kroah.com>
References: <cover.1585297723.git.joglekar@synopsys.com>
 <8a9ca8e08d7c4957789a209c77589f1aa4bd2f06.1585297723.git.joglekar@synopsys.com>
 <20200327095447.GA1698181@kroah.com>
 <11a058bc-a947-a763-680f-a11fd454925a@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11a058bc-a947-a763-680f-a11fd454925a@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 27, 2020 at 10:11:59AM +0000, Tejas Joglekar wrote:
> Hi,
> On 3/27/2020 3:24 PM, Greg KH wrote:
> > On Fri, Mar 27, 2020 at 03:11:56PM +0530, Tejas Joglekar wrote:
> >> This commit adds the documentation for consolidate-sgl, and
> >> snps,consolidate-sgl property. These when set enables the quirk for
> >> XHCI driver for consolidation of sg list into a temporary buffer when small
> >> buffer sizes are scattered over the sg list not making up to MPS or total
> >> transfer size within TRB cache size with Synopsys xHC.
> >>
> >> Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
> >> ---
> >>  Documentation/devicetree/bindings/usb/dwc3.txt     | 3 +++
> >>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
> >>  2 files changed, 6 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> >> index 9946ff9ba735..292d1f7969e4 100644
> >> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> >> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> >> @@ -104,6 +104,9 @@ Optional properties:
> >>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
> >>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
> >>  			enable periodic ESS TX threshold.
> >> + - snps,consolidate-sgl: enable sg list consolidation - host mode only. Set to use
> >> +			SG buffers of at least MPS size by consolidating smaller SG
> >> +			buffers list into a single buffer.
> >>  
> >>   - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
> >>   - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> >> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> >> index 3f378951d624..a90d853557ee 100644
> >> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> >> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> >> @@ -43,6 +43,9 @@ Optional properties:
> >>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
> >>    - imod-interval-ns: default interrupt moderation interval is 5000ns
> >>    - phys : see usb-hcd.yaml in the current directory
> >> +  - consolidate-sgl: indicate if you need to consolidate sg list into a
> >> +    temporary buffer when small SG buffer sizes does not make upto MPS
> >> +    size or total transfer size across the TRB cache size.
> > 
> > Shouldn't this refer to the fact that the hardware is broken?  Otherwise
> > why would anyone know if they should, or should not, enable this option?
> >
> We have not seen issue with Linux environment for now. But with other OS with
> SG list with very small buffer sizes the xHC controller hang was seen. So 
> currently introducing the binding as optional one. One could enable this 
> option when xHC halt happens due to small SG list sizes.  

What I mean is this should be something like,
"quirk-broken-sg-list-handler" or something like that.  Otherwise how
does anyone know if this really is needed or not.  Reading this would
seem like everyone would like to do this, as consolidating links
sounds like a good optimization, when instead this really cause more
memory allocations, making this possibly worse performance.

thanks,

greg k-h
