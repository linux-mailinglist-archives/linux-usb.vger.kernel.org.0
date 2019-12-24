Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA26912A2F8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2019 16:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfLXP2J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Dec 2019 10:28:09 -0500
Received: from netrider.rowland.org ([192.131.102.5]:39415 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726140AbfLXP2I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Dec 2019 10:28:08 -0500
Received: (qmail 29107 invoked by uid 500); 24 Dec 2019 10:28:07 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 24 Dec 2019 10:28:07 -0500
Date:   Tue, 24 Dec 2019 10:28:07 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
cc:     "Rene D. Obermueller" <cmdrrdo@gmail.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: ERROR: unexpected command completion code 0x11 for DJ-Tech CTRL
 (resending as plain text ;)
In-Reply-To: <98997f07-80ef-b86a-6702-448e68ff4ffa@linux.intel.com>
Message-ID: <Pine.LNX.4.44L0.1912241023260.28718-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 23 Dec 2019, Mathias Nyman wrote:

> The Maximum Packet Size of the full-speed bulk endpoint looks a bit suspicious (maxp 4)
> 
> 12478.521580: xhci_add_endpoint: State disabled mult 1 max P. Streams 0 interval 125 us max ESIT payload 0 CErr 3 Type Bulk OUT burst 0 maxp 4 deq 00000000fff71001
> 
> For full speed bulk endpoints only support 8, 16, 32 and 64 bytes Max Packet sizes.
> Host are not required to support other values. See USB2 spec section 5.8.3 for details
> 
> Maybe forcing it to one of the allowed values could work.
> Does the below hack help? (untested)?

Is this the sort of thing we should handle in 
config.c:usb_parse_endpoint()?

Even though 4 is not a valid maxpacket size for full-speed bulk
endpoints, many host controllers and hubs will handle it okay.  Much
the same is true for devices that have a high-speed bulk endpoint with
maxpacket set to 1024.  Should we try to treat these two errors the
same way?

Alan Stern

