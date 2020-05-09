Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04701CC1C0
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 15:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgEINXh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 09:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726904AbgEINXg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 09:23:36 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9368C061A0C
        for <linux-usb@vger.kernel.org>; Sat,  9 May 2020 06:23:36 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fu13so5516317pjb.5
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2020 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m6rH3XcvlCHD6Smk1GtwJfgqlq+VWlPnqoHpZdRsMeI=;
        b=vv++posiC5BPmZR4HWX8HS+TzniLdtAGuZFZDPbrPQo1073D3q/ECQEOkg1aMylGI1
         pWv+JD9zI9AJp/wNJqfhuYsc8R1lC7gLi+pl//nsy4vs0dEKOSB5xkpCrb8YUojJC5Vz
         6QbTBjWLt8wZG93KzYbQG5Kho2qq6trdt+humq28A4e0AkaRfZvkk6CTcntdGyl7oRXB
         6iWpykNJXNUNcPBZVSpbbPZTBlVFjgk5c5aohXtD/3SIaPwwsGPN3Vdv9e2iim7kDo0t
         U5hWGmQHtT2fyGK5ITs9NbkgqJG4B7WOxj9iy2UYJB5YHpyxJSVsj8PBX/9SU2M4g02q
         mtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m6rH3XcvlCHD6Smk1GtwJfgqlq+VWlPnqoHpZdRsMeI=;
        b=QuA4jW5I8Dqjx7YV+fQgvn69xnO2Dgs2QgOiB5JfKuDKGBL/kYQl0L69v8SoILpnWo
         LAxG4tYkznbokO7pnhgNe9FouX5MDubn7i659RIToJNMgxAgNtMXuwXBZ+fYSNqfQV92
         xAFp5L78NvzdfcA5ijIyMn2C/0NGN2mA9tIgfCIxnlI7qsaSSGyYCbljtqXfr9XIA101
         aMqAHuQ27jC9vrZBBDFbZ3SBPfX8f3KEjDDUD2cOEesMR8D6/0sEeTSf53+YogbDk1Wj
         1DcgEoAaQeDOY3UzmL6VsKqXxgB5v+HlfEW+pUFGXdKg0h6BHKRTUNDyjwM8j4tLS4BZ
         M+pA==
X-Gm-Message-State: AGi0Puby9FlgcZDvD4p0Xf5FQDff71nON8IaKoGQqPC5LV2no5N1w9K4
        Z+hMZaszr41spStZlZCzfgqcBIeoUBWDoKOkxN51v1e2uzI=
X-Google-Smtp-Source: APiQypLd3DqT21blgK/ByDCDeGLDE/yVcvXALGEMRPzDrr+O9dO+G6ZMeK8jNvsQSMWeSC/9purWjmLv/Y1njyvZz7c=
X-Received: by 2002:a17:902:4c:: with SMTP id 70mr6810872pla.336.1589030615938;
 Sat, 09 May 2020 06:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588870822.git.andreyknvl@google.com> <459d02069dedefcc30095748f49ef4a426e15b74.1588870822.git.andreyknvl@google.com>
 <873689mtbv.fsf@kernel.org>
In-Reply-To: <873689mtbv.fsf@kernel.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Sat, 9 May 2020 15:23:25 +0200
Message-ID: <CAAeHK+zRcz8YH_r+QJVJzSgmC9aY57+COybOo60uR0GJTqfSUg@mail.gmail.com>
Subject: Re: [PATCH USB v3 3/5] usb: raw-gadget: fix gadget endpoint selection
To:     Felipe Balbi <balbi@kernel.org>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 9, 2020 at 10:00 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> Andrey Konovalov <andreyknvl@google.com> writes:
>
> > Currently automatic gadget endpoint selection based on required features
> > doesn't work. Raw Gadget tries iterating over the list of available
> > endpoints and finding one that has the right direction and transfer type.
> > Unfortunately selecting arbitrary gadget endpoints (even if they satisfy
> > feature requirements) doesn't work, as (depending on the UDC driver) they
> > might have fixed addresses, and one also needs to provide matching
> > endpoint addresses in the descriptors sent to the host.
> >
> > The composite framework deals with this by assigning endpoint addresses
> > in usb_ep_autoconfig() before enumeration starts. This approach won't work
> > with Raw Gadget as the endpoints are supposed to be enabled after a
> > set_configuration/set_interface request from the host, so it's too late to
> > patch the endpoint descriptors that had already been sent to the host.
> >
> > For Raw Gadget we take another approach. Similarly to GadgetFS, we allow
> > the user to make the decision as to which gadget endpoints to use.
> >
> > This patch adds another Raw Gadget ioctl USB_RAW_IOCTL_EPS_INFO that
> > exposes information about all non-control endpoints that a currently
> > connected UDC has. This information includes endpoints addresses, as well
> > as their capabilities and limits to allow the user to choose the most
> > fitting gadget endpoint.
> >
> > The USB_RAW_IOCTL_EP_ENABLE ioctl is updated to use the proper endpoint
> > validation routine usb_gadget_ep_match_desc().
> >
> > These changes affect the portability of the gadgets that use Raw Gadget
> > when running on different UDCs. Nevertheless, as long as the user relies
> > on the information provided by USB_RAW_IOCTL_EPS_INFO to dynamically
> > choose endpoint addresses, UDC-agnostic gadgets can still be written with
> > Raw Gadget.
> >
> > Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > ---
>
> you're adding a new IOCTL, how is this a fix?

It's a fix in a sense that without this patch a user can't make
raw-gadget work with other UDCs besides dummy, and with this patch it
works (at least with dwc2 I'm currently using for tests).

I guess I could split this patch into two, one that removes the failed
attempt to auto-assign endpoints, and another one that adds the new
ioctl. Should I do that?
