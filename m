Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3911C1045CD
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 22:31:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbfKTVbj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 16:31:39 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:35402 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725842AbfKTVbj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 16:31:39 -0500
Received: (qmail 6083 invoked by uid 2102); 20 Nov 2019 16:31:38 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Nov 2019 16:31:38 -0500
Date:   Wed, 20 Nov 2019 16:31:38 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     evan@gnarbox.com
cc:     linux-usb@vger.kernel.org
Subject: Re: DJI CINESSD USB Adapter Failures
In-Reply-To: <20191120191716.DVZ3qorXy%evan@gnarbox.com>
Message-ID: <Pine.LNX.4.44L0.1911201630150.1498-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 20 Nov 2019 evan@gnarbox.com wrote:

> We're trying to connect a DJI CINESSD USB adapter to our custom
> hardware running kernel 4.9.  It enumerates, communciation fails, then
> it disconnects.  This cycle seems to continue indefinitely.  I've supplied
> links to the dmesg output[0] and the USB protocol analyzer capture[1] of
> this situtation.  Please see the Data Center tool[2] to view the capture.
> 
> The device also does not enumerate properly on a desktop and laptop we
> have running 4.15.  There is a patch[3] that disables LPM for this device.
> After applying that patch the desktop and laptop work.  We already have
> LPM disabled wholesale on our board so this patch did not help.
> 
> Does anything in the dmesg or capture jump out?  What information can
> I gather or next steps would you recommend?

Have you tried running the same 4.9 kernel on the desktop or laptop as
on the custom board?  If that fails, you'll know what needs to be
fixed.

Alan Stern

