Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D838725AAD1
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 14:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgIBMF0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 08:05:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:49320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbgIBMFV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 08:05:21 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE1282078B;
        Wed,  2 Sep 2020 12:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599048321;
        bh=u+4ibBvp2QzwwGZqBQIQYYibjqDiypNttDcy+bmGWpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EkbLsyVQeqtFP3lPZhdCdBoNoyzY1duYw73OYPQOBF1m0SMudE1DhtKZw7dZy3h0F
         UtlagFn8x1V9EzgOrPgJUQx54U2C9f7KdRTU9nYezzM6WrAGb9ImIrQdQWhjwqrH/u
         klr5mPzoErU9rMbjGGm5RSs5uhT0c3XrsOqiO36Q=
Date:   Wed, 2 Sep 2020 14:05:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= 
        <santiago.ruano-rincon@imt-atlantique.fr>
Cc:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.de>,
        miguel@det.uvigo.es, 965074@bugs.debian.org
Subject: Re: Patches to make multicast proccesing on CDC NCM drivers
Message-ID: <20200902120546.GA2008696@kroah.com>
References: <20200730135334.GN1496479@bartik>
 <1596118042.2508.6.camel@suse.de>
 <20200902114718.GB242939@bartik>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200902114718.GB242939@bartik>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 02, 2020 at 01:47:18PM +0200, Santiago Ruano Rincón wrote:
> El 30/07/20 a las 16:07, Oliver Neukum escribió:
> > Am Donnerstag, den 30.07.2020, 15:53 +0200 schrieb Santiago Ruano
> > Rincón:
> > > Hi,
> > > 
> > > Miguel Rodríguez sent this set of patches two years ago to fix the lack
> > > of multicast processing on CDC NCM driver:
> > > 
> > > https://www.spinics.net/lists/linux-usb/msg170611.html
> > > https://www.spinics.net/lists/linux-usb/msg170603.html
> > > https://www.spinics.net/lists/linux-usb/msg170567.html
> > > https://www.spinics.net/lists/linux-usb/msg170568.html
> > > 
> > > I've using a DKMS version of them, available in
> > > https://github.com/stbuehler/fixed-cdc-ether-ncm/tree/wip/patches
> > > since more than a year ago, and they are working fine with my Dell D6000
> > > docking station. IPv6 connectivity is broken without them.
> > > 
> > > Is there any chance to consider those patches (or what would be needed
> > > to make it happen)?
> > > It would be great to have them upstream!
> > 
> > Hi,
> > 
> > they have been merged on Wednesday.
> …
> 
> Great, thanks!
> 
> It would be possible to apply/backport Miguel's patches (along with
> 5fd99b5d9950d6300467ded18ff4e44af0b4ae55) to stable versions please?

I don't see that git commit id in Linus's tree, are you sure it is
correct?

> FWIW, in the context of Debian, I'm personally interested in 4.19.y.

What specific list of commits are you wanting to see backported?

thanks,

greg k-h
