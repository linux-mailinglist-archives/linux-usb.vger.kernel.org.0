Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2008F1C971C
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 19:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgEGRHF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 13:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725949AbgEGRHE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 13:07:04 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D2DC05BD43
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 10:07:03 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id d4so6458085qva.16
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ct3BK4gm/q86QmYuR5ZR/29gFnmZjaUluf46gNZVNR8=;
        b=ei5Ui1IQ46onwaK7Bz8wzqZph0b2kZo3Jfy1QFsaPnPpn0mCG0eqN07k6ZtOyl8GyG
         E2MHJcP1StTby58wMTkL0SYVrvqwC3GhlqQg4Vsar+Qtad8Vuh3AeliiD7Ga91u2N6Dg
         XGruAipCZoeohg+0+jMdHVv7kNtdJyEF7uEnlVtLeqI6bLtWuvFJkHXYJbDRDT+9DKzD
         RMW6ljhi4ckEjA6HuV1g+LVchwCu/cITcJ9zIMXWVzrkHWEzuco+IGtE5Jot+C55rvL8
         OtI0mEyzD4PHrCaQK/vvOU3IcS6Ze03TkJmic8EOrDXcZtMP1d4VgceQxTxHZof6Rcdo
         gT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ct3BK4gm/q86QmYuR5ZR/29gFnmZjaUluf46gNZVNR8=;
        b=huvo2Up0xD9hYymr2RhjBsGv+/vhdambM3ljVXaZlB5dyYrT+3jIpZibbhGv+Ri6LL
         BGqXoDnFr4IQI1AcWPfR8p5jAFqf0Dl+/MfZbf2PfZOnKQgIoSkAgyK9oP/W8iwBLYOx
         r2NW+8emJv+KAPdKOdx5Xd3N5vJhq2ycd4CnWeznHZtxZ5y5D5oCLW18ndlHum3DKvWP
         Hi21PNYLnuZoty+ZajZpfdDGSmLthorkEm7zI1K4li8GC1pjLYfp0ottuIwSZUy6jQud
         6P9iDt18h2Lmr/ymRMU9/12x4910/LEG0Pd3fXP1Or5FNLZk+atAGAz3NnNL9lvVP2My
         Haog==
X-Gm-Message-State: AGi0PuYq8BFpJ6JWV59lj6MTWE0T0bXxrWcfyHd8cKHnq+AUA5St4oZS
        SueOB+Lrr7nFqil9B6Qt7LlAyTOwA/uxbDT/
X-Google-Smtp-Source: APiQypKRLt2zSY4Ou9VI6deks5k4MCfwUuX13qpxmUxO9UsmGQqhLChqeurC7hYZJC31zES8PtBlwUhzAipwcRJU
X-Received: by 2002:a0c:910c:: with SMTP id q12mr14871311qvq.239.1588871222163;
 Thu, 07 May 2020 10:07:02 -0700 (PDT)
Date:   Thu,  7 May 2020 19:06:53 +0200
Message-Id: <cover.1588870822.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH USB v3 0/5] usb: raw-gadget: fixes for 5.7-rcN
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

I've put all raw-gadget fixes in a series, please ignore the previous
patches.

I've dropped the patches that change the ABI for now (those need more
testing anyway).

Changes in v3:
- Dropped ABI breaking changes for .
- A few more comment fixes for uapi headers.
- Updated documentation.

Andrey Konovalov (5):
  usb: raw-gadget: fix return value of ep read ioctls
  usb: raw-gadget: improve uapi headers comments
  usb: raw-gadget: fix gadget endpoint selection
  usb: raw-gadget: support stalling/halting/wedging endpoints
  usb: raw-gadget: documentation updates

 Documentation/usb/raw-gadget.rst       |  37 ++-
 drivers/usb/gadget/legacy/raw_gadget.c | 314 ++++++++++++++++++++-----
 include/uapi/linux/usb/raw_gadget.h    | 108 ++++++++-
 3 files changed, 377 insertions(+), 82 deletions(-)

-- 
2.26.2.526.g744177e7f7-goog

