Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B470336E9F5
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 14:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhD2MFu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Apr 2021 08:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhD2MFs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Apr 2021 08:05:48 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7109C06138B
        for <linux-usb@vger.kernel.org>; Thu, 29 Apr 2021 05:04:59 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e5so38001548wrg.7
        for <linux-usb@vger.kernel.org>; Thu, 29 Apr 2021 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MiEGZ+NS79WfLSCC9MIwqhDMsalGqkYSHOP1/CwaZU4=;
        b=YgwMixYszQENkHqy9w2Jcs0yAfAy1kkME8DMPpQ5ZZLD193GRfpHBf4uqFL3SRq2Cy
         MM+bj/rtvHESAWxPWym3OBx8oRK+LwSF0/sJoHB5CqkFIFcySppu5xnLyQbDsdRqeY9C
         GNh3BbYzxbHMCioyzp9U4suZ3fcl/+bL0ydOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MiEGZ+NS79WfLSCC9MIwqhDMsalGqkYSHOP1/CwaZU4=;
        b=t17MDKYKs0qj1a0u7eiqXZjmnSdZzYYAJbOOD+qBHN4ABodMvpkMjBeJ7zQ/5R4D+V
         joGMr183kF+6/UsQ7YFIwzCvxq4gXHYESq+TLllJC/T9kocHxRbM+6zOkDT2C+A3v2Bg
         IQ/7ZW8kij7qdG/Vdae1FOVlza+zoEK66ToaWxbXzZL94Sbe6tDNf82FQOE4R653XH4+
         5wxnTE3zS76orIQ91CBy3hS1WFopDXrlislSAAdR/lCoLW6IExmar0qCZc/XzGHmL/lc
         AXjEHuhZBTchivvMxogV1VMeZd6mULU2X68FtRBQ1iUB2z2UpenYLLPtucvDicru6EYA
         +kTA==
X-Gm-Message-State: AOAM533WEWtX2L2VrilVMFXSNtSi1usLg0LWRxtSkudjx9I/XLkTL1XM
        pdLQuLHodOkjvDu5BnUeQ6VkxA==
X-Google-Smtp-Source: ABdhPJzmDVcXuCXiplPzF0O0arZ1mMffMpsXfHhp9ao117QhIvz6OE2+jM6MkrgthQaHAg5tIffCHw==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr43468889wrh.68.1619697898559;
        Thu, 29 Apr 2021 05:04:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id e10sm4495558wrw.20.2021.04.29.05.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 05:04:57 -0700 (PDT)
Date:   Thu, 29 Apr 2021 14:04:55 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
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
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
Message-ID: <YIqg59yageIUwiwy@phenom.ffwll.local>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local>
 <YIqehmw+kG53LF3t@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIqehmw+kG53LF3t@kroah.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
> > On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
> > > Userspace could hold open a reference to the connector->kdev device,
> > > through e.g. holding a sysfs-atrtribute open after
> > > drm_sysfs_connector_remove() has been called. In this case the connector
> > > could be free-ed while the connector->kdev device's drvdata is still
> > > pointing to it.
> > > 
> > > Give drm_connector devices there own device type, which allows
> > > us to specify our own release function and make drm_sysfs_connector_add()
> > > take a reference on the connector object, and have the new release
> > > function put the reference when the device is released.
> > > 
> > > Giving drm_connector devices there own device type, will also allow
> > > checking if a device is a drm_connector device with a
> > > "if (device->type == &drm_sysfs_device_connector)" check.
> > > 
> > > Note that the setting of the name member of the device_type struct will
> > > cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
> > > as extra info. So this extends the uevent part of the userspace API.
> > > 
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > Are you sure? I thought sysfs is supposed to flush out any pending
> > operations (they complete fast) and handle open fd internally?
> 
> Yes, it "should" :)

Thanks for confirming my vague memories :-)

Hans, pls drop this one.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
