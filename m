Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC767E707
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 17:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbfD2P5i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 11:57:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:44602 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728516AbfD2P5i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 11:57:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6E259AD45;
        Mon, 29 Apr 2019 15:57:37 +0000 (UTC)
Message-ID: <1556553445.20085.21.camel@suse.com>
Subject: Re: [PATCH] UAS: fix alignment of scatter/gather segments
From:   Oliver Neukum <oneukum@suse.com>
To:     David Laight <David.Laight@ACULAB.COM>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Mon, 29 Apr 2019 17:57:25 +0200
In-Reply-To: <ff7152940ce84722a284baf7b8566dde@AcuMS.aculab.com>
References: <20190429122026.4249-1-oneukum@suse.com>
         <f378babbf2f349e59d98a5ab99958d78@AcuMS.aculab.com>
         <1556545099.20085.14.camel@suse.com>
         <e22543f3d87b4867aefdf9c71e2ec4a2@AcuMS.aculab.com>
         <1556548362.20085.17.camel@suse.com>
         <ff7152940ce84722a284baf7b8566dde@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mo, 2019-04-29 at 15:06 +0000, David Laight wrote:
> From: Oliver Neukum
> > On Mo, 2019-04-29 at 14:19 +0000, David Laight wrote:

> > AFAICT controllers do not export that property.
> 
> Perhaps they need to ....

Feel free to make a patch.

> > > Even if you decide the code is 'good enough' (I don't know what the
> > > cost is of enforcing a 2k alignment instead of 512 bytes)
> > > the comment is just plain wrong.
> > 
> > Usually block IO will be pages. They are 4K aligned.
> > In terms of performance this code is unlikely to matter.
> 
> Presumably there are some cases where the buffer isn't 4k aligned.
> I'm guessing things like 'dd' of raw disks?

Possibly.

> If the buffer has the wrong alignment then I presume a bounce buffer
> has to be allocated?
> The USB controller drivers are likely to need to be able to do that
> anyway because buffers from the network stack can have almost
> arbitrary alignment (I remember that code being horrid, I don't
> remember a data copy in the TX path).

You can ask the network layer to undo scatter/gather.
I don't see an issue.

> > But it is needed for correctness.
> 
> If you are doing it for 'correctness' then you need the correct size.

Why? Any larger size will do.

> If you are doing it because you've seen too small an alignment you
> should be mentioning the failing system.

Why?

> > What would you want for the comment?
> 
> You need to be more specific about the alignment requirements than
> the old comment, not far less specific.

But the statement the old comment made are no longer correct.

	Regards
		Oliver

