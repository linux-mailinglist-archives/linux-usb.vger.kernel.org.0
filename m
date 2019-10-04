Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1B5CBCD2
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 16:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388724AbfJDORy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 10:17:54 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:44804 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388625AbfJDORx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 10:17:53 -0400
Received: (qmail 2273 invoked by uid 2102); 4 Oct 2019 10:17:52 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 4 Oct 2019 10:17:52 -0400
Date:   Fri, 4 Oct 2019 10:17:52 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     David Heinzelmann <heinzelmann.david@gmail.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a connection-change
 occurs before validating the connection.
In-Reply-To: <20191004132341.GA22292@dhe-pc>
Message-ID: <Pine.LNX.4.44L0.1910041008420.1615-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 4 Oct 2019, David Heinzelmann wrote:

> Hi,
> 
> thank you for the feedback! I hope this time everything is in order.
> However, the correct error description is somewhat difficult for me.

You should follow the advice I gave you last time: Explain what the 
problem is and how the patch fixes it.

> Here is the third version:
> 
> From 58634d035508b621025da1d866179b59ed0ae37a Mon Sep 17 00:00:00 2001
> From: David Heinzelmann <heinzelmann.david@gmail.com>
> Date: Fri, 4 Oct 2019 12:28:36 +0200
> Subject: [PATCH v3] usb: hub: Check device descriptor before resusciation
> 
> If a port connection-change occurs, the connection should not be
> resusciated without a prior check if the port connection is enabled.
> Signed-off-by: David Heinzelmann <heinzelmann.david@gmail.com>

(Insert a blank line before the Signed-off-by:.)

See, this doesn't say what the problem is.  Someone reading your 
description won't know _why_ a check is needed.

The problem shows up when a device goes through a firmware update.  It
will disconnect from the USB bus and reconnect, and if it is attached
to an xHCI host controller then the controller hardware will
automatically initialize the connection and enable the port.  But
hub_port_connect_change() assumes that if the port is enabled then
nothing has changed; it doesn't check to see if the device's
descriptors have been updated.  As a result, the kernel's internal copy
of the descriptors ends up being incorrect and the device doesn't work
properly.

The solution to the problem is for hub_port_connect_change() always to
check whether the device's descriptors have changed before 
resuscitating an enabled port.

Alan Stern

