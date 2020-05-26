Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB591E1F77
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 12:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731745AbgEZKOs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 06:14:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:38948 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726944AbgEZKOs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 06:14:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E3979B1E7;
        Tue, 26 May 2020 10:14:49 +0000 (UTC)
Message-ID: <1590488084.2838.34.camel@suse.com>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Tue, 26 May 2020 12:14:44 +0200
In-Reply-To: <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 26.05.2020, 08:59 +0000 schrieb Joakim Tjernlund:
> On Tue, 2020-05-26 at 10:47 +0200, Oliver Neukum wrote:
> > 
> > Am Montag, den 25.05.2020, 16:49 +0000 schrieb Joakim Tjernlund:
> > 
> > > To be clear, I can pull the cable and put it back and there are no garbage chars.
> > > There is also this error:
> > > [Wed May 20 14:03:25 2020] cdc_acm 1-6.3:1.1: acm_ctrl_irq - usb_submit_urb failed: -19
> > > [Wed May 20 14:03:25 2020] usb 1-6-port2: attempt power cycle
> > > [Wed May 20 14:03:26 2020] usb 1-6.3: USB disconnect, device number 86
> > > [Wed May 20 14:03:26 2020] cdc_acm 1-6.3:1.1: failed to set dtr/rts
> > > 
> > > Should not this auto reenable emulate reattaching the USB cable?
> > 
> > Hi,
> > 
> > yes it should. You find the garage characters after the EMI event. How
> > sure are you that they arrive after the event and not during the event?
> > 
> 
> Don't known how to determine that? 
> I can say that 
>    acm_ctrl_irq - usb_submit_urb failed: -19

-19 is -ENODEV

The driver thinks tries to resubmit the URB asking for control
messages.
Basically you are seeing error handling starting and failing due
to a subsequent disconnect.
 
> and
>    cdc_acm 1-6.3:1.1: failed to set dtr/rts
> are unique to this EMI event though. It does not feel like this
> reenabling follow the same procedure as a cable pull?
> As I can only see the above two errors I think we should get rid of
> these first.

The timing is different and if there is EMI transfer can end
in errors and cause error handling to kick in. You are seeing
symptoms. You can try enabling dynamic debugging to get
a better log.

	Regards
		Oliver

