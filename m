Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADBF615B46C
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 00:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgBLXFQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 18:05:16 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:44331 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728674AbgBLXFQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Feb 2020 18:05:16 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3F39FE0006;
        Wed, 12 Feb 2020 23:05:14 +0000 (UTC)
Message-ID: <9a3f2a266b53ab24b613a04b38e668338d43117e.camel@hadess.net>
Subject: Re: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 13 Feb 2020 00:05:13 +0100
In-Reply-To: <20200212190621.GA1970508@kroah.com>
References: <20191016093933.693-1-hadess@hadess.net>
         <20200212190621.GA1970508@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-02-12 at 11:06 -0800, Greg Kroah-Hartman wrote:
> On Wed, Oct 16, 2019 at 11:39:27AM +0200, Bastien Nocera wrote:
> > This is version 3 of the patch set.
> > 
> > Changes in v3:
> > - Add Alan's ack
> > - don't export usb_device_match_id()
> > 
> > Changes in v2:
> > - checkpatch.pl is now quiet
> > - fallback to the generic driver when driver ->probe() fails
> 
> Sorry for the long response to this, my fault.
> 
> At first, I really don't like the idea of using the usb device driver
> interface, but I don't think there's a better way.  And, you did the
> work to make it so that it works cleanly, which is always
> appreciated.

I'm hoping that a few user-space drivers end up upstream in the kernel
for hardware that needs it.

> So all now queued up, let's see what breaks in linux-next with it! :)

And I sure hope I won't be break anything!

> One note, your patches had to be applied with "-p0" to git, normally
> we
> do it with "-p1", I don't know how you generated your patches at 0
> depth.

My fault. I tried to use the "noprefix" git diff option to make it
easier to visualise changes, but that leaked into generated patches as
well. I've disabled it since.

I plan on making some more changes to the USB subsystem in the (near)
future, so it's to get my feet wet with this.

Cheers

