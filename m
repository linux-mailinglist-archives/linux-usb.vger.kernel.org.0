Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD49F1C8B39
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 14:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgEGMpZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 08:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgEGMpZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 08:45:25 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B073C05BD0A
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 05:45:24 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id k12so6340380wmj.3
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tc54G0swG8CTxHpRzIJicQ+dWaw02lBcaaXJW9A91/A=;
        b=cgkCoFI6x7ULrpuxlc3Pot4OLbdagWZR3Riu4oqoLyuTnqTUtaw/P1oSLU9GUNZLBh
         uBzz6Tn/obB4yHCjWHFNB00yoG2NX2PzJx+68S20f2iamTkB9rBhE3CbIO7K8/ng535Z
         PP/4T6ahdJEid5BH6ota2i6158SrfDoU4hCMjRSEUZY/cXcZ36thF7i5KpFYhRHsAwst
         hFHdPMNWIhlDUfdOgxISjBLDq3GESj9wmW2pMwoNIwiF+xfOYB3giQ1rvFGg04+KbTYJ
         7qcqWRLaP6XKGxPpD50zmm8Ljzoy5q3Wn6QG1dxtCg+vr1Rr83WXfYIYUnLpjD/5IZ7G
         hPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tc54G0swG8CTxHpRzIJicQ+dWaw02lBcaaXJW9A91/A=;
        b=r+HIh6oP68ooMhEbmoMg2I+6Aak+0/7IcjdGcr0RryJkjCUBQRMQRp/oRsZC1VGRFz
         S3yy6NkZC488lVPCXdXiggar/ARM9mQCfPMKx6YUlORl8hPKx9GsJdcApXGQ0N6jSpTy
         EqW9JDeIfzwoo/3YiM/Rqv/nkjjPeOxqyPzR6RGmjNlFk+J0UI71PAzhjbB4ESdevp2o
         xCBHFhyAchg+ipPeyT6uR3LA4UZntQ4n6yPahO1ypDSF3t1DbcA1+uOD0R2aN4T7B1+E
         65HPu3B8Dz0glv8K9I4MLoYGerRNblvpTJAgIO+PnJhiN32vvZALODoNEHNuKo00oU1O
         4e8g==
X-Gm-Message-State: AGi0PuYXUSIO3dYghNAiQFNCkJ50Yr6kTLDIdHe6jryVHR1BuUJqgH/R
        kZY0ML6nEPjTH4nrd+D6WUmMqw==
X-Google-Smtp-Source: APiQypJUW4IMne2lqh0irngXT2iCewbj1NbU/g07pTPKmQaWFrKPK5bXCb6d0RGyftkr/I2AfTCWsA==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr9736752wmh.47.1588855523069;
        Thu, 07 May 2020 05:45:23 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c17sm8034106wrn.59.2020.05.07.05.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 05:45:22 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de,
        andriy.shevchenko@linux.intel.com, garsilva@embeddedor.com,
        keescook@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/1] Add USB role switch to tps6598x
Date:   Thu,  7 May 2020 13:45:55 +0100
Message-Id: <20200507124556.1774311-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

