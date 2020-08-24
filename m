Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81AA024F335
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 09:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgHXHkK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 03:40:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:56604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbgHXHkJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 03:40:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0EB72075B;
        Mon, 24 Aug 2020 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598254809;
        bh=X7htA40GdFkjs1/tXtG35GsISNmIomtrSMtXGVM4/Yg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1CipUioANad4wCkIwJ7ZvVKlu4jbI5kpTvksWQc1zs50qlaLDfbANOp00pJXbMbw7
         ZoVUcje9Qd+vB6bhvxsVtd4zWhdlmQ5dxRtE/53KzqCqxUjbjGiC5RYZc/SoIug0mS
         nSswDiYTIuoo3bVLjsfRpyBVsigBnV40/92i6MvE=
Date:   Mon, 24 Aug 2020 09:40:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Cyril Roelandt <tipecaml@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org, javhera@gmx.com,
        brice.goglin@gmail.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200824074027.GB3983120@kroah.com>
References: <20200421030137.GA2492@Susan>
 <20200815001829.GA2786@Susan>
 <20200815021929.GC52242@rowland.harvard.edu>
 <20200815232357.GB2786@Susan>
 <20200816162642.GC86937@rowland.harvard.edu>
 <20200818041324.GA3173@Susan>
 <20200818145722.GA146472@rowland.harvard.edu>
 <20200823013025.GA11449@Susan>
 <20200823144752.GB303967@rowland.harvard.edu>
 <20200823180837.GA3448@Susan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823180837.GA3448@Susan>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 23, 2020 at 08:08:37PM +0200, Cyril Roelandt wrote:
> Hello,
> 
> On 2020-08-23 10:47, Alan Stern wrote:
> > Yes; it looks like the problem is that there are entries for this device 
> > in both unusual_devs.h and unusual_uas.h -- and it doesn't help that the 
> > two entries aren't identical.
> > 
> > The unusual_devs.h entry tells usb-storage not to use FUA, but it 
> > doesn't rule out the uas driver.  And since the device claims to support 
> > UAS, usb-storage bows out.  But then the unusual_uas.h entry tells uas 
> > not to handle the drive, so the end result is that it doesn't get 
> > handled at all.
> > 
> > To fix the immediate problem you should add the US_FL_IGNORE_UAS flag to 
> > the entry in unusual_devs.h.
> 
> That did the trick[1]. Do you think this patch could be suitable for a
> future version of the kernel?
> 
> 
> Cyril
> 
> [1] https://framagit.org/Steap/linux/-/commit/c6b6f436f9c96a01101e9407ed481684c37fa87d

Can you submit this in a format that we can easily review, and hopefully
apply, it?

thanks,

greg k-h
