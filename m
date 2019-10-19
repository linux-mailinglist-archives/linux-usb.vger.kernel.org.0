Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF82DD93B
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2019 16:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfJSO5C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Oct 2019 10:57:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51729 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725930AbfJSO5C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Oct 2019 10:57:02 -0400
Received: (qmail 5200 invoked by uid 500); 19 Oct 2019 10:57:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Oct 2019 10:57:00 -0400
Date:   Sat, 19 Oct 2019 10:57:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Harald Dunkel <harri@afaics.de>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: 5.3.6: I/O error on writing SD card via USB3
In-Reply-To: <6a8c4e3c-1183-4b2d-3ed9-2be3b32d5f34@afaics.de>
Message-ID: <Pine.LNX.4.44L0.1910191052530.4534-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 19 Oct 2019, Harald Dunkel wrote:

> Hi folks,
> 
> I've got an USB3 SD card adapter (device info attached). Problem:
> Writing a (rather slow 133x) SD card via an USB3 slot I get I/O errors,
> see attached kern.log. If I use an USB2 slot, then there is no problem
> (not shown here).
> 
> The I/O errors don't come up immediately, but after a few minutes
> writing time, so I wonder if this is a heat problem?
> 
> Since modern PCs don't have USB2 slots anymore I would be highly
> interested in a workaround. Kernel is 5.3.6 built from the git
> repository.
> 
> 
> Every helpful hint is highly appreciated.

What happens if you don't use that rather slow 133x SD card?  Do other
cards work better?

Another possibility: If you attach the card adapter by a USB-2 cable
then it will run as a USB-2 device (even when plugged into a USB-3
port).  That probably would help -- although it would also slow down
the data transfers.  Although, come to think of it, slowing down the
transfer rate may be just what this card needs...

Alan Stern

