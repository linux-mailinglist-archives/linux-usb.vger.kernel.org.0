Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35CD3A0A33
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 04:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbhFICsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 22:48:14 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:55042 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbhFICsO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 22:48:14 -0400
Received: by mail-pj1-f44.google.com with SMTP id g24so489424pji.4
        for <linux-usb@vger.kernel.org>; Tue, 08 Jun 2021 19:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6pyM9qx2wNrDkcCVnHu2542oT0QO41UA4mh+x+A7AdE=;
        b=FErClxm/bRZmLe6FhJt/GSnmFJNbrLpAct88FR0CugarRNFYVBfZHV8O0bi+BFr0kw
         E4RIr8vJ+cGxtukCJ+6DPVGIBZbxaBmnAmOD2owlh9yCILc0UezBXwZdKGCqnz1gWu5C
         K/gCBu8/wSP79LDhHifBnjPtQdF2DtZAOQ1sSz0pad8I6bVNlizQ3n/7Ub00ZFTm/+wt
         whQzClvYesx4aSSbSuQ7xRzbcsE8a/tgyRHLjLVe+0wzyCc6W+dbBuGHsD1GLmh/S6OP
         lSwGJ4x8IxrSY2HM7aN5jw1noIxExHYZU5zpmTdVIAfEDVl7Vx7Hv4g4qF/grAzQMiuZ
         ZRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6pyM9qx2wNrDkcCVnHu2542oT0QO41UA4mh+x+A7AdE=;
        b=cu0HakXtl3eQfnxqwneovpAtbNr1WBIttqN+ShgkaelOX9IrqkoL4j6alFury82ulX
         Ighw4DlWFRv6SS6k6dxGiXAMLqilS4UuvhpokQDtjNAR7cUavDJEqxTuGrglMF/ebEWu
         IpPP7IxkBjPUnBt1BI/0VwSNNZa5W1MOREiN/l8lhseWSYwWT7xU4pzKbFIkWQU+GpzK
         YmVRMF4H7K7hLq72+MnwNjkgSwSjlH6mUpdVeAivFRlMzNdUj6AfANFA1T70O0UGu9FV
         01pPRg9sdcoc1u/sX7P0lswmmpzeFzhFa7aIH6ZsUQyqhoasxS/Y7vTglTJ9NJhndy6z
         e9Ww==
X-Gm-Message-State: AOAM532Z9FSwngzh9AavZOHtXP4g3RoEcuegAYGO7ZID774H+O3Bc+FX
        SahjweNnSl329NmjhfgdYpI=
X-Google-Smtp-Source: ABdhPJz0Jemz249Gi1bk2aVy+3vJ92EMsJuB8+K17BI8zD1l9E9oO4mqihOYRTLlQvdTh3wcPiwQ4A==
X-Received: by 2002:a17:902:9042:b029:10f:c864:6090 with SMTP id w2-20020a1709029042b029010fc8646090mr3213211plz.39.1623206708903;
        Tue, 08 Jun 2021 19:45:08 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:0:e8f0:d5c3:a6b3:bbff])
        by smtp.gmail.com with ESMTPSA id e24sm12750994pgi.17.2021.06.08.19.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 19:45:08 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] usb: fix various gadget panics on 10gbps cabling
Date:   Tue,  8 Jun 2021 19:44:59 -0700
Message-Id: <20210609024459.1126080-1-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <YL8wSsGso94F6lEH@kroah.com>
References: <YL8wSsGso94F6lEH@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

usb_assign_descriptors() is called with 5 parameters,
the last 4 of which are the usb_descriptor_header for:
  full-speed (USB1.1 - 12Mbps [including USB1.0 low-speed @ 1.5Mbps),
  high-speed (USB2.0 - 480Mbps),
  super-speed (USB3.0 - 5Gbps),
  super-speed-plus (USB3.1 - 10Gbps).

The differences between full/high/super-speed descriptors are usually
substantial (due to changes in the maximum usb block size from 64 to 512
to 1024 bytes and other differences in the specs), while the difference
between 5 and 10Gbps descriptors may be as little as nothing
(in many cases the same tuning is simply good enough).

However if a gadget driver calls usb_assign_descriptors() with
a NULL descriptor for super-speed-plus and is then used on a max 10gbps
configuration, the kernel will crash with a null pointer dereference,
when a 10gbps capable device port + cable + host port combination shows up.
(This wouldn't happen if the gadget max-speed was set to 5gbps, but
it of course defaults to the maximum, and there's no real reason to
artificially limit it)

The fix is to simply use the 5gbps descriptor as the 10gbps descriptor,
if a 10gbps descriptor wasn't provided.

Obviously this won't fix the problem if the 5gbps descriptor is also
NULL, but such cases can't be so trivially solved (and any such gadgets
are unlikely to be used with USB3 ports any way).

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/config.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/gadget/config.c b/drivers/usb/gadget/config.c
index 8bb25773b61e..05507606b2b4 100644
--- a/drivers/usb/gadget/config.c
+++ b/drivers/usb/gadget/config.c
@@ -164,6 +164,14 @@ int usb_assign_descriptors(struct usb_function *f,
 {
 	struct usb_gadget *g = f->config->cdev->gadget;
 
+	/* super-speed-plus descriptor falls back to super-speed one,
+	 * if such a descriptor was provided, thus avoiding a NULL
+	 * pointer dereference if a 5gbps capable gadget is used with
+	 * a 10gbps capable config (device port + cable + host port)
+	 */
+	if (!ssp)
+		ssp = ss;
+
 	if (fs) {
 		f->fs_descriptors = usb_copy_descriptors(fs);
 		if (!f->fs_descriptors)
-- 
2.32.0.rc1.229.g3e70b5a671-goog

