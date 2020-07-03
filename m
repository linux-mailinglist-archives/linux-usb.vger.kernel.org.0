Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05AB221348D
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgGCG5M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:57:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:49366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgGCG5M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 02:57:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA1E3206DF;
        Fri,  3 Jul 2020 06:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593759431;
        bh=uJWRWO43JxASaW/OKSqEM4bw3NlXSIESiHi5CvzRorU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CatH7o2K3W2nDRHS+T9tuBDmarfElrzHRJJRpie6w4C8hVYiMtwb/Nvch4g2aHCui
         r0hEpyCXW5nsQUpvLaIc6T0atrL7OcleqYqR/0WiPoClELxC4UUGrRVEQIABsN5rsq
         FtZ1yEj07j7BmZdLUYy2XxIUVq/yHTkSoxCeKz0A=
Date:   Fri, 3 Jul 2020 08:57:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Chris Dickens <christopher.a.dickens@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, andrzej.p@samsung.com
Subject: Re: gadget: Why do Microsoft OS descriptors need their own USB
 request?
Message-ID: <20200703065715.GA2220026@kroah.com>
References: <CAL-1MmUi6OajEYNuP+OOEeekesZJjAGP-8VDSjGydXAMEFHhMA@mail.gmail.com>
 <20200703060013.GA6188@kroah.com>
 <CAL-1MmX7xKjYUUAgSGfJ7roi6W3ucD+oyQT4vmxAaDtJpjU07Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL-1MmX7xKjYUUAgSGfJ7roi6W3ucD+oyQT4vmxAaDtJpjU07Q@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Jul 02, 2020 at 11:47:09PM -0700, Chris Dickens wrote:
> Well, the history shows it was there from the very beginning, so it is
> unclear (at least to me) why it was needed.

Look in the older history trees, perhaps it is in there?

And if it pre-dates git, odds are we don't remember anymore, some of us
deal with thousands of patches a week :)

thanks,

greg k-h
