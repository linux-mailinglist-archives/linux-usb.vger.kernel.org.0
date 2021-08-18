Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E72173F0DD7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 00:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234266AbhHRWEP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 18:04:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41886 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234106AbhHRWEP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Aug 2021 18:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629324219;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oK2hoz1pNxOtprsAxgLW7HzE+yMICN6HsSK04cEBylI=;
        b=U1M12Ef79gIzWfAIQ3nKTA5kV9J77YweVmr2XZeQqYPDhkfg47XtnhBmbV+pFsI9aCK4qW
        U2atCuQs/Zh0SOhFeUYi5WFzUK7cJ4ejWAY/7kGLTZi5Mk5nZXP+LPiSPTeQ5a4glYODvi
        oxPVlQQ305AT9dYNocq1IcpdZfO4Zew=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-oOmeJpRzOwSdS1HYNsSRfw-1; Wed, 18 Aug 2021 18:03:38 -0400
X-MC-Unique: oOmeJpRzOwSdS1HYNsSRfw-1
Received: by mail-qv1-f72.google.com with SMTP id u11-20020a0562141c0b00b0036201580785so3169160qvc.11
        for <linux-usb@vger.kernel.org>; Wed, 18 Aug 2021 15:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=oK2hoz1pNxOtprsAxgLW7HzE+yMICN6HsSK04cEBylI=;
        b=X45LmcPrbgaoHynm79lHtpZLkpKwg3xnk2BWD2jnJgUvqbXZTCn8lYYl5TIKDDI/qj
         sIQPlVhFSEV5cZmwLdPEmv/0MyyToENqN+ziG++T/UvAvdwFJ8Q+jTRKuIT4JunUYNY3
         zAEWMzJx8KJz9BOz1/FhMF8LDU8lfNuv0rofkgBMtF+adB+qMhl7rpcGldPaOgHofYhU
         97EhPN6QN5ojVrqSOdo1nLN4hNxnFBN6DpQ4ARPIMVAlM/ApYDD8trELCFWW4QzU1Xki
         h0uAZ0GLQ1uZ0SNbyeL8WfaB++TBOdPIcgruoFy6krhVA7KiHVSaQpCjaPfAtKjiOybN
         1XZw==
X-Gm-Message-State: AOAM531Fq7I0mlBtSEaF+nEmHgOMkmjvN6rxRGgKOpWp2VEjgfr0kfGr
        qchL5UaAF2qlaFeVmx83JKLRwHdwYlN7o7Bsh8ivm6L+kKd79YT1NF1QPGLwVlWYInamDdcktTL
        uycr5FeNsMqdKmeaU+87s
X-Received: by 2002:a37:8a44:: with SMTP id m65mr520049qkd.72.1629324218131;
        Wed, 18 Aug 2021 15:03:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc1VLlBPcs2iR13iycuCWuLv6rS+CUis7hvVYcDzugjfZJrLwBK518fpIWhBKDSKQE00KYsg==
X-Received: by 2002:a37:8a44:: with SMTP id m65mr520023qkd.72.1629324217953;
        Wed, 18 Aug 2021 15:03:37 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id b19sm620360qkc.7.2021.08.18.15.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 15:03:37 -0700 (PDT)
Message-ID: <1f5f00e0042e48bc3420c3f17457e82d83e68567.camel@redhat.com>
Subject: Re: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band
 hotplug notification (v4 resend)
From:   Lyude Paul <lyude@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Date:   Wed, 18 Aug 2021 18:03:35 -0400
In-Reply-To: <20210817215201.795062-1-hdegoede@redhat.com>
References: <20210817215201.795062-1-hdegoede@redhat.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This looks great to me! Wasn't much to comment on here as most of this looks
fine to me. For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

This will be quite interesting to try getting working for nouveau

On Tue, 2021-08-17 at 23:51 +0200, Hans de Goede wrote:
> Hi all,
> 
> Here is a rebased-resend of v4 of my patchset making DP over Type-C work on
> devices where the Type-C controller does not drive the HPD pin on the GPU,
> but instead we need to forward HPD events from the Type-C controller to
> the DRM driver.
> 
> Changes in v4 resend:
> - Rebase on top of latest drm-tip
> 
> Changes in v4:
> - Rebase on top of latest drm-tip
> - Add forward declaration for struct fwnode_handle to drm_crtc_internal.h
>   (fixes warning reported by kernel test robot <lkp@intel.com>)
> - Add Heikki's Reviewed-by to patch 7 & 8
> - Add Heikki's Tested-by to the series
> 
> Changes in v3:
> - Base on top of latest drm-tip, which should fix the CI being unable to
>   apply (and thus to test) the patches
> - Make intel_acpi_assign_connector_fwnodes() take a ref on the fwnode
>   it stores in connector->fwnode and have drm_connector_cleanup() put
>   this reference
> - Drop data argument from drm_connector_oob_hotplug_event()
> - Make the Type-C DP altmode code only call
> drm_connector_oob_hotplug_event()
>   when the HPD bit in the status vdo changes
> - Drop the platform/x86/intel_cht_int33fe: Correct "displayport" fwnode
>   reference patch, this will be merged independently through the pdx86 tree
> 
> Changes in v2:
> - Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
>   device hold a reference to the connector" patch with:
>   "drm/connector: Give connector sysfs devices there own device_type"
>   the new patch is a dep for patch 2/9 see the patches
> 
> - Stop using a class-dev-iter, instead at a global connector list
>   to drm_connector.c and use that to find the connector by the fwnode,
>   similar to how we already do this in drm_panel.c and drm_bridge.c
> 
> - Make drm_connector_oob_hotplug_event() take a fwnode pointer as
>   argument, rather then a drm_connector pointer and let it do the
>   lookup itself. This allows making drm_connector_find_by_fwnode() a
>   drm-internal function and avoids code outside the drm subsystem
>   potentially holding on the a drm_connector reference for a longer
>   period.
> 
> This series not only touches drm subsys files but it also touches
> drivers/usb/typec/altmodes/typec_displayport.c, that file usually
> does not see a whole lot of changes. So I believe it would be best
> to just merge the entire series through drm-misc, Assuming we can
> get an ack from Greg for merging the typec_displayport.c changes
> this way.
> 
> Regards,
> 
> Hans
> 
> Hans de Goede (7):
>   drm/connector: Give connector sysfs devices there own device_type
>   drm/connector: Add a fwnode pointer to drm_connector and register with
>     ACPI (v2)
>   drm/connector: Add drm_connector_find_by_fwnode() function (v3)
>   drm/connector: Add support for out-of-band hotplug notification (v3)
>   drm/i915/dp: Add support for out-of-bound hotplug events
>   usb: typec: altmodes/displayport: Make dp_altmode_notify() more
>     generic
>   usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
> 
> Heikki Krogerus (1):
>   drm/i915: Associate ACPI connector nodes with connector entries (v2)
> 
>  drivers/gpu/drm/drm_connector.c              | 79 ++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h          |  2 +
>  drivers/gpu/drm/drm_sysfs.c                  | 87 +++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_acpi.c    | 46 +++++++++++
>  drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +
>  drivers/gpu/drm/i915/display/intel_display.c |  1 +
>  drivers/gpu/drm/i915/display/intel_dp.c      | 12 +++
>  drivers/usb/typec/altmodes/Kconfig           |  1 +
>  drivers/usb/typec/altmodes/displayport.c     | 58 ++++++++-----
>  include/drm/drm_connector.h                  | 25 ++++++
>  10 files changed, 279 insertions(+), 35 deletions(-)
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

