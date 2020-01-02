Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 867FF12E758
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 15:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728526AbgABOnL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 09:43:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:44912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728425AbgABOnL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jan 2020 09:43:11 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A07021734;
        Thu,  2 Jan 2020 14:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577976190;
        bh=n4AM9LRCWJXAhltDcmCKVNCRSqTreCc4/lgTFxpkwDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oOezIZcQfCHPx6kby/tHNLiYkc/GsZbuiwBqNvaPgPU5/jssAAf85gPNemTuag9UW
         LHjY+KNFyyMQi3sPcZJMY0AR77+XBhWLIQM2Av6nB5nxHf+Mh3ctLIRzRNHb3DZadh
         3f2/YIqAiBBvrKKp+Nmd+wgkYLRWhKE1ExwvN8Ho=
Date:   Thu, 2 Jan 2020 15:43:08 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: Changed commit author date of queued commits
Message-ID: <20200102144308.GA4022303@kroah.com>
References: <c1fe8040-b35d-70a0-6906-a82d20cc93f1@molgen.mpg.de>
 <20200102142200.GA4020988@kroah.com>
 <25813021-f136-fb30-71da-c2ff522141b1@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25813021-f136-fb30-71da-c2ff522141b1@molgen.mpg.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 02, 2020 at 03:36:07PM +0100, Paul Menzel wrote:
> Dear Greg,
> 
> 
> On 2020-01-02 15:22, Greg KH wrote:
> > On Thu, Jan 02, 2020 at 03:15:04PM +0100, Paul Menzel wrote:
> 
> >> Looking at [1] and [2], the commit author timestamps differ. Mika’s commit
> >> in Patchwork is from Nov. 13, 2019, 5:32 p.m. UTC, and you committed it the
> >> day after.
> >>
> >> But, the date of the commit you sent is Wed, 11 Dec 2019 16:20:02 +0200 [2].
> >>
> >> Is that expected? Should the tag(?) be added in all “forwarded” commits
> >> to the list?
> > 
> > What "tag" would that be?
> > 
> > Mathias sent the patches to me through email, and then I applied them to
> > my tree.  The authorship timestamp ends up being that final email.
> > 
> > Nothing new here, this is how things have always worked :)
> 
> If you add
> 
>     Date: Thu Jan 2 13:16:21 2020 +0100
> 
> in the beginning of the message body, `git am` will take that as author date
> instead of the date in the email header.
> 
> `git help am` does not state that, but `git help format-patch` and the
> format it creates shows that this is how it works, and I just tested this,
> and it works this way.

So how would one export the patches from git, and pass them to 'git
send-email' in a way that would preserve this tag?

But step back here, why is this an issue at all?

thanks,

greg k-h
