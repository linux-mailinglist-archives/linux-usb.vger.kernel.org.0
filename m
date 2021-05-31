Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821DB39643E
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 17:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbhEaPvr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 11:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234276AbhEaPto (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 May 2021 11:49:44 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945ECC0467F8
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 07:33:18 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id k22-20020a17090aef16b0290163512accedso58457pjz.0
        for <linux-usb@vger.kernel.org>; Mon, 31 May 2021 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nj/CyLi2Ey20BGR067XvnItHRN2wQ9sMZGyG7EUHMUg=;
        b=jHpVEriRRvJepS9WU/97GVvNphKGj8Tr7G15/SCPSC5BAdIZgCYojR1iVfAiOHLiKq
         kw0CEHCnVJBnNHHTW8NXax7LxZI24gbA/8odJIHroPHSaYOg4SnAXZaXLjR644cQ3ArE
         PjGpWxip8qckLiCT0QWYjwUzkjAAOMb09csuM2Q8xszGq9lpK+Mpnttm0TYegoJfZopU
         q2kfoqXYKHzaAYd1+okDcmOLJZpdnFzWm31aPRv60HYZHPr6ccPCLHHji4MXrV9wJcN7
         K7VXt5NtQs4NDWHQ8O7w5i/fqm4UHocDCmdARa6e8v3Kz9gjJf1wJlAkRKgwDyjEIjXK
         ZJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nj/CyLi2Ey20BGR067XvnItHRN2wQ9sMZGyG7EUHMUg=;
        b=kZW5GI5pGAopndcYT4s1NedDhWKkmea7a4vnaCF689r4fI1WyzuEXLLhkoLduOxE3X
         9kFSZS7u9utPH/GduTJR/UtRqzsfU6mZgDNWzzu+gJR0ZZ+v+ipK+fMAeulUQQ9uGSf3
         57izX0c6uu9RIaaLLNYChEWcIZ0nRKmRLK24LcxUaCfPSFsuXawPXri5MosIhILXbczG
         8U5HNr/qI22E8De9c+4UaQ9S5dA7XA1Nh4sEKUyEPXJoePq/+VFGXacVzsaUpDgbShkn
         7lzHTup7ju3vpWOvZtNHVaEC5UGJbUsP+E8dduStRWZ5bsMu0K42bzIb2gbTmVWcRua5
         qpkg==
X-Gm-Message-State: AOAM531VzGPDbigYaUWdVjwaCdkDJmNnttR4XaOg1y2VqM/zHcPt5y20
        ASPL7y70XEC4U3MFqpjcHLaph8BwtDVAkSjeaMc=
X-Google-Smtp-Source: ABdhPJxsHEV2RdzHCSanI8Lv4Mxf4/duYJAUXmICgSGsw+a/bbVsG9XVPDgw+1dPYBFcVxnTT9YupkL0QkK8LogC2DM=
X-Received: by 2002:a17:90a:80c5:: with SMTP id k5mr11846651pjw.129.1622471598069;
 Mon, 31 May 2021 07:33:18 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 31 May 2021 17:33:02 +0300
Message-ID: <CAHp75Vc1BHSOfzUg2a1EEV_hNQK_MNNnVKA4wG_tWAWgTmnE9w@mail.gmail.com>
Subject: v5.13-rc3 --> v5.13-rc4 DWC3 breakage
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, USB <linux-usb@vger.kernel.org>,
        Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

The only patch that made v5.13-rc4 effectively broke USB on Intel Merrifield.

My reproducer:
 1. Boot with switch in gadget mode
 2. Enable USB ethernet
 3. Switch to host
 4. wait a bit for device enumeration, etc
 5. Switch back
 6. No gadget mode, kernel RCU stall detected (USB become unusable, so
does the system)

[  115.792620] rcu: INFO: rcu_sched self-detected stall on CPU
[  115.798410] rcu:     0-....: (24089 ticks this GP)
idle=886/1/0x4000000000000000 softirq=3796/3797 fqs=5240
[  115.808333]  (t=21000 jiffies g=6505 q=12158)
[  115.812847] NMI backtrace for cpu 0
[  115.816472] CPU: 0 PID: 23 Comm: kworker/0:1 Not tainted 5.13.0-rc4+ #213
...

[  115.977913]  add_dma_entry+0xd4/0x1d0
[  115.981760]  dma_map_page_attrs+0xd8/0x220
[  115.986063]  usb_hcd_map_urb_for_dma+0x3b6/0x4f0
[  115.990895]  usb_hcd_submit_urb+0x98/0xbf0
[  115.995263]  dln2_rx+0x1ae/0x280 [dln2]
...

100% Reproducibility, revert of the 25dda9fc56bd ("usb: dwc3: gadget:
Properly track pending and queued SG") fixes the issue.

Please, fix it properly or revert. Thanks!

-- 
With Best Regards,
Andy Shevchenko
