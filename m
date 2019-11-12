Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A61F8B97
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 10:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfKLJVs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 04:21:48 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37429 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfKLJVr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Nov 2019 04:21:47 -0500
Received: by mail-lf1-f68.google.com with SMTP id b20so12227556lfp.4
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2019 01:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bK8M3ysmYuO5k6wu7oPGJUYPK68YxzfOj4oYVjbN0f0=;
        b=TMwt16ftk6u9OnVZevebwfSvSYDfxV97FGZLEIzVjaD2hBzSWlr5Y8Zx0r0F1CCH2i
         A1V5apB6KAzu5Clc7HcO/6ydGZC17J6pV42+lmF7doBWzmFPDgCittJtQuz91yWHc4L/
         IDPL+W1dY7xQLOngYLfeknFuiifqkFxxaljO1AKJr1uXqvdu34fApgfx+/j43Ph9tXkC
         bwqYZPWOLMoeB5nDZJdpXEyMFfO0gfR4YQ9aisX87cHWqkhEYbDXzyIFaOXEp6XfPj3Z
         ytMobx0BP2o4IZ3lgyUmTRcwJNzlGIDV6yCKonwzqMZ2wFxl2cTomJUm9xUgA3UWlOjq
         zg+A==
X-Gm-Message-State: APjAAAVg3JstNsiYC3LtZiHeV+ExZi7LEPu6N9leGjM9MtwRVcUgNgKX
        viecg6Xz+f1TXl2OsdUuH7YDRTfpcDg=
X-Google-Smtp-Source: APXvYqwwCDEYlpbCln+0CIPhrr77q2CmFRPNuFWhNVClkRIEUno0Fm+RWoo8SBxViod7Ihm55mE9Zw==
X-Received: by 2002:ac2:5589:: with SMTP id v9mr14286889lfg.32.1573550505154;
        Tue, 12 Nov 2019 01:21:45 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id q2sm761897lfp.26.2019.11.12.01.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 01:21:44 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iUSMx-0008E5-7u; Tue, 12 Nov 2019 10:21:51 +0100
Date:   Tue, 12 Nov 2019 10:21:51 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/11] USB: serial: mos7840: type detection and clean ups
Message-ID: <20191112092151.GO11035@localhost>
References: <20191107132904.2379-1-johan@kernel.org>
 <20191111132746.GA450958@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111132746.GA450958@kroah.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 11, 2019 at 02:27:46PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Nov 07, 2019 at 02:28:53PM +0100, Johan Hovold wrote:

> > Johan Hovold (11):
> >   USB: serial: mos7840: clean up device-type handling
> >   USB: serial: mos7840: document MCS7810 detection hack
> >   USB: serial: mos7840: fix probe error handling
> >   USB: serial: mos7840: rip out broken interrupt handling
> >   USB: serial: mos7840: drop redundant urb context check
> >   USB: serial: mos7840: drop paranoid port checks
> >   USB: serial: mos7840: drop paranoid serial checks
> >   USB: serial: mos7840: drop serial struct accessor
> >   USB: serial: mos7840: drop port driver data accessors
> >   USB: serial: mos7840: drop read-urb check
> >   USB: serial: mos7840: drop port open flag
> > 
> >  drivers/usb/serial/mos7840.c | 770 +++++------------------------------
> >  1 file changed, 102 insertions(+), 668 deletions(-)
> 
> Nice cleanups:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for the review. All now applied.

Johan
