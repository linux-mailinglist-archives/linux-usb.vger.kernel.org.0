Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4D912E819
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 16:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgABPcn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 10:32:43 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35017 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbgABPcn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 10:32:43 -0500
Received: by mail-lf1-f65.google.com with SMTP id 15so30135647lfr.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jan 2020 07:32:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X2bdc3I7CssYMJkFC+tUD4saLRW+PWs6uz/Nr7ULd2g=;
        b=r0m+yau3EUGj6LpJksLkjV4Eywq1DWM3eiKRAQGLl3XQqTCPaJNGramTga8x0C9RuB
         ce6szfKyVrh6m1JqsKNiByAXbCemgsWmnzvLiJPmDNsaUdKf3dANoiuSmv+2esGrSIBc
         YpBnZpJqUNn0Y0NmTnkdMcWRIPL4cbQcQaAU/GZkcE6qtv5NAaC3fBrrFofc9Az4uUjD
         Z7Unl9zBiCLwgP07DINO/lbv8NHaKP7xEgmKntyMF4xGR6h/1uzmVE2n57OjCmlUp1cO
         SGVS6Fvux44NjrUA38aM+3V3bWSd31JluQB6fM9JwZFYddEIXjOIsIt9zgucRdg1mkck
         tCLQ==
X-Gm-Message-State: APjAAAXInsvwSXUSZvxa/f1V90hwLn56b8EjpqTSLhqryyAjKfnPwz4Z
        Mnc45iM5BO1J5GhC1dwQJLw=
X-Google-Smtp-Source: APXvYqyEBILDCDPMxr4TZIlbb5Xd/zJXetcKXUdnwE4xZ6cKtHJzg5CNSUHlz/tL87TmwtxqZHhPTA==
X-Received: by 2002:a19:c3cc:: with SMTP id t195mr48466018lff.144.1577979161694;
        Thu, 02 Jan 2020 07:32:41 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id m11sm23476223lfj.89.2020.01.02.07.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 07:32:40 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1in2Sn-0001HE-P0; Thu, 02 Jan 2020 16:32:41 +0100
Date:   Thu, 2 Jan 2020 16:32:41 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Message-ID: <20200102153241.GA4683@localhost>
References: <s5hr20ingu5.wl-tiwai@suse.de>
 <Pine.LNX.4.44L0.2001021003130.1546-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001021003130.1546-100000@iolanthe.rowland.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 02, 2020 at 10:06:33AM -0500, Alan Stern wrote:
> On Thu, 2 Jan 2020, Takashi Iwai wrote:
> > On Thu, 02 Jan 2020 12:20:45 +0100, Johan Hovold wrote:

> > > Note that we also have this little gem in the ftdi usb-serial driver
> > > (since 2009) overriding a zero max packet size for devices with broken
> > > descriptors:
> > > 
> > > 	895f28badce9 ("USB: ftdi_sio: fix hi-speed device packet size calculation")
> > > 
> > > Note sure how common those are but they will no longer work after the
> > > new sanity check in core. I guess we could add quirks for them (to core)
> > > in case we get any reports, but perhaps reverting the check should be
> > > considered.
> > 
> > FWIW, Roger confirmed that reverting the commit d482c7bb0541 does
> > indeed fix the issue (with the latest 5.4.y kernel).
> 
> All right.  Suppose instead of reverting that commit, I change the code
> so that it only logs a warning when it finds an endpoint descriptor
> with maxpacket = 0 (and it skips the warning for isochronous endpoints
> in altsetting 0).  At the same time, we can add a check to
> usb_submit_urb() to refuse URBs if the endpoint's maxpacket is 0.
> 
> Sounds good?

Sounds good to me.

Just make sure not to add a WARN() in usb_submit_urb() so that we end up
having to add maxpacket checks to every USB driver when syzbot starts
hitting this (only driver's doing maxpacket divisions or similar should
need that).

Johan
