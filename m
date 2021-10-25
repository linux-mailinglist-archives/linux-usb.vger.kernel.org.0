Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACC44397D6
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 15:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbhJYNu6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 09:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36759 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232478AbhJYNu6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 09:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635169715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QFI3PFtyII2N/X0+5XOVxFRqOrrQcvsw/pIIb4c1XKU=;
        b=eNdpgRWBBsyQbuF9SoDOtXVEhgRm1pO8ISLlOjTU5a79vv/4v5ZY4ohpsij8nM+qcaInYW
        4tHROde80GJ4+uLyZhenE4wm0q7XYDssHo7OCtbZB8ayonXG0iguM2kZlPdl22YBzXwwlN
        G6KbVGHHsJIihcFX1aGT+sqHYq4QtgE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-e_2Eh546NaOmfXMNR_9KAg-1; Mon, 25 Oct 2021 09:48:34 -0400
X-MC-Unique: e_2Eh546NaOmfXMNR_9KAg-1
Received: by mail-ed1-f70.google.com with SMTP id i9-20020a508709000000b003dd4b55a3caso304415edb.19
        for <linux-usb@vger.kernel.org>; Mon, 25 Oct 2021 06:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=QFI3PFtyII2N/X0+5XOVxFRqOrrQcvsw/pIIb4c1XKU=;
        b=o3Amn87756VUr+T25MuaBLspfHQWW+nydeQTPk1RLrcQDpIUSbqusveA0OFtriLsIC
         gBVlIrlpS91nYmsSKpRXZSo9Dpf5N/XgutqApHbui31mRVTvNQzDA2PYpVdfabel8ej6
         7FQLrxyCbZbE5uAwO48MnYOmrf8/JbTc340lmI/ftgqcsrmRGkq8xwvvia401spGibz0
         6skfhWjtEoXUlyPMuYuI1RPGsYZg0N9wjHMZcgE56JHwl1Qb+USeSkObVfDEuoCQFBwd
         RZpWopnkp39JxMtk5cyDWoNt2FSUhOPbCkKjW0+aJFqSD9tjUWzPNnlrFW/Y+tfjA6DK
         Jq5A==
X-Gm-Message-State: AOAM5303GCInlY3I8qQz05btC98STo0LBnXkAEKhWNRoqL9uHeNNGM0I
        coBZDUF9o5k2XBIvvleQRu4TfOub021pxu51rVwAN7K5yaDZk3oM2g4wJUQOcb2lfww5k6MYIe1
        LJ6SQoN8U8hdU2deXyZTo
X-Received: by 2002:a17:906:d552:: with SMTP id cr18mr10372637ejc.130.1635169712712;
        Mon, 25 Oct 2021 06:48:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJMIDqRAUzemX3+LEOJOZGY2oPKITC0T0wU0rRc3Y4v/9h6lOEHTFuev9/fP5nGigq5W6REg==
X-Received: by 2002:a17:906:d552:: with SMTP id cr18mr10372620ejc.130.1635169712579;
        Mon, 25 Oct 2021 06:48:32 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id g26sm2448670edt.13.2021.10.25.06.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 06:48:32 -0700 (PDT)
Message-ID: <e21981cf-fef0-b73d-8fe4-4e1fab0d3864@redhat.com>
Date:   Mon, 25 Oct 2021 15:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Disabling intel-wmi-thunderbolt on devices without Thunderbolt /
 detecting if a device has Thunderbolt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

While digging through Microsoft Surface Go ACPI tables to fix an unrelated
issue, I noticed that there is an intel-wmi-thunderbolt WMI device in the
ACPI tables and the intel-wmi-thunderbolt driver happily binds to this.
This is likely the result of copy paste programming of the ACPI tables.

This causes a /sys/bus/wmi/devices/.../force_power attribute to be created
and echoing to that executes ACPI code which ends up poking at things it
should not be poking at on the Surface Go.

The problem of having these "nonsense" WMI devices with the
intel-wmi-thunderbolt GUID is likely more wide-spread and ideally the
intel-wmi-thunderbolt would ignore these.

This makes me wonder if there is a way to see if there are any thunderbolt
controllers on the system at all ? (with as goal to make intel-wmi-thunderbolt
not bind if there are none)

Regards,

Hans


