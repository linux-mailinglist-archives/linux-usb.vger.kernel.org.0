Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2594D099
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 16:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfFTOnV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 10:43:21 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:44388 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726428AbfFTOnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 10:43:21 -0400
Received: (qmail 2188 invoked by uid 2102); 20 Jun 2019 10:43:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Jun 2019 10:43:20 -0400
Date:   Thu, 20 Jun 2019 10:43:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1561041295.20348.4.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1906201042190.1512-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 20 Jun 2019, Mayuresh Kulkarni wrote:

> > It would be easiest to export the usb_autopm_* API to user space.
> 
> AFAIU, usb_autopm_* API operate on interface rather than on device.
> Due to this, they are *indirectly* exposed by appropriate class drivers
> to the user-space class drivers cater to. E.g.: USB audio class driver
> calls usb_autopm_* APIs when user space calls pcm_open(playback_stream).

In fact, the usb_autopm_* API can operate both on interfaces and on
devices.  It is used both ways in the kernel.

Alan Stern

