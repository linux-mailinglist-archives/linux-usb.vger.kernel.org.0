Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BED543775C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 17:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729035AbfFFPDy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 11:03:54 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:52128 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727309AbfFFPDy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 11:03:54 -0400
Received: (qmail 8362 invoked by uid 2102); 6 Jun 2019 11:03:53 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Jun 2019 11:03:53 -0400
Date:   Thu, 6 Jun 2019 11:03:53 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: USB reset problem
In-Reply-To: <76055429-9E4E-4B4B-B9B0-9514F633392F@digi.com>
Message-ID: <Pine.LNX.4.44L0.1906061101180.1641-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 6 Jun 2019, Bollinger, Seth wrote:

> > On Jun 6, 2019, at 9:36 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > If the descriptor changes between resets, that means that something
> > changed and we need to start over with it.  What is the problem that
> > this is causing
> 
> We have code doing a USBDEVFS_RESET that fails when the ioctl returns EPERM.

EPERM means that the file descriptor was not opened with write access.  
It has nothing to do with reset failures.

> I think the solution might be to simply not do the reset for this device, but wanted to check if anyone else had encountered this issue.

It's true that many programs using usbfs do unnecessary resets.  If you 
don't need it, don't do it!

Alan Stern

