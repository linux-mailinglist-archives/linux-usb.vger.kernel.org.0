Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8B015AF19
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 18:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgBLRwe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 12:52:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:43488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727361AbgBLRwe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Feb 2020 12:52:34 -0500
Received: from localhost (unknown [104.132.1.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E5AB2168B;
        Wed, 12 Feb 2020 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581529953;
        bh=pMpiC4FpmmBU8sD7mNcfoTUn3HtSLw/33KCBhawGMjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EZ/5u+F6r4sjiPb0CsL0wpUcabhAqPpBFQFhnuHQwrSVJrFg6VRVV2zRg2K3gLEW+
         oTcRZyjony6oiB2e05rYWCLlodKPYX4ngsFzhQTttssNF/afc7fM3wtWCfsXxcr4Is
         nQ3OuLHxPkf84EA/qOMtH7yS8iD351UtBQ5+pvLM=
Date:   Wed, 12 Feb 2020 09:52:33 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v3 0/6] Add Apple MFi fastcharge USB device driver
Message-ID: <20200212175233.GB1872825@kroah.com>
References: <20191016093933.693-1-hadess@hadess.net>
 <2f9b9dad3e8b390f70168b2fef1607f0b72ce7c3.camel@hadess.net>
 <a03988283e4858c0eb00e46bd9c41f52e356d1e0.camel@hadess.net>
 <20200107093508.GA1028311@kroah.com>
 <11a4cee8a055c482ce0ba5b06dcdbe157e082a2d.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11a4cee8a055c482ce0ba5b06dcdbe157e082a2d.camel@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 11, 2020 at 01:21:15AM +0100, Bastien Nocera wrote:
> On Tue, 2020-01-07 at 10:35 +0100, Greg Kroah-Hartman wrote:
> > On Tue, Jan 07, 2020 at 09:46:50AM +0100, Bastien Nocera wrote:
> > > Hey,
> > > 
> > > On Thu, 2019-11-21 at 16:20 +0100, Bastien Nocera wrote:
> > > > Hey,
> > > > 
> > > > Any updates on getting this into the USB tree?
> > > > 
> > > > Alan acked the patchset more than a month ago.
> > > 
> > > Thought I'd ask again, the 6 patches were acked by Alan, and tested
> > > by
> > > me. Is there any chance they could be considered for merging, or
> > > reviewed?
> > 
> > Ugh, sorry, these fell through the cracks.  They are still in my
> > "to-review" queue, I'll try to get to them by the end of the week.
> 
> Hey,
> 
> It's been a month, and it missed the last merge window. Is there
> anything else I should be doing?

{sigh} my fault, will look at this today, sorry...
