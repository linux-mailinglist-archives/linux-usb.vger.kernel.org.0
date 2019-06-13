Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8666C43A28
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 17:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732419AbfFMPTG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 11:19:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:37976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732142AbfFMNCf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Jun 2019 09:02:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F641205ED;
        Thu, 13 Jun 2019 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560430954;
        bh=/8/guLOYcdh25qUCHt+eHE8/ipFObeASg16LCV7kjjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CCcehPRBSEbzoRofHWRTA+skNR57jG95Rcg6UJwC0qpNlvIDiyquCs0vsoroZhBm/
         XQqnmm3uM9iY/HpUjZFG4+TjczvHrkMNzxKKOPixgmTL3WZU+/4v+1rFu0xrSVsdaD
         I5UHznTGK4GjQ8G0J5luSC/rCYTNI3w6nz8jgFA0=
Date:   Thu, 13 Jun 2019 15:02:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     "Regupathy, Rajaram" <rajaram.regupathy@intel.com>,
        "Cox, Alan" <alan.cox@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Pandey, Prabhat Chand" <prabhat.chand.pandey@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Nyman, Mathias" <mathias.nyman@intel.com>,
        "K V, Abhilash" <abhilash.k.v@intel.com>,
        "Balaji, M" <m.balaji@intel.com>
Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a
 raw interface on DbC
Message-ID: <20190613130232.GB803@kroah.com>
References: <20190607142132.GG14665@kroah.com>
 <af51b855-4ee4-9bc2-6484-b8c4d897f503@linux.intel.com>
 <20190610141607.GA5937@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15AEE6@BGSMSX102.gar.corp.intel.com>
 <20190611095243.GA23226@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15B030@BGSMSX102.gar.corp.intel.com>
 <20190611123409.GA26261@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15DF95@BGSMSX102.gar.corp.intel.com>
 <20190612105408.GA22303@kroah.com>
 <87pnnhekch.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnnhekch.fsf@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 13, 2019 at 03:33:02PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> >> > > > Who can use this interface in the "real world", is it only
> >> > > > developers that have access to the special hardware dongle?  Or can
> >> > > > anyone use this on their laptops for getting console access in a way
> >> > > > that is somehow "better" than the existing interface?
> >> > >
> >> > > No special hardware is required. As indicated earlier developers need a USB A-
> >> > A debug cable and anyone can use it to get console access.
> >> > 
> >> > Where can I get one of those?
> >> Here is one example:  https://www.amazon.com/SIIG-SuperSpeed-Cable-Meters-CB-US0212-S1/dp/B0032ANCBO
> >
> > Ah, nice!  I'll try to see if I can get that in my country...
> >
> > Nope, not available in Europe from what I can tell, I'll have to wait
> > until the next time I'm in the US :(
> 
> here's one from amazon.de:
> 
> https://www.amazon.de/dp/B00WHZ6VEU/

Dieser Artikel kann nicht in die Niederlande geliefert werden.

:(

