Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD562076F3
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 17:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404169AbgFXPNG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 11:13:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:52556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403831AbgFXPNG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Jun 2020 11:13:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66A8F20656;
        Wed, 24 Jun 2020 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593011585;
        bh=DFYjcKM/PfZZ+GdRNKYaTR5uxWIH72AzYOaF2eVTr28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1pIqZ4ks/sHQwNQqamr9FMzy45J42X0KA/5lROjQyOCH1cWoiWVNoir7pXnFzu/7q
         HtCXT7am8GpCbvCFKnhKpweojmlsyw/y936InRnWa+C5/udZ41K5DqTn8j7vW9GOjf
         a5BYaSeJKVrk4WQznwXcK32GRXXqcyLa+uwP+PEg=
Date:   Wed, 24 Jun 2020 17:13:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     Changming Liu <charley.ashbringer@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "thomas@winischhofer.net" <thomas@winischhofer.net>
Subject: Re: [PATCH 0/4] USB: sisusbvga: series of changes char to u8
Message-ID: <20200624151304.GA1977333@kroah.com>
References: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
 <20200619070053.GA543232@kroah.com>
 <BN6PR06MB2532B0A36A0C4781BEBB4387E5980@BN6PR06MB2532.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN6PR06MB2532B0A36A0C4781BEBB4387E5980@BN6PR06MB2532.namprd06.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 19, 2020 at 08:50:52PM +0000, Changming Liu wrote:
> > > This patch series changes all appropriate instances of signed char
> > > arrays or buffer to unsigned char.
> > >
> > > For each patch, if changing one variable to u8 involves its
> > > callers/callees, then those changes are included in that patch as
> > > well.
> > >
> > > This doesn't apply to ioctl functions, since the types for buffer of
> > > ioctl-like functions needs to be char* instead of u8* to keep the
> > > compiler happy.
> > 
> > Why is that?  What is forcing those types to be that way?  These are all self-
> > contained in the driver itself, so they should be able to be changed, right?
> > 
> > Do you have an example of a function that you want to change but somehow
> > can not?
> > 
> Sorry for this confusion, I should have put more context into this patch.
> This is a re-send of a former patch which was rejected by kernel build
> test robot when I tried to change all char instances of this driver to
> u8 in order to remove any potential undefined behaviors.
> 
> This patch(also the former rejected one) were based on a former discussion
> with you, the email was quite lengthy, so I attached the link here for 
> your reference. https://www.spinics.net/lists/linux-usb/msg196153.html
> 
> In conclusion, only the one I noted in the link has security implication 
> and should be fixed, the other changes from char to u8 are just 
> "in case".
> 
> If you still think it's needed to change all instances 
> of char in this driver to u8, I'll enrich the patch note(which I should 
> have done earlier) and re-send the patch series again.
> Or if you think just fixing that specific UB in sisusb_write_mem_bulk
> is enough, I'll submit another patch.

I think cleaning up everything is good, so fixing that up and resending
it would be great to have.

thanks,

greg k-h
