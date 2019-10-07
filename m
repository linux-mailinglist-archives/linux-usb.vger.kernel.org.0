Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBA0CEB2E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 19:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbfJGR4A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 13:56:00 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37766 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfJGRz7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 13:55:59 -0400
Received: by mail-pg1-f196.google.com with SMTP id p1so6881629pgi.4
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=egboN5LspnsxlOmbUEUbW8zbZDOgKxSBdf9tJPyXXRs=;
        b=h1As562vjET1VzrndYwZlyOz+8bP+Z6B7xHScJN8GN0dXK88R+2cHCxeADlO92XjUQ
         bp+k3fsyOVMKU2H8C5DhtAir11Pp95AfQwX9dBU1Q00hP05/wNahVY35KhVta3r9FF9X
         pEmUBcyVKz579Ru6T16W/hzUbOal04Ygcxw/JOPYxnD/YP7g1rbcHTkXsNIRNCbBO3jX
         lll53Au/bZ9ilssKtkuGjChBP9xXL9Lz0ShEdID0ZabgSrB1y7mVM4oY1C0qAnGK2RIv
         1dnwOO0g0TbkftARF6KvWBcBTVuvOFhXHqsZw6+8qfho08c1qfxOW3+ggttMw5KH1YGT
         Mclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=egboN5LspnsxlOmbUEUbW8zbZDOgKxSBdf9tJPyXXRs=;
        b=c5B3TRl4/fHK4fgDbgkjTODhT05TLXdBtgkS8OUKiAIYuhQXPsdILef3eDMRHlO8Ut
         TY5qOa+QymMzlqqvb1d84pa1MrxenlK31joEdul8vyGt+aY3gEox1ouNBgzjKTQTwsYl
         mTDxabMEypSyFB/acumTk4UHJ1YpUkmWBwAoqIHF5yGz+DtVCq+8ncFwq23ww/CJbCS/
         RJ4rBiXTPFFW1tFsvjmGYX8gib5DAHqwoUYVznIfwBGrsAO8iV5i6EL/oi/n7jBh7zCN
         h7GSHO3+WxitufWSYdy980uTdnjWTpOmbxA02vSfAVtYAY01J/wry9dnFGucSq5xYKok
         d7bg==
X-Gm-Message-State: APjAAAX8Op2vmuvHVaqGbESahQiqOpDKz9lgHKLyHge0fWwXwXbxrjGq
        fPb/yJpNVtoopKE3v1IQOEHB/w==
X-Google-Smtp-Source: APXvYqxlGxe94guiFCzVkK5f+pR1M2fVMTgZtKZPLcP1Jxldh/nvUB2WLt7G/TlrrY7TC5wnTetyzQ==
X-Received: by 2002:a63:d250:: with SMTP id t16mr3884089pgi.278.1570470958745;
        Mon, 07 Oct 2019 10:55:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id k15sm3820096pgt.25.2019.10.07.10.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 10:55:57 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yu Chen <chenyu56@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC][PATCH v2 0/5] dwc3: Changes for HiKey960 support
Date:   Mon,  7 Oct 2019 17:55:48 +0000
Message-Id: <20191007175553.66940-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I've been carrying for awhile some patches that Yu Chen was
previously pushing upstream to enable USB on the HiKey960 board
and I wanted to try to nudge them forward as I'm not sure as to
what his plans are.

This series is just the simpler parts of the patch set that I
wanted to send out to see if we could make some progress on
while I continue to work on the more complex bits.

You can find the full set of changes to get USB working on the
board here:
  https://git.linaro.org/people/john.stultz/android-dev.git/log/?id=ef858be80f202b7bffb7d03c168ee72457a0ef3e

This series is just the more trivial changes, along with some
missing binding documentation that I've added.

I'd greatly appreciate any review or feedback on this series!

thanks
-john

New in v2:
* Tweaked binding clock name as clk_usb3phy_ref didn't seem right.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org

John Stultz (2):
  dt-bindings: usb: dwc3: Add a property to do a CGTL soft reset on mode
    switching
  dt-bindings: usb: dwc3: of-simple: add compatible for HiSi

Yu Chen (3):
  usb: dwc3: Execute GCTL Core Soft Reset while switch mdoe for
    Hisilicon Kirin Soc
  usb: dwc3: Increase timeout for CmdAct cleared by device controller
  usb: dwc3: dwc3-of-simple: Add support for dwc3 of Hisilicon Soc
    Platform

 .../devicetree/bindings/usb/dwc3.txt          |  2 +
 .../devicetree/bindings/usb/hisi,dwc3.txt     | 52 +++++++++++++++++++
 drivers/usb/dwc3/core.c                       | 20 +++++++
 drivers/usb/dwc3/core.h                       |  3 ++
 drivers/usb/dwc3/dwc3-of-simple.c             |  4 +-
 drivers/usb/dwc3/gadget.c                     |  2 +-
 6 files changed, 81 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/hisi,dwc3.txt

-- 
2.17.1

