Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F54E255E3F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 17:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgH1Pzn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 11:55:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53481 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728281AbgH1Pzm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Aug 2020 11:55:42 -0400
Received: (qmail 472950 invoked by uid 1000); 28 Aug 2020 11:55:41 -0400
Date:   Fri, 28 Aug 2020 11:55:41 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Martin Thierer <mthierer@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
Message-ID: <20200828155541.GC470612@rowland.harvard.edu>
References: <20200821170106.GB256196@rowland.harvard.edu>
 <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
 <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
 <cbdfafed-b8d4-ca07-bde1-4598f5117f04@linux.intel.com>
 <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
 <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com>
 <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com>
 <CAL3BvCzKdRAVNMgG2do1D_QgKnR_x+P-uBuv3-kPMi7z6iabwQ@mail.gmail.com>
 <a8c8509b-6f45-c905-3860-d2b5dd5f9103@linux.intel.com>
 <f57b9d65-9553-17f7-090a-0272b013af36@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f57b9d65-9553-17f7-090a-0272b013af36@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 28, 2020 at 04:10:47PM +0300, Mathias Nyman wrote:
> >> Thanks, that seems to work! (Judging by the absence of my original
> >> issue with the xum1541 adapter; I haven't checked what's actually
> >> happening on the bus).
> >>
> >> Martin
> >>
> > 
> > Great, thanks.
> > 
> > Now this test code needs to be cleaned up a turned into a real patch
> 
> Can you test one more round?
> The code below is cleaned up but it also has a functional change.
> This version issues separate commands for dropping and adding endpoints.
> Previous code both did all on one command.
> 
> If it works I'll send it forward.
> 
> Thanks
> -Mathias
> 
> ---
> From: Mathias Nyman <mathias.nyman@linux.intel.com>
> Subject: [PATCH] usb: Fix out of sync data toggle if a configured device is
>  reconfigured
> 
> Userspace drivers that use a SetConfiguration() request to "lightweight"
> reset a already configured usb device might cause data toggles to get out
> of sync between the device and host, and the device becomes unusable.
> 
> The xHCI host requires endpoints to be dropped and added back to reset the
> toggle. USB core avoids these otherwise extra steps if the current active
> configuration is the same as the new requested configuration.
> 
> A SetConfiguration() request will reset the device side data toggles.
> Make sure usb core drops and adds back the endpoints in this case.
> 
> To avoid code duplication split the current usb_disable_device() function
> and reuse the endpoint specific part.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

This seems reasonable.  But can you add something to the kerneldoc for
usb_reset_configuration() explaining that if the routine fails, the
device will probablly be in an unusable state (endpoints disabled,
interfaces only partially enabled)?

Alan Stern
