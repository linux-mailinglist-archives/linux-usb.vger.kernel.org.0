Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A67D42238EA
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 12:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgGQKFE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 06:05:04 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36456 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725912AbgGQKFE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 06:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594980303;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=2Cl26ld9ZGOVbX1b+g3zLKQapxqI7+XKQsCDyLyNA+Q=;
        b=PypMSIoSBGhwSfyPR00Z6nDlq45N7beDd8lyAtKm0r/Cuv7gqUAiVwbcF1lRtKV3Bwm7hI
        Kwefih8NPkMVx7BIY5VuA8/wYRhpaxopFG0P+pbCbUuWX6VW8R0xYi3rGF7zOh9rSDtcBP
        7JuWOwKnsu7Qylr/HE3OCmU6qV74HAs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-XS8-F_ChMe-XB0YWHmBzmQ-1; Fri, 17 Jul 2020 06:05:01 -0400
X-MC-Unique: XS8-F_ChMe-XB0YWHmBzmQ-1
Received: by mail-ed1-f71.google.com with SMTP id x20so5500392edr.20
        for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2020 03:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=2Cl26ld9ZGOVbX1b+g3zLKQapxqI7+XKQsCDyLyNA+Q=;
        b=el9DjHOBHkWgUjs+g9z8kD/C1+wOHDldhxki/cXvo5vCzPZi+JVTBpOUnm4MG9cC4v
         09Ng+bpPqFflZbETVkGWLuejfdFtnn/KbD7Tg87m/PGO6CVoEhxPZ0DsQg072YvomK4o
         3+eSDfhcYckNW8nAb8KPWbEpQdVnJEkvABQ9YaWXVIzMmOaxGQ3JoP3aLfxACgDRcFeu
         +1YWcO2Q/6bP0Hbe4JDb0Higjaao2PtS+lxcCJoKC3fvEdIMEqxjS/Mxh06ak5QLPWQh
         usKmIb5zLXtfeDW0hf9YkCwurGfDRAbrev4fORfGJD2X8zT+EggZsqBUGjkQpjz7okgr
         H+Zw==
X-Gm-Message-State: AOAM533Ns2CiInPxuaIl7TpgvR3Kb4esxDzqim+r41JBEXb0rvjnsTy6
        c86qcvmawpoDM4FrNvM8bQbPe/qeDFuzt5s6jOfIRqyd7701LDpdtevNLHpxh5kpNXqD6XR2HDa
        I6wAM42WOYfTjXhIXSF3Y
X-Received: by 2002:a17:906:494a:: with SMTP id f10mr8175330ejt.428.1594980299813;
        Fri, 17 Jul 2020 03:04:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs1k2JNMRCL7D7hyj4nVrmBh4WFWJeDyMBLFztKxswDS96+BBi+ZtGr03ls6TbEpcYJDTeNA==
X-Received: by 2002:a17:906:494a:: with SMTP id f10mr8175313ejt.428.1594980299606;
        Fri, 17 Jul 2020 03:04:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t2sm7903100eds.60.2020.07.17.03.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 03:04:59 -0700 (PDT)
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: AB BA lock inversion in ucsi driver caused by "usb: typec: ucsi:
 displayport: Fix a potential race during registration"
Message-ID: <734333be-aa48-d2fc-0463-6334115e3c12@redhat.com>
Date:   Fri, 17 Jul 2020 12:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

I've been running my personal kernel builds with lockdep enabled
(more people should do that) and it found an AB BA lock inversion in the
ucsi driver. This has been introduced by commit 081da1325d35 ("usb: typec:
ucsi: displayport: Fix a potential race during registration").

The problem is as follows:

AB order:

1. ucsi_init takes ucsi->ppm_lock (it runs with that locked for the duration of the function)
2. usci_init eventually end up calling ucsi_register_displayport, which takes
    ucsi_connector->lock

BA order:

1. ucsi_handle_connector_change work is started, takes ucsi_connector->lock
2. ucsi_handle_connector_change calls ucsi_send_command which takes ucsi->ppm_lock

I think this can be fixed by doing the following:

a. Make ucsi_init drop the ucsi->ppm_lock before it starts registering ports; and
    replacing any ucsi_run_command calls after this point with ucsi_send_command
    (which is a wrapper around run_command taking the lock while handling the command)

b. Move the taking of the ucsi_connector->lock from ucsi_register_displayport into
    ucsi_register_port() to make sure that nothing can touch the connector/port until
    ucsi_register_port() has completed.


b. is not stricly necessary but it brings the locking during init more inline
with locking done during runtime so this seems like a good idea.

Regards,

Hans

