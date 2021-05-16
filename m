Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C4C381BE8
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 03:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbhEPBDJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 21:03:09 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50853 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231608AbhEPBDI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 21:03:08 -0400
Received: (qmail 1046484 invoked by uid 1000); 15 May 2021 21:01:54 -0400
Date:   Sat, 15 May 2021 21:01:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hritik Vijay <hritikxx8@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Order in which kernel decides binding device driver
Message-ID: <20210516010154.GA1046393@rowland.harvard.edu>
References: <YKA0hphGFeqM+BZG@Journey.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKA0hphGFeqM+BZG@Journey.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 16, 2021 at 02:22:22AM +0530, Hritik Vijay wrote:
> Hello
> 
> I've experimented with two device drivers targeting a single device,
> both hot-pluggable. When the device plugs in, both the modules are loaded.
> This is expected behavior of udev. After being loaded, only one of the
> drivers offered by them is chosen to be bound to the device
> i.e. only one module gets to execute their `probe` function.
> 
> I tried looking through the source to find out which module would get
> the preference but I would really like some clarification on the
> topic. 
> In what order will the kernel decide to give opportunities to device 
> drivers to bind to a device ?

I believe this happens in the order that the drivers are registered.  
For drivers in modules, this will be the order in which the modules are 
loaded.

In practice the loading order usually doesn't matter, because only one 
driver will be able to manage a particular device.  For cases where 
there are two drivers capable of handling the same device, people 
usually have some sort of priority scheme to decide.  For example, many 
USB mass-storage devices can be handled by either the usb-storage or the 
uas driver, but uas has higher priority.

Alan Stern
