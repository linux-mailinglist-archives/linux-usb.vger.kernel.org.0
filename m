Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA777143DF6
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2020 14:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbgAUNYm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jan 2020 08:24:42 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36973 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgAUNYm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jan 2020 08:24:42 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so2264929lfc.4
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2020 05:24:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5iAo+irflEib1JNgFOWN0uKGeNdlwGuIOrpYRSAl7ME=;
        b=BQCJk7Kt5ikKcDwch2quzqhpRp7IUrJiq4e2dhLxfAguCDtFI6aa78pX/g2vIpQJlu
         yQIBZxtJqMcCRACZXnA+rluMmfmi+mLldFS4aJ/j6Ur6muZ89qXjj0mrBqkw22ZGK10K
         N2Vo6p1CCuj7VomiQj/zeN4x1tu5N/cxuK6wYgWuggMp7nVhx1lusSOVFZOsRJt5Lzf1
         TqqXPJUTYgGcPxUaX7nxd4yQTEngArUbR4VslobedeE/nh2RxWxhrJ7gRsoYXsnz2mmw
         xgQbLyBPFNcKfeMHvWleZBRgPAOxXqjlvGpCKEQx36C4KSFG1VHYFAi+eoHPtFgbWBI6
         AcZg==
X-Gm-Message-State: APjAAAXzoe32nuzE22meFfExk3kzDmN6EEswrq6qNxKVL8MGnbI1SnK2
        dK4/0jY6UP909bqgIFAnxhX4vMDc
X-Google-Smtp-Source: APXvYqzKsWToEyCxYa6S71dw9Us/dkFmfkh0fwp8IJS7dPfQsG1jlSy0dLXWvx/Znaf7GrMHEo7NZg==
X-Received: by 2002:ac2:46c2:: with SMTP id p2mr2609702lfo.139.1579613080343;
        Tue, 21 Jan 2020 05:24:40 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id b17sm18489734ljd.5.2020.01.21.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 05:24:39 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1ittWH-0003bN-Ie; Tue, 21 Jan 2020 14:24:37 +0100
Date:   Tue, 21 Jan 2020 14:24:37 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: Can't we have stricter matching for vendor specific devices?
Message-ID: <20200121132437.GB8375@localhost>
References: <1579523791.17973.31.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579523791.17973.31.camel@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 20, 2020 at 01:36:31PM +0100, Oliver Neukum wrote:
> Hi Johan,
> 
> I have looked at your heroic efforts at sanity checking
> and I cannot help myself wondering whether this is a winning
> strategy. Shall we really specify for each device how many
> endpoints it is suposed to have in the probe() method?
> 
> Could we extend the matching by a minimum and maximum number
> of endpoints and masks for permissible endpoint types?
> 
> For class devices this is impossible, but the majority of
> drivers are for vendor specific devices.

I have considered it, but I don't think that encoding this in the device
id table would work. Just take something like the option driver with
about a thousand entries. Encoding what is essentially a driver
requirement would just waste a lot of space.

It's also not clear how to encode the various ways that drivers look up
endpoints, such as by number or by descriptor order, and often in
various combinations (e.g. an endpoint can be optional or the driver can
handle both interrupt and bulk types). For this to work generally, you'd
also need to deal with drivers switching altsettings (e.g. which
altsetting should core verify?).

Any change in this direction would also risk introducing regressions as
we don't have access to the descriptors for devices that have already
been added.

Instead I came to the conclusion that we should treat this just like any
other resource allocation and to provide helpers for drivers to use (I
have some more work in this area coming).

Just like it's a bug to not check the return value from kmalloc() or
platform_get_irq() so should trying to use an endpoint before making
sure it is available be considered a bug even in cases where it doesn't
outright crash the kernel currently. And we should of course always
sanity check external input.

One way of enforcing this would be to eventually require drivers to
initialise URBs using a struct usb_host_endpoint which they would have
lookup up using common helpers. There's even a comment by Alan in
usb_submit_urb() documenting this intention (see 5b653c79c04c ("USB: add
urb->ep")).

Johan
