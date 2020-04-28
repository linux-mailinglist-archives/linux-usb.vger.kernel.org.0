Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778781BC5F5
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 19:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgD1RBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 13:01:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:60384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgD1RBe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 13:01:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 763C020730;
        Tue, 28 Apr 2020 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588093293;
        bh=0LphSW+nEOML3VabclV/1ydlTPntModDS9qr0NH2AGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0L2gF98Q4RDgjaF+I9aQo8T9XAT8iLGb+3vDL8CTnhGu6sixUx95sAgP9Uwk7jYA9
         Nkx7UML2SnLIKUjDyo3yfAQZy8JRZF0o4+h206FCDdWZtIOE2sAuCVvjIeUmGEjnfZ
         PvhmieixMtGTtvlW1PQIxqMOtTqT+ZZ6zqIm26Jc=
Date:   Tue, 28 Apr 2020 19:01:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.7-rc4
Message-ID: <20200428170131.GA1641691@kroah.com>
References: <20200428090956.GR487496@lahna.fi.intel.com>
 <20200428105018.GA1143911@kroah.com>
 <20200428115815.GY487496@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428115815.GY487496@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 28, 2020 at 02:58:15PM +0300, Mika Westerberg wrote:
> On Tue, Apr 28, 2020 at 12:50:18PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 28, 2020 at 12:09:56PM +0300, Mika Westerberg wrote:
> > > Hi Greg,
> > > 
> > > The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
> > > 
> > >   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.7-rc4
> > > 
> > > for you to fetch changes up to 9d2214b14103594efdbf33018b893b9417846d42:
> > > 
> > >   thunderbolt: Check return value of tb_sw_read() in usb4_switch_op() (2020-04-20 11:54:19 +0300)
> > > 
> > > ----------------------------------------------------------------
> > > thunderbolt: Fix for v5.7-rc4
> > > 
> > > - Fix checking return value of tb_sw_read() in usb4_switch_op().
> > > 
> > > ----------------------------------------------------------------
> > > Mika Westerberg (1):
> > >       thunderbolt: Check return value of tb_sw_read() in usb4_switch_op()
> > 
> > Why does this commit not have a cc: stable tag on it?  I can apply it by
> > hand and add it, but that will not show up as a pull request/merge, is
> > that ok?
> 
> I'm not sure this qualifies as stable material to be honest. Changes
> that this triggers is really low because there are no USB4 devices
> available for public at the moment (that's the reason I did not add the
> tag).
> 
> If you still think it should have stable tag, then it would be great if
> you could add it. It is fine if it goes in as a patch not a merge.

I'll add it and queue it up now, thanks.

greg k-h
