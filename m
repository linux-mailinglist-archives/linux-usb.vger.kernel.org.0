Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78492D336F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 21:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgLHUTU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 15:19:20 -0500
Received: from avasout01.plus.net ([84.93.230.227]:51733 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgLHUSP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 15:18:15 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id mjAKkz4Uqn8O7mjALkcUPK; Tue, 08 Dec 2020 20:00:58 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Ld6nFgXi c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=kj9zAlcOel0A:10 a=P1kZ4gAsAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8
 a=TLdEE8NKXQqG-gpGWbIA:9 a=CjuIK1q_8ugA:10 a=fn9vMg-Z9CMH7MoVPInU:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com> <000001d6c89c$086812e0$193838a0$@perdrix.co.uk> <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk> <918e298941f820a7cc3310c95dc211cca7596dba.camel@suse.com> <000e01d6c980$d9a75f70$8cf61e50$@perdrix.co.uk> <005601d6cc87$2fa608f0$8ef21ad0$@perdrix.co.uk> <36ac7a79c4b24f9f68b3543d18a51ec9af0a4933.camel@suse.com> <000701d6cd7c$236ec8b0$6a4c5a10$@perdrix.co.uk> <20201208162722.GC1298255@rowland.harvard.edu> <000801d6cd81$dc303370$94909a50$@perdrix.co.uk> <20201208174515.GG1298255@rowland.harvard.edu>
In-Reply-To: <20201208174515.GG1298255@rowland.harvard.edu>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Tue, 8 Dec 2020 20:00:52 -0000
Message-ID: <003e01d6cd9c$d8777cf0$896676d0$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJfP5HDkXWJEZOH15z/N9BPLD1dpgG/r2JFAdm0H9gDCO/tjgMSOm1iAh4l/iEBj9gVBwK4lVYdAUVD4c0Bv1AblAGAacOEqDe4LsA=
X-CMAE-Envelope: MS4wfHdr3+OPjIKptzR6YE5HpKypwZ+m7WLqR8aN8UJU+cOjHjx32t4eFJVP2/fP84zx2QEr0GdCtyHzvOvd1kHTCg9qlN432SRurEbjS3Al13PM658oug0a
 EGyL3QH9V3smk2t/cF6eLXIuXLimfDxmOKBK/WayUDhUVZZVzdqP7BBu89TnEMsFGpe5YthcCF6HQA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you to both Oliver and to you.

I'll chase up the supplier over the cable.

Would I be right to assume that this LaCie device (and other Seagate USB
devices) will the added to the database of quirks? So that when Oliver's fix
goes "mainstream" no-one will need to add options for modprobe?

Hmm I wonder how long it will take the Ubuntu Kernel to catch up with
Olivers patch?

Thanks again,
David

-----Original Message-----
From: 'Alan Stern' <stern@rowland.harvard.edu> 
Sent: 08 December 2020 17:45
To: David C. Partridge <david.partridge@perdrix.co.uk>
Cc: 'Oliver Neukum' <oneukum@suse.com>; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

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

> I then tried again using the 3m long cable and got the same error as
before
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

