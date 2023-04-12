Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBE4D6DF95E
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 17:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjDLPIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 11:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjDLPIs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 11:08:48 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 904691BB
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 08:08:47 -0700 (PDT)
Received: (qmail 215973 invoked by uid 1000); 12 Apr 2023 11:08:46 -0400
Date:   Wed, 12 Apr 2023 11:08:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg KH <greg@kroah.com>, Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] USB: core: Add routines for endpoint checks in old
 drivers
Message-ID: <847a4775-f900-44e7-871e-eddb850b0aab@rowland.harvard.edu>
References: <00000000000096e4f905f81b2702@google.com>
 <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
 <8896f261-9602-4663-aa87-1feb9bf3ec0f@redhat.com>
 <2023040148-aground-cornbread-84e2@gregkh>
 <f764a19d-858e-408c-a5f5-d6fe7306c4cb@rowland.harvard.edu>
 <2023040544-cuddly-glancing-f577@gregkh>
 <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
 <f45ab17e-d66a-f64b-5dfa-ec292d311f52@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f45ab17e-d66a-f64b-5dfa-ec292d311f52@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 12, 2023 at 01:54:12PM +0200, Oliver Neukum wrote:
> On 10.04.23 21:37, Alan Stern wrote:
> 
> Hi,
> > To make this checking as simple as possible, we now add a couple of
> > utility routines to the USB core.  usb_check_bulk_endpoints() and
> > usb_check_int_endpoints() take an interface pointer together with a
> > list of endpoint addresses (numbers and directions).  They check that
> > the interface's current alternate setting includes endpoints with
> > those addresses and that each of these endpoints has the right type:
> > bulk or interrupt, respectively.
> > 
> > Although we already have usb_find_common_endpoints() and related
> > routines meant for a similar purpose, they are not well suited for
> > this kind of checking.  Those routines find endpoints of various
> > kinds, but only one (either the first or the last) of each kind, and
> > they don't verify that the endpoints' addresses agree with what the
> > caller expects.
> 
> these will do the job. Yet this strikes me as unelegant. That is
> if you define a data structure to match against, why not
> add a pointer to it to struct usb_device_id and use that?

Struct usb_device_id doesn't seem like the right place.  Struct 
usb_driver would be more appropriate.  The drivers that need this have 
only one entry in their match table, which means that drivers with large 
match tables (which would require a lot of extra space for the new 
pointers) don't need it.

> Basically the table of endpoints you are creating is a description of
> a device. Why add code for checking it to each probe() method
> that needs it?

True, the checks could be centralized in usb_probe_interface().  What do 
you think about doing it that way?

Alan Stern
