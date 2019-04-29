Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56D67E4CD
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 16:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbfD2Oc4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 10:32:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:51580 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725838AbfD2Oc4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 10:32:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9093EAF22;
        Mon, 29 Apr 2019 14:32:55 +0000 (UTC)
Message-ID: <1556548362.20085.17.camel@suse.com>
Subject: Re: [PATCH] UAS: fix alignment of scatter/gather segments
From:   Oliver Neukum <oneukum@suse.com>
To:     David Laight <David.Laight@ACULAB.COM>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Mon, 29 Apr 2019 16:32:42 +0200
In-Reply-To: <e22543f3d87b4867aefdf9c71e2ec4a2@AcuMS.aculab.com>
References: <20190429122026.4249-1-oneukum@suse.com>
         <f378babbf2f349e59d98a5ab99958d78@AcuMS.aculab.com>
         <1556545099.20085.14.camel@suse.com>
         <e22543f3d87b4867aefdf9c71e2ec4a2@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mo, 2019-04-29 at 14:19 +0000, David Laight wrote:
> From: Oliver Neukum
> > Sent: 29 April 2019 14:38
> > On Mo, 2019-04-29 at 13:31 +0000, David Laight wrote:
> > > From: Oliver Neukum
> > > > 
> > > > +	 * USB has unusual scatter-gather requirements: the length of each
> > > > +	 * scatterlist element except the last must be divisible by the
> > > > +	 * Bulk maxpacket value.  Fortunately this value is always a
> > > > +	 * power of 2.  Inform the block layer about this requirement.
> > > > +	 */
> > > 
> > > That isn't the correct restriction for XHCI.
> > > It has its own perverse restrictions.
> > > I think they are all handled within the xhci driver.
> > 
> > Yes, but that does not matter. You just cannot assume that only
> > XHCI will be used with UAS. In particular virtual drivers will
> > be used.
> 
> True, but there is no need to enforce a 2k (IIRC) alignment for XHCI.
> Perhaps you need a different property from the controller.

AFAICT controllers do not export that property.

> Even if you decide the code is 'good enough' (I don't know what the
> cost is of enforcing a 2k alignment instead of 512 bytes)
> the comment is just plain wrong.

Usually block IO will be pages. They are 4K aligned.
In terms of performance this code is unlikely to matter.
But it is needed for correctness.

What would you want for the comment?

	Regards
		Oliver

