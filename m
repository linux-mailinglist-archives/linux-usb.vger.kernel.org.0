Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1246C39AD66
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 00:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhFCWEU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 18:04:20 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:34317 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhFCWEU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Jun 2021 18:04:20 -0400
Received: by mail-wr1-f43.google.com with SMTP id q5so7321969wrm.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Jun 2021 15:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GXL+fNqjlwf75kNsCNroFfs+UKeXb8lL1LOOkgL27rs=;
        b=AUzbyNHoqoKPjhekKGj7LS9TNXZdUmohJAmoCKJ1GFn/si1CkbG4bL1GUYH3CVkB9r
         ymPQzjX5q9SwjQXkht5Ki4Rhk9qdPBoSZs+crP/l5YCya5HLbX1r9xGLJLzA+P9fe7oB
         C1klFVjjA75mMnFC5RNJ331IEmelcsnAkG6iBnGHPYiLflAWTK1whYYbpR4AT7uOCbgl
         Hnk3hV1/OxkgIbOEd2EdvvRH6e+3c6P/VYOCdEQ888IhhhDzqeplKb2n8JA/5VdFAReI
         SM4t7vzRKMciERDIpSECEG1kVnNuXT1R8RakahSkqtcqLsg42VxE7oqt1pyZa8kQWy2K
         ladg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GXL+fNqjlwf75kNsCNroFfs+UKeXb8lL1LOOkgL27rs=;
        b=ICMTxnoyYTQygZeAxW+peXYxfN1V/3XozMalNWjnS1S5X8IIVKiEn0bZedNOi1TcLv
         vCVnd5t4sw7655wpt6RaoDzzkAJhVUnDKdDF7qUlAHYuhmG+RXvxkS7r63/rBiKDFWxV
         1rWG6XrxsMdHpKBIs7XymljD6GE13teGTq7YJylPOu7VfkONUqM/6Nu4+hT8WdCvsBf0
         r7Gc3A4OrnvTcHZVsCyXCFrRNSGDJ8qZBVz1SYf3Ca1uvpHwMBMLcNhRpTWh1clRHOA9
         kozqIYigOJQZoQ6yFi4opSlCBBF0R8bcPGs2HLd4YUbkJHSd+CVyIsJa8+vqqMbu0k9h
         TXRg==
X-Gm-Message-State: AOAM530ZLw/DNa4F7RsADBmbYL+iNTTMTmzcOYvINFa8aJCKkuoXf1Pk
        IvzPyPvRwtfQPoW1y6UzjUQHqA==
X-Google-Smtp-Source: ABdhPJzV3aHN5HLYUVs3TW4ohKdnyTO7BVAvaTP9npKs5IDpFCzjDDOsCim5Y52aYofrob3zpuhQHQ==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr556058wrq.152.1622757678349;
        Thu, 03 Jun 2021 15:01:18 -0700 (PDT)
Received: from localhost.localdomain ([2a04:cec0:11bf:2693:b60f:d58b:e3f4:1a80])
        by smtp.googlemail.com with ESMTPSA id s128sm4078404wme.6.2021.06.03.15.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:01:17 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-usb@vger.kernel.org,
        gschmottlach@gmail.com, Pavel Hofman <pavel.hofman@ivitera.com>
Subject: [PATCH v3 0/3] UAC2 Gadget: feedback endpoint support
Date:   Fri,  4 Jun 2021 00:01:01 +0200
Message-Id: <20210603220104.1216001-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.32.0.rc0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Current UAC2 gadget implements capture/sync paths as two USB ISO ASYNC
endpoints (IN and OUT).

This violates USB spec which says that ISO ASYNC OUT endpoint should
have feedback companion endpoint.  See USB2.0 spec "5.12.4.1
Synchronization Type": asynchronous sink provides explicit feedback
(isochronous pipe).  Interesting that for ISO ASYNC *IN* endpoint
respective feedback isn't required since source provides implicit
feedforward (data stream).

While it's not an issue if UAC2 Gadget is connected to Linux host (Linux
ignores missing feedback endpoint), with other hosts like Windows or
MacOS the UAC2 Gadget isn't enumerated due to missing feedback endpoint.

This patch series adds feedback endpoint support to UAC2 function, new
control to UAC2 mixer which can be used by userspace tools (like
alsaloop from alsa-utils) for updating feedback frequency reported to
the host.  This is useful for usecases when UAC2 Gadget's audio samples
are played to another codec or audio card with its own internal
freerunning clock so host can be notified that more/less samples are
required.

The alsaloop tool requires some (relatively small) modifications in
order to start support driving feedback frequency through UAC2 mixer
control.  That change will be sent as a separate patch to ALSA
community.

Also added ability to switch ISO ASYNC OUT endpoint into adaptive
endpoint which doesn't require feedback endpoint (as per USB spec).

v2 [2] -> v3:
* Just fold 9 left shift in the feedback calculation to avoid
  dealing with big numbers (as suggested by Pavel Hofman)

v1 [0] -> v2:
* Instead of HW rate used by gadget (which the controlling application
  might not be directly dealing with), the kcontrol used to provide the
  feedback value is expressed in PPM. This way the correction is
  agnostic of the rate used by the gadget while retaining enough
  precision to allow a smooth adaptation of the clock on the playback
  side, if necessary.
* The minimum value for the correction is aligned with
  sound/usb/endpoint.c at -25%.
* The maximum correction must be chosen more carefully as it impact the
  bandwidth required by the output EP. The minimum is one extra frame
  per packet. This is ~500PPM at 192KHz. This seemed more than enough
  while testing.
  Of course, there is a trade off between saving bandwidth and enabling
  devices with a significant (abnormal) clock deviation. The default
  extra reserved bandwidth is set at 500PPM but it is configurable
  through configfs, like the rest of the gadget.

I have kept Ruslan assigned as the author of series. He did the vast
majority of the work and deserve the credit. I have merely tweaked in
his original patchset.

This patchset has been tested on an arm64 host at HIGH_SPEED, with
various rates and channel configuration. I have not tested with
FULL_SPEED or SUPER_SPEED.

See here [1] an example of regulation with a patched version of
alsaloop.

[0]: https://lore.kernel.org/r/1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com
[1]: https://pastebin.com/0hiK7LAe
[2]: https://lore.kernel.org/r/20210430142625.357152-1-jbrunet@baylibre.com

Ruslan Bilovol (3):
  usb: gadget: f_uac2/u_audio: add feedback endpoint support
  usb: gadget: f_uac2: add adaptive sync support for capture
  usb: gadget: u_audio: add real feedback implementation

 .../ABI/testing/configfs-usb-gadget-uac2      |   2 +
 Documentation/usb/gadget-testing.rst          |   2 +
 drivers/usb/gadget/function/f_uac2.c          | 144 ++++++++++-
 drivers/usb/gadget/function/u_audio.c         | 225 +++++++++++++++++-
 drivers/usb/gadget/function/u_audio.h         |  12 +
 drivers/usb/gadget/function/u_uac2.h          |   4 +
 6 files changed, 383 insertions(+), 6 deletions(-)

-- 
2.32.0.rc0

