Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84CE33A791F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 10:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhFOIiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 04:38:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50719 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230454AbhFOIiL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Jun 2021 04:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623746167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zQ0Ep4gSklPhhhQetAYfHp3vlzd1+9BgVu3ya8aRWQM=;
        b=JzPqnjpJSF+T+KD7oCQY1ng2kwBzBZoLafd8+fNC83mloNyFh0nEd59pH7VCO3TSCHadbw
        dFd1TL7t0JlTUTnZvfG9DtZXX9L61gTGq3xhjTz5lpWZZ+prPGVGIPfm+pmqVENCujq3nC
        /ExByn/oUiKzuFthDDOdaBBRZ/ZzrWc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-SXfhCTnEOW2f5NbGhOTj2g-1; Tue, 15 Jun 2021 04:36:06 -0400
X-MC-Unique: SXfhCTnEOW2f5NbGhOTj2g-1
Received: by mail-ej1-f70.google.com with SMTP id am5-20020a1709065685b02903eef334e563so4210905ejc.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 01:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zQ0Ep4gSklPhhhQetAYfHp3vlzd1+9BgVu3ya8aRWQM=;
        b=c4KV+entalBg/FFhyVneOaDwG8B/sDls6n2HWK9rs0360Xs+mkolzKdIjVcg15kjrO
         eq/gKsv64ucKmGUOVzzsHQZyX2kIgUo7WaIMVBjhAi4nUxfEJFOKqqifpB6m+3ej0cM5
         UxYphGal+s3QrRtJtE9LLYmTM0laV1vhojMHORM78LXQ/yu1aq1OIDGUhJDJQW6RwnpL
         NAuPUV7/Ki/xrE2ptujrer3Ill1aAkCncogw7HQ1hg9i9sJsuptIjqg9wRp+wTT6AUDq
         aORvMm66KuC0jM7/MeLroz1PhXGH53A84NhNZQYwhjzuqc/Qc/pQv+xk8gWHLCKoTM4B
         Hzgg==
X-Gm-Message-State: AOAM530hj0HwikuVF4xEFuZw2QDaw9nyc5OTJ6/1BjTRCE4UFuJFBOxM
        OJl1lrME2LYy1QOIStt+dBXZBJnnkdR/GruKIZT4CfvegNaIIxgabvygp55ck86nA5M/vfDbxnt
        Fj0h0iPtep7OsEJp9mImB1244Co4nX01Hl/RJcqSZBZ3WX3BnE4zE2TpympF+1gJZ5NddA+O7
X-Received: by 2002:a05:6402:177a:: with SMTP id da26mr22030423edb.40.1623746165041;
        Tue, 15 Jun 2021 01:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuia3ZZuLKlhW1jA90agTPeTWJUE4THW+wLb67BqgyyKefSYmWxSa7tNuFPsdEX1gg4N8JLw==
X-Received: by 2002:a05:6402:177a:: with SMTP id da26mr22030399edb.40.1623746164865;
        Tue, 15 Jun 2021 01:36:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id cx7sm11218545edb.65.2021.06.15.01.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 01:36:04 -0700 (PDT)
Subject: Re: [PATCH 0/8] drm + usb-type-c: Add support for out-of-band hotplug
 notification (v4)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20210604194840.14655-1-hdegoede@redhat.com>
 <YMhZiAFshz1xklUK@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <11c9eb33-d88e-6c0f-a7a5-fec3480ee789@redhat.com>
Date:   Tue, 15 Jun 2021 10:36:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMhZiAFshz1xklUK@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 6/15/21 9:40 AM, Greg Kroah-Hartman wrote:
> On Fri, Jun 04, 2021 at 09:48:32PM +0200, Hans de Goede wrote:
>> Here is v3 of my patchset making DP over Type-C work on devices where the
>> Type-C controller does not drive the HPD pin on the GPU, but instead
>> we need to forward HPD events from the Type-C controller to the DRM driver.
>>
>> Changes in v4:
>> - Rebase on top of latest drm-tip
>> - Add forward declaration for struct fwnode_handle to drm_crtc_internal.h
>>   (fixes warning reported by kernel test robot <lkp@intel.com>)
>> - Add Heikki's Reviewed-by to patch 7 & 8
>> - Add Heikki's Tested-by to the series
>>
>> Changes in v3:
>> - Base on top of latest drm-tip, which should fix the CI being unable to
>>   apply (and thus to test) the patches
>> - Make intel_acpi_assign_connector_fwnodes() take a ref on the fwnode
>>   it stores in connector->fwnode and have drm_connector_cleanup() put
>>   this reference
>> - Drop data argument from drm_connector_oob_hotplug_event()
>> - Make the Type-C DP altmode code only call drm_connector_oob_hotplug_event()
>>   when the HPD bit in the status vdo changes
>> - Drop the platform/x86/intel_cht_int33fe: Correct "displayport" fwnode
>>   reference patch, this will be merged independently through the pdx86 tree
>>
>> Changes in v2:
>> - Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
>>   device hold a reference to the connector" patch with:
>>   "drm/connector: Give connector sysfs devices there own device_type"
>>   the new patch is a dep for patch 2/9 see the patches
>>
>> - Stop using a class-dev-iter, instead at a global connector list
>>   to drm_connector.c and use that to find the connector by the fwnode,
>>   similar to how we already do this in drm_panel.c and drm_bridge.c
>>
>> - Make drm_connector_oob_hotplug_event() take a fwnode pointer as
>>   argument, rather then a drm_connector pointer and let it do the
>>   lookup itself. This allows making drm_connector_find_by_fwnode() a
>>   drm-internal function and avoids code outside the drm subsystem
>>   potentially holding on the a drm_connector reference for a longer
>>   period.
>>
>> This series not only touches drm subsys files but it also touches
>> drivers/usb/typec/altmodes/typec_displayport.c, that file usually
>> does not see a whole lot of changes. So I believe it would be best
>> to just merge the entire series through drm-misc, Assuming we can
>> get an ack from Greg for merging the typec_displayport.c changes
>> this way.
> 
> No objection from me, I've replied with reviewed-by for those USB
> patches now.

Great, thank you.

drm-devs, can I get an ack / reviewed-by for the rest of the series
so that I can push this to drm-misc-next ?

Regards,

Hans

