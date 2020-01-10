Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 202CF136858
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2020 08:36:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgAJHfz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jan 2020 02:35:55 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41896 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgAJHfy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jan 2020 02:35:54 -0500
Received: from mail-ot1-f70.google.com ([209.85.210.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1ipopj-0001Jq-IM
        for linux-usb@vger.kernel.org; Fri, 10 Jan 2020 07:35:51 +0000
Received: by mail-ot1-f70.google.com with SMTP id o14so543422otp.4
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2020 23:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VkFahSTywvqn5j5X/7juimxnMuGVeAK18BGmio6HoZw=;
        b=R/ePNVC0SnR6qfruVW68WA5nvS+2gQQMuDoEq5iFeVF/jMcMPGwVfF7xZIhJ9FvY+8
         mZAtfxBgMwz6pI/h3hKWj9FCfw/tDq8pMVHv/X+PSnouUm184fLfjlnaWLRZm/zVIl+a
         pfqYRb+T0OXOOGEjfB+/8p7bOKU9MHSDhcEgJigbz9MlYqr6tBtJYtzwKWQlma16PQh3
         aF66tmGNTU06ukNPyksy7p+w20THto4m04XVrDLc1l30UfM9AJGUpCT0f5ziUDtKQHuc
         EaoAz3IrcXMMN+4EhcoRKqk7r/zS8ivBxck7storGeIxUnmwx5m6oG1OBlNt2HoiRcdG
         uCjw==
X-Gm-Message-State: APjAAAUbFkrlyEE3Yd4hCrT0QTzCPS4kegBQ7bl2lmWg7KjlZsaj3RCJ
        fdz90FGp6rAkdj5gJa1gVNk9HdklVhwErhmMUNLbulQoVszRJlvstGns4+9oi7h+UuQfZAEg3SS
        XSjRwGOd+fscPPTyHJHRtX4pSfd3XDtS60SZI/RU9/EFHzkEMMm0jPg==
X-Received: by 2002:aca:2419:: with SMTP id n25mr1229244oic.13.1578641750557;
        Thu, 09 Jan 2020 23:35:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxuBy33kewJNyY+KyNet6/qLs+DSuqtwhqq5q4SMD4TyxqUukaZwkF34vIpgcwDcgi7iTsY1+4vIVHFbRMI5sk=
X-Received: by 2002:aca:2419:: with SMTP id n25mr1229235oic.13.1578641750299;
 Thu, 09 Jan 2020 23:35:50 -0800 (PST)
MIME-Version: 1.0
References: <90B37743-30D1-41BB-8272-D5FBDC89C88F@canonical.com> <Pine.LNX.4.44L0.2001061007070.1514-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001061007070.1514-100000@iolanthe.rowland.org>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Fri, 10 Jan 2020 15:35:39 +0800
Message-ID: <CAAd53p7NhhQL=5teoaLQ4r5Y-QDGysGoXS-wwGc1fh59rfYu2g@mail.gmail.com>
Subject: Re: [PATCH 3/3] USB: Disable LPM on WD19's Realtek Hub during setting
 its ports to U0
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 6, 2020 at 11:08 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 6 Jan 2020, Kai-Heng Feng wrote:
>
> > > On Jan 5, 2020, at 00:20, Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Sat, 4 Jan 2020, Kai-Heng Feng wrote:
> > >
> > >>>>>> @@ -3533,9 +3533,17 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
> > >>>>>>        }
> > >>>>>>
> > >>>>>>        /* see 7.1.7.7; affects power usage, but not budgeting */
> > >>>>>> -      if (hub_is_superspeed(hub->hdev))
> > >>>>>> +      if (hub_is_superspeed(hub->hdev)) {
> > >>>>>> +              if (hub->hdev->quirks & USB_QUIRK_DISABLE_LPM_ON_U0) {
> > >>>>>> +                      usb_lock_device(hub->hdev);
> > >>>>>> +                      usb_unlocked_disable_lpm(hub->hdev);
> > >>>>>> +              }
> > >>>>>>                status = hub_set_port_link_state(hub, port1, USB_SS_PORT_LS_U0);
> > >>>>>> -      else
> > >>>>>> +              if (hub->hdev->quirks & USB_QUIRK_DISABLE_LPM_ON_U0) {
> > >>>>>> +                      usb_unlocked_enable_lpm(hub->hdev);
> > >>>>>> +                      usb_unlock_device(hub->hdev);
> > >>>>>
> > >>>>> The locking here seems questionable.  Doesn't this code sometimes get
> > >>>>> called with the hub already locked?  Or with the child device locked
> > >>>>> (in which case locking the hub would violate the normal locking order:
> > >>>>> parent first, child second)?
> > >>>
> > >>> I did a little checking.  In many cases the child device _will_ be
> > >>> locked at this point.
> > >>>
> > >>>> Maybe introduce a new lock? The lock however will only be used by this specific hub.
> > >>>> But I still want the LPM can be enabled for this hub.
> > >>>
> > >>> Do you really need to lock the hub at all?  What would the lock protect
> > >>> against?
> > >>
> > >> There can be multiple usb_port_resume() run at the same time for different ports, so this is to prevent LPM enable/disable race.
> > >
> > > But there can't really be an LPM enable/disable race, can there?  The
> > > individual function calls are protected by the bandwidth mutex taken by
> > > the usb_unlocked_{en|dis}able_lpm routines, and the overall LPM setting
> > > is controlled by the hub device's lpm_disable_counter.
> >
> > For enable/disable LPM itself, there's no race.
> > But the lock here is to protect hub_set_port_link_state().
> > If we don't lock the hub, other instances of usb_port_resume()
> > routine can enable LPM and we want the LPM stays disabled until
> > hub_set_port_link_state() is done.
>
> That's what I was trying to explain above.  Other instances of
> usb_port_resume() _can't_ enable LPM while this instance is running,
> because the lpm_disable_counter value will be > 0.

Yes you are right, there's actually no race.
The hub is still a bit flaky with this approach, so I'll resend a v2
to simply disable LPM for this hub.

Kai-Heng

>
> Alan Stern
>
