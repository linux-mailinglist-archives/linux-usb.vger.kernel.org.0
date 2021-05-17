Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D833382649
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 10:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbhEQIKA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 04:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbhEQIIv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 04:08:51 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8811FC061573
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 01:07:31 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id lj11-20020a17090b344bb029015bc3073608so3241835pjb.3
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IxSnEISy5CLiRWLMh9aMS41D9EJyxiVUgXZ2d/P9mcU=;
        b=dkuiiUybh/Rfx7FaBlcmk/PPmcU1X+titGUcEXSQmIjMfD2r1xhLb0ZksrSB/2tnjs
         UREfuDT0xQYnUs/T/59lkKQNRSRteLSm3wUaacPovX3B3X7YSHkMBxTP79CPrWBr++/s
         iZR5cMNm9Io7Gqgnt6X/8L4KN0EqVWlV3iE4fSsapE/EjqrAYkD/PeXbUlb3B1INxgEQ
         VjCREZCxH62Lu5IC2dkLgVBsJA1oLjKo1iwMicUfVBKPQzJ9N+otYph8TBWaG3x45ons
         foARZR3/NGxdRUEsSDyNpi22MxkhCcpsRXws+dr5MbpUDrbAZlG+zlyTGrEEwOijVBWp
         kZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IxSnEISy5CLiRWLMh9aMS41D9EJyxiVUgXZ2d/P9mcU=;
        b=hM0QOTIbY08p/BwyMHapBKbWi/AzJKK+DjxTvbnArAyIVg6VeF5LhOLzgByTVCk+Rl
         OgjGhroGrPmCBI2GS9GjGMS4PFwsr/3gbhMvyEzS5RUfZ8j42IM89uwAETHS6EIh+fep
         sfX9ozNYeoPci5TsU8xUabrADpq1+FUmz+tOKpd1PV7vFRM3MrsHQNIfAeR4J7q0zsGT
         UvrgBFlxDTJGRM/caMjzBB6tg+I2TOUixJNdgPRFFsigq6x75B6rGN9AAUY/3g8ka1Zl
         oPJsUBsj2cYBsVkuQIZBiqbQ/aoQsJbECRlAytw/EoBbXpBabkgsZcV2PFt0FDp/7Sem
         hYzw==
X-Gm-Message-State: AOAM533rydtHgGpXcKQSQPJQCcrSj5lgGzB7cfUCiG7Kqiii+VWvk44I
        5dnGyC9L/F6zlTSll+RDJMsA9ntyRQtayg==
X-Google-Smtp-Source: ABdhPJyZGkeZVTp01R9o4izTcZxCGgI1IUWWApwc6IalGLtbETOZHR/qrbT/K1Rc3EUTqH1rdViprw==
X-Received: by 2002:a17:902:7e02:b029:f1:62ce:6674 with SMTP id b2-20020a1709027e02b02900f162ce6674mr3582110plm.39.1621238851016;
        Mon, 17 May 2021 01:07:31 -0700 (PDT)
Received: from Journey.localdomain ([223.226.180.251])
        by smtp.gmail.com with ESMTPSA id w123sm9142702pfb.109.2021.05.17.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 01:07:30 -0700 (PDT)
Date:   Mon, 17 May 2021 13:37:27 +0530
From:   Hritik Vijay <hritikxx8@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Order in which kernel decides binding device driver
Message-ID: <YKIkPuj+fCod6f5B@Journey.localdomain>
References: <YKA0hphGFeqM+BZG@Journey.localdomain>
 <20210516010154.GA1046393@rowland.harvard.edu>
 <YKCovrGBB4QQAl52@Journey.localdomain>
 <20210516144118.GB1060053@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516144118.GB1060053@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 16, 2021 at 10:41:18AM -0400, Alan Stern wrote:
> Please use Reply-To-All so that your responses show up on the mailing 
> list.
> 
> On Sun, May 16, 2021 at 10:38:14AM +0530, Hritik Vijay wrote:
> > On Sat, May 15, 2021 at 09:01:54PM -0400, Alan Stern wrote:
> > > I believe this happens in the order that the drivers are registered.  
> > > For drivers in modules, this will be the order in which the modules are 
> > > loaded.
> > Can you please reference the code snippet with this ? If it happens in
> 
> There is no such snippet.  This is an emergent effect; it happens 
> because __device_attach in drivers/base/dd.c calls bus_for_each_drv to 
> try to match drivers with a new device, bus_for_each_drv in bus.c uses 
> next_driver to iterate through the list of drivers on a bus, next_driver 
> uses klist_next to follow the klist of driver knodes, and bus_add_driver 
> calls klist_add_tail to add a new driver knode to the end of the klist 
> of drivers for a bus.
> 
> > the order in which the modules are loaded then I suppose its the
> > responsibility of the hot-plugging daemon (udev here) to take care of
> > the load order.
> 
> No; load order is nobody's responsibility.  Making sure the system works 
> correctly is the responsibility of the programmers who wrote the device 
> drivers (is that you in this case?).  Drivers are supposed to work as 
> desired no matter what order they get probed in.
> 
> > > driver will be able to manage a particular device.  For cases where 
> > > there are two drivers capable of handling the same device, people 
> > > usually have some sort of priority scheme to decide.  For example, many 
> > > USB mass-storage devices can be handled by either the usb-storage or the 
> > > uas driver, but uas has higher priority.
> > > 
> > > Alan Stern
> > I'm curious about the case where no particular priority is defined.
> 
> In that case there is no definite requirement.  Either driver may be 
> probed first and consequently may end up binding to the device; the 
> result is more or less random.  It may even differ from one boot to the 
> next.
> 
> > Hrtk
> 
> Alan Stern

Thank you so much for the detailed reply. Having looked at dd.c and
bus.c, it now makes much more sense to me.

Hrtk
