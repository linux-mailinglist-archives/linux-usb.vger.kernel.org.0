Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 156AB131597
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 17:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgAFQDK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 11:03:10 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40202 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgAFQDJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 11:03:09 -0500
Received: by mail-lf1-f67.google.com with SMTP id i23so36722288lfo.7
        for <linux-usb@vger.kernel.org>; Mon, 06 Jan 2020 08:03:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UGKSNhETwLcDVeEssEJo4lDdixB1LJYqjKbjkXT9Qwc=;
        b=LmZPyV+E69V5TQevGUvekJ58zsBk9me77THHfRblfWMnwlYe3kM7NrS3IDHLVwdgc+
         uoZoLCelHOUN6Visp6BF+wO6lt3wORjFRxt3it6TNwBbyZBbWvCJFdUGAP8wv4iBVCqM
         cVYk1JpB4IKFCx2GPfNBxF4Vm0vDuXocXvx4pQiyVGcb6IXrTMo1n+Ps0rHsBO4GzInR
         e23AyimGPJnpl+tzZdxxWT+Ugrdf0/BOLeAiJ7tkcmHTf9XPWbYl3dUBBbCzIYRApQOG
         Nqn0zddknooblx/9s95k0wOeURrYSnfKodMqcz5D4oXItW8Ur4YZkX3EI524ADb3WhFm
         mSQw==
X-Gm-Message-State: APjAAAXmiiaBXnSVf6X5aJtUl1DFL/o79yFvLw6Sra1Mbxi5NzBqimq7
        M9Mp29MYkQVSlsy45/6fcqA/ycBZ
X-Google-Smtp-Source: APXvYqzmdsi0n/TZbqExidITXwTYOlqYrpu3Tt9gMGyZOpO8s6ZfOd0BNcXqHmDDIeihO5Y+VXefFQ==
X-Received: by 2002:a19:c648:: with SMTP id w69mr56822817lff.44.1578326587623;
        Mon, 06 Jan 2020 08:03:07 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id d16sm29112409lfa.16.2020.01.06.08.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 08:03:06 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ioUqZ-0001AR-3s; Mon, 06 Jan 2020 17:03:15 +0100
Date:   Mon, 6 Jan 2020 17:03:15 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: Fix: Don't skip endpoint descriptors with
 maxpacket=0
Message-ID: <20200106160315.GA30908@localhost>
References: <20200105122846.GA6776@suse.com>
 <Pine.LNX.4.44L0.2001061040270.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001061040270.1514-100000@iolanthe.rowland.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 06, 2020 at 10:43:42AM -0500, Alan Stern wrote:
> It turns out that even though endpoints with a maxpacket length of 0
> aren't useful for data transfer, the descriptors do serve other
> purposes.  In particular, skipping them will also skip over other
> class-specific descriptors for classes such as UVC.  This unexpected
> side effect has caused some UVC cameras to stop working.
> 
> In addition, the USB spec requires that when isochronous endpoint
> descriptors are present in an interface's altsetting 0 (which is true
> on some devices), the maxpacket size _must_ be set to 0.  Warning
> about such things seems like a bad idea.
> 
> This patch updates an earlier commit which would log a warning and
> skip these endpoint descriptors.  Now we only log a warning, and we
> don't even do that for isochronous endpoints in altsetting 0.
> 
> We don't need to worry about preventing endpoints with maxpacket = 0
> from ever being used for data transfers; usb_submit_urb() already
> checks for this.
> 
> Reported-and-tested-by: Roger Whittaker <Roger.Whittaker@suse.com>
> Fixes: d482c7bb0541 ("USB: Skip endpoints with 0 maxpacket length")
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://marc.info/?l=linux-usb&m=157790377329882&w=2

Acked-by: Johan Hovold <johan@kernel.org>

We also need

Cc: stable <stable@vger.kernel.org>

as d482c7bb0541 ("USB: Skip endpoints with 0 maxpacket length") ended up
being (auto- ?) selected for stable.

Johan
