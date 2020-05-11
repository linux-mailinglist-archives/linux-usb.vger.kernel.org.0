Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9541CE902
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 01:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgEKXTC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 19:19:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725987AbgEKXTB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 19:19:01 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223BEC061A0C
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 16:19:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id y16so5894319wrs.3
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 16:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YcH2qux2JQ3JDWPW8Ez5GMHytn9j0kQ5ZwwWCyBgCa0=;
        b=YfY3AO+xwobQI5nDzao9bEcnpRa93zCd9hz5vx0zh12cwf+tVsfGm0M+KYJws5f2aa
         LudFWzD0fpBiaq/Lyc6hzyAWXwwChbAm8toIJPdhrhh/uWNUMDvCSqYU4ajp7ON7OiZg
         thRD0EDG0h/eh7KkB1ct9951JLuKjT2mSaj/vJHhg4SHSVHBlNu0ifiYywvn0ijc44cF
         Wj5mcwPD7IY+p6lKASZF/oaEepVxOIbH1VHzzZumJLYKcTJlYLoo38GtD/d90ljzUBBJ
         lTdrieonP4ECkPSBTfGEZN49vMp+/Zr8L4zwynxAzTOobhWC1E7vL0tcElaJ8jL6c32E
         Jg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YcH2qux2JQ3JDWPW8Ez5GMHytn9j0kQ5ZwwWCyBgCa0=;
        b=V+K7P6hqIkGlObDo6zBHkQopAawgsi2XtnxevUe0wTXA+jbL2UvcuzDjW5xM2Xr4ux
         zB7Lk6ym29VgTIdYomy9DrPIwnIL3F/z4qCBwMvWEnSIlRu24IvQAkXY/iiCVM3crv5o
         oR5qTDDi+WITnVBTh266PiHIlaoKSZdW+sOm2o8HCZnzob1pzwzMvRrqn4M7xC5uWx4G
         J/45LObzfAcim7q04VaspdpBoBDTcD1mSq352zg+0xjJyluBLR2xa3MKd8m1QreYB8td
         KB4OCuElTeSKQVq7bLOV/dkzJJsBO5HMfpJeAlr58vOVMNRiLo5DLCyxn1YEbsx0EBCg
         M2xQ==
X-Gm-Message-State: AGi0Puau7c2x6wZtycN28Zb/VppLi4vHtzS0jXiAbXKnLMu3sSNTquSG
        VlBy6KkkQ/4eFFn73C/gm+SyJw==
X-Google-Smtp-Source: APiQypI7/IaLG2t0Gjb5EAdsNkTk9Z69V4So1QmiEDfuPR7q6gkHdbDL/nVt50+Xy28maOMl9hD8RA==
X-Received: by 2002:adf:f84c:: with SMTP id d12mr5330861wrq.248.1589239138888;
        Mon, 11 May 2020 16:18:58 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id t2sm29844707wmt.15.2020.05.11.16.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:18:58 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/1] Add USB role switch to tps6598x
Date:   Tue, 12 May 2020 00:19:29 +0100
Message-Id: <20200511231930.2825183-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V3:
- Updates error flow for connector as indicated by Heikki.

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

 drivers/usb/typec/tps6598x.c | 57 +++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 7 deletions(-)

-- 
2.25.1

