Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A0B22630C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 17:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgGTPM5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 11:12:57 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33309 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726769AbgGTPM5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 11:12:57 -0400
Received: (qmail 1232970 invoked by uid 1000); 20 Jul 2020 11:12:55 -0400
Date:   Mon, 20 Jul 2020 11:12:55 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: kworker/0:3+pm hogging CPU
Message-ID: <20200720151255.GE1228057@rowland.harvard.edu>
References: <20200720083956.GA4074@dhcp22.suse.cz>
 <20200720135857.GB1228057@rowland.harvard.edu>
 <20200720143213.GJ4074@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720143213.GJ4074@dhcp22.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 20, 2020 at 04:32:13PM +0200, Michal Hocko wrote:
> On Mon 20-07-20 09:58:57, Alan Stern wrote:
> [...]
> > Can you provide the contents of /sys/kernel/debug/usb/devices and also a 
> 
> attached.

It looks like you've got just two devices, only one of which is in use, 
on bus 1 (the non-SuperSpeed bus) and nothing on bus 2.

> > usbmon trace showing a few rounds of this recurring activity?
> 
> This is not my area so I will need some help here. I assume I should
> look for debug/usb/usbmon which contains quite some files for me
> 0s  0u  1s  1t  1u  2s  2t  2u
> most of them provide data when cating them.

The interesting files are 1u (for bus 1) and 2u (for bus 2).  At the 
moment, though, we don't know which bus the troublesome 
device/controller is on.

> > section of the dmesg log with dynamic debugging enabled for the usbcore 
> > module, as well.
> 
> Could you give me more details steps please?

Do:

	sudo echo 'module usbcore =p' >/debug/dynamic_debug/control

Then wait long enough for some interesting messages to appear in the 
kernel log (it should only take a few seconds if the worker thread is as 
busy as you say) and collect the output from the dmesg command.

To turn dynamic debugging back off when you're finished, use the same 
command with "=p" changed to "-p".

Alan Stern
