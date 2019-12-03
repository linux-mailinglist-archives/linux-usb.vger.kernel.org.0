Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBAB10FB88
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 11:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfLCKP2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 05:15:28 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42196 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbfLCKP2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 05:15:28 -0500
Received: by mail-pg1-f196.google.com with SMTP id i5so1468963pgj.9
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2019 02:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9tRxVgE9HFG04agLIYkIxCuLcJXysbe1494NjR7f93c=;
        b=HoZE0eWAeqSX8yhZ60usZmY7HegNU7Eqm2zKr6UNbGa6jJJ8djzgc8nA81LFzKICE1
         o8P8YM2zbFkdgnQCgwsGaREaihuGxajcKV2hb6odfKtXRUqEeIVirQBGkmIIL0nIdxxl
         h6lxB/KZHg6EjlFBLYdMgA8Bx2roM6720uk6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9tRxVgE9HFG04agLIYkIxCuLcJXysbe1494NjR7f93c=;
        b=feX5+hA4BDCd9OHHFDttp80OhqKElskj7SFr3M29pHlqvSD7QQlmJ7pZzCIEkWExyF
         NyB73fvIYb6SPxSdx/XHqrNZ89QMF/tIWL27Z7VB/fCgiURi15D6Na9S/W8i2qX4Tyow
         6ttP0zLbSjDR/TGkMSmQ5js+9dp6iTh6zaE8aSprawaD39uHzhyVmndsolgcjrwYxh2m
         t6sje+vBH/hK8zsXivTajVjeilKUn0KCPbHwN/UPM1ao17bIDhshAwBFL7pN9iOfHKoz
         qytIABQYisQAXIGcmtGCj2Te9RoGYuIxszqdGouraX67c6koIOn86JUHN2atqAKgn+xr
         UjCw==
X-Gm-Message-State: APjAAAUEo7P3CnOEBcmpzcFWq2qKaDIHnSidgiF0l5aAs7VVZ8xbdSH6
        ajP/i1uFB0gIbnYNT8GoHpxu7WiKtD7s4g==
X-Google-Smtp-Source: APXvYqwIvn1rfxHeprF7KgmnJ16qeOEmel+VhkoLgbCYekUX2UE7TrBlBzPYR3CfkEETTAbDZd46VQ==
X-Received: by 2002:a65:64d4:: with SMTP id t20mr4579380pgv.152.1575368127112;
        Tue, 03 Dec 2019 02:15:27 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id o7sm3248639pfg.138.2019.12.03.02.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 02:15:26 -0800 (PST)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     GregKroah-Hartman <gregkh@linuxfoundation.org>,
        RobHerring <robh+dt@kernel.org>,
        MarkRutland <mark.rutland@arm.com>,
        AlanStern <stern@rowland.harvard.edu>,
        SuwanKim <suwan.kim027@gmail.com>,
        "GustavoA . R . Silva" <gustavo@embeddedor.com>,
        IkjoonJang <ikjn@chromium.org>, JohanHovold <johan@kernel.org>,
        linux-kernel@vger.kernel.org, drinkcat@chromium.org
Subject: [PATCH v4 0/2] usb: override hub device bInterval with device
Date:   Tue,  3 Dec 2019 18:15:21 +0800
Message-Id: <20191203101521.198914-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
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

Changes in v4
- use of_property_read_u32() instead of of_property_read_u8()

Ikjoon Jang (2):
  dt-bindings: usb: add "hub,interval" property
  usb: overridable hub bInterval by device node

 Documentation/devicetree/bindings/usb/usb-device.txt | 4 ++++
 drivers/usb/core/config.c                            | 9 +++++++++
 2 files changed, 13 insertions(+)

-- 
2.24.0.393.g34dc348eaf-goog

