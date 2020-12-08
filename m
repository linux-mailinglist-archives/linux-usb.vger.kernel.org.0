Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52D62D2FA9
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 17:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730514AbgLHQ2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 11:28:04 -0500
Received: from netrider.rowland.org ([192.131.102.5]:46925 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730183AbgLHQ2D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 11:28:03 -0500
Received: (qmail 1301225 invoked by uid 1000); 8 Dec 2020 11:27:22 -0500
Date:   Tue, 8 Dec 2020 11:27:22 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>
Cc:     'Oliver Neukum' <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS
Message-ID: <20201208162722.GC1298255@rowland.harvard.edu>
References: <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>
 <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>
 <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>
 <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>
 <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
 <918e298941f820a7cc3310c95dc211cca7596dba.camel@suse.com>
 <000e01d6c980$d9a75f70$8cf61e50$@perdrix.co.uk>
 <005601d6cc87$2fa608f0$8ef21ad0$@perdrix.co.uk>
 <36ac7a79c4b24f9f68b3543d18a51ec9af0a4933.camel@suse.com>
 <000701d6cd7c$236ec8b0$6a4c5a10$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000701d6cd7c$236ec8b0$6a4c5a10$@perdrix.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 08, 2020 at 04:06:49PM -0000, David C. Partridge wrote:
> >> 2-1: USB disconnect, device number 2
> 
> >Again, did you plug the cable or did the device spontaneously disconnect?
> 
> That was a spontaneous disconnect.
> 
> > In this case, could you retry with
> > usb-storage quirks=059f:105f:kf
> 
> Sure! The results are in general a lot more promising (apart from the first line) - plus I was able to read/write files without problems:
> 
> Dec 08 15:47:48 charon kernel: usb usb2-port6: config error
> Dec 08 15:47:49 charon kernel: usb 1-6: new high-speed USB device number 4 using xhci_hcd

This is puzzling.  The device connected at SuperSpeed in the previous 
tests.  Clearly this is related to the warning in the preceding line 
(the port failed to configure its link partner).

What could have happened?  A problem in the cable?

The usb-storage quirk setting would not have affected this.

Alan Stern
