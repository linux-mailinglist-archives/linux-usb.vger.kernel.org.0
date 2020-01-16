Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC44813FB9E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 22:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbgAPVef (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 16:34:35 -0500
Received: from mail-vs1-f54.google.com ([209.85.217.54]:38081 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729305AbgAPVee (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 16:34:34 -0500
Received: by mail-vs1-f54.google.com with SMTP id v12so13647917vsv.5
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2020 13:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=AGt3KcOzBwBCMk+MQvi9CtXSfDZ24gssKIJht6EMKLc=;
        b=FeNvY6ARudp71xkWsih/wsG2G5HJnXewWS6uA18HyfuPUaGuXUo+ELglRh8b7qWvSC
         Ff5MXi95j1EBIx6Pv16l7WBuXF3LJfpJiGvu7vKm2+/2+nUdtiJz1gABO/7hMU1US6b3
         wtmSbVAr6fFjm0j39rBWz/nrEZOMQmwhbHWbXSvLMK9R6P3WPGS1RrLKcVh1f48MJGbC
         A5zjF0KJIRf9JgGvoRoPh6tjG+EwnlLjw3rrNs6gzsdzyHRHpcwuaAr2Pm6+qKlNdg+Q
         2faXr1AK/N/HzSY9itD1+iKe765LCpmtrF3kweejAPsZ010fUyN8yj+IPckaFu9tdruV
         ov9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=AGt3KcOzBwBCMk+MQvi9CtXSfDZ24gssKIJht6EMKLc=;
        b=EmiFePIx80nUbO9nYzYX5CigP2l1QYgKAXfQYc+/RbkSGdMGgoIOcgVQ+LLnJ82sob
         8KyX+tIfWz+ONS+CC0ksQwBDTWC1j/f1V/1HdJjK+wq2I5LWAD4FeXzScgyrVwDbh6lR
         E5+e6KvH0aDz2D7vix9pcZshL9sL5nDhfI0KG4LMVJ3JjHY1CErG4c4w9iAK6VFEtzaI
         /PTc9hIuwojhEV6yBmVEQR65uCJZQYRzmK6+6n2uusABWzeX5U8wY9ToteM/OkOA8eEI
         hZk1VlBdUZwaYjWjQNOK1mS+fJQ/7b5avZSQXlb+DUJjIN506RStFri6WP25f0bISt2A
         S5tw==
X-Gm-Message-State: APjAAAUimIwnMZufsHlOnOTXfX4qpf1OH6+9UC6bK/0ZNRwvihTRgjld
        lJRN9cNjIMRG4qr/CB5VhgaQ3tC2Ahu41aMYHhItoAU3
X-Google-Smtp-Source: APXvYqy/ezypUsr9DZFlCC0C1UnvKVhuljjUP3oAv/9yeHzTNPryFqWVSAUgBOGPBth/ZDcCA/BoL9XCTZuEsgNfUyM=
X-Received: by 2002:a67:6f46:: with SMTP id k67mr2986904vsc.2.1579210473496;
 Thu, 16 Jan 2020 13:34:33 -0800 (PST)
MIME-Version: 1.0
From:   Chris Dickens <christopher.a.dickens@gmail.com>
Date:   Thu, 16 Jan 2020 13:34:21 -0800
Message-ID: <CAL-1MmW7_DVGyOQytz=_fDeswUT=n_sfePS5yNm7SRU2ORSomQ@mail.gmail.com>
Subject: Inconsistency in how URBs are unlinked
To:     linux-usb <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

A bug [1] has been reported against libusb about a segfault that
occurs when a device is disconnected while processing isochronous
transfers.  In my investigation I discovered an interesting
inconsistency in how URBs are unlinked across the USB core.

The usbfs driver will unlink URBs in the same order they are
submitted.  From what I can see this code is executed when
setting/releasing an interface or when alloc'ing/freeing streams.  I
see there is also a call within the usbfs driver's disconnect
function, but that appears to be a no-op (is this really the case?) as
by the time that function is called the interface would have already
been disabled and thus usb_hcd_flush_endpoint() would have been
called.

Since commit 2eac136243 ("usb: core: unlink urbs from the tail of the
endpoint's urb_list"), the usb_hcd_flush_endpoint() function will
unlink URBs in the reverse order of submission.  This subtle change is
what led to the crash within libusb.  The bug manifests when transfers
within libusb are split into multiple URBs.  Prior to this change, the
order in which URBs were reaped matched the order in which they were
submitted.  Internally libusb expects this order to match and frees
memory when it encounters the last URB in a multi-URB transfer, but
since it reaps the last URB first the memory is freed right away and
things take a turn when the freed memory is accessed when reaping the
other URB(s) in that same transfer.

I will fix libusb to account for this behavior, but I thought it worth
mentioning as this new behavior isn't what I (and possibly others)
necessarily expect.

Chris

[1] https://github.com/libusb/libusb/issues/607
