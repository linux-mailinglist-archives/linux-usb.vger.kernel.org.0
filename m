Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 494812CF08A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 16:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbgLDPNn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 10:13:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:34134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730388AbgLDPNm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Dec 2020 10:13:42 -0500
Date:   Fri, 4 Dec 2020 16:14:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607094782;
        bh=Xwp6gOMd8q+DsCvQnzAGd6nZPIZPCMU3ZEzQ4k157tE=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=LSk8nBTnSPKy7aCW64kXVX7q9toIlMAjqzvVxn1HdEP9iHiFLaZJbeRZYO/Yn9+B6
         TA39zkuSEX1min2lI7qPBDo+npVDbb+LwBsF25AftX1L9mAM0b9Jj+tYOd7levGcgj
         CPQeIyw22wZKR78op34G54OxZNmpZSjc+CoZSu+8=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Himadri Pandya <himadrispandya@gmail.com>
Subject: Re: [PATCH 1/3] USB: core: drop pipe-type check from new
 control-message helpers
Message-ID: <X8pSSqQenF8sytJg@kroah.com>
References: <20201204085110.20055-1-johan@kernel.org>
 <20201204085110.20055-2-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204085110.20055-2-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 09:51:08AM +0100, Johan Hovold wrote:
> The new control-message helpers include a pipe-type check which is
> almost completely redundant.
> 
> Control messages are generally sent to the default pipe which always
> exists and is of the correct type since its endpoint representation is
> created by USB core as part of enumeration for all devices.
> 
> There is currently only one instance of a driver in the tree which use
> a control endpoint other than endpoint 0 (and it does not use the new
> helpers).
> 
> Drivers should be testing for the existence of their resources at probe
> rather than at runtime, but to catch drivers failing to do so USB core
> already does a sanity check on URB submission and triggers a WARN().
> Having the same sanity check done in the helper only suppresses the
> warning without allowing us to find and fix the drivers.

The issue is "bad" devices.  syzbot fuzzed the USB sound drivers with
stuff like this and found a bunch of problems, which is where this check
originally came from.  While it is nice to "warn" people, that keeps
moving forward and then the driver tries to submit an urb for this
endpoint and things blow up.  Or throw more warnings, I can't remember.

So I'd like to keep this check here if at all possible, to ensure we
don't have to fix those "bugs" again, it's not hurting anything here, is
it?

thanks,

greg k-h
