Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCAD36FC53
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 16:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbhD3O1Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 10:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbhD3O1X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 10:27:23 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF89C06174A
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 07:26:32 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id d14so19045969edc.12
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 07:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6gV63pw27KCpnWgK13XCxTaXBaKXWHs5jMvmJy5qLcE=;
        b=oKssPS5ZJt4ICBISME5rWZD3RuFGOBituvjuddxLddcm2USIMw7qjXzi45JibABaAY
         FpkhODLV7JbPD7GSkxv7TESJtldf3XqchH6ObrbPcL0klMc+KkgTYM7oC9v8BfynhmXe
         uYtspPOVKRXP0LVJ8Reo7LD+d1top3rbXIuwSZS6gz1zsvjI3ZWe6H5cgoFpPqHakG/V
         oEWlrNUh2OLl9kLfuAa0SQ1Pv5NcpRt+OJ+tsbCHI67zs9c+asL6SHA2RH5zKXn+9Sfy
         zPdChQ3sr0w6g8f9oPLmiIQ7WPSYuIZ7iBM6H1e55epIP806iq2ZDSZLJOEjwFFHQa0M
         F6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6gV63pw27KCpnWgK13XCxTaXBaKXWHs5jMvmJy5qLcE=;
        b=qqWGXEQ51ISjusrXPF2wMCBcF6EXRdnii4zhV/AVS+gaGizKpXM66m4Tuja9yassoU
         jtAx+3HECz/VY+BbevNgAOQWwj015vL02AvP9frytZOYMXOwP0YabSmmAU/Fvcz5v0TO
         iVgCVRyMpnuuT2NQDL/BWJWdPWNCDIEFNydc3U9orQxVOrgz8Wa7mDgCqpsBbKAY3N30
         /FtG3q9lNuXWyqs/1AfzmMxm4EAJlyDHa1+K0vdiYgqs4VV4nJ4ScJ/kQUHY0EN3Qo4N
         PZUDzCg0AlBr2MX68lIHN9vXhli58DYcV6Bbzk7WIVaT6mTNihZNbN1/GAYf25rFCXxe
         CqWA==
X-Gm-Message-State: AOAM530Iei7pi7RzI28c3ptcTROGnFqoyOdbbLrUZmEIxvVH9UvA2D9w
        X2WfzIZsAYZZ8Vvc55jr8llPQw==
X-Google-Smtp-Source: ABdhPJyIu1KgYt5Torh1aaF5dJ9mfRyhLDQ0pgw29d2RXspA0bhxuxVh5tFlnZGHIHE8yDKHWRjMOw==
X-Received: by 2002:a05:6402:17:: with SMTP id d23mr6332393edu.63.1619792791193;
        Fri, 30 Apr 2021 07:26:31 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id t22sm1009290edw.29.2021.04.30.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:26:30 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>, linux-usb@vger.kernel.org,
        gschmottlach@gmail.com
Subject: [RFC PATCH v2 0/3] UAC2 Gadget: feedback endpoint support
Date:   Fri, 30 Apr 2021 16:26:22 +0200
Message-Id: <20210430142625.357152-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
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

Ruslan Bilovol (3):
  usb: gadget: f_uac2/u_audio: add feedback endpoint support
  usb: gadget: f_uac2: add adaptive sync support for capture
  usb: gadget: u_audio: add real feedback implementation

 .../ABI/testing/configfs-usb-gadget-uac2      |   2 +
 Documentation/usb/gadget-testing.rst          |   2 +
 drivers/usb/gadget/function/f_uac2.c          | 144 +++++++++++-
 drivers/usb/gadget/function/u_audio.c         | 214 +++++++++++++++++-
 drivers/usb/gadget/function/u_audio.h         |  12 +
 drivers/usb/gadget/function/u_uac2.h          |   4 +
 6 files changed, 372 insertions(+), 6 deletions(-)

-- 
2.31.1

