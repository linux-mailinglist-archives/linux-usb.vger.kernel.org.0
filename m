Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C3C2154C1
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 11:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgGFJbu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 05:31:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33699 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgGFJbu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 05:31:50 -0400
Received: by mail-lj1-f196.google.com with SMTP id e8so10188441ljb.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 02:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A0yQhHZ4juxWszoVo2w0lmi5EWsX40zvQw4kn68vC88=;
        b=K4yeRxbxBxg+4ZnHmpXA/DD/TOssOzPX2PcT+TN5fR588tnvaYdxB7e1Qr9VoMbsaP
         kOg7YNVLcT1c9Qduy0yfvMThlKgMo1sHCXKBt9QfSlbB6P+jrIfWWrf8KxTWcqWwwgFv
         EX5Q05fNqIIka4HWQHxUPeKuu5cR3/lgdDJAdwEDAXhfUETP2O8Bd9xIKI13jhmAEaJe
         fPnBkWKAx4LKx/dvrvqhHHrEcRT68rB4Hz18GOdNKGaj8zm6vFRqqTwKiF/Z0nZmvVoT
         gi2q9KMMvlgn0LBGwXLn9PJse8t3YGKn+GCEFI2cof1bxwCAldHLO5IGgKvzWf/wACxj
         sRxg==
X-Gm-Message-State: AOAM532myRdqOkD7xq6iBVhCRnaeuVM7LfU1Wh3tMvS7d8CoIAn/m8CO
        NAEs7R4cRT9eWGJlbRy4nCc=
X-Google-Smtp-Source: ABdhPJyHIcAXxIhEmNrYqtixPvlSvP5HUW4OU6cTE8X6NIVbQvSIjPZY3qxSPHj/ZcLdi6ww4+jiUg==
X-Received: by 2002:a2e:b4d3:: with SMTP id r19mr12301300ljm.150.1594027907741;
        Mon, 06 Jul 2020 02:31:47 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l14sm6158378lfj.13.2020.07.06.02.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 02:31:46 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jsNTU-0003B0-B6; Mon, 06 Jul 2020 11:31:44 +0200
Date:   Mon, 6 Jul 2020 11:31:44 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 6/6] USB: serial: ch341: Simulate break condition if
 not supported
Message-ID: <20200706093144.GG3334@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <91bacfa4097350b4731724f5820e06bc03e7e8f3.1585697281.git.public@hansmi.ch>
 <20200514144721.GG25962@localhost>
 <6e29707b-6774-9f25-25ac-4b4cd202a017@msgid.hansmi.ch>
 <20200630113906.GA3334@localhost>
 <f34a9b6e-ec2a-0873-e97b-2d5b2170e2ff@msgid.hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34a9b6e-ec2a-0873-e97b-2d5b2170e2ff@msgid.hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Sat, Jul 04, 2020 at 08:25:03PM +0200, Michael Hanselmann wrote:
> On 30.06.20 13:39, Johan Hovold wrote:
> > On Thu, May 28, 2020 at 12:21:11AM +0200, Michael Hanselmann wrote:

> Updated patch included below.
> 
> Michael
> 
> ---

When sending patches inline like this, try to avoid adding a (---)
marker like this as it makes git-am discard the commit message when
applying.

> From 41b8b06d343a69541a357d8c9d6d0fe3f22610d6 Mon Sep 17 00:00:00 2001
> Message-Id: <41b8b06d343a69541a357d8c9d6d0fe3f22610d6.1593887001.git.public@hansmi.ch>
> From: Michael Hanselmann <public@hansmi.ch>
> Date: Thu, 5 Mar 2020 01:50:35 +0100
> Subject: [PATCH] USB: serial: ch341: Simulate break condition if not supported
> 
> A subset of all CH341 devices don't support a real break condition. This
> fact is already used in the "ch341_detect_quirks" function. With this
> change a quirk is implemented to simulate a break condition by
> temporarily lowering the baud rate and sending a NUL byte.
> 
> The primary drawbacks of this approach are that the duration of the
> break can't be controlled by userland and that data incoming during
> a simulated break is corrupted.
> 
> The "TTY_DRIVER_HARDWARE_BREAK" serial driver flag was investigated as
> an alternative. It's a driver-wide flag and would've required
> significant changes to the serial and USB-serial driver frameworks to
> expose it for individual USB-serial adapters.
> 
> Tested by sending a break condition and watching the TX pin using an
> oscilloscope.
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>

Now applied with a slightly condensed probe info message.

Thanks,
Johan
