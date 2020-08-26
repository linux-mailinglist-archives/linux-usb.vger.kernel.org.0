Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F324F253175
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 16:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgHZOhK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 10:37:10 -0400
Received: from netrider.rowland.org ([192.131.102.5]:45331 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726241AbgHZOhI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 10:37:08 -0400
Received: (qmail 402002 invoked by uid 1000); 26 Aug 2020 10:37:07 -0400
Date:   Wed, 26 Aug 2020 10:37:07 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Martin Thierer <mthierer@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
Message-ID: <20200826143707.GC400430@rowland.harvard.edu>
References: <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
 <20200821170106.GB256196@rowland.harvard.edu>
 <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
 <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
 <cbdfafed-b8d4-ca07-bde1-4598f5117f04@linux.intel.com>
 <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
 <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com>
 <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com>
 <20200825151042.GC365901@rowland.harvard.edu>
 <b7b49077-de57-ef15-587a-a50486dfe372@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7b49077-de57-ef15-587a-a50486dfe372@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 11:37:50AM +0300, Mathias Nyman wrote:
> On 25.8.2020 18.10, Alan Stern wrote:
> > There's got to be a better way to do this, something that doesn't 
> > involve so much code duplication.  For instance, maybe we could make 
> > this routine and usb_set_configuration() both call a new 
> > __usb_set_config(), with an extra flag telling the routine whether to 
> > change the interface devices and bindings.
> 
> I agree that this needs cleaning up, this code was intended for testing.
> 
> It allows us to call usb_hcd_alloc_bandwidth() once with a configuration
> and with the old endpoint pointers still intact, leading to one configure
> endpoint command for xhci with the relevant drop and add endpoint flags set,
> all in one go.
> 
> Looks like the last part usb_disable_device() does similar endpoint code
> churning to flush, disable, drop, and remove endpoints. May we could start
> by turning that code into some useful helper first?

usb_disable_device() is _supposed_ to be the useful helper!  :-)  But 
yes, it could be split into two pieces.

I still think it would be worthwhile to combine usb_set_configuration() 
and usb_reset_configuration() into one routine, since they have to do a 
lot of the same things.

Alan Stern
