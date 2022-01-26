Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883BA49C0EC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 02:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbiAZBvj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 20:51:39 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41145 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236019AbiAZBvi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 20:51:38 -0500
Received: (qmail 124177 invoked by uid 1000); 25 Jan 2022 20:51:37 -0500
Date:   Tue, 25 Jan 2022 20:51:37 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Nazarewicz <mina86@mina86.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: f_mass_storage: Make CD-ROM emulation
 work with Mac OS-X
Message-ID: <YfCpKfIqGiGkTP3f@rowland.harvard.edu>
References: <20220124160150.19499-1-quic_jackp@quicinc.com>
 <20220126012154.GH3221@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126012154.GH3221@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 25, 2022 at 05:21:54PM -0800, Jack Pham wrote:
> On Mon, Jan 24, 2022 at 08:01:50AM -0800, Jack Pham wrote:
> > From: Roger Quadros <roger.quadros@nokia.com>
> > 
> > Mac OS-X expects CD-ROM TOC in raw format (i.e. format:2). It also
> > sends the READ_TOC CDB in old style SFF8020i format. i.e. 2 format bits
> > are encoded in MSBs of CDB byte 9.
> > 
> > This patch will enable CD-ROM emulation to work with Mac OS-X. Tested on
> > Mac OS X v10.6.3.
> > 
> > Signed-off-by: Roger Quadros <roger.quadros@nokia.com>
> > Signed-off-by: Jack Pham <quic_jackp@quicinc.com>
> > ---
> > v4: Updated return length as I had inadvertently applied an earlier version of
> >     Roger's patch which had the same mistake [2]
> 
> Hi Alan, if this looks fine to you would you please mind providing your
> Acked-by again?

Sure, this is good, a simple fix to the earlier version of the patch.  
In fact, I should have noticed the wrong length value while reading it.

Acked-by: Alan Stern <stern@rowland.harvard.edu>


> Also, if there are no objections, I think this patch can qualify as a
> bugfix and I can send a v5 Cc'ed to stable with a Fixes tag of commit
> d5e2b67aae79 ("USB: g_mass_storage: template f_mass_storage.c file
> created") -- basically this has been around for as long as
> f_mass_storage.c itself (if not even before when CD-ROM emulation was
> first introduced to the former file_storage gadget).

Whether to call it a bug fix is questionable, because this interface 
never worked with Mac OSX.  But if you want it to be merged into the 
-stable kernels, I have no objection.  Greg KH may not agree...

Alan Stern
