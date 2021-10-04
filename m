Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C68442197F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Oct 2021 23:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbhJDV6g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 17:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhJDV6f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 17:58:35 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7415C061749
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 14:56:45 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id oa6-20020a17090b1bc600b0019ffc4b9c51so405084pjb.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Oct 2021 14:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9y7riDeNDbxZ4NRQpyssCDChvJ1LIqCruwwNdCr++pI=;
        b=hJUynXsHtowO6YPoMbbKMPqmgbqGhndnyHzbik6Zs5eroP91LAH9jm5AM0L/V9naxE
         mX0LOUSlAm0NdTMwQTlTTiQ0f5agxLDy/iPEy/YXT8/H8IaIZJfHyuhggzfPjjX4o3jZ
         3bPXStzm4jLJeLrm/OBHFFy4KODGpGSyGmLjAincLYQK8ymDWfBMtKTmQ5vxy3GDYPdb
         qQZ/zrfmzfa/8WpBr8CFYI4hOaSthMzus7rLK+zf4nizFNoyOx3DZcitvxBlS5Oby9ac
         HzqG8fvoMWrEYbah99LuZqN1a8nZTpU6Bp1F/FGnSgDy9efhr7LKkN3XNU+6Z9Nl/50B
         +A8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9y7riDeNDbxZ4NRQpyssCDChvJ1LIqCruwwNdCr++pI=;
        b=cdFu9RD4jLL6XUh4WpSjA7Ft9WISla7sgbRhnYU2S2SbqW3YWzPBlffELoYHtnyqj1
         Ja9DnJZEHnASa8l87+/DbnnQsw33mPh0yFXz89NiR3tQkstyrM4SzjQUjTFexijVyo8J
         +8nJO3lLbWLm2r66+6TaCzhgjAiXHW1IaQ6LrsXLnijAB9NU5jVVcA8LV9mh4sDrdSfc
         UVTzOjgnaJ7937NCxXBEu2RhaG7q3wxBdUQAKm079lE6E7bDzImBFSvs166kR7FrrC5+
         /HElSd3ZlN+m7zUEVH6ySVZQWlrnPBoaZhR8Plrb+Rv1zbuiSZORvpze8H4Br1KWFIRk
         MN0w==
X-Gm-Message-State: AOAM530qiKsQ8xCiNmizJ0+TrDp1mtUywgVkX+Mkjy7hPkBEV5WVOt9W
        YabYL5f3nQsnePP0okL+uwCq4UCB+VwzN/IkGDN6Tg==
X-Google-Smtp-Source: ABdhPJyEGQe2OxC51Cpuh85Aq3vgJ4MoUwZn8lG1eKS5I4pm0MxqDpX83ESO4dVzGLS0tT9NGJ7NPpTwQsD+RYk3buQ=
X-Received: by 2002:a17:90b:1e05:: with SMTP id pg5mr6778604pjb.173.1633384604995;
 Mon, 04 Oct 2021 14:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210929224823.556943-1-rajatja@google.com> <2df726b3-e5c4-0fbb-991d-e31e74348d52@suse.com>
In-Reply-To: <2df726b3-e5c4-0fbb-991d-e31e74348d52@suse.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Mon, 4 Oct 2021 14:56:08 -0700
Message-ID: <CACK8Z6F7jqTSyqO9of7JXtTu_unLSEDWC=ExoC2tRbbiLM_h8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: hub: Mark root hubs on removable devices, as removable.
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Chris Chiu <chris.chiu@canonical.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        levinale@google.com, bleung@google.com, rajatxjain@gmail.com,
        jsbarnes@google.com, pmalani@google.com,
        Dmitry Torokhov <dtor@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Dmitry Torokhov

On Thu, Sep 30, 2021 at 1:02 AM Oliver Neukum <oneukum@suse.com> wrote:
>
>
> On 30.09.21 00:48, Rajat Jain wrote:
> > Currently all usb root hubs are always marked as DEVICE_REMOVABLE_UNKNOWN
> > unconditionally. Let us try to help the users to identify the removable
> > root hubs, by checking the device on which the root hub sits. If the base
> > (parent) device on which the root hub sits, is removable (e.g. on
> > thunderbolt docks), then the roothub is also marked as removable.
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
>
> Hi,
>
> frankly, why? You are needlessly throwing away information about where
> in the tree
> removal can happen.

I think this comment was meant for the *next* patch
(https://lkml.org/lkml/2021/9/29/1023) and perhaps we can discuss this
there? Let me copy your comment there and respond.

*This* patch does not throw away any information as currently the root
hubs are always and unconditionally marked as "unknown". This patch
aims to provide information where we can, for roothubs only.

Thanks,

Rajat


This looks like a worsening, not an improvement to me.
>
>     Regards
>         Oliver
>
