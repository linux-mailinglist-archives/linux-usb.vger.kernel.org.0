Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76F198170C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 12:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbfHEK3k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 06:29:40 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44214 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfHEK3j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 06:29:39 -0400
Received: by mail-vs1-f65.google.com with SMTP id v129so55581905vsb.11
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=La8MiJUsPLRVhcVVoBNW+DhkKeRh9TCwN1Rhjt/cdTc=;
        b=koiTsq/CtLAjcgJ5VlzXoXogVNF8Sx7NHh1T6ioIVN6vDbPKqm7ewdEDTc/hdb91Bz
         htvFfzTJ1jb4anHHzuYFxRy52YqxBDFf5p64hUf6Crh0WxGHF3jyieN1AN/fX8nRokWE
         EB8oVUBm9GfEo8uoF63kWswK2X5V5pPWyDc0xR4EhtW7gq0IF1ECFQDvXuLdGJSjs+2G
         iTtSMlTBcPMvmkT9/bzRZ/kovNHz7GJF5BUw9qYFvTQICEAWsKJCnfxiiLYh9LJi005I
         4so9e9alZUW1GZ0Ey/PB0UsKbIzYIcxl8tHqRqK9tnX0AptCJ565uxaBeAdjSjqTcEn/
         5Ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=La8MiJUsPLRVhcVVoBNW+DhkKeRh9TCwN1Rhjt/cdTc=;
        b=WnvdPhYoGI5jARcyokiZL9sFSbqDoFbBF/OQNB9ysEczm6kqkwUxrKJyMgSrXnlO9b
         IL9br38ANWeaEwxDR2BMmfFtObSCIJipcn81IJ7V+vsQeGiVRyUen/zxRWeM2hDWMew7
         cDnHhxMaf/8VECS3JJXdvWL4AnmBpNhSmJH5xy0UnybZnjJh5pzQY3eAg+Igw5mfpEhe
         iyY1Wemg6V7LlkpbWBLMrBsk8bCKC7GMf6sI3/zliAoEg+tVIotGNbUaNsfRDgKNtHwQ
         Ao5HtbuMwz+xi5OUUmSL1sqdYBba/EPSRyOTuLZsvWpVDk1/uP3c2d78DZQw/4SOQspG
         df4Q==
X-Gm-Message-State: APjAAAWTv78gB70n3yRFjIPBkQgXpYE0z7EZiEIwzCDwLM88C3kc/cMp
        d5xSMZ01xFApF3iNfKfIBdp8Jt9wSnicCNpHVl1qJCQiZe4ZjA==
X-Google-Smtp-Source: APXvYqxPg5duQ8eja0KfjCbZarBp46CcF8y0+lX5iODjr2LD6vfowBxEfIqiAyuQLEK1pk3IqVFyMAh3wzfHF6+Y1Ss=
X-Received: by 2002:a67:f713:: with SMTP id m19mr7629570vso.183.1565000978119;
 Mon, 05 Aug 2019 03:29:38 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>
Date:   Mon, 5 Aug 2019 12:29:27 +0200
Message-ID: <CA+zpnLehOG=agTtLkVZte-WJRpPwnGOvazum-o-=gLisSbe67A@mail.gmail.com>
Subject: Race condition when accessing authorized_default for a root hub
To:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I believe there is a race condition for userland in hcd.c where the
kernel sends a uevent before the underlying sysfs is fully populated:

(drivers/usb/core/hcd.c)
          /* starting here, usbcore will pay attention to this root hub */
          retval = register_root_hub(hcd);
          if (retval != 0)
                  goto err_register_root_hub;
          [...]
          retval = sysfs_create_group(&rhdev->dev.kobj, &usb_bus_attr_group);
          if (retval < 0) {
                  printk(KERN_ERR "Cannot register USB bus sysfs
attributes: %d\n",
                         retval);
                  goto error_create_attr_group;
          }

Here, register_root_hub will call kobject_uevent(&dev->kobj, KOBJ_ADD)
(via usb_new_device and device_add). This was found in userland (see
https://github.com/USBGuard/usbguard/issues/321).

The fix is not as simple as swapping both blocks (that is, calling
sysfs_create_group before register_root_hub) as device_add is
responsible for calling kobject_add and kobject_uevent.

This can potentially be solved by adding the sysfs_create_group call
to the bus_notifier list (blocking). Thoughts?

Thanks,
Thiebaud
