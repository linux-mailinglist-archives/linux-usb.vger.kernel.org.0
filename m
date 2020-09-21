Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E040D2726F7
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIUO2R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:28:17 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44422 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIUO2R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:28:17 -0400
Received: by mail-lj1-f194.google.com with SMTP id b19so11266167lji.11
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mtNhXFuf8g4XBcLG6hHchTKDDf6mQ6ZidJdQqTdREu8=;
        b=JLVvSGHyyKvs+df74aC1+NyIhKTCqE/oQHDOo/zm2ta0coIsAZb0c3TyCs2TKQHLVk
         azCRlvo44RbE4J3j7e6mCS3N2O75niRsjFN1Ka6qVzOO5kOAn8LVqdiRAyzpGTOTvv4e
         PKQW5GyMm55d8Ri4iem9sVXsxhKm645XjB5tyAHnD+F3B6X3zqdoo/s7VbOP8Mh/UzTy
         ZVNWLY9n3kA1O01/n8StdmqjcRMpSzAuMXhCw+eWd6CxFL+nDbBWm10+J5YjQoSqtauA
         vVu7BZXffT6SNFiMgPsdy955AsqHS+PjQbp/LMVV02g8xs9GtVpCB37iJKXWhZq3ECTZ
         2Blw==
X-Gm-Message-State: AOAM531ILhUxUmBCR1fOyjxCfz4OiC1Mgfs0b2WHLZ8lX4IRWDqcfCQe
        prKFgjyhp+UddIDA+GKc4MNLHNqQxbU=
X-Google-Smtp-Source: ABdhPJyQGme2YiZ+e5hOsMpSJXZyLNrUQfwmPzd2XmM345y7kewbm4PZe0s9/r4EsPaf+OYBfVlKKA==
X-Received: by 2002:a2e:958f:: with SMTP id w15mr17514200ljh.449.1600698495145;
        Mon, 21 Sep 2020 07:28:15 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id e14sm2797083ljp.15.2020.09.21.07.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:28:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kKMnW-0006PU-Vz; Mon, 21 Sep 2020 16:28:07 +0200
Date:   Mon, 21 Sep 2020 16:28:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
Message-ID: <20200921142806.GX24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
 <20200921135951.24045-5-johan@kernel.org>
 <1600697816.2424.102.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600697816.2424.102.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 04:16:56PM +0200, Oliver Neukum wrote:
> Am Montag, den 21.09.2020, 15:59 +0200 schrieb Johan Hovold:
> > For interfaces that lack a union descriptor, probe for a
> > "combined-interface" before falling back to the call-management
> > descriptor instead of the other way round.
> 
> Hi,
> 
> the more I look at this the more it seems to me like the
> device that has the quirk does NOT have a collapsed interface
> but two interfaces and just a lack of a union descriptor.

But then why name the quirk NO_DATA_INTERFACE if it has a data
interface? By hardcoding the data-interface number to be the one and
only interface, you'd end up probing for a "combined" interface also
with a broken call-management descriptor.

Side note: I really think we should start mandating lsusb output to go
along with any patch for quirky devices.

> I am taking the original author into CC (hoping it still workd)
> Johan, would just taking the first three patches of the series work for
> now?

Of course, no problem holding back the last one for a bit.

Johan
