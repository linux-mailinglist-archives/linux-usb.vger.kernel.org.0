Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC2E2AA888
	for <lists+linux-usb@lfdr.de>; Sun,  8 Nov 2020 01:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgKHASf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 7 Nov 2020 19:18:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgKHASf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 7 Nov 2020 19:18:35 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AD9C0613CF
        for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2020 16:18:35 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id b1so7132967lfp.11
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2020 16:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=qZAeMtNpHB8i765OQRRfYUJi1ia5fArUuDex2L5iRHI=;
        b=exjqRr2qT8m/5WkKq4SvM5uHqrkObb1dniGHIRr0Iyv/iHVZIfJFdhT3UzA1ZHucSx
         1en/q+YmyeSdLp2yZdO+uOtkBvOTy3nf4kL08Q58YZ450shBlrmpYHsNsHa/72EcGTCu
         f1ZS6Se2zeVO9nYP3INyiSy5ZUcDHeCwCe6vdTOCZ2L+9rLhR2yekrmjXJNUI01G7pMw
         ZyaxglxuI7xOkbG50QFVNItpMErhwr6dbE2/KkApYwp+81mX7ClGJZOtzHDElcJopTfs
         YwuVoGDghFYJJecC0r36JJONekiT8caijT4AOv/50rNU1dOzuck4tI87CjVNpqbQf+r0
         V2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=qZAeMtNpHB8i765OQRRfYUJi1ia5fArUuDex2L5iRHI=;
        b=uN2/vcX4MZ+tyt6Xn7eMEt0mOwi5YgWFp6H9v291wG5HXEUeNROOHo/7vAbYrl29xu
         OiwjF2xF3O6Dxl4kdjAFd+pA/2iXujNK+vkTsvUXUFxRmYm1FhnhDCBJAwZ5XKOOPKFZ
         HP15VZ9I6T8kGqCj/Cr2xZcbyJzST8pFsg3FKh4di39a1161iQ4CyKiXlXwBIbsA4+Mc
         v/FxF/mHAJnPNXOeZ8OxqiY0P1ByWz/R/5fGCFY1ibmHzWL5haeAJyWoikQzuoEui9Zx
         ctvbTOfRuytZCfxW8xXe6lO3x6y5lDy3QdK9eF9xMAH5UxJt/rRPhoQxzChLVUNJywsK
         oWHg==
X-Gm-Message-State: AOAM531Z/yV3IpblLUnh3Kgip3IDQcw6AE/rYuy92IoSM4VHps2g4obx
        iarhn5fvwY8xaQM9nAmibyk=
X-Google-Smtp-Source: ABdhPJyuaahsWuLMvV+Td5qSJmgc1JGr5uU1pESIjHYq2BR4BlgAeiewyO3pLR4fd0nYa6j49AX15w==
X-Received: by 2002:a19:5c8:: with SMTP id 191mr3103058lff.111.1604794713803;
        Sat, 07 Nov 2020 16:18:33 -0800 (PST)
Received: from localhost ([80.64.86.40])
        by smtp.gmail.com with ESMTPSA id g2sm82709lfc.94.2020.11.07.16.18.32
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 07 Nov 2020 16:18:33 -0800 (PST)
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: [PATCH 0/3] UAC2 Gadget: feedback endpoint support
Date:   Sun,  8 Nov 2020 02:18:28 +0200
Message-Id: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current UAC2 gadget implements capture/sync paths
as two USB ISO ASYNC endpoints (IN and OUT).

This violates USB spec which says that ISO ASYNC OUT endpoint
should have feedback companion endpoint.
See USB2.0 spec  "5.12.4.1 Synchronization Type": asynchronous
sink provides explicit feedback (isochronous pipe).
Interesting that for ISO ASYNC *IN* endpoint respective
feedback isn't required since source provides implicit
feedforward (data stream).

While it's not an issue if UAC2 Gadget is connected to
Linux host (Linux ignores missing feedback endpoint),
with other hosts like Windows or MacOS the UAC2 Gadget
isn't enumerated due to missing feedback endpoint.

This patch series adds feedback endpoint support to
UAC2 function, new control to UAC2 mixer which can
be used by userspace tools (like alsaloop from alsa-utils)
for updating feedback frequency reported to the host.
This is useful for usecases when UAC2 Gadget's audio
samples are played to another codec or audio card
with its own internal freerunning clock so host can
be notified that more/less samples are required.

The alsaloop tool requires some (relatively small)
modifications in order to start support driving
feedback frequency through UAC2 mixer control.
That change will be sent as a separate patch
to ALSA community.

Also added ability to switch ISO ASYNC OUT endpoint into
adaptive endpoint which doesn't require feedback endpoint
(as per USB spec).

Ruslan Bilovol (3):
  usb: gadget: f_uac2/u_audio: add feedback endpoint support
  usb: gadget: f_uac2: add adaptive sync support for capture
  usb: gadget: u_audio: add real feedback implementation

 Documentation/ABI/testing/configfs-usb-gadget-uac2 |   1 +
 Documentation/usb/gadget-testing.rst               |   1 +
 drivers/usb/gadget/function/f_uac2.c               | 118 ++++++++++-
 drivers/usb/gadget/function/u_audio.c              | 217 ++++++++++++++++++++-
 drivers/usb/gadget/function/u_audio.h              |  10 +
 drivers/usb/gadget/function/u_uac2.h               |   2 +
 6 files changed, 345 insertions(+), 4 deletions(-)

-- 
1.9.1

