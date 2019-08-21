Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63BDF97640
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 11:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfHUJcV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 05:32:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:37152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbfHUJcU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Aug 2019 05:32:20 -0400
Received: from localhost (unknown [12.166.174.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6A4A22D6D;
        Wed, 21 Aug 2019 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566379939;
        bh=0woE7KH9qH87RbaubAR04Ak4yDzR/nxmHFuwDbo3cf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oRGCb3cLAStHY4MBdHaRh1/sWNhi0ENJBPihYDW/gnRJHaFzeYRkI6gBkQq1bBtvc
         akSm0qTU3RNxqg92RqFdFB1gS62gN3X+wnBHmylRG6/iheS6DAA+R3CwyNJBfdsyST
         6JaH2hK93VeJ3CDu6/KlNT/8eWf7cht+C7eJSEQs=
Date:   Wed, 21 Aug 2019 02:32:19 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: f_mass_storage vs drivers/target
Message-ID: <20190821093219.GA24207@kroah.com>
References: <8b5d460e023284a803d5f448655d5c20de711f12.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b5d460e023284a803d5f448655d5c20de711f12.camel@kernel.crashing.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 21, 2019 at 01:38:49PM +1000, Benjamin Herrenschmidt wrote:
> Hi folks !
> 
> It seems that f_mass_storage duplicates (well maybe predates too..) a
> lot of what's in drivers/target.

It predates it by a long time.

> Anybody working on implementing a new version of f_mass_storage that
> is layered upon drivers/target instead ? That would bring quite a lot
> of additional functionality.

Why is that needed?  What functionality is missing that it will provide?
Will it make the code simpler?

> If not, I might look into it.

Hey, we don't refuse patches, for cleaning stuff up, you know that :)

thanks,

greg k-h
