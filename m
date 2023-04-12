Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2276DFEE2
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 21:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjDLTop (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 15:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjDLToo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 15:44:44 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id F33991B7
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 12:44:42 -0700 (PDT)
Received: (qmail 226899 invoked by uid 1000); 12 Apr 2023 15:44:42 -0400
Date:   Wed, 12 Apr 2023 15:44:42 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg KH <greg@kroah.com>, Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] USB: core: Add routines for endpoint checks in old
 drivers
Message-ID: <6e48efb5-0057-444c-a3c2-6de98c22b85f@rowland.harvard.edu>
References: <00000000000096e4f905f81b2702@google.com>
 <e382763c-cf33-4871-a761-1ac85ae36f27@rowland.harvard.edu>
 <8896f261-9602-4663-aa87-1feb9bf3ec0f@redhat.com>
 <2023040148-aground-cornbread-84e2@gregkh>
 <f764a19d-858e-408c-a5f5-d6fe7306c4cb@rowland.harvard.edu>
 <2023040544-cuddly-glancing-f577@gregkh>
 <dd2c8e8c-2c87-44ea-ba17-c64b97e201c9@rowland.harvard.edu>
 <f45ab17e-d66a-f64b-5dfa-ec292d311f52@suse.com>
 <847a4775-f900-44e7-871e-eddb850b0aab@rowland.harvard.edu>
 <b62ca617-3684-0b59-953e-24aaa5de2978@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62ca617-3684-0b59-953e-24aaa5de2978@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 12, 2023 at 08:52:45PM +0200, Oliver Neukum wrote:
> 
> 
> On 12.04.23 17:08, Alan Stern wrote:
> > On Wed, Apr 12, 2023 at 01:54:12PM +0200, Oliver Neukum wrote:
> 
> > > these will do the job. Yet this strikes me as unelegant. That is
> > > if you define a data structure to match against, why not
> > > add a pointer to it to struct usb_device_id and use that?
> > 
> > Struct usb_device_id doesn't seem like the right place.  Struct
> 
> Conceptually it belongs there. It describes a device, not a driver.
> I would say that the name is not well chosen, but it is the right place.
> 
> > usb_driver would be more appropriate.  The drivers that need this have
> > only one entry in their match table, which means that drivers with large
> 
> Why would that be the case? As far as I can see everything that is not
> a class driver will need this or an equivalent and many of them
> support multiple types of devices.

In fact, I'm not sure where to find examples of drivers needing this.  
Apparently only one in drivers/usb/misc/ could benefit (uss720).  The 
other already use usb_find_common_endpoints() or related functions.  
Some of the drivers in atm/ also could use some work.  But there must be 
plenty of others; I just don't know where to look.

The point about how many different devices a driver supports is 
irrelevant; what matters is how it checks the endpoints it will use.  If 
a driver assumes that all the devices it supports will have three 
bulk-OUT endpoints numbered 1, 2, and 3 then it doesn't need a separate 
entry for each usb_device_id in its match table.

> > match tables (which would require a lot of extra space for the new
> > pointers) don't need it.
> 
> A few dozen bytes.

Ho, ho.  Look at usb-storage or uas and think again: two useless 8-byte 
pointers added to each and every entry in the unusual_devs tables.

> > True, the checks could be centralized in usb_probe_interface().  What do
> > you think about doing it that way?
> 
> That really is the best place to put the code for checking.
> And you might put into a comment that the way USB works the endpoint
> number includes the direction. It is not obvious to a casual reader.

The patches already contain such comments, in the patch description and 
in the kerneldoc.

Alan Stern
