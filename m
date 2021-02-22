Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B5C3214EC
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 12:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230345AbhBVLSO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 06:18:14 -0500
Received: from server.atrad.com.au ([150.101.241.2]:52826 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbhBVLSN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 06:18:13 -0500
Received: from marvin.atrad.com.au (IDENT:1008@marvin.atrad.com.au [192.168.0.2])
        by server.atrad.com.au (8.15.2/8.15.2) with ESMTPS id 11MBH76F018260
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 22 Feb 2021 21:47:09 +1030
Date:   Mon, 22 Feb 2021 21:47:07 +1030
From:   Jonathan Woithe <jwoithe@just42.net>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Samsung T5 500 GB USB3.1 SSD fails with ASMedia ASM1142, 250 GB
 version works
Message-ID: <20210222111707.GA26487@marvin.atrad.com.au>
References: <20210219102218.GA29156@marvin.atrad.com.au>
 <cdb0ab8e14de5f93dfae2164f18d9d1703b3fc36.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdb0ab8e14de5f93dfae2164f18d9d1703b3fc36.camel@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.79 on 192.168.0.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 22, 2021 at 11:24:18AM +0100, Oliver Neukum wrote:
> Am Freitag, den 19.02.2021, 20:52 +1030 schrieb Jonathan Woithe:
> 
> > Since some people have reported success with ASMedia cards if the uas driver
> > is prevented from loading, I tried this too.
> > 
> >   rmmod uas
> >   rmmod usb-storage
> >   modprobe usb-storage quirks=04e8:61f5:u
> 
> this rules out an issue with UAS.
> 
> > This still ended in failure along similar lines:
> > 
> >   usb 4-1: new SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd
> >   usb-storage 4-1:1.0: USB Mass Storage device detected
> >   usb-storage 4-1:1.0: Quirks match for vid 04e8 pid 61f5: 800000
> >   scsi host10: usb-storage 4-1:1.0
> >   usb 4-1: reset SuperSpeedPlus Gen 2 USB device number 3 using xhci_hcd (x6)
> >   sd 10:0:0:0: [sdd] tag#0 UNKNOWN(0x2003) Result: hostbyte=0x07 driverbyte=0x00 cmd_age=0s
> >   sd 10:0:0:0: [sdd] tag#0 CDB: opcode=0x2a 2a 00 23 1c 34 30 00 02 00 00
> > 
> > After 7 repeats of the above sequence the operation failed.
> > 
> > It may be helpful to know that the same 500 GB SSD does work on a different
> > machine when connected to usbc or usb3 ports with kernel 4.4.19.  These
> > ports on that machine are provided by a mainboard host controller:
> 
> Is it bus powered or self powered?

Both the 250 GB drive (which works well) and the 500 GB drive (which
doesn't) are Samsung T5 SSDs.  They are bus powered.  There is no separate
power input socket on these SSDs.

> It is possible that the other machine can just supply more power.

On the machine with the ASMedia controller (where the problem occurs), the
500 GB SSD works perfectly well when connected to USB2 sockets.  If a USB2
socket can supply sufficient power, wouldn't a USB3 port be more than
capable?

The specifications for both the 250 GB (working) and 500 GB (not working)
are 5V at 0.8A.  I'm guessing this is a worst-case scenario.  In any case,
this is well within the capabilities of a USB3 port.  If there was a power
issue with one of these drives it's surprising it's not seen in both -
unless the 250 GB is just under the critical power threshold and the 500 GB
is just above it.  Is there an easy way to tell if this is indeed the case?

Regards
  jonathan
