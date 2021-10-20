Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280444354E2
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 23:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhJTVEc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 17:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhJTVEc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Oct 2021 17:04:32 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E31EC06174E
        for <linux-usb@vger.kernel.org>; Wed, 20 Oct 2021 14:02:16 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id f5so23590450pgc.12
        for <linux-usb@vger.kernel.org>; Wed, 20 Oct 2021 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aEJ4aClzzu5M+yXLNrCl94comgnOtbH7g1x4aaTR2/c=;
        b=GikTc+5IV3eD51X5uI3yzoZYmKC7Yr4vKdZ8qjxkUY583xnRiFULZuVXqgMwYtozXx
         l0FPaxlD8F+TzqockpUYUWpMmEQo3U9W6kw3lbKMqNLyxxfqhSWuA9GCoBeAqkVP02jD
         j5n27xv7ljZTpnFM+m24txDgSGIisdFK/lbVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aEJ4aClzzu5M+yXLNrCl94comgnOtbH7g1x4aaTR2/c=;
        b=Lc39AN3PpDJOlzFuBSpc3PC9QanQBabvoBARq6BnNht7fJhiiNNyZfEu8IgWqB2zEM
         3+VFvso4kEl21fSuqdOJLcUfikXXS8OsH1y/w4hZg2P6g4iK2NRFdeWgXtAbfPVnEM0t
         VE67UDI+ShbZmPYBqqQrN6hPrc82uBQ6lkfcQ1dbMgsJ7BmpFDStKiTvCZI9PLA9JN7s
         h7mM/Yk/lT3onbQBlFnTEmcVAKWwPbxycZynfM5Z3Ss0x96eLVh4jJsflxZv/c952ouR
         Gsa9CdbmGmGJ3T0vpxeJDZY3tZfU4h76gmqQRSgCb6jeQ3Q67/OWfHXM6Q+oAxYvOfGt
         yBag==
X-Gm-Message-State: AOAM531Hh1sB4yfsVP+4fd4PxvGIq4J8L/iZeXMuCoMQGIgtyMxQ+3YO
        lR+qsiJKfR56/rspaLJY/yF9Eg==
X-Google-Smtp-Source: ABdhPJz2CgbXheR9DbGF3q23WRYHZCtYywJXpdmuXkB5TBHsWGRJt2taiEpwvmG0a/on2vqLgOQXpQ==
X-Received: by 2002:a63:7119:: with SMTP id m25mr1185739pgc.253.1634763735988;
        Wed, 20 Oct 2021 14:02:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d5fe:85e9:caf2:ec4e])
        by smtp.gmail.com with UTF8SMTPSA id p25sm4319527pfh.86.2021.10.20.14.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 14:01:54 -0700 (PDT)
Date:   Wed, 20 Oct 2021 14:01:21 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v16 6/7] usb: host: xhci-plat: Create platform device for
 onboard hubs in probe()
Message-ID: <YXCDobJSuytwthoA@google.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <20210813125146.v16.6.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
 <dfac0025-b693-2431-04c8-1dba7ef32141@linux.intel.com>
 <YXB7vIP6ifQS3T4o@google.com>
 <20211020203720.GA1137200@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211020203720.GA1137200@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 20, 2021 at 04:37:20PM -0400, Alan Stern wrote:
> On Wed, Oct 20, 2021 at 01:27:40PM -0700, Matthias Kaehlcke wrote:
> > Hi Mathias,
> > 
> > On Wed, Oct 20, 2021 at 04:05:37PM +0300, Mathias Nyman wrote:
> > > If separate devices for controlling onboard hub power is the right solution then
> > > how about creating the onboard hub device in usb_add_hcd() (hcd.c), and
> > > store it in struct usb_hcd.
> > > 
> > > A bit like how the roothub device is created, or PHYs are tuned.
> > 
> > Sure, that sounds feasible, even better if it's handled in a single place
> > and different types of controllers don't have to add support separately.
> 
> Bear in mind that this would prevent you from working with onboard
> non-root hubs.

My goal is to (architecturally) support nested hubs, but TBH I haven't
looked much into such a configuration since I don't have hardware for
testing. My assumption was that support for onboard hubs connected to
non-root hubs whould have to be added to the generic hub driver.

Could you elaborate in how far you think it would be different for
xhci_plat vs generic hcd?
