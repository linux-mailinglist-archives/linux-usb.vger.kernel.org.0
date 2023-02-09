Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5FDE68FDF4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 04:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232756AbjBID3D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Feb 2023 22:29:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232738AbjBID2l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Feb 2023 22:28:41 -0500
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF37E1EBEB
        for <linux-usb@vger.kernel.org>; Wed,  8 Feb 2023 19:27:15 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5258f66721bso8955807b3.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Feb 2023 19:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skydio.com; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+dFU4D+3NJXtvoLWdpHYJ6p3GWkAyfwQu99maiNSiG4=;
        b=Tkk5Sc5C4ohZPWWEamSPWNA1rZBgTC/K40Akvckqgqdq8NGhsr61Esy4WmqNMFxwqj
         NlNrFVf1Tc8lwXY1q8o0+IjpqnYpsOtE+H2CcLq1uBi//XxMiSEmd0eZb/yuEsV51iS9
         aZQBN11pGn61qpzojw6FF1Lq3mdS5WPtUm5+ebUXyVo8N9m+gQy9HWtpuDzHVWYuZgnn
         tD5Ua5eSlEGZFYg5QRTcOfb+fbzDAAxHcvBGMUkuCTkzRr13SACUzFzhsrlsyCO+gLh5
         42BoHqucNRh7a56yesx2JM6YwvK3knR1r6TtUXAB4O3Fw/Enp34kW+FSdFaS6eyc3Kr6
         T8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dFU4D+3NJXtvoLWdpHYJ6p3GWkAyfwQu99maiNSiG4=;
        b=CQrMmx3BpbFE4fGvWoJ+wBbi90MC3nrEqrpJqhG3k7CXBZhDGwgzMQWY4sWYWIgRkX
         U60UUWqVi6+ZoRMEl9lFygroehkeZ/I/QOE9EwC4FQkoQiFVWwUbXHnlHhOn7QMqiyLz
         wOVT28Lmdich5lTdNont0cIhWhldUbiiKRuTOAp7AheNo5/IYUQyYYn1aUprQ0VPJg2U
         UkotgU1d9Iu7uVnecy3bsOi5mBRkZZ4X/e7TfDVcnruylSX4/PGmZlA2WFc5z1k2rk9X
         ftmV0efI8B7WJ5EU1Kerwq/Nx/R8oJnkjDI3RssoOmDVIJPUPbt8ykY1pL3sToG8HjG3
         XUfg==
X-Gm-Message-State: AO0yUKWm4oH9AMvU1Ruv3txhbveSrAfOSNjQ6uOCCKMw7iPFfg0IeJ7Q
        3OtNqSFyR4HwVHDWHEUOzaKzafV7Ly3QnTQQtGr2VeUjnqu/z9xk
X-Google-Smtp-Source: AK7set8I3xNUUZYdjej4JQECpo5dGzkAtw1sARpvAtEgVA91TWWVhIOYeg5GX2f47cE7sGU/+IUGxZm5gLHzYF+qXq0=
X-Received: by 2002:a0d:d411:0:b0:52a:9e00:d32 with SMTP id
 w17-20020a0dd411000000b0052a9e000d32mr800216ywd.153.1675913234808; Wed, 08
 Feb 2023 19:27:14 -0800 (PST)
MIME-Version: 1.0
From:   Jerry Zhang <jerry@skydio.com>
Date:   Wed, 8 Feb 2023 19:27:04 -0800
Message-ID: <CAMKO5Cs69cN+RZNvszobqpHwNNsPFafAaSUxg63sWhSGPXcjyw@mail.gmail.com>
Subject: dwc3 stuck in U3 state on USB3-only link
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, Alex Mallery <alex.mallery@skydio.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,T_SPF_PERMERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I'm reaching out to more knowledgeable people as I've exhausted my
other debug options.

We have a custom board with two linux systems connected by USB 3 wires
only, vbus and USB2 are omitted for space savings. This has pretty
much worked as the controllers are independent, except for the
following bug:

- When the host system (tegra xhci host driver) reboots, the device
(msm-dwc3) enters the U3 state and never leaves it, even after the
host powers back up.
- Also if the device system happens to finish booting before the host,
the same thing happens, dwc3 gets stuck in U3 and never enumerates.

I'm able to get these messages from the dwc3 driver when the host reboots

[   34.549834] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
[   34.555749] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=28100C
[   34.562902] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler link
state = 0x0006
[   34.570319] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
unexpected PWR_EVNT, irq_stat=281000
[   34.663734] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
[   34.669644] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=2C1004
[   34.676698] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
unexpected PWR_EVNT, irq_stat=2C1000
[   34.686082] dwc3 a600000.dwc3: dwc3_gadget_suspend_interrupt Entry to 3
[   34.692919] dwc3 a600000.dwc3: Notify controller from
dwc3_gadget_vbus_draw. mA = 2
[   34.700777] msm-dwc3 a600000.ssusb:
DWC3_CONTROLLER_SET_CURRENT_DRAW_EVENT received
[   34.708648] dwc3 a600000.dwc3: Notify OTG from dwc3_gadget_suspend_interrupt
[   34.715888] msm-dwc3 a600000.ssusb: DWC3_CONTROLLER_NOTIFY_OTG_EVENT received

I think the main thing I'm looking for is validating my existing
understanding and confirming a few things I suspect, but am not sure
of due to unfamiliarity with the details of the USB3 spec:

- iiuc USB3 power management and states should actually be independent
from both vbus and usb2 lines as all the negotiation happens with LFPS
over the USB3 wires.
- I see that entry to U3 requires an LFPS message, but in this case
the host wouldn't have been able to send a message as it is powering
off. Is the device also capable of entering U3 due to timeouts and is
it expected to enter U3 in this situation?
- Similarly I've seen that exiting from U3 requires an LFPS message.
My expectation is that the host would wake up all devices on the bus
with LFPS messages shortly after bootup, and either this isn't
happening, or the device is failing to receive or process the message.
If the entry to U3 is expected, how is it then expected to exit U3?

I've also tried relevant looking quirks on the gadget side including
ssp-u3-u0-quirk, u2exit_lfps_quirk, disable_scramble_quirk. I don't
see a way to explicitly prevent the controller from entering U3 mode,
is this possible with a register setting?

Would appreciate any thoughts. If I haven't misunderstood anything,
the next step would probably be to find a beagle 5000 analyzer and
track down the LFPS messages.

Thanks
