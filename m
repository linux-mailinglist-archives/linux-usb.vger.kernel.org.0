Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8A06DEF4F
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 16:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbfJUOVM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Oct 2019 10:21:12 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:46754 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfJUOVM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Oct 2019 10:21:12 -0400
Received: by mail-vk1-f202.google.com with SMTP id n124so6212349vkg.13
        for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2019 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=RSPzO7VGyWVFZTDHTLbd7vQlQ7kvJGvHy26uTtoxePU=;
        b=izNS4AyOIEJSHE4NorVSgTeYmiLlikycWS0QlQ80XEAbgPCVg3V3G3NyygtgwH1e6x
         eOjr8Qqg6CNFTHRQWkOeKiNwcxWVQxGdP0GlkJRy+MwBlLtYa+qdKo+6T1LjXdLyFPns
         mzHqRVRUczACtoHFQtHYMmUFG9a1uOtQt3ETeqAoQEk/WElFjhnsuv9oE/w+l8puWI9p
         ejOO9cRPqUou/THadN/z/kJ6AFyVqA/QppiwQ1Z53HQJsY1eji2jQJl1QIfFMheqgcTS
         7JyDE2X+liFLwzSmMGPptPnABQ4rDsGDgHdSVRSD1lTXfvJ87Z93X1PkGwT5CPcqIuxp
         D7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=RSPzO7VGyWVFZTDHTLbd7vQlQ7kvJGvHy26uTtoxePU=;
        b=EHJ3HTJlPZLqde6dHGmEpivbCy37V5ns3Ho9pi7APiH+kXoO3aVfGcOSCw/SAdt2XO
         YMxkxrCMEEGKwHMRGAFh6JrYi9boCkKugkkAP9BL+iIVrwL6KgbcWx9B1vwRME8dUeQI
         hQBlKlwDy4oXKoe7sXYUMjUM6ivBnAiL9e+txlF8wosRIVcjyXvDCzCxN3hoFE3eiIVN
         Klz5LMwqDaESkfTrHtVP5IO1JsajBwabDMX9Bs83H1U3uV+x92f8f9u5qaZFzwTgVI3T
         MpUkgnOTT/a4IoaRFLxiURiUuhoZsNaT1652hmKvKmWrylIYxaqW0kDEIPd7othRYLBP
         MFWQ==
X-Gm-Message-State: APjAAAVNMeN1y2Q+B+Y6DLmoU7mSqu72ZBpXFgmbhlgsPY/GDHyJlWxf
        OS8s7SACetPCggcwDgqWQsgwM28PaEXRMX8aFm2xcgU5i1+ja5RBDifjKN3pmv+rG7U28q3UVJf
        qKzWA6ozz+Rn4Rb6unVVOQrch7F7BXC90/9FExfes5sAzwrrDspoR4WlobYxD48h4KWwdO1ioUE
        n5
X-Google-Smtp-Source: APXvYqxjnFzSC7W/dFXdHUgixxaKnlTaYyJauPRN10M9bBo/RXxlP/49gc4zLIh2cMZyMj76MvP3vxhqrZg2gDU+
X-Received: by 2002:a9f:3d82:: with SMTP id c2mr13083240uai.1.1571667670792;
 Mon, 21 Oct 2019 07:21:10 -0700 (PDT)
Date:   Mon, 21 Oct 2019 16:20:57 +0200
Message-Id: <cover.1571667489.git.andreyknvl@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH v2 0/2] USB: dummy-hcd: some updates
From:   Andrey Konovalov <andreyknvl@google.com>
To:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "Jacky . Cao @ sony . com" <Jacky.Cao@sony.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Changes in v2:
- Added missing Signed-off-by.
- Added better explanation as to why we need more Dummy devices.

Andrey Konovalov (2):
  USB: dummy-hcd: increase max number of devices to 32
  USB: dummy-hcd: use usb_urb_dir_in instead of usb_pipein

 drivers/usb/gadget/udc/dummy_hcd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.23.0.866.gb869b98d4c-goog

