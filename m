Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA472729BF
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 17:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbgIUPQO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 11:16:14 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32861 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgIUPQO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 11:16:14 -0400
Received: by mail-lj1-f194.google.com with SMTP id k25so11445964ljk.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 08:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MLbMRG1q1mEdY1V1gqzGmOyWktHWfg6qpGgA931GBC8=;
        b=GW+hX039yUU+Yk7+2lkMMT3Q06EY85oWnEF2BpeYLMFQVitWDo688S1yzNO3MAEN8c
         OJoLHVDrLvJEmLpyHEYlQL5Db445+q88o3Y3cBBrl+CsevqtHV1LehjP1+a7SPa1tXPr
         eqv7dBdeeWo8mIkVERyo7ovRJuA/h2QEywXmV6r9VDij/fmiv5zjG1g/U4NvTyXaKqjv
         ngQvc01Z+jRwAv2U3WK+SLv8TBH5amd20+cuPnv1NWir6/pfQOaoPVkKRlOc50wxRCyo
         JoHfRzxbZWkESFz2ZXO2T/TtvVT1adsmdKeCzAyy7DWd46hdV18Exw/EyG5KIJrW+bRp
         qkiw==
X-Gm-Message-State: AOAM530tcrqr/EXKSopb9zYfFrZd/N3ZM8z07HCrqzHXa8WjGVDN68Ti
        g82MJfAHLS4uP+r53sH4IEw=
X-Google-Smtp-Source: ABdhPJz+0QK+fz1WgOD7WnS0zI/HPIuKdpWZFKzp5zj52Q/v+syR6Aq3FKMoapoX4Xxk1oRXHMAbDg==
X-Received: by 2002:a2e:b5a8:: with SMTP id f8mr68575ljn.246.1600701371740;
        Mon, 21 Sep 2020 08:16:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v10sm2782955lji.128.2020.09.21.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 08:16:11 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kKNXx-0006ki-0t; Mon, 21 Sep 2020 17:16:05 +0200
Date:   Mon, 21 Sep 2020 17:16:05 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
Message-ID: <20200921151605.GY24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
 <20200921135951.24045-5-johan@kernel.org>
 <1600697816.2424.102.camel@suse.com>
 <20200921142806.GX24441@localhost>
 <1600700674.2424.105.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600700674.2424.105.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 05:04:34PM +0200, Oliver Neukum wrote:
> Am Montag, den 21.09.2020, 16:28 +0200 schrieb Johan Hovold:
> > On Mon, Sep 21, 2020 at 04:16:56PM +0200, Oliver Neukum wrote:
> > > Am Montag, den 21.09.2020, 15:59 +0200 schrieb Johan Hovold:
> > > > For interfaces that lack a union descriptor, probe for a
> > > > "combined-interface" before falling back to the call-management
> > > > descriptor instead of the other way round.
> > > 
> > > Hi,
> 
> Hi,
> 
> > > 
> > > the more I look at this the more it seems to me like the
> > > device that has the quirk does NOT have a collapsed interface
> > > but two interfaces and just a lack of a union descriptor.
> > 
> > But then why name the quirk NO_DATA_INTERFACE if it has a data
> 
> In hindsight that seems not the best name.
> 
> > interface? By hardcoding the data-interface number to be the one and
> > only interface, you'd end up probing for a "combined" interface also
> > with a broken call-management descriptor.
> 
> Well, by the changelog assuming a combined interface caused an oops.
> Thence I am forced to conclude that the davices _has_ a separate
> data interface, but no union descriptor.

No, the oops was probably due to the missing sanity check later added by
403dff4e2c94 ("USB: cdc-acm: check for valid interfaces").

With a broken call-management descriptor pointing to a non-existent
interface we'd oops before that commit.

> > Side note: I really think we should start mandating lsusb output to go
> > along with any patch for quirky devices.
> 
> Good idea. Convince Greg.

Heh. I'm sure he can be convinced. :)

Johan
