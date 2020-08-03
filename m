Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C9D23AA13
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 18:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbgHCQCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 12:02:23 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53915 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726457AbgHCQCW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Aug 2020 12:02:22 -0400
Received: (qmail 110633 invoked by uid 1000); 3 Aug 2020 12:02:21 -0400
Date:   Mon, 3 Aug 2020 12:02:21 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 3/3] USB: Fix device driver race
Message-ID: <20200803160221.GA108905@rowland.harvard.edu>
References: <20200727104644.149873-1-hadess@hadess.net>
 <20200727104644.149873-3-hadess@hadess.net>
 <64c8caa8ee054ed9106683f15238b2be74f77aa2.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64c8caa8ee054ed9106683f15238b2be74f77aa2.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 03, 2020 at 05:04:46PM +0200, Bastien Nocera wrote:
> On Mon, 2020-07-27 at 12:46 +0200, Bastien Nocera wrote:
> > When a new device with a specialised device driver is plugged in, the
> > new driver will be modprobe()'d but the driver core will attach the
> > "generic" driver to the device.
> > 
> > After that, nothing will trigger a reprobe when the modprobe()'d
> > device
> > driver has finished initialising, as the device has the "generic"
> > driver attached to it.
> > 
> > Trigger a reprobe ourselves when new specialised drivers get
> > registered.
> > 
> > Fixes: 88b7381a939d ("USB: Select better matching USB drivers when
> > available")
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> Greg, Alan, are you happy with this iteration?
> 
> If so, I can send it again with Alan's acks, along with a fix for the
> function name Alan mentioned. I see that the first patch in the list
> landed in usb-next already.

This is almost the same as v5, which I already Acked.  The only 
difference is the error logging when the reprobe fails, and that looks 
fine.  So...

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
