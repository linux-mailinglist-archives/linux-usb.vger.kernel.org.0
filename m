Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD563B70E
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390726AbfFJOQL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:16:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:48790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390682AbfFJOQL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 10:16:11 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F022207E0;
        Mon, 10 Jun 2019 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560176170;
        bh=RdNeTv79b9E8qs/xrXqA6ychSrjogWwPKm1yobW5SxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o+Xdh/Vt0v9tnUhPGx5LSLkGdDkepYTa/cxvnwUj6WPvCDMzOFgWk5a+vCQHm6oNG
         3xX35xAgFUDiU5IHhTdNppnoaOkFqbzfBE3j/Gybxe7h1lqoDEKqyQSW0LXeWUHtZd
         AFqSY1c/vLwdCyDSClJ7qKrsr7P4rVyXjjjFlSIg=
Date:   Mon, 10 Jun 2019 16:16:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>,
        linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        rajaram.regupathy@intel.com, abhilash.k.v@intel.com,
        m.balaji@intel.com
Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a
 raw interface on DbC
Message-ID: <20190610141607.GA5937@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-5-prabhat.chand.pandey@intel.com>
 <20190607142132.GG14665@kroah.com>
 <af51b855-4ee4-9bc2-6484-b8c4d897f503@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af51b855-4ee4-9bc2-6484-b8c4d897f503@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 10, 2019 at 04:53:51PM +0300, Mathias Nyman wrote:
> On 7.6.2019 17.21, Greg KH wrote:
> > On Fri, Jun 07, 2019 at 12:03:05PM +0530, Prabhat Chand Pandey wrote:
> > > From: Abhilash K V <abhilash.k.v@intel.com>
> > > 
> > > This patch provides a raw device interface on xhci Debug capability.
> > 
> > What is a "raw device"?
> > 
> > > This abstracts dbc functionality to user space inorder to facilitate
> > > various frameworks to utilize xhci debug capability.
> > 
> > I do not understand this sentance at all.  Please provide a lot more
> > information.
> > 
> > > It helps to render the target as an usb debug class device on host and
> > > establish an usb connection by providing two bulk endpoints.
> > 
> > provide bulk endpoints where?  To send data where?  This is very
> > confusing and does not make any sense to me...
> > 
> > 
> > > 
> > > [don't dynamically allocate tiny space for name only -Mathias]
> > > Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> > > Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
> > > Signed-off-by: Abhilash K V <abhilash.k.v@intel.com>
> > > Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > ---
> ...
> > 
> > So you have a new char device, with a undocumented and unknown format of
> > data flowing across it to the device.  How in the world are we supposed
> > to use this thing?  Where is it documented?  What does it do?  How can
> > you use it?
> > 
> > I don't mean to be so harsh here, but come on people, this stuff needs a
> > lot more background documentation, information, and explaination as to
> > exactly why in the world we need any of this, and what it even does!
> > 
> > Also, you need to fix the code, it doesn't work as pointed out in a few
> > places :)
> > 
> 
> Thanks for going through this.
> It's now clear this is far from ready.
> I need to re-evaluate my position on this, not just the code and the documentation,
> but the usefulness of it all.

What is this even supposed to be used for?  What is the application for
it?  I couldn't determine that at all, what am I missing?

thanks,

greg k-h
