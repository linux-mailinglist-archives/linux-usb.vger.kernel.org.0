Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9A32D316E
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 18:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbgLHRp5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 12:45:57 -0500
Received: from netrider.rowland.org ([192.131.102.5]:38571 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727998AbgLHRp4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 12:45:56 -0500
Received: (qmail 1304838 invoked by uid 1000); 8 Dec 2020 12:45:15 -0500
Date:   Tue, 8 Dec 2020 12:45:15 -0500
From:   'Alan Stern' <stern@rowland.harvard.edu>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>
Cc:     'Oliver Neukum' <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS
Message-ID: <20201208174515.GG1298255@rowland.harvard.edu>
References: <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>
 <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>
 <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
 <918e298941f820a7cc3310c95dc211cca7596dba.camel@suse.com>
 <000e01d6c980$d9a75f70$8cf61e50$@perdrix.co.uk>
 <005601d6cc87$2fa608f0$8ef21ad0$@perdrix.co.uk>
 <36ac7a79c4b24f9f68b3543d18a51ec9af0a4933.camel@suse.com>
 <000701d6cd7c$236ec8b0$6a4c5a10$@perdrix.co.uk>
 <20201208162722.GC1298255@rowland.harvard.edu>
 <000801d6cd81$dc303370$94909a50$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000801d6cd81$dc303370$94909a50$@perdrix.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 08, 2020 at 04:47:44PM -0000, David C. Partridge wrote:
> >This is puzzling.  The device connected at SuperSpeed in the previous
> tests.  Clearly this is related to the warning in the preceding line (the
> port failed to configure its link partner).
> 
> >What could have happened?  A problem in the cable?
> 
> Previous test was using a 3m long cable.
> 
> Tried again with a 1m cable:
> 
> Dec 08 16:38:30 charon kernel: usb 2-1: new SuperSpeed Gen 1 USB device
> number 2 using xhci_hcd
...

So it worked.

> I then tried again using the 3m long cable and got the same error as before
> and connected at high-speed not SuperSpeed
> 
> Should I expect problems with a 3m long cable or does this say the 3m long
> cable is faulty? 

IT depends on the thickness (gauge) of the wires inside the cable.  
There's a table (11-3) in the USB-3.1 spec that lists maximum cable 
length for a variety of gauges.

For AWG 28 the maximum cable length is 0.8 meters.  For AWG 20 the 
maximum length is 5.3 meters.  Your cable is likely to be somewhere in 
that range, but I don't know where.

On the bright side, it looks like you have found the answer to all the 
problems.  :-)

Alan Stern
