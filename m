Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC8C1DFF65
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 16:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729539AbgEXOec (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 10:34:32 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39227 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728320AbgEXOec (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 May 2020 10:34:32 -0400
Received: (qmail 3405 invoked by uid 1000); 24 May 2020 10:34:31 -0400
Date:   Sun, 24 May 2020 10:34:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Till =?iso-8859-1?Q?D=F6rges?= <doerges@pre-sense.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
Message-ID: <20200524143431.GA3275@rowland.harvard.edu>
References: <512118bc-e639-2387-e608-56b7e30fc3b2@pre-sense.de>
 <20200523154817.GA7091@rowland.harvard.edu>
 <34933b01-e4b0-10da-c935-9e6a9a6ae427@pre-sense.de>
 <20200523203349.GA12853@rowland.harvard.edu>
 <816c9c46-6845-e09f-9c67-ecd2427eb9c4@pre-sense.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <816c9c46-6845-e09f-9c67-ecd2427eb9c4@pre-sense.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 24, 2020 at 09:46:06AM +0200, Till Dörges wrote:
> Am 23.05.20 um 22:33 schrieb Alan Stern:
> 
> >>>> I'm trying to get external HDDs from Sony to work under Linux with USB 3.0.
> >> [...]
> >>>>  - PSZ-HA2T: idVendor=054c, idProduct=087d
> >>>>  - PSZ-HA1T: idVendor=054c, idProduct=087d
> >>>>  - PSZ-HA50: idVendor=054c, idProduct=087d
> >>>>  - PSZ-HC1T: idVendor=054c, idProduct=0c4f
> [...]
> >> Because with setting the f flag (via options usb-storage quirks=054c:087d:f) the
> >> PSZ-HA*1*T starts behaving nicely.
> [...]
> >> The PSZ-HA*2*T, however, still doesn't work with that.
> [...]
> > That device seems to be behaving so badly, it's hard to tell what the 
> > underlying problem is.
> > 
> > I'd start by blacklisting the device for UAS, so forcing it to use 
> > usb-storage, which is a somewhat simpler protocol.  Next, you should 
> > collect a usbmon trace showing what happens when you plug in the 
> > PSZ-HA2T.  That will tell us what's going on, even if it doesn't suggest 
> > a way to work around the problems.
> > 
> > (The instructions for usbmon are in the kernel source file 
> > Documentation/usb/usbmon.rst.)
> 
> Thanks. Will give that a shot.
> 
> 
> Is there any way to differentiate between devices other than vendor and product ID?
> 
> Because the PSZ-HA1T (which seems to be working thanks to your help) and the PSZ-HA2T
> (which still refuses to work) have the *same* vendor and product ID.

There's also the bcdDevice value.  It is ignored for quirks specified by 
the "quirks=" module parameter, but it is used for quirks stored in the 
unusual_devs.h or unusual_uas.h files in the kernel source code.

Alan Stern
