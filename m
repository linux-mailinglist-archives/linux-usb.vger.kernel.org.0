Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C61F160D6E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 09:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbgBQIdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 03:33:13 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:36799 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728456AbgBQIdN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 03:33:13 -0500
Received: by mail-lj1-f182.google.com with SMTP id r19so17816427ljg.3
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 00:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4o9MpvCnaW7UNrMoDadTvPllbR5hSCdTM1cZtcwAvo8=;
        b=xr36KzVxOPwuOahqFncxjhK4K8zSR2lKO39Cxagp19vpsh2qOcTiJybYRRe7pI/5bk
         3w/XGkmLQjqV3+cwsJlYWlggupIrqmMkzIGJUwGWgZOAR9d7suw7tMrylO3nmBWcc/VR
         qsFb5SzdiVdfppdjWADry9ZGJEUCL9vM5oTQY5woMoZ4u7ENul/znHVmDUPOdzIMW3Qz
         8de77iKP6QtAHDal2JrdZb9FC0nElwJJVG64ZiA03jlZwvrx7TiIZeVWKfK6J0Ltn/xw
         FDNz99SqqBemyvnYIc39cJLNv//6MUgZZuCuw/CQhlQ45AJOSVff8mXvbiKxV8nt/W2o
         JKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4o9MpvCnaW7UNrMoDadTvPllbR5hSCdTM1cZtcwAvo8=;
        b=rNXR9HTCEW2LeCBlhBYSiwQqeqwSHmFnQwbsWm1CpGSoliA+8qRrAFbH6qgxUjK47H
         vRYPi2+FTfnc0Y9tcdVu6Oy6VygIEt4LdnBaz86jcQrgR+ZI84Y3s7NXw72mRxVEfIDu
         3ukHTh5oAOh8zZVWIggEXQrSRwn+pPU3xSVTkfRc1/8VPcGjkLxM167LXINergL5Eayd
         e/ishuYHxISRWBMd6D17VtyeAqW1Gc3t2thCVFmXGTFkc4gG21BP9/mRXtF7Taag+Q+b
         2PkaJIecma/RpVVD6gV+trKbzvGZv5DkI1mIR7XtUd1uuIOYz0KWSjiWPAKmMSDwfiSI
         l+vQ==
X-Gm-Message-State: APjAAAUWVlbJN2Vz3TPqtcm0pYSgxY0bDhCPnh7G4hQExDqevbquG0zw
        GWMlM7wammzbDW3dasAhsbWSEvrhb98jP4pJFWwuh3Em5mk=
X-Google-Smtp-Source: APXvYqx2ueaC/hV8qPE0R05PmQXt8c2Pct9mXAV2SSmrSlMEmO1pjbXcsPd0W1wVCc9TriZVLyqVp/ChAvVZSmdRB38=
X-Received: by 2002:a2e:9008:: with SMTP id h8mr9245027ljg.217.1581928390302;
 Mon, 17 Feb 2020 00:33:10 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 17 Feb 2020 14:02:57 +0530
Message-ID: <CA+G9fYtnwFVPQxgHOU2Bi9y5+q4sSsww47yxK+_3ZAQ9=kyhUg@mail.gmail.com>
Subject: msm_hsusb 78d9000.usb: failed to create device link to ci_hdrc.0.ulpi
To:     linux-usb@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter.Chen@nxp.com, lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

arm64 APQ 8016 SBC ( Dragonboard 410c)  device running Linux next boot
failed due to below error.

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
[    0.000000] Linux version 5.6.0-rc2-next-20200217 (oe-user@oe-host)
(gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Feb 17 04:27:31 UTC 2020
[    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
<>
[    4.439291] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.448891] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.457879] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.467331] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.475636] mmc0: new HS200 MMC card at address 0001
[    4.478895] mmcblk0: mmc0:0001 DS2008 7.28 GiB
[    4.480629] mmcblk0boot0: mmc0:0001 DS2008 partition 1 4.00 MiB
[    4.484719] mmcblk0boot1: mmc0:0001 DS2008 partition 2 4.00 MiB
[    4.492247] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.502611] mmcblk0rpmb: mmc0:0001 DS2008 partition 3 4.00 MiB,
chardev (234:0)
[    4.506949] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.517901] random: fast init done
[    4.521420] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
[    4.523400] mmcblk1: mmc1:aaaa SL16G 14.8 GiB
[    4.532843] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.539131]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
[    4.542309]  mmcblk1: p1
[    4.561843] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.573481] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.585283] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.592622] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.600074] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.607204] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi
[    4.614679] msm_hsusb 78d9000.usb: failed to create device link to
ci_hdrc.0.ulpi

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: c25a951c50dca1da4a449a985a9debd82dc18573
  git describe: next-20200217
  make_kernelversion: 5.6.0-rc2
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/705/config
  build-location:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-next/705

ref:
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200217/testrun/1223296/log
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200217/testrun/1223301/log
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200217/testrun/1223310/log
https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20200217/testrun/1223308/log
