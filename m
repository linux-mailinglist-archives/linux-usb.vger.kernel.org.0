Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2DE117CFF9
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2020 21:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgCGUX7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Mar 2020 15:23:59 -0500
Received: from netrider.rowland.org ([192.131.102.5]:33515 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726138AbgCGUX7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Mar 2020 15:23:59 -0500
Received: (qmail 17328 invoked by uid 500); 7 Mar 2020 15:23:58 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Mar 2020 15:23:58 -0500
Date:   Sat, 7 Mar 2020 15:23:58 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     James <bjlockie@lockie.ca>
cc:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: dvdrw USB3 drive seen as USB2
In-Reply-To: <f3025e11-3ed5-7d95-821d-03bd2fc0cd4b@lockie.ca>
Message-ID: <Pine.LNX.4.44L0.2003071517430.17115-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 7 Mar 2020, James wrote:

> The cable is attached to the drive.
> I guess the cable could be defective.
> 
> I found out my Realtek USB adapter is USB2 by default but there is a 
> parameter in the driver to make it USB3.

Do you have a pointer or URL for an explanation of that parameter?

> I wonder if it is becoming more common to have USB2 by default and then 
> USB3 by software.

I have not heard of such a thing.  It seems like a bad idea; why would 
anybody want their device to run at USB-2 speed by default when it 
could be running at USB-3 speed?

> Unfortunately, I think Linux uses generic drivers.

The drivers are largely generic, but they include device-specific quirk
lists, so they are not entirely generic.

Alan Stern

