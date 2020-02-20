Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8EA21660E5
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 16:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgBTP0w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 10:26:52 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:59436 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728236AbgBTP0w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 10:26:52 -0500
Received: (qmail 1541 invoked by uid 2102); 20 Feb 2020 10:26:51 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Feb 2020 10:26:51 -0500
Date:   Thu, 20 Feb 2020 10:26:51 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Belisko Marek <marek.belisko@gmail.com>
cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: functionfs gadget with multiple endpoints
In-Reply-To: <CAAfyv36n=--KiHmdyS7hOGzF8fVtq8y=uZx0cxARgp7fUta4ng@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2002201024190.1453-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 20 Feb 2020, Belisko Marek wrote:

> Hi,
> 
> I'm playing with functionfs and use configfs + functionfs + ffs-test
> from kernel to test connection between my device and host. ffs-test
> example provide 1 configuration with 1 interface and with 2 bulk
> endpoints.
> 
> I'm writing application which will write/read data to usb device but
> can be accessed from other multiple application. I'm planning to write
> kind of gatekeeper which will serialize data to endpoint and notify
> reader about received data.
> 
> I was thinking about other possibility to extend gadget to provide
> more endpoints (like 2). I was able to extend ffs-test and also I can
> send/receive data (using libusb) over original endpoints but not over
> new created one (I've run 2 instances of same application which
> basically create transfers for 2 different endpoints) but when running
> second application I got this error:
> 
> libusb: error [submit_bulk_transfer] submiturb failed error -1 errno=16
> libusb: error [submit_bulk_transfer] submiturb failed error -1 errno=16

Only one program at a time can claim an interface, and submitting an 
URB to an endpoint automatically claims the endpoint's interface.

> I'm not USB expert but multiple endpoint should be possible (maybe I
> need to put them to other interface?-> tried that also but got same
> error as above with errno=2). Thanks for any pointers and advice.

errno=16 and errno=2 are different errors, not the same error.  
Putting the endpoints in different interfaces should work; you probably
have a bug somewhere in your code.

Alan Stern

