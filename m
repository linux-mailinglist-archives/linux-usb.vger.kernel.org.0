Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6761D1D28
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 20:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390076AbgEMSOc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 14:14:32 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46931 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1733070AbgEMSOc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 May 2020 14:14:32 -0400
Received: (qmail 6873 invoked by uid 500); 13 May 2020 14:14:31 -0400
Date:   Wed, 13 May 2020 14:14:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: Testing endpoint halt support for raw-gadget
Message-ID: <20200513181431.GB2862@rowland.harvard.edu>
References: <CAAeHK+z=z=e2pYQy3vtJO4rm+=Rb=av+4RidLCyp7Ae3shggqA@mail.gmail.com>
 <Pine.LNX.4.44L0.2004280920510.4958-100000@netrider.rowland.org>
 <CAAeHK+yHBZ4oxW7AbS8VwqMrULKiETBYjW6ARZ+9FiWk=hvs=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+yHBZ4oxW7AbS8VwqMrULKiETBYjW6ARZ+9FiWk=hvs=g@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 13, 2020 at 07:07:20PM +0200, Andrey Konovalov wrote:
> Hi Alan,
> 
> I've been looking at this a little more. Do I understand correctly
> that even though Dummy UDC names endpoints as "ep1in", etc. it
> actually allows to assign endpoints addresses different from what is
> specified in the endpoint names (it uses find_endpoint() to find the
> right endpoint based on ep->desc)? E.g. you can technically assign
> endpoint with address 2 (| USB_DIR_IN) to "ep1in".

Yes, that's right.  In fact, you can do this with any UDC.  (But with 
other UDCs it won't work, whereas with dummy-hcd it will.)

> If this is correct, this kind of limits Dummy UDC usage with Raw
> Gadget the way it is currently implemented, as Raw Gadget assumes that
> the endpoint address must be fixed when the endpoint is named as
> ep1in.

Okay.  That makes sense, since it is true for most UDCs.

> Would it be acceptable to add another mode to Dummy UDC that names the
> endpoints as "ep-a"? Perhaps enabled with a module parameter. I'm not
> sure if this kind of naming would be technically correct, as "ep-a"
> name assumes that we can assign arbitrary transfer type to the
> endpoint as well, which isn't possible with Dummy UDC, as it doesn't
> support ISO transfers.
> 
> Or do you think there can be another way to expose the fact that Dummy
> UDC allows arbitrary addresses? I could hardcode this into Raw Gadget,
> but it doesn't feel like the right approach.

Why do you want to do this?  Does anything go wrong if you just continue 
to assume the endpoint numbers are fixed?

I suppose, if you thought this was really necessary, we could change 
find_endpoint() so that it looks for a match against the endpoint's name 
instead of against the address stored in the descriptor.  Or we could 
change the last thirteen "generic" endpoints in ep_info[] to be 
configurable: "ep-a", ..., "ep-m", or "ep-aout", ..., "ep-min".  (The 
fact that the endpoints don't support isochronous is exposed through the 
usb_ep_caps structures.)

Alan Stern
