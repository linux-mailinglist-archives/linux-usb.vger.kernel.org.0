Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3F6339773
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 20:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbhCLTet (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 14:34:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234261AbhCLTeP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Mar 2021 14:34:15 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C654DC061574
        for <linux-usb@vger.kernel.org>; Fri, 12 Mar 2021 11:34:15 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so11221930pjc.2
        for <linux-usb@vger.kernel.org>; Fri, 12 Mar 2021 11:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=w6aDwi7wgZ1fw+QR1gc+BzNVblRjmv4wMSYUUazh8YA=;
        b=ByvMTA8PgbIuZQ0u457dI9LGW52bksANnXZLxoj6qIhMx5AZktszFIrOucOh1XRplS
         8pdCoFcdVYNV5rloy8ZvaptIsRtEIq7mBDBV5eVKZiYuQ/AW3BJKx90y+LnF+jeTt+HC
         u0MIdzZlVT5O1k1+xPY8pvjVcgH2Aq0r2fi416gEcLh7ZD3WE9tv+z4PvZWyIbbLthh4
         hTn8a5kL/ZRB9IuYwbwLWUYvem04wJfJg3EMSUo62/JxlqqYMhZ0hEByVr3805u3Lk2g
         fEtcd7PLOfGIJMHDqF1tUtyEGeRCw2Q2i5pY3udA9VXsrCKmHKCxvWzJ7/HryOSaD/GL
         gd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=w6aDwi7wgZ1fw+QR1gc+BzNVblRjmv4wMSYUUazh8YA=;
        b=k/Pwq0KvC5EQ4n3FD0ExLfhGrCoIgGPP4KAtw4FP5ZyIjeMB9y3vqyVTbSGtxE5Z9q
         X2BqGv7n1ZOXhs6ZQCFuDT8YxcpowMj4DdUsLWNSlAC2UoNPOhX4PS0QlKVT5vC/hFEs
         LUVXPw2ze9reNT5z3LaSkWulAtTDjPBdaLjLccKpK2kxUopDJ67P5DxZkKBAOksOFW5W
         YjmRQEHlwgU6h8/g0VexFiQStnPBeevp8nwoarzu4ncAhoaYY5qyjL7i9ewON1+iG/q6
         yeR6WSD2oEQA5Rk2YThcG/FImURaqGywgXomYUFY+WdqkQvgF6JMcI2uYTVXCZKG33Zg
         94Gg==
X-Gm-Message-State: AOAM531ISTdwAUZQIjAhuWgrpn9s7qiWnG79LRxZ86nyvVF8tI3fpOEP
        9WOVZeHBseNnXbPfH0Vzb3CF1ItV50GtVaHFxi4=
X-Google-Smtp-Source: ABdhPJyOzleq64xHtwv0iOiaIxUAMRpOx7qNL9PgDnjTA12AXXsORdvgb2a+Dk2rJqK4ZKOnE1+fv8xsvPXDMmVT8EE=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr16434776pjb.129.1615577655186;
 Fri, 12 Mar 2021 11:34:15 -0800 (PST)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 Mar 2021 21:33:59 +0200
Message-ID: <CAHp75VcN8X3dJUrmaO+CiVEu9-1V8eMV_LMFb19_rvVcr2a0gg@mail.gmail.com>
Subject: The fix e5f4ca3fce90 broke Intel Edison host mode
To:     Serge Semin <fancer.lancer@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

The fix in the commit
e5f4ca3fce90 ("usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend regression")
effectively broke host mode on Intel Edison.

When device in a gadget mode and I attach the USB Mass Storage device

Before: automatically switches to host mode and detects storage and
everything okay
After: automatically switches to host mode and that's it.

Revert, as obviously from above, helps.

So, please fix this or I will send revert near to rc5,

Happy to test any proposed patches! (Maybe Ferry also can help with that)

-- 
With Best Regards,
Andy Shevchenko
