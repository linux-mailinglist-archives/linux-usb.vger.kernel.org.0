Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA9427400F
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 12:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgIVKy6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 06:54:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33013 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgIVKy4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 06:54:56 -0400
Received: by mail-lj1-f194.google.com with SMTP id k25so13751497ljk.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 03:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ndHYmX+vHK+Ui14RySCb+MecEf8SCbUkFy2A4pSZ9Zg=;
        b=KoH3QPZaprkwP5XE8QQNxrUbCIFzAy04Gk1jsI4/QiHiW3pSDWieuygW+NKF/k45Sh
         3BtGFonN1x5icbaJlgNWD0C/ijiHDpVxebNBEa6UnwQC9qZignXZibmF9sWlvnSQ8wgy
         dfS+1KaSXhHpfu3B/XaT7nUrj2SmGZ2pA3MyJMl83XdpDBco/LC4jQmVAHRDQUYG490S
         jvElTLKHY96iYet54s7fiMlgr15nHLqv0d0C2zd6sHEJIpA0GPU/IB9uKQs7lJOQScyf
         vJbz5hDlVeDsNDgNaxM+3OuX568nHWSOlwo4VDpsqivvn0shgtENhGEa/1HnCn8qPQAj
         pjmQ==
X-Gm-Message-State: AOAM532vYeKI0rNyMHbb8m9TaJBaJENn2YKyI69b7dYiHrOMFc0+8oIn
        TTVPfEGQZECcckoXj9Hd1vRZgc6zOFI=
X-Google-Smtp-Source: ABdhPJxiH1U+EKjj3wD9JMH4R3jSybBeU4y6dmlt/rNEn1rbDqnw7jcsOOgut7BOyC8dpXpswRN5Jw==
X-Received: by 2002:a2e:99c7:: with SMTP id l7mr1321980ljj.425.1600772094444;
        Tue, 22 Sep 2020 03:54:54 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id 131sm3394744lff.198.2020.09.22.03.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 03:54:53 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kKfwc-0003aB-Po; Tue, 22 Sep 2020 12:54:47 +0200
Date:   Tue, 22 Sep 2020 12:54:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, Erik Slagter <erik@slagter.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Subject: Re: [PATCH v2 4/4] USB: cdc-acm: clean up no-union-descriptor
 handling
Message-ID: <20200922105446.GC24441@localhost>
References: <20200921135951.24045-1-johan@kernel.org>
 <20200921135951.24045-5-johan@kernel.org>
 <1600697816.2424.102.camel@suse.com>
 <20200921142806.GX24441@localhost>
 <1600700674.2424.105.camel@suse.com>
 <20200921151605.GY24441@localhost>
 <1600708657.2942.2.camel@suse.com>
 <20200922070506.GZ24441@localhost>
 <1600771242.6926.16.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600771242.6926.16.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 12:40:42PM +0200, Oliver Neukum wrote:
> Am Dienstag, den 22.09.2020, 09:05 +0200 schrieb Johan Hovold:
> 
> > The relevant commits are
> > 
> >   a2bfb4a346d2 ("USB: support for cdc-acm of single interface devices")      (2009)
> >   fd5054c169d2 ("USB: cdc_acm: Fix oops when Droids MuIn LCD is connected")  (2011)
> >   403dff4e2c94 ("USB: cdc-acm: check for valid interfaces")                  (2014) 
> > 
> > Before Greg added the sanity checks in that last commit, a broken
> > call-management descriptor referring to a non-existent interface would
> > cause a NULL-pointer dereference.
> 
> Yes.
> 
> > The second commit, adding support for a specific device, didn't fix that
> > problem generally
> 
> Yes
> 
> >  and only worked around it for one device by hardcoding
> > the data interface to match the control interface,
> 
> How do you know. It hardcoded the data interface. That it matches
> the control interface is a guess.

No, see below.

> >  thereby falling back
> > to the "combined-interface" probing you added in that first commit.
> 
> How do you know? They may or may not match. 

Heh. Did you actually read the commit message?

	"Add NO_DATA_INTERFACE quirk to tell the driver that "control"
	 and "data" interfaces are not separated for this device, which
	 prevents dereferencing a null pointer in the device probe
	 code."

Convinced yet?

Johan
