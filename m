Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B6213BF21
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 13:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbgAOMDi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 07:03:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgAOMDh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 07:03:37 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8D752187F;
        Wed, 15 Jan 2020 12:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579089817;
        bh=/tUx1Wbe5U7ScFEYlDhpM8gvGVLYPR4gr6BFFZmJhNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K65HMpVVO9w7+zRJ7dtP0b3NfTyByXS7KubzJ8ChqmvN22ivWrWUg/oeBjmCUvE0K
         pPXV3R2f859YkfL8JdFnR2cXYDoV6uWGyLbKVWmu1L/T73G+NZVBARC8WG5q0OOUhE
         lr78qZTCHXP6K2GoCZrbLBNT9BsgyExRE8lzRRKw=
Date:   Wed, 15 Jan 2020 13:03:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: changes for v5.6 merge window
Message-ID: <20200115120334.GB3270387@kroah.com>
References: <878sm96pzf.fsf@kernel.org>
 <20200115092813.GA3153837@kroah.com>
 <20200115093746.GA3177342@kroah.com>
 <8736ch6mbe.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8736ch6mbe.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 15, 2020 at 12:33:41PM +0200, Felipe Balbi wrote:
> 
> Hi,
> 
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > On Wed, Jan 15, 2020 at 10:28:13AM +0100, Greg Kroah-Hartman wrote:
> >> On Wed, Jan 15, 2020 at 11:14:28AM +0200, Felipe Balbi wrote:
> >> > 
> >> > Hi Greg,
> >> > 
> >> > here's my pull request for v5.6 merge window. If you want anything to be
> >> > changed, let me know.
> >> 
> >> Did you send this twice?  Any difference?
> >> 
> >
> > I did a pull, and get this problem when checking the patches:
> >
> > Commit: 6a6ae4e8e926 ("usb: gadget: f_ncm: Use atomic_t to track in-flight request")
> > 	Fixes tag: Fixes: 40d133d7f5426 ("usb: gadget: f_ncm: convert to new function interface
> > 	Has these problem(s):
> > 	        - Subject has leading but no trailing parentheses
> > 	        - Subject has leading but no trailing quotes
> 
> Oh, I missed those.
> 
> > I'll go fix it up, but that will break your tree if you try to merge as
> 
> Thanks for fixing. I'll reset my tree to yours.
> 
> > I will have to rebase :(
> 
> no worries.
> 
> Out of curiosity, what are you using to flag those? Is checkpatch doing
> that now?

No, I'm using some scripts originally based on code that Stephen uses
for linux-next (you would have got the same report from him when he
merges in your tree.)  I published them on the workflows@vger.k.o
mailing list a while back if you are interested in them.

thanks,

greg k-h
