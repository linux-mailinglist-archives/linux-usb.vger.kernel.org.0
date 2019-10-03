Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A8FCB009
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 22:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389351AbfJCUU4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 16:20:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34016 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388920AbfJCUUa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 16:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570134028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=lJsPH0CXpGipbA9H0dGeQKpG32OggA79MXCAh0eilHM=;
        b=R6BpWamPHr78X7aS0QdG6b6w9AkQxDLjf7GIoVYxLgeVb1NK7/MW51tgyLsXk+vjd4jLnI
        XYMsTYseyRzBnHefOnarfxu1BmDlCu3b+8ON0JPyZNBzzUPCBb3a4fdIj8tYcuiJt3ZWzz
        Rf/nrehDeqjJYr3tcnlduGa5+58Kgxc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-2ex26p7OP621RIpB1dZp8g-1; Thu, 03 Oct 2019 16:20:26 -0400
Received: by mail-wr1-f72.google.com with SMTP id b6so1636655wrw.2
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 13:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=1mbvMx4ggA/oxOpE1MmlWpjLmFJpu3/zVOWw4njUri0=;
        b=riS3q9j/+o68mXHc1AB26r/fmHThZmjUa138AnV8TUm82GG+Nj+bDpmP16iZP6aSyz
         mj5B6QC8F1KYZp0I8frtRrCufunhaI7QLWXCWaphav9MZ4ygpQLd7ok1Kg3u2lAXI2z+
         AlVdeNIpERWHn62CAwl5KgcHb3xCkZfg4oedvAKXYif7nHSumUYxYtwZNJ7H15cejGOm
         NYpyZisS/VoLzYNcHRJThWXmYQspBlYyXY1Z60inZ1ayY0vljwo2kli66XkfWflMqD3t
         CPuRqwVDO0aCSPjQoSVSPjfLvw1aEAlzR9qZ+bpmJRcTW+tRZtHpVRXCp+ReAlroIZRT
         MExQ==
X-Gm-Message-State: APjAAAUyGfF/pM6TQh6YTfx8KWWPhHIkP8gJMV2JofNyQ9ptaumk2xko
        qB+QcFNxD7YSkuFBy0KHxlpXj9/BGQW3hfFRWwOhySdhWpiyyM5EI0DF4QudPESdhe3kHEtSkzp
        ZzBAPrXgjTbJ4BR9KEvL+
X-Received: by 2002:a5d:6a09:: with SMTP id m9mr8087605wru.12.1570134025843;
        Thu, 03 Oct 2019 13:20:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMmbb0nF2zvJZD5BcMQQB8t9k4v9RmHUA6Wx0p477W+n8i5AnC905fNFlzJHR4Ptxz5d/wZg==
X-Received: by 2002:a5d:6a09:: with SMTP id m9mr8087595wru.12.1570134025690;
        Thu, 03 Oct 2019 13:20:25 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id b22sm3533965wmj.36.2019.10.03.13.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 13:20:25 -0700 (PDT)
To:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andy@infradead.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-kernel@vger.kernel.org, youling 257 <youling257@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Problem with "driver core: platform: Add an error message to
 platform_get_irq*()" commit
Message-ID: <01e3d855-c849-ad7f-a6f8-87c806bb488b@redhat.com>
Date:   Thu, 3 Oct 2019 22:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
X-MC-Unique: 2ex26p7OP621RIpB1dZp8g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I've been debugging a new error printed with 5.4-rc1:

[   25.570893] dwc3 dwc3.0.auto: IRQ peripheral not found

This is caused by the "driver core: platform: Add an error message to platf=
orm_get_irq*()"
commit.

The dwc3 driver first tries to get the IRQ by 2 different names before fall=
ing
back to the IRQ at index 0:

         irq =3D platform_get_irq_byname(dwc3_pdev, "peripheral");
         if (irq > 0)
                 goto out;

         if (irq =3D=3D -EPROBE_DEFER)
                 goto out;

         irq =3D platform_get_irq_byname(dwc3_pdev, "dwc_usb3");
         if (irq > 0)
                 goto out;

         if (irq =3D=3D -EPROBE_DEFER)
                 goto out;

         irq =3D platform_get_irq(dwc3_pdev, 0);

Together with the mentioned commit, this is causing this new (harmless)
error message. We also have had a bug report for this:

https://bugzilla.kernel.org/show_bug.cgi?id=3D205037

Which I will close after this mail since the error is harmless,
still it is sorta scary looking and we should probable silence it.

The best solution I can come up with is adding a new
platform_get_irq_byname_optional mirroring platform_get_irq_optional
and using that in drivers such as the dwc3 driver.

Does anyone have a better suggestion?

Regards,

Hans

