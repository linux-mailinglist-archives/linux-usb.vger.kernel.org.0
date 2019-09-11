Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2A9AF9DC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 12:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbfIKKFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Sep 2019 06:05:09 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:58490 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbfIKKFJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Sep 2019 06:05:09 -0400
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23994598AbfIKKFGpWut1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Sep 2019 12:05:06 +0200
Date:   Wed, 11 Sep 2019 12:05:05 +0200
From:   Ladislav Michl <ladis@linux-mips.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 2/6] usb: gadget: u_serial: reimplement console support
Message-ID: <20190911100505.GA9950@lenoch>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
 <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
 <87r25utufw.fsf@gmail.com>
 <20190810081105.GA10667@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190810081105.GA10667@qmqm.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

On Sat, Aug 10, 2019 at 10:11:05AM +0200, Micha³ Miros³aw wrote:
> On Fri, Aug 09, 2019 at 03:05:55PM +0300, Felipe Balbi wrote:
> > 
> > Hi,
> > 
> > Micha³ Miros³aw <mirq-linux@rere.qmqm.pl> writes:
> > > Rewrite console support to fix a few shortcomings of the old code
> > > preventing its use with multiple ports. This removes some duplicated
> > > code and replaces a custom kthread with simpler workqueue item.
> > >
> > > Only port ttyGS0 gets to be a console for now.
> > >
> > > Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Tested-by: Ladislav Michl <ladis@linux-mips.org>
> > 
> > checking file drivers/usb/gadget/function/u_serial.c
> > Hunk #7 FAILED at 1206.
> > Hunk #8 succeeded at 1302 (offset -2 lines).
> > Hunk #9 succeeded at 1334 (offset -2 lines).
> > Hunk #10 succeeded at 1363 (offset -2 lines).
> > 1 out of 10 hunks FAILED
> > 
> > Could you rebase on my testing/next?

I do not see this patch in -next and there were no more comments from you.
Is there anything else you need to review patchset?

Thanks,
	ladis

> Sure. Should be ready in a few minutes.
> 
> Best Regards,
> Micha³ Miros³aw
