Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797FD1C9E03
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 23:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgEGV7I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 17:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgEGV7H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 17:59:07 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C033C05BD43
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 14:59:06 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i15so7823176wrx.10
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t3RcuTfATJPIk2PpFOWFeubdL2oxOOoFafQJ/eMWyS8=;
        b=aGESkxJLEnPKhYPOXsknxCmACG2VOHSTPvA3IkN8bDuJ52fDGV+2/pJTF83FFTS/qm
         KLxfwvfJFFOTMSVeX4JD/RnYfEWU1K1Q9c4yHMwYeamr866iU7vJSUQ7EYDxl0xRySYF
         qeYoqhgtci9DihQZWS1Ln5i6gVQPq6DuLYkryznlEzVpu/Gw7ixsIvWhzEkBPDIQO5t/
         F9HENQtUYfAXtd4KAJDj34UuAwguug4vl1Yj8Rxttq24GUO6EcxL5UqP9HU8hoKuMWY4
         RzziAHu6pa8HjiuvyEeSTK/WE/YHO4pDUW9bvIkTy64L5QauFi1EZZsBG+QMEeAnGRr4
         JkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t3RcuTfATJPIk2PpFOWFeubdL2oxOOoFafQJ/eMWyS8=;
        b=FtDXwxXy9niL1zrsfcyCscprc+wPRhOzTb3+R6D8h79rmmCVGA1XC/hEDj7AXTrws1
         tsBgQ74tw63dwZkWbNslu2qIQ3fkECR+V4UNGIr9PyOqQE7em8uGqDULcxKE6Vs8aIuR
         u+agxwUDkmC6iojwR+eFvYst13a7JSAxbSTTlOk15IFKlEIKXRV9x68ssL+YpFPAGxsd
         WtqvEamXPKlN9bliC/shgkZ3zUoNZLlfPa09+p2e4ErJwx6jE4RInqm4BxwD6Vvzvm1+
         e1VbmnKw/Uces3hmYPQnnvDD3JIE6GW9ZRE0RQEw7NoLDzdTwT36DZ5i8P12aa+0bGGr
         vxKQ==
X-Gm-Message-State: AGi0PuY9LmPBLcPZeCK2rSwsxbOpHC02vybiFQACs4plNkK1VYE+JMHw
        xd+UmnsJgwVOwfZkXczAmScGLPWAItY=
X-Google-Smtp-Source: APiQypIw6C1LouSvwYnIQbTEFcF4XymG+MeqV9Vea7gsPVFW65Oc1KDuBjhZii2HuPxdNXC9lsGzXw==
X-Received: by 2002:adf:f907:: with SMTP id b7mr17699159wrr.203.1588888744591;
        Thu, 07 May 2020 14:59:04 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z18sm9814245wrw.41.2020.05.07.14.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 14:59:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de,
        andriy.shevchenko@linux.intel.com, garsilva@embeddedor.com,
        keescook@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/1] Add USB role switch to tps6598x
Date:   Thu,  7 May 2020 22:59:37 +0100
Message-Id: <20200507215938.1983363-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V2:
- Updates the git commit to include a link to the TI document which
  describes firmware configuration - Andy
- Pads out the description a bit to include information on baking the
  data-role into the firmware with the referenced utility.

V1:
This patch - adds USB role switching to the TI TPS6598x. It has been tested
out with a ChipIdea controller inside a Qualcomm MSM8939.

Right now you need to have configured the TPS firmware with the TI
configuration tool so that the chip knows if it should initiate or accept
data and power role swaps.

https://www.ti.com/lit/an/slva843a/slva843a.pdf

Heikki mentioned that on the ACPI systems the firmware had been
pre-configured to do data/power role swaps. On the hardware I have this is
the case also, which is why I did't invest more time in adding DT bindings
to control data/power roles that I don't need or necessarily support with
the reference hardware.

As-is this code will do role-swappping nicely for me, and I think should be
safe on existing ACPI systems.

Bryan O'Donoghue (1):
  usb: typec: tps6598x: Add USB role switching logic

 drivers/usb/typec/tps6598x.c | 56 +++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 7 deletions(-)

-- 
2.25.1

