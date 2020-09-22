Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39601273B65
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 09:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgIVHFR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 03:05:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46419 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbgIVHFQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 03:05:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id b22so16800276lfs.13
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 00:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OpHYjvNK55DFrEHYgECuSg/9IRexzKGmTsYKFsrQfI0=;
        b=VZzlqBTXcdron/UU5lPZzFe99cJMDHZtsAf/LckQjB2YyXnSBkFfKxDY3slpSQ2zza
         YPlxpl5AaDij/zHghUHOIgVZUUJ7YP/AnNORgQjItzTkp1csIal4Mx3d41SIUCltbEi0
         yf32PwrHNPXJiyq+MhyZC+4zfzNE8zBg1ZsAqbxAS4x/LV3N7yuXKroq0LLLdyhKqaAZ
         z0Sjc2frHZit/iv3I3A/yCM3s2eUPnKKTs8lc4qsFhap3gbRHMIO2OPCDQuVS2so0rWW
         vi3Lgvc4084oBdHchmZnyx496tAYkE6WTt326GPvJtuBvm2TSWpnRJgV96yQbZeDERAO
         JZdw==
X-Gm-Message-State: AOAM531zgbIkKmtPI8mjZyBfkpZk50WJCcT9w04+SlOCDg1Qtf4cUBzW
        IeZ88kW2yoZhlKGgPp512vONy6EXrtg=
X-Google-Smtp-Source: ABdhPJye6p1O5XGq8lGkF9SzIbHUgAEWvbYqfDhF61K7/XY/8JpOgfgMZQ2u+bkcqS4NZgWAcur5xw==
X-Received: by 2002:a19:8242:: with SMTP id e63mr1043023lfd.226.1600758314534;
        Tue, 22 Sep 2020 00:05:14 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id k205sm3235502lfk.19.2020.09.22.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:05:13 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kKcMM-0004HB-St; Tue, 22 Sep 2020 09:05:06 +0200
Date:   Tue, 22 Sep 2020 09:05:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
Message-ID: <20200922070506.GZ24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
 <20200921135951.24045-5-johan@kernel.org>
 <1600697816.2424.102.camel@suse.com>
 <20200921142806.GX24441@localhost>
 <1600700674.2424.105.camel@suse.com>
 <20200921151605.GY24441@localhost>
 <1600708657.2942.2.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600708657.2942.2.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 07:17:37PM +0200, Oliver Neukum wrote:
> Am Montag, den 21.09.2020, 17:16 +0200 schrieb Johan Hovold:
> > > > interface? By hardcoding the data-interface number to be the one and
> > > > only interface, you'd end up probing for a "combined" interface also
> > > > with a broken call-management descriptor.
> > > 
> > > Well, by the changelog assuming a combined interface caused an oops.
> > > Thence I am forced to conclude that the davices _has_ a separate
> > > data interface, but no union descriptor.
> > 
> > No, the oops was probably due to the missing sanity check later added by
> > 403dff4e2c94 ("USB: cdc-acm: check for valid interfaces").
> > 
> > With a broken call-management descriptor pointing to a non-existent
> > interface we'd oops before that commit.
> 
> Hi,
> 
> maybe I am dense, but a patch that comes after a patch that is said to
> fix something? Furthermore that patch would not come it work,
> it would merely make probe() fail cleanly. If I read the changelog
> correctly, the change makes the device work.

The relevant commits are

  a2bfb4a346d2 ("USB: support for cdc-acm of single interface devices")      (2009)
  fd5054c169d2 ("USB: cdc_acm: Fix oops when Droids MuIn LCD is connected")  (2011)
  403dff4e2c94 ("USB: cdc-acm: check for valid interfaces")                  (2014) 

Before Greg added the sanity checks in that last commit, a broken
call-management descriptor referring to a non-existent interface would
cause a NULL-pointer dereference.

The second commit, adding support for a specific device, didn't fix that
problem generally and only worked around it for one device by hardcoding
the data interface to match the control interface, thereby falling back
to the "combined-interface" probing you added in that first commit.

See? The second commit fixed the oops *and* made the device probe
successfully. If we'd had the sanity check in place by then it would
only have make it probe successfully.

Johan
