Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03B71C9729
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 19:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgEGRHU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 13:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727972AbgEGRHO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 13:07:14 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C360C05BD43
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 10:07:14 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id g8so7938075qtq.2
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 10:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=7/PrXCrrp5hii78pLoOm9OApKV03tezSTtbf21wn2GQ=;
        b=vJ2cM97lrsVanMLQWlqZTgaTuRFdaYInxkAXTc1yX40b8vt+T925FTXgJal0sutkm/
         Qod3Kghc5YBrrYcrNJdKZwVj5qtIf40beNkJT2yW5S1C0QnqVbWws9SKTPfagLcfREO0
         gD5X+dGPLcTZSDKGFGnChODgWTY5EzyAPi3VA+ZD5mmDoS2rduAzlZDc9L0scC8/LOx+
         2qCOly+pNoVVgZZEwX0oZ/iaAYI3wIKJXNyiSIRtdzCGKHRVlnZ6U2ahWUcez0t8gRHy
         38s5DeSTRojmMQcMWprmAHfOoWWA77z3TSlb4p86rDN++UNEQNfB3iEnJHTvlHLGMl7Z
         t4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=7/PrXCrrp5hii78pLoOm9OApKV03tezSTtbf21wn2GQ=;
        b=b5/bzDrNNHEKlImVta0yZrwckzlenRZyGCPUM/zZvMr+TpN4RISX4QB0CjR36Y8+Jx
         FvhmWCF1KcABpEvnSCuh8HzwiP7BOM1Z+SCKSuZeVRvCzVDJxR4vwbtyzEP0/Z0kbffH
         83fiAJUZibaT8szL3iBCUVHLMKJ1InAH7j8K1gugBki8shP6PK6EQQ5GZfBS3K4bupr/
         XzdEVn4lsUV9MpuW+qLwYVtTiPJ7Ao+BoJ8vyGyz6jJMqcutC+WkwC8Bd81/ESdHciHb
         VlVh9tDrnfMtZFTrCGHP3/NFRpduL0j36DLKqMswlyo4L82zMs1zaPUTJHUlxuy7HTxY
         SHbQ==
X-Gm-Message-State: AGi0PuYUAqXClSrpv7boJnwqrV6Vy/ZFyWGsRcCZYu7z0AUD1PtWNRs1
        leqHs4UH0PUUzQqIw4fsMYxl7DzYMJ+sEV6z
X-Google-Smtp-Source: APiQypIy9HLMvQvr1IoBhkEe19b6+HAz9x1jbIn1bDPc6Z2265SQK2szy4myS1YuI24410DJjPCvk1IQhD93SQVM
X-Received: by 2002:a0c:ffa3:: with SMTP id d3mr14017803qvv.12.1588871233518;
 Thu, 07 May 2020 10:07:13 -0700 (PDT)
Date:   Thu,  7 May 2020 19:06:58 +0200
In-Reply-To: <cover.1588870822.git.andreyknvl@google.com>
Message-Id: <b07af6ea7091afe7aa528b3015e041999aeebe97.1588870822.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1588870822.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH USB v3 5/5] usb: raw-gadget: documentation updates
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mention the issue with fixed UDC addresses.

Links external examples and test suite.

Add more implmenetation details and potential improvements.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 Documentation/usb/raw-gadget.rst | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Documentation/usb/raw-gadget.rst b/Documentation/usb/raw-gadget.rst
index 3b3d78e850b2..68d879a8009e 100644
--- a/Documentation/usb/raw-gadget.rst
+++ b/Documentation/usb/raw-gadget.rst
@@ -49,10 +49,36 @@ The typical usage of Raw Gadget looks like:
    Raw Gadget and react to those depending on what kind of USB device
    needs to be emulated.
 
+Note, that some UDC drivers have fixed addresses assigned to endpoints, and
+therefore arbitrary endpoint addresses can't be used in the descriptors.
+Nevertheles, Raw Gadget provides a UDC-agnostic way to write USB gadgets.
+Once a USB_RAW_EVENT_CONNECT event is received via USB_RAW_IOCTL_EVENT_FETCH,
+the USB_RAW_IOCTL_EPS_INFO ioctl can be used to find out information about
+endpoints that the UDC driver has. Based on that information, the user must
+chose UDC endpoints that will be used for the gadget being emulated, and
+properly assign addresses in endpoint descriptors.
+
+You can find usage examples (along with a test suite) here:
+
+https://github.com/xairy/raw-gadget
+
+Internal details
+~~~~~~~~~~~~~~~~
+
+Currently every endpoint read/write ioctl submits a USB request and waits until
+its completion. This is the desired mode for coverage-guided fuzzing (as we'd
+like all USB request processing happen during the lifetime of a syscall),
+and must be kept in the implementation. (This might be slow for real world
+applications, thus the O_NONBLOCK improvement suggestion below.)
+
 Potential future improvements
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- Reporting more events (suspend, resume, etc.) through
-  USB_RAW_IOCTL_EVENT_FETCH.
+- Report more events (suspend, resume, etc.) through USB_RAW_IOCTL_EVENT_FETCH.
 
 - Support O_NONBLOCK I/O.
+
+- Support USB 3 features (accept SS endpoint companion descriptor when
+  enabling endpoints; allow providing stream_id for bulk transfers).
+
+- Support ISO transfer features (expose frame_number for completed requests).
-- 
2.26.2.526.g744177e7f7-goog

