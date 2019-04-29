Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D79AAE3DE
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 15:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbfD2Nic (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 09:38:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:40644 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725838AbfD2Nic (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 09:38:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6AA89ABA1;
        Mon, 29 Apr 2019 13:38:31 +0000 (UTC)
Message-ID: <1556545099.20085.14.camel@suse.com>
Subject: Re: [PATCH] UAS: fix alignment of scatter/gather segments
From:   Oliver Neukum <oneukum@suse.com>
To:     David Laight <David.Laight@ACULAB.COM>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Mon, 29 Apr 2019 15:38:19 +0200
In-Reply-To: <f378babbf2f349e59d98a5ab99958d78@AcuMS.aculab.com>
References: <20190429122026.4249-1-oneukum@suse.com>
         <f378babbf2f349e59d98a5ab99958d78@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mo, 2019-04-29 at 13:31 +0000, David Laight wrote:
> From: Oliver Neukum
> > 
> > +	 * USB has unusual scatter-gather requirements: the length of each
> > +	 * scatterlist element except the last must be divisible by the
> > +	 * Bulk maxpacket value.  Fortunately this value is always a
> > +	 * power of 2.  Inform the block layer about this requirement.
> > +	 */
> 
> That isn't the correct restriction for XHCI.
> It has its own perverse restrictions.
> I think they are all handled within the xhci driver.

Yes, but that does not matter. You just cannot assume that only
XHCI will be used with UAS. In particular virtual drivers will
be used.

	Regards
		Oliver

