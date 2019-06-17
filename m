Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEA748300
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 14:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfFQMvK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 08:51:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36989 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfFQMvK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jun 2019 08:51:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id v14so9829402wrr.4
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2019 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5bmkX35OV+Un6bMajgKlhe2VCa9szCQ2ZkSqsLoxX0o=;
        b=SkGqB8nJ/IEWG4IXm6QepVKAPERnunfILKb8Kq1MbhkJjXx3UULfKVudbA72IOKn4f
         G62Fr3PqgKzQKcNsmyBRXyveUf+dHEtdCXtQsE3gTVZVWnfWkldCrMnFs2slVkltx4Gb
         8AATCMbXrzOzWwipup1IO6zK1olLm9TmFGFjp+3h5Yjpcyz6iiNP46kZZ3t5mshsqkkB
         uUfjeYjyZ9Qx603esC/J+weA9ps0NBpcyLjXqm3f6wYZUVQ8smY0LRF+HMW2KQdWf9ZA
         5xqUxmiRTeR1e7KAm+OpIrpAp3jU3t2gdQNZWCNNhR7OlH8K5th6Jk4140PPDGahTHVY
         aqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5bmkX35OV+Un6bMajgKlhe2VCa9szCQ2ZkSqsLoxX0o=;
        b=ltPuY6Fk7/+QI2/bj99VdGJAMskQia5EzewR8qaD8buft9mtCpPyVC9hec+7jPbKdF
         43hW6AxBAvsiRHqcPgzxtjvdvrSOgShCv22mkQh1/hFcry86CFziPLiX45M/AQHmUCJv
         c3Ih/kS4hLOW0ZCqln+lLCR+schaodX+JhoeBOJnCTElqsie6RYeV9dsnaqPIujmCR9U
         AavpmKPYAvaqsTCzGwusaK0+94y7B6mfbWIHkdpRsvoTJ11YJaUD+s4KbV1d6FJNiRiF
         GZOWrvehOJI0Gc/5ZKTZVZG4BjBbM69KZtpCDGHQFGQ2Jd9Kht2A8LYq0c99/oHoACJ6
         tskw==
X-Gm-Message-State: APjAAAX9bsgl99I91jLsyVhDbtaM50lRQm3IJW8Tu43dimvvFqQs/mcx
        Y9HuLd5/FH+OVYDsMR5eRZN/Yg==
X-Google-Smtp-Source: APXvYqw7cAvvCpSNGdJ5pbIUQp1AMGTBLl023D9nSX8+bxc3wDDiQnF3ftT8PtAoEjuj1WIEl1FdVg==
X-Received: by 2002:adf:f84f:: with SMTP id d15mr75718744wrq.53.1560775868649;
        Mon, 17 Jun 2019 05:51:08 -0700 (PDT)
Received: from dell.watershed.co.uk ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id o11sm10477852wmh.37.2019.06.17.05.51.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:51:08 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, ard.biesheuvel@linaro.org,
        jlhugo@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v4 0/4] I2C: DWC3 USB: Add support for ACPI based AArch64 Laptops
Date:   Mon, 17 Jun 2019 13:51:01 +0100
Message-Id: <20190617125105.6186-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch-set ensures the kernel is bootable on the newly released
AArch64 based Laptops using ACPI configuration tables.  The Pinctrl
changes have been accepted, leaving only I2C (keyboard, touchpad,
touchscreen, fingerprint, etc, HID device) and USB (root filesystem,
camera, networking, etc) enablement.

RESEND: Stripped I2C patches as they have also been merged into
        their respective subsystem.

v4:
 * Collecting Acks
 * Adding Andy Gross' new email
 * Removing applied Pinctrl patches

Lee Jones (4):
  soc: qcom: geni: Add support for ACPI
  usb: dwc3: qcom: Add support for booting with ACPI
  usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
  usb: dwc3: qcom: Improve error handling

 drivers/soc/qcom/qcom-geni-se.c |  21 ++-
 drivers/usb/dwc3/Kconfig        |   2 +-
 drivers/usb/dwc3/dwc3-qcom.c    | 221 ++++++++++++++++++++++++++++----
 3 files changed, 209 insertions(+), 35 deletions(-)

-- 
2.17.1

