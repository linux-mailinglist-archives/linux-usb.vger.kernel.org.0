Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC232FA695
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 17:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406068AbhARQoh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 18 Jan 2021 11:44:37 -0500
Received: from mail.msweet.org ([173.255.209.91]:46934 "EHLO mail.msweet.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405883AbhARQo0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 11:44:26 -0500
Received: from [10.0.1.137] (cbl-66-186-76-47.vianet.ca [66.186.76.47])
        by mail.msweet.org (Postfix) with ESMTPSA id AD55B809DE;
        Mon, 18 Jan 2021 16:43:43 +0000 (UTC)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
From:   Michael Sweet <msweet@msweet.org>
In-Reply-To: <20210118163117.GA142198@rowland.harvard.edu>
Date:   Mon, 18 Jan 2021 11:43:42 -0500
Cc:     Pete Zaitcev <zaitcev@redhat.com>,
        Jeremy Figgins <kernel@jeremyfiggins.com>,
        "<gregkh@linuxfoundation.org>" <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <B5544550-3209-4D98-ABA0-7FA389AED95F@msweet.org>
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
 <20210118163117.GA142198@rowland.harvard.edu>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

FWIW, the CUPS libusb-based backend only sets the alt setting if there is more than 1 alt setting in the descriptor.


> On Jan 18, 2021, at 11:31 AM, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> On Sun, Jan 17, 2021 at 11:44:16PM -0600, Pete Zaitcev wrote:
>> On Sun, 17 Jan 2021 15:36:39 -0600
>> Jeremy Figgins <kernel@jeremyfiggins.com> wrote:
>> 
>>> The naming is designed to mirror the existing
>>> USB_QUIRK_NO_SET_INTF flag, but that flag is
>>> not sufficient to make these devices work.
>>> +	{ 0x0416, 0x5011, USBLP_QUIRK_NO_SET_INTF }, /* Winbond Electronics Corp. Virtual Com Port */
>> 
>> Jeremy, thanks for the patch. It looks mostly fine code-wise (quirk is
>> out of numerical order), but I have a question: did you consider keying
>> off usblp->dev->quirks instead?
>> 
>> How about this:
>> 
>> diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
>> index 37062130a03c..0c4a98f00797 100644
>> --- a/drivers/usb/class/usblp.c
>> +++ b/drivers/usb/class/usblp.c
>> @@ -1315,7 +1315,11 @@ static int usblp_set_protocol(struct usblp *usblp, int protocol)
>> 	alts = usblp->protocol[protocol].alt_setting;
>> 	if (alts < 0)
>> 		return -EINVAL;
>> -	r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
>> +	if (usblp->dev->quirks & USB_QUIRK_NO_SET_INTF) {
>> +		r = 0;
>> +	} else {
>> +		r = usb_set_interface(usblp->dev, usblp->ifnum, alts);
>> +	}
>> 	if (r < 0) {
>> 		printk(KERN_ERR "usblp: can't set desired altsetting %d on interface %d\n",
>> 			alts, usblp->ifnum);
> 
> Would it be practical simply to skip the usb_set_interface() call 
> whenever alts is 0?  After all, devices use altsetting 0 by default; it 
> shouldn't be necessary to tell them to do so.
> 
> Alan Stern

________________________
Michael Sweet



