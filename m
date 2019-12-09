Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFADA117053
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 16:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbfLIPYq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 10:24:46 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:36912 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726197AbfLIPYp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 10:24:45 -0500
Received: (qmail 2025 invoked by uid 2102); 9 Dec 2019 10:24:45 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Dec 2019 10:24:45 -0500
Date:   Mon, 9 Dec 2019 10:24:45 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Erkka Talvitie <erkka.talvitie@vincit.fi>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
In-Reply-To: <023701d5ae77$14ec9d50$3ec5d7f0$@vincit.fi>
Message-ID: <Pine.LNX.4.44L0.1912091024060.1462-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 9 Dec 2019, Erkka Talvitie wrote:

> > Ok, just to double check:
> > 
> > I take the existing driver code (I will not apply the earlier RFC on top
> of
> > that) and apply one more check before the original stall check (that is):
> > } else if (QTD_CERR(token)) {
> > 
> > The check that I will add is checking MMF bit && PID == IN, and this check
> > comes right after the babble check, right?
> > 
> > Good, seems like a simple change. Yet I still prefer to test the change.
> > Unfortunately that goes to the next week as we have a national holiday
> > tomorrow.
> > I will get back to you most likely on Monday.
> 
> I tested this change and it removes the error messages from the output.

Great!  Okay, feel free to submit a new patch.

Alan Stern

