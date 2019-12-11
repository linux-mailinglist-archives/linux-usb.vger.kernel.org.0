Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFC711A64C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 09:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbfLKIxq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 03:53:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39331 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfLKIxq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 03:53:46 -0500
Received: by mail-lj1-f196.google.com with SMTP id e10so23099523ljj.6
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 00:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zSls4t623tUVEVK9z4n8AGT6MLJJOckHndddKIzts7E=;
        b=OXsWanpQsPDeIInLdjPOrRg5ZiCvfhIXWjMFUGP/v3D38PoyUE1Am0NnijBrQJBHUd
         AsHPL6tj3oH4p7A4QUXdl4o4d0ayjBoD3RX+8i+Hk2miszkwyg/wVZw4AMOUb/f2/nE2
         i7ve1koXgd42O6EzuaecP76CZSq4Gm4MZQZnmxRwuQqtK812PsQUwzhlp0rVOXbHojbM
         rOX+Nr9fwyQSpNxMXvqYeQfHEcPLCQNSGNOUIG/mB8i8Lw/jr6tVPi9dBN4iQCE7WP2O
         sVxvpkDiZwJ4VPVlV/BbRr1GWs3pjovy5RdmrH6A++B8Y8rzHgF+wglmVO7lEhAKIbQn
         8gwQ==
X-Gm-Message-State: APjAAAUdeODEEe+FGl3yYnS18scUhuBUUNjmYoR5+nTX144lcqMbvs8p
        BmmJB5hiPTkpnF7IWJeQDSAKtuiV
X-Google-Smtp-Source: APXvYqw5k68mza6DznzCz4K9bfXKO4RpdnDN5ZhAhFaP36pk7MK9+NamfryBA0wUJp5P8s4PS90zkg==
X-Received: by 2002:a2e:6a03:: with SMTP id f3mr1252913ljc.232.1576054423789;
        Wed, 11 Dec 2019 00:53:43 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id u20sm702607lju.34.2019.12.11.00.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 00:53:42 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iexkf-00030J-3E; Wed, 11 Dec 2019 09:53:45 +0100
Date:   Wed, 11 Dec 2019 09:53:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, Bin Liu <b-liu@ti.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: musb: sunxi: propagate devicetree node to glue
 pdev
Message-ID: <20191211085345.GT10631@localhost>
References: <20191210165454.13772-1-b-liu@ti.com>
 <20191210165454.13772-2-b-liu@ti.com>
 <20191211080528.GA415633@kroah.com>
 <20191211084935.GS10631@localhost>
 <20191211085122.GA500642@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211085122.GA500642@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 11, 2019 at 09:51:22AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Dec 11, 2019 at 09:49:35AM +0100, Johan Hovold wrote:
> > On Wed, Dec 11, 2019 at 09:05:28AM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Dec 10, 2019 at 10:54:53AM -0600, Bin Liu wrote:
> > > > From: Mans Rullgard <mans@mansr.com>
> > > > 
> > > > In order for devicetree nodes to be correctly associated with attached
> > > > devices, the controller node needs to be propagated to the glue device.
> > > > 
> > > > Signed-off-by: Mans Rullgard <mans@mansr.com>
> > > > Signed-off-by: Bin Liu <b-liu@ti.com>
> > > > ---
> > > >  drivers/usb/musb/sunxi.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > 
> > > Does this need to go to stable kernel(s)?  If so, what commit does this
> > > fix fix?
> > 
> > No, I'd say it's a new feature.
> 
> Then why is it needed for 5.5-final and not for 5.6-rc1?

Right, it shouldn't be needed in 5.5.

Johan
