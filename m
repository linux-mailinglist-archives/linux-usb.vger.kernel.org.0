Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07BF91396C8
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 17:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728734AbgAMQuy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 11:50:54 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:56354 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728641AbgAMQuy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 11:50:54 -0500
Received: (qmail 2814 invoked by uid 2102); 13 Jan 2020 11:50:53 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Jan 2020 11:50:53 -0500
Date:   Mon, 13 Jan 2020 11:50:53 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH v4 1/1] usb: gadget: add raw-gadget interface
In-Reply-To: <CAAeHK+z2+_UHNp4_D2iL9FzPtDoU1YBohCaDJG8sAy12uc_-ew@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2001131049090.1502-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 13 Jan 2020, Andrey Konovalov wrote:

> I've also found an issue, but I'm not sure if that is the bug in Raw
> Gadget, or in the gadget layer (in the former case I'll add this fix
> to v5 as well). What I believe I'm seeing is
> __fput()->usb_gadget_unregister_driver()->usb_gadget_remove_driver()->gadget_unbind()
> racing with dummy_timer()->gadget_setup(). In my case it results in
> gadget_unbind() doing set_gadget_data(gadget, NULL), and then
> gadget_setup() dereferencing get_gadget_data(gadget).
> 
> Alan, does it look possible for those two functions to race? Should
> this be prevented by the gadget layer, or should I use some kind of
> locking in my gadget driver to prevent this?

In your situation this race shouldn't happen, because before
udc->driver->unbind() is invoked we call usb_gadget_disconnect().  If
that routine succeeds -- which it always does under dummy-hcd -- then
there can't be any more setup callbacks, because find_endpoint() will
always return NULL (the is_active() test fails; see the various
set_link_state* routines).  So I don't see how you could have ended up
with the race you describe.

However, a real UDC might not be able to perform a disconnect under
software control.  In that case usb_gadget_disconnect() would not
change the pullup state, and there would be a real possibility of a
setup callback racing with an unbind callback.  This seems like a 
genuine problem and I can't think of a solution offhand.

What we would need is a way to tell the UDC driver to stop invoking
gadget callbacks, _before_ the UDC driver's stop callback gets called.
Maybe this should be merged into the pullup callback somehow.

Alan Stern

