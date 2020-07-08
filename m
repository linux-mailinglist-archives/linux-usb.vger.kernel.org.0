Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB22218808
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729347AbgGHMuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:24 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42868 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729268AbgGHMuW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:22 -0400
Received: by mail-lj1-f194.google.com with SMTP id h22so46935204lji.9
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H0bjgyzH5s0eIqZUX6DEWjUkmcGB3TXKjdjC99HLXfE=;
        b=B45aIkbos+r06pAJhSUZ7fqbpLRGmFrAKIpyPCYrsEkiTiBLxSGJ/JSjxtP18SvHT8
         SU/Sxe+dhOq0uuE1VYgu2+uFnYBjEF7e3OvIn2shSlGFE0NfWXSlX9WHgTUhjH4oxVKx
         +o6ApgkziIa+34HRZfCqhHecCw6bm8FzX9XMbi66Okc6j2RYFFIXg5/b9iz1DLpqWixv
         jcGVcpOquc7DK0tZF/9Q3rEA9R9UUwDpA+klYWrwBnUbXnxxNAs//m9sF26FxWZd8tyv
         7+kFVrcsYMRKJrA7P+PyuA9Ad2p7t5hIM/20b54prjWA/dYrmXfgFj5KXsZ7nB9tSOrb
         67lw==
X-Gm-Message-State: AOAM532jus2qS2XoVy54fq5rBexGsdPdI4iY1yYwIBWat4rM9FRfMlwh
        WQD18VcDEIuGpNvFrVOjjEjj1e3eiBE=
X-Google-Smtp-Source: ABdhPJzaxsQ7lhL3dKaHgJ4PLHLB76A2+N6y5EIDKtgmYGJoUYRLc3u8SLzi1TnXbkAQ/wd60eL6WQ==
X-Received: by 2002:a2e:9042:: with SMTP id n2mr31644959ljg.208.1594212620444;
        Wed, 08 Jul 2020 05:50:20 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id k14sm892552ljc.48.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-000466-KL; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 08/10] USB: serial: drop unnecessary sysrq include
Date:   Wed,  8 Jul 2020 14:49:58 +0200
Message-Id: <20200708125000.15659-9-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There's no need to include sysrq.h in the subsystem header.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/usb/serial.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index c4ed4404335e..4becca7ae264 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -17,7 +17,6 @@
 #include <linux/kref.h>
 #include <linux/mutex.h>
 #include <linux/serial.h>
-#include <linux/sysrq.h>
 #include <linux/kfifo.h>
 
 /* The maximum number of ports one device can grab at once */
-- 
2.26.2

