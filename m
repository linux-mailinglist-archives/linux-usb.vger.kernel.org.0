Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB431BBA62
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 11:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgD1JxL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 05:53:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:59492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727023AbgD1JxL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 05:53:11 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D48F8206C0;
        Tue, 28 Apr 2020 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588067591;
        bh=B6nzA4UfwQmeVeAPo7RBtE16kyIvUTx2Oc+VIZuZORA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GWmmoxuYcOCdjKiJsAe07q2lHnHn4SJ22nQ3N2/tnalrlPm5ufDjii/WB772qQyn8
         Wrtk1azLZvDu+Y8B5iI/3INVb5RMt9DMSXxaXfAuOi4mA2tmy2gs5Y34kPE+2woFkF
         9m/4JRZXLFM60LlRxjFS9NoANX98/mk5os7ZDCYQ=
Date:   Tue, 28 Apr 2020 11:53:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dave Mielke <Dave@mielke.cc>
Cc:     linux-usb@vger.kernel.org,
        Samuel Thibault <Samuel.Thibault@ens-lyon.org>,
        Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Writing to /sys/../power/autosuspend when not root.
Message-ID: <20200428095308.GA1129325@kroah.com>
References: <20200426190838.GU756@beta.private.mielke.cc>
 <20200427103009.GA2362731@kroah.com>
 <20200428092649.GI756@beta.private.mielke.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428092649.GI756@beta.private.mielke.cc>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 28, 2020 at 05:26:49AM -0400, Dave Mielke wrote:
> [quoted lines by Greg KH on 2020/04/27 at 12:30 +0200]
> 
> >Have a udev rule that turns autosuspend off for each specific USB device
> >that you know does not work with autosuspend.  
> 
> Yes, thanks, that should work. I have another question, though. Our code first
> tries to write "-1" to power/autosuspend, and then, if that fails, it writes
> "0". I'm guessing that "-1" was an older way (but I've forgotten). How can a
> udev rule be written to accommodate that?

udev rules can run any script/program that they want to :)

greg k-h
