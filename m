Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1905B701B19
	for <lists+linux-usb@lfdr.de>; Sun, 14 May 2023 03:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjENBvM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 May 2023 21:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjENBvL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 May 2023 21:51:11 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B97C1BD8
        for <linux-usb@vger.kernel.org>; Sat, 13 May 2023 18:51:10 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-24df6bbf765so9809149a91.0
        for <linux-usb@vger.kernel.org>; Sat, 13 May 2023 18:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684029069; x=1686621069;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PQfB3WClBNnYwvtvnpXprV6Ji1SqwgoNfRGD4hxaNP8=;
        b=S5Ti3AK5cMeoEi4qyBqMZFbCC9yE6B1HrY5CcurOZrmW3UXffM2aeA4DHkdoGQ/YxN
         sD7PSEdX7fkKKPmJ3pOkDTIfBokFnpMkAGHSE/GzI6FQpMeKQ0x24vaTFMlwMadcHVxY
         +vtvgqlRqMeHVVLA71wMe0rdhFxuX5uLKte+88Pbtqz3bAcUm3349ib/C6rs+UjbxZ4h
         oMBeMCn3TqIqb87ubklmUzRFDXuC56veWdqGCxAJQhwyGxksW82pCADFDyUejxILNsxd
         DmAOllxzsZaHuAg03fLixwavuxd7vvW2EK3GAr26OstsVBTJxa4LCZKanoSqSPLrtps8
         RGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684029069; x=1686621069;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQfB3WClBNnYwvtvnpXprV6Ji1SqwgoNfRGD4hxaNP8=;
        b=PjJjR2e3V9x06uFyTnmNPM8v5AsYbVjiDSbMhrEBWy/5Ga/CfN5/BEKQ3FpwURon7E
         UC0hVrsjRQqHMuZco1tSpNa5I9Lw9DGMA2cFVoPLUao6W84ZMjD5PlU5t7BZjHj+z27l
         rZVsi1HJdydzlIKcJTNMuYGAarhPHmU3nubh02U6UqO7q6Uw1xYr12dpdYQVatxFi8Gj
         Zn2NKYp5FWjZGoY5+7hcoJTppaneB+acACC79iut7vv08OJGRgaXKfEU1fRi1n3zKzSG
         a7hFFc6yCCl13kCKQDzZ6crUuOCAlycs2MJWcaqUWkwrMaT/j2KHwpoM9+ax/ZqvWckg
         c+jA==
X-Gm-Message-State: AC+VfDy/4Z1kyA9myBILk5k/ohY9rGNfXgztd/A+P4sGL4s0H5S7PYtB
        osR6memD3xHOxJj2mdDkTRtb8/RolzTloZoT9jJEmB1SBRg=
X-Google-Smtp-Source: ACHHUZ6LJIHwo9fWFUKY4evZxxfgc2AgurL1HCHrsUNVIhpYNQkM91pvv6+lYBUiIFb7Focq1WcFYgGIcsz8+6Fu0PE=
X-Received: by 2002:a17:90a:fa96:b0:24e:1093:c8c0 with SMTP id
 cu22-20020a17090afa9600b0024e1093c8c0mr28041649pjb.7.1684029069162; Sat, 13
 May 2023 18:51:09 -0700 (PDT)
MIME-Version: 1.0
From:   yunhua li <yunhual@gmail.com>
Date:   Sat, 13 May 2023 18:50:58 -0700
Message-ID: <CAMqbrUgMcOFuw_P6z_KmqJF5iKEXFHVz2eKOyy=5OnWARfRJhw@mail.gmail.com>
Subject: XHCI(USB 3.0) isochronous bandwidth calculation question
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

yunhua li <yunhual@gmail.com>

6:46=E2=80=AFPM (2 minutes ago)
to linux-usb
Hello all
For USB 3.0 isochronous endpoint, anyone know how to calculate
bandwidth for an XHCI chip?
I have 3 isochronous Cameras.
Camera1: 1920*1200*16(YUV) *20(FPS) =3D 737280000 ~ 740Mb/s
Camera2:  1200*1200*16(YUV) * 20(FPS) =3D 460800000 ~ 470Mb/s
Camera3:  1200*1200*16(YUV) * 20(FPS) =3D 460800000 ~ 470Mb/s
16(YUV) is 2 byte YUV encoding for each pixel.
20(FPS) is the frame rate.
Total bandwidth 740+470+470 =3D 1680Mb/s ~ 1.7Gb/s
USB 3.0 speed is 5Gbps. count in 10b/8b encoding, is 4Gbps. I know
there is some protocol overhead.  When I open the 3rd camera with
guvcview or other software. I got the following error.

xhci_hcd 0000:49:00.0: xhci_check_bandwidth called for udev 000000004bbf2dc=
d
xhci_hcd 0000:49:00.0: // Ding dong!
usb 10-2: Not enough bandwidth for new device state.
xhci_hcd 0000:49:00.0: xhci_reset_bandwidth called for udev 000000004bbf2dc=
d
usb 10-2: Not enough bandwidth for altsetting 1

the error comes xhci_check_bandwidth from
https://elixir.bootlin.com/linux/v5.10.140/source/drivers/usb/host/xhci.c#L=
2906
xhci_configure_endpoint
https://elixir.bootlin.com/linux/v5.10.140/source/drivers/usb/host/xhci.c#L=
2862
The result is COMP_BANDWIDTH_ERROR or  COMP_SECONDARY_BANDWIDTH_ERROR
https://elixir.bootlin.com/linux/v5.10.140/source/drivers/usb/host/xhci.c#L=
2022

The bandwidth check is done by hardware, not software, I just want to
know how to calculate the max supported bandwidth for 3 isochronous
devices?
I tried to read the XHCI spec.
https://www.intel.com/content/dam/www/public/us/en/documents/technical-spec=
ifications/extensible-host-controler-interface-usb-xhci.pdf
But I couldn't figure it out.  I appreciate any help, and thanks for
your time to read my post.

more info:
Here is when I open the 1st camera, the kernel print.
(1920*1200*2(Byte) =3D 4608000
uvcvideo: Device requested 46080 B/frame bandwidth.
uvcvideo: Selecting alternate setting 1 (46080 B/frame bandwidth).
uvcvideo: Device requested 46080 B/frame bandwidth.
uvcvideo: Selecting alternate setting 1 (46080 B/frame bandwidth).
Regards
