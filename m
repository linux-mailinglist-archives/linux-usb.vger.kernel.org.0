Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A306241F6E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 19:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgHKRxl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 13:53:41 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47571 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726115AbgHKRxk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 13:53:40 -0400
Received: (qmail 341684 invoked by uid 1000); 11 Aug 2020 13:53:38 -0400
Date:   Tue, 11 Aug 2020 13:53:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tom Rix <trix@redhat.com>
Cc:     gregkh@linuxfoundation.org, acozzette@cs.hmc.edu,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: realtek_cr: fix return check for dma functions
Message-ID: <20200811175338.GB339805@rowland.harvard.edu>
References: <20200811151505.12222-1-trix@redhat.com>
 <20200811160348.GD335280@rowland.harvard.edu>
 <1f7d5a64-f264-4fed-bf90-b64e2693652d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f7d5a64-f264-4fed-bf90-b64e2693652d@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 11, 2020 at 10:29:29AM -0700, Tom Rix wrote:
> 
> On 8/11/20 9:03 AM, Alan Stern wrote:
> > On Tue, Aug 11, 2020 at 08:15:05AM -0700, trix@redhat.com wrote:
> >> From: Tom Rix <trix@redhat.com>
> >>
> >> clang static analysis reports this representative problem
> >>
> >> realtek_cr.c:639:3: warning: The left expression of the compound
> >>   assignment is an uninitialized value. The computed value will
> >>   also be garbage
> >>     SET_BIT(value, 2);
> >>     ^~~~~~~~~~~~~~~~~
> >>
> >> value is set by a successful call to rts51x_read_mem()
> >>
> >> 	retval = rts51x_read_mem(us, 0xFE77, &value, 1);
> >> 	if (retval < 0)
> >> 		return -EIO;
> >>
> >> A successful call to rts51x_read_mem returns 0, failure can
> >> return positive and negative values.  This check is wrong
> >> for a number of functions.  Fix the retval check.
> >>
> >> Fixes: 065e60964e29 ("ums_realtek: do not use stack memory for DMA")
> >> Signed-off-by: Tom Rix <trix@redhat.com>
> >> ---
> >>  drivers/usb/storage/realtek_cr.c | 36 ++++++++++++++++----------------
> >>  1 file changed, 18 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
> >> index 3789698d9d3c..b983753e2368 100644
> >> --- a/drivers/usb/storage/realtek_cr.c
> >> +++ b/drivers/usb/storage/realtek_cr.c
> >> @@ -481,16 +481,16 @@ static int enable_oscillator(struct us_data *us)
> >>  	u8 value;
> >>  
> >>  	retval = rts51x_read_mem(us, 0xFE77, &value, 1);
> >> -	if (retval < 0)
> >> +	if (retval != STATUS_SUCCESS)
> >>  		return -EIO;
> > Instead of changing all these call sites, wouldn't it be a lot easier 
> > just to change rts51x_read_mem() to make it always return a negative 
> > value (such as -EIO) when there's an error?
> >
> > Alan Stern
> 
> I thought about that but there was already existing (retval != 
> STATUS_SUCCESS) checks for these calls.

The only values that routine currently returns are 
USB_STOR_TRANSPORT_ERROR, -EIO, and 0.  None of the callers distinguish 
between the first two values, so you can just change the first to the 
second.

Note that STATUS_SUCCESS is simply 0.

Alan Stern
