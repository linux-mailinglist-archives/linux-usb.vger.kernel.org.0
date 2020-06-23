Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42467205532
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 16:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732925AbgFWOyz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 10:54:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57017 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732821AbgFWOyy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jun 2020 10:54:54 -0400
Received: (qmail 179264 invoked by uid 1000); 23 Jun 2020 10:54:53 -0400
Date:   Tue, 23 Jun 2020 10:54:53 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        cristian.birsan@microchip.com, iain.galloway@nxp.com,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@puri.sm" <kernel@puri.sm>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: Microchip USB2642 Hub not resuming from USB autosuspend
Message-ID: <20200623145453.GA178927@rowland.harvard.edu>
References: <8738e4d3-62b1-0144-107d-ff42000ed6c6@puri.sm>
 <021b18e4-343d-76d2-5d35-817d576f503e@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <021b18e4-343d-76d2-5d35-817d576f503e@puri.sm>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 23, 2020 at 03:48:01PM +0200, Martin Kepplinger wrote:

> We've resolved this issue too. When scsi (sd) runtime pm is not enabled
> by default, it needs to be enabled of course and events_dfl_poll_msecs
> for the block layer set to 0.

Actually that last step isn't needed.  But if you don't do it, the device 
will wake up from runtime suspend every time the block layer polls it.  So 
you probably do want to either turn off polling or increase the polling 
interval significantly.

> scsi sd has until now incomplete support for runtime pm and this
> addition makes it work, i.e. suspend when not mounted:
> https://lore.kernel.org/linux-scsi/20200623111018.31954-1-martin.kepplinger@puri.sm/T/
> the whole USB path is suspended as a consequence - and woken up if opened.

I don't understand this.  As far as I know, runtime-PM support in the SCSI 
and block layers has been complete for many years.  If you have to do 
anything extra (like applying the patch in the email you mentioned) then 
something is broken.  The device should be able to go into runtime suspend 
just fine with the current code -- even when a file system is mounted.

Alan Stern
