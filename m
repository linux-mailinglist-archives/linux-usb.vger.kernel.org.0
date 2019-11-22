Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D6A105F2C
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 05:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfKVEYZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 23:24:25 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37209 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfKVEYY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 23:24:24 -0500
Received: by mail-pg1-f193.google.com with SMTP id b10so2731607pgd.4
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2019 20:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msCu0QpwL+TYH2H0S7A59z3R+0BjpgNq8syAjSNxH5A=;
        b=QzZFd4Wt0cjTgBvP+UjZIpNq8OdeXFjyWBUGkwQNhDzUO/E5lE8HQ3n2patQ2M+r9m
         zXesz8Y+XLXINZllCrFNb573zAuEP14nU5vMhA35zfEDPfg0zZ0Mj2l4Dx8SvnN8BxrK
         /62XxHPvUc/VlvonA0ZXgPMTuiQ5qOqgujCZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=msCu0QpwL+TYH2H0S7A59z3R+0BjpgNq8syAjSNxH5A=;
        b=erLyGcLG2+r8eneWubu8jwsflEL5oibX7z+Ha6VwHWCmet/rO3ABycliYPd+BZ7rHj
         kEe0SCATD8SDsnu5Fmthc1r+aDC/QrHWtqWZMmBL1RqTjc1shUfRfQgX/YUZFW+dIjsB
         I9sbfWQq9J3K3umyIusRqrbTJiJqP9fm+XDPr+TSxwLWUS/Xjppqx4HrQJZFP852WTK0
         6NbXx461wGZnpLrTCjtTeFGO1Glat16ex+4DeTKJ1yyqsumyPaG9tnLlAugLknRLjGAH
         pqYm3fNIkkB6cu+Kw0xLwz2bZTYp3L/M7z5P4AWQtOUsK8OgqWyUeC8k6ZWJSRaCsjX4
         nVug==
X-Gm-Message-State: APjAAAUMxq5/YJVBfEDmTxYspG7NKi6dWAq2RgK6COsIoCv1TYwMPE+q
        hN5MLbmj7oxJJx0YPSIxl2oue+gpjZKCBw==
X-Google-Smtp-Source: APXvYqxFlBSAySyw6HLdZ4UGY2AFeTgBXYlW07/IOFHfDkALCilbw+dFP9Dlb7LglnlGPhiKvMMAAg==
X-Received: by 2002:a63:5801:: with SMTP id m1mr13457168pgb.139.1574396663849;
        Thu, 21 Nov 2019 20:24:23 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id r28sm5435801pfl.37.2019.11.21.20.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 20:24:23 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        IkjoonJang <ikjn@chromium.org>, JohanHovold <johan@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        drinkcat@chromium.org
Subject: [PATCH v3 0/2] usb: override hub device bInterval with device
Date:   Fri, 22 Nov 2019 12:24:17 +0800
Message-Id: <20191122042417.205481-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patchset enables hard wired hub device to use different bInterval
from its descriptor when the hub has a combined device node.

When we know reducing autosuspend delay for built-in HIDs is better for
power saving, we can reduce it to the optimal value. But if a parent hub
has a long bInterval, mouse lags a lot from more frequent autosuspend.
So this enables overriding bInterval for a hard wired hub device only
when we know that reduces the power consumption.

Ikjoon Jang (2):
  dt-bindings: usb: add "hub,interval" property
  usb: overridable hub bInterval by device node

 Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
 drivers/usb/core/config.c                            | 6 ++++++
 2 files changed, 10 insertions(+)

-- 
2.24.0.432.g9d3f5f5b63-goog

