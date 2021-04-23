Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4056A368EDA
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 10:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241461AbhDWIcZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 04:32:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:51368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230059AbhDWIcY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 04:32:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52CBA613F6;
        Fri, 23 Apr 2021 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619166707;
        bh=UTKjXg0Fo1WvYRmXNNct4uDb8EX9vH7DcV26g2bH08c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j4Oz+VIDPlc0OWgF8YLOw2+vACOaNt9iBNFoCxucmcUodgaeFriWlwj+tuT/xxJsO
         r4gDSjcZjFlM09gLihqJRU0OZh8mqRZ7Qn5XVXg91D5IGZNc11lMfFAA/uudfISok/
         Llg/pdmeLnPrzs3ZbNPNYc3kWL7P+hGFPXpKUFXIFEmVPqNE3+6+ZjQAQgvLhHl34K
         yvKg/pKKXKxv4V1zEyzGTW6MvjA6cScsyZzZa387o/pf62tPMaJQ5cVCOLOEaadBHH
         rBlfYxNoBmZnPXaQCf4pD8bcnf4N2kkLYcGxWootqaVt8uOoViFOXRqQgJP6DIl5ik
         2VEkyhibIXudg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lZrEA-00029D-Rh; Fri, 23 Apr 2021 10:31:55 +0200
Date:   Fri, 23 Apr 2021 10:31:54 +0200
From:   Johan Hovold <johan@kernel.org>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 212751] New: acm_port_activate - usb_submit_urb(ctrl irq)
 failed after kernel update
Message-ID: <YIKF+r22o2jKSoxo@hovoldconsulting.com>
References: <bug-212751-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-212751-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 22, 2021 at 04:32:51PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=212751
> 
>             Bug ID: 212751
>            Summary: acm_port_activate - usb_submit_urb(ctrl irq) failed
>                     after kernel update
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.10.30
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: johann.wilhelm@wilhelm.consulting
>         Regression: No
> 
> Something between 5.10.26 and 5.20.30 broke (at least) the USB CDC
> implementation by ST Microsystems on their STM32 devices.
> 
> On opending of the device following error occurs:
> [ 1333.790160] cdc_acm 1-10:1.0: acm_port_activate - usb_submit_urb(ctrl irq)
> failed
> 
> 
> 5.10.26 works - 5.10.30 does not.

This is likely due to commit 6069e3e927c8 ("USB: cdc-acm: untangle a
circular dependency between callback and softint") which had a bug that
was just fixed by commit a8b3b519618f ("USB: CDC-ACM: fix
poison/unpoison imbalance").

You can try applying the latter yourself but it will otherwise show up
in stable soon.

Johan
