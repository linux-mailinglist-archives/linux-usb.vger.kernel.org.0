Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B1D340862
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 16:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhCRPDY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 11:03:24 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55423 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230040AbhCRPDK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 11:03:10 -0400
Received: (qmail 528903 invoked by uid 1000); 18 Mar 2021 11:03:09 -0400
Date:   Thu, 18 Mar 2021 11:03:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ulrich Windl <Ulrich.Windl@rz.uni-regensburg.de>
Cc:     Greg KH <greg@kroah.com>, zzam@gentoo.org,
        "systemd-devel@lists.freedesktop.org" 
        <systemd-devel@lists.freedesktop.org>,
        usb-storage@lists.one-eyed-alien.net, hirofumi@mail.parknet.co.jp,
        linux-usb@vger.kernel.org
Subject: Re: Antw: [EXT] [systemd-devel] [PATCH] usb-storage: Add quirk to
 defeat Kindle's automatic unload
Message-ID: <20210318150309.GB527768@rowland.harvard.edu>
References: <20210317190654.GA497856@rowland.harvard.edu>
 <F279F9BC020000F5AE14D9EC@gwsmtp.uni-regensburg.de>
 <C63C44570200006665972EEF@gwsmtp.uni-regensburg.de>
 <B960C12A020000A667ECE9F9@gwsmtp.uni-regensburg.de>
 <B72C58530200001565972EEF@gwsmtp.uni-regensburg.de>
 <0F2319EB020000F567ECE9F9@gwsmtp.uni-regensburg.de>
 <DE3F57520200009E65972EEF@gwsmtp.uni-regensburg.de>
 <474C42CD02000091AE14D9EC@gwsmtp.uni-regensburg.de>
 <D43A6F56020000F865972EEF@gwsmtp.uni-regensburg.de>
 <6052FD00020000A10003FE36@gwsmtp.uni-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6052FD00020000A10003FE36@gwsmtp.uni-regensburg.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 18, 2021 at 08:10:56AM +0100, Ulrich Windl wrote:
> >>> Alan Stern <stern@rowland.harvard.edu> schrieb am 17.03.2021 um 20:06 in
> Nachricht <20210317190654.GA497856@rowland.harvard.edu>:
> > Matthias reports that the Amazon Kindle automatically removes its
> > emulated media if it doesn't receive another SCSI command within about
> > one second after a SYNCHRONIZE CACHE.  It does so even when the host
> > has sent a PREVENT MEDIUM REMOVAL command.  The reason for this
> > behavior isn't clear, although it's not hard to make some guesses.
> 
> Actually I think Amazon should fix the firmware.

You are free to suggest to them that they change it.  Even if you do 
find the right people to ask about this, I'd be very surprised if they 
agreed to make the change.

> It seems the main goal was to prevent the use of open software to manage the
> content.

This is guesswork on your part, and I disagree.  I think the main goal 
was to improve the user experience by making the Kindle return to normal 
operating mode automatically when file transfers are finished, rather 
than requiring the user to do something extra.  But that's also just a 
guess.

Alan Stern
