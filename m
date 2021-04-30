Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8A936FBA9
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 15:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhD3Nq3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 09:46:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24083 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229688AbhD3Nq2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 09:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619790339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ngr4LyEkdELa/6PdIZcv+wXD2znntuZQwvgVg8NJ51s=;
        b=V7P2omlLNQc2AxgLppjU65tDnKDliryZX6sqj6cwbWg9U1PDITLcMhaYEjKO1NvlNRt0vu
        sBLb73ihkj825N/gU03OpJwNkH9OgfRu4UEscKProlYLwcQQvQAZxggBxPB74+0xQ4Jct0
        i9B38wkpM6cSyZMqd4ClYong7BZ5CHI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-XioLvotnPlW11gONbtE9rw-1; Fri, 30 Apr 2021 09:45:36 -0400
X-MC-Unique: XioLvotnPlW11gONbtE9rw-1
Received: by mail-ed1-f71.google.com with SMTP id u30-20020a50a41e0000b0290385504d6e4eso8545878edb.7
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 06:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ngr4LyEkdELa/6PdIZcv+wXD2znntuZQwvgVg8NJ51s=;
        b=iw0MGmLTBCxn4JveYd3uEl7OFmN/YNPVbpKu/CThFVLPuW2fuoW81okZe7jGfcBrR6
         TZYce0aLubvDCFNoz2Ne70MasniTqRikIqMUSAhNWYKpDSV+cPD7p6oL2TqwNaOwvFLm
         5l2vfUtaqPEs8jYt+t9ayFoIiVvCL6/+sHfNnLarznQ3ms6aoWRq/6MWT8BDFToNlMZW
         i1AnwELl0qTqHQ3ZtPU7SI7eQcX4slNmWwo7yqfZa9Mwm0m5IjTbEbkeyq6gmMmPY+YH
         TyzR3qXWY7EpZ/ncGDfEpdPLC4f/7x5fSyrTQ8syNRaOO7YEr6ff6w1oBtFOQHbMGI7C
         aqLA==
X-Gm-Message-State: AOAM532EsGUBt4KDqwDQTTNPe945NVw3feCqb3EEQuCoMmQKHDEKsFNx
        5k/9ZgSn4OQ/e0b4SycyYi4pKXNVdcGqbOyMje51gTRZJOiVPQOp30tq4wDFrCwAxRz7F6fcubY
        cB6EZel+ZZDvylaH7AEsk5IPEKxJ6bgASDCOFcO/nf3qCVNn6NmtAyoDxvmaRP8KxVJSAuEte
X-Received: by 2002:a05:6402:40d6:: with SMTP id z22mr6005365edb.275.1619790335161;
        Fri, 30 Apr 2021 06:45:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVgln2PsbGBWtD0Y9vGbxqHA4KEKia8ZfjelCngqnsAV0j0ddhk9OZLNm9FE8nL8viwO/OZw==
X-Received: by 2002:a05:6402:40d6:: with SMTP id z22mr6005318edb.275.1619790334881;
        Fri, 30 Apr 2021 06:45:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n10sm1933338ejg.124.2021.04.30.06.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 06:45:34 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To:     Daniel Vetter <daniel@ffwll.ch>
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
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
 <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
 <YIsEfAjFthAyHxUi@phenom.ffwll.local>
 <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
 <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9c6d5361-c435-521e-d7d7-f8976927f9de@redhat.com>
Date:   Fri, 30 Apr 2021 15:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFf8n6QfRdSXeB6J+L7NPGbeEyJKhx1Vu7x8env=_7tkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

p.s.

On 4/30/21 1:38 PM, Daniel Vetter wrote:

Offtopic:

> I'm also not sure why we have to use the kdev stuff here. For other
> random objects we need to look up we're building that functionality on
> that object. It means you need to keep another list_head around for
> that lookup, but that's really not a big cost. E.g. drm_bridge/panel
> work like that.

So I took a peek at the bridge/panel code and that actually seems to
have an issue with removal vs lookup. It is not even just a race,
it seems a lookup does not take a reference and there is nothing
stopping a user from doing an unbind or rmmod causing the panel
to be removed while other code which got a pointer to the panel
through of_drm_find_panel() will not be prepared to deal with
that pointer all of a sudden no longer being valid.

Now this would be a case of the user shooting his-self in the
foot (where as connectors can actually dynamically disappear
under normal circumstances), but ideally we really should do
better here.

Is there a TODO list somewhere for issues like this ?  Or shall
I submit a patch adding a FIXME comment, or is this considered
not worth the trouble of fixing it?

Regards,

Hans

