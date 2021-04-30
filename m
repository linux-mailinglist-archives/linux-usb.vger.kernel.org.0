Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44E2C36F975
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 13:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhD3Ljv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 07:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbhD3Lju (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 07:39:50 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972B3C06174A
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 04:39:02 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id z20-20020a0568301294b02902a52ecbaf18so11772280otp.8
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 04:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iCEXz/yaxYBT/FshpzlIrzQLK04AK7mC76pDdEPQ8/E=;
        b=jTFs6Ygb5gdbje8oWB9YHArP9jIqk5llWrjliDwHnL1dPABD2I1fuU06jlleJ0GPuD
         yt3CS2jg4F/ehoeJGukE+WW2GkNUAtHtObj4pgArLnJRKljqCdyET5f6GHwzNDUMeed7
         efRia80oFUziPIm+EIHOY2VsaVWTgj6CYumL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iCEXz/yaxYBT/FshpzlIrzQLK04AK7mC76pDdEPQ8/E=;
        b=uJ7U7uvicL1p2zAr0r97KPtJP967GjxphRnDz4iuFmsWKcAY6S+54nChM58j4HpFoa
         WR3F+zhOBJUjCK5MPT+2S00DTfar9eKdxGpB1C2WRWnltEgnBQc/A3JhzifK0wG9oCrD
         5NzCsGLG4EtB0UacosflE0rMWq4HHrix3hClPlncIF5pT3T6J7veMqVaMKPi6D6KmLTS
         Ve303aY4QWac603ppwsZKFgTK/I1jN7oLB/b7r+wQ2Pdnu1qxUkEbn8JDk+CvFgJFLUf
         dlwmFv8P2/72fl7Rj9nKQs0X6vgx8Rr1T/7thaR/FSVcjIlAZyXT5bc4Vkdzn8yu7yrF
         O/OA==
X-Gm-Message-State: AOAM532vMwy9Momb0jV2jkMv0BfJTM0HWN82CaITPqBftwEvsmWbXpW8
        1ACHnSVXOsqSX69oLqT/GrvUH0K40/y4NwueCawK8Xo6HEQ=
X-Google-Smtp-Source: ABdhPJyXfDzTj/Hp5TwOz9Yr1HlSkJoBEYod0CqWLP9ktLIpQN6SATRaQVjnSrT/eSNfbx2VChv3bBS7bCXLlOX0Jl0=
X-Received: by 2002:a9d:10a:: with SMTP id 10mr3349443otu.188.1619782741979;
 Fri, 30 Apr 2021 04:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210428215257.500088-1-hdegoede@redhat.com> <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local> <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
 <YIsEfAjFthAyHxUi@phenom.ffwll.local> <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
In-Reply-To: <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 30 Apr 2021 13:38:51 +0200
Message-ID: <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 30, 2021 at 1:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/29/21 9:09 PM, Daniel Vetter wrote:
> > On Thu, Apr 29, 2021 at 02:33:17PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 4/29/21 2:04 PM, Daniel Vetter wrote:
> >>> On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
> >>>> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
> >>>>> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
> >>>>>> Userspace could hold open a reference to the connector->kdev device,
> >>>>>> through e.g. holding a sysfs-atrtribute open after
> >>>>>> drm_sysfs_connector_remove() has been called. In this case the connector
> >>>>>> could be free-ed while the connector->kdev device's drvdata is still
> >>>>>> pointing to it.
> >>>>>>
> >>>>>> Give drm_connector devices there own device type, which allows
> >>>>>> us to specify our own release function and make drm_sysfs_connector_add()
> >>>>>> take a reference on the connector object, and have the new release
> >>>>>> function put the reference when the device is released.
> >>>>>>
> >>>>>> Giving drm_connector devices there own device type, will also allow
> >>>>>> checking if a device is a drm_connector device with a
> >>>>>> "if (device->type == &drm_sysfs_device_connector)" check.
> >>>>>>
> >>>>>> Note that the setting of the name member of the device_type struct will
> >>>>>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
> >>>>>> as extra info. So this extends the uevent part of the userspace API.
> >>>>>>
> >>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>>>
> >>>>> Are you sure? I thought sysfs is supposed to flush out any pending
> >>>>> operations (they complete fast) and handle open fd internally?
> >>>>
> >>>> Yes, it "should" :)
> >>>
> >>> Thanks for confirming my vague memories :-)
> >>>
> >>> Hans, pls drop this one.
> >>
> >> Please see my earlier reply to your review of this patch, it is
> >> still needed but for a different reason:
> >>
> >> """
> >> We still need this change though to make sure that the
> >> "drm/connector: Add drm_connector_find_by_fwnode() function"
> >> does not end up following a dangling drvdat pointer from one
> >> if the drm_connector kdev-s.
> >>
> >> The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
> >> a reference on all devices and between getting that reference
> >> and it calling drm_connector_get() - drm_connector_unregister()
> >> may run and drop the possibly last reference to the
> >> drm_connector object, freeing it and leaving the kdev's
> >> drvdata as a dangling pointer.
> >> """
> >>
> >> This is actually why I added it initially, and while adding it
> >> I came up with this wrong theory of why it was necessary independently
> >> of the drm_connector_find_by_fwnode() addition, sorry about that.
> >
> > Generally that's handled by a kref_get_unless_zero under the protection of
> > the lock which protects the weak reference. Which I think is the right
> > model here (at a glance at least) since this is a lookup function.
>
> I'm afraid that things are a bit more complicated here. The idea here
> is that we have a subsystem outside of the DRM subsystem which received
> a hotplug event for a drm-connector.  The only info which this subsystem
> has is a reference on the fwnode level (either through device-tree or
> to platform-code instantiating software-fwnode-s + links for this).
>
> So in order to deliver the hotplug event to the connector we need
> to lookup the connector by fwnode.
>
> I've chosen to implement this by iterating over all drm_class
> devices with a dev_type of drm_connector using class_dev_iter_init()
> and friends. This makes sure that we either get a reference to
> the device, or that we skip the device if it is being deleted.
>
> But this just gives us a reference to the connector->kdev, not
> to the connector itself. A pointer to the connector itself is stored
> as drvdata inside the device, but without taking a reference as
> this patch does, there is no guarantee that that pointer does not
> point to possibly free-ed mem.
>
> We could set drvdata to 0 from drm_sysfs_connector_remove()
> Before calling device_unregister(connector->kdev) and then do
> something like this inside drm_connector_find_by_fwnode():
>
> /*
>  * Lock the device to ensure we either see the drvdata == NULL
>  * set by drm_sysfs_connector_remove(); or we block the removal
>  * from continuing until we are done with the device.
>  */
> device_lock(dev);
> connector = dev_get_drvdata(dev);
> if (connector && connector->fwnode == fwnode) {
>         drm_connector_get(connector);
>         found = connector;
> }
> device_unlock(dev);

Yes this is what I mean. Except not a drm_connector_get, but a
kref_get_unless_zero. The connector might already be on it's way out,
but the drvdata not yet cleared.

> With the device_lock() synchronizing against the device_lock()
> in device_unregister(connector->kdev). So that we either see
> drvdata == NULL if we race with unregistering; or we get
> a reference on the drm_connector obj before its ref-count can
> drop to 0.

The trouble is that most connectors aren't full drivers on their kdev.
So this isn't the right lock. We need another lock which protects the
drvdata pointer appropriately for drm connectors.

> There might be places though where we call code take the device_lock
> while holding a lock necessary for the drm_connector_get() , so
> this approach might lead to an AB BA deadlock. As such I think
> my original approach is better (also see below).
>
> > Lookup tables holding full references tends to lead to all kinds of bad
> > side effects.
>
> The proposed reference is not part of a lookup list, it is a
> reference from the kdev on the drm_connector object which gets
> dropped as soon as the kdev's refcount hits 0, which normally
> happens directly after drm_connector_unregister() has run.

Yeah but the way you use it is for lookup purposes. What we're
implementing is the "get me the drm_connector for this fwnode"
functionality, and that _is_ a lookup. How its implemented is an
internal detail really, and somehow using full references for lookup
functionality isn't great.

I'm also not sure why we have to use the kdev stuff here. For other
random objects we need to look up we're building that functionality on
that object. It means you need to keep another list_head around for
that lookup, but that's really not a big cost. E.g. drm_bridge/panel
work like that.

> In many other places in the kernel problems like this are
> solved by embedding the device struct inside the containing
> data struct (so the drm_connector struct) and using the
> device_struct's refcounting for all refcounting and using
> the device struct's release callback as the release callback for
> the entire object.
>
> That is not doable here since the drm_object code has its own
> refcounting going on. What this patch is in essence doing is
> simulating having only 1 refcount, by making sure the
> main-object release callback does not get run until
> the drm_objects' refcount and the device's refcount have
> both reached 0 (by keeping the drm_object's refcount at
> a minimum of 1 as long as there are references to the
> device).

Uh yeah that sounds bad. If you really need the full refcount we
should really only have one.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
