Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DD7103781
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 11:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728636AbfKTK2Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 05:28:16 -0500
Received: from mail-il1-f170.google.com ([209.85.166.170]:37864 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbfKTK2Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 05:28:16 -0500
Received: by mail-il1-f170.google.com with SMTP id s5so2877881iln.4
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 02:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7fJ7F08J9U7Fr6MXxHh1Vbug8WabRnCGXh/I0XbTQUU=;
        b=MHHJzVM0/LyX5VXz3M1pTpkiE9ggEXlIisBUYjOuBaZ/M7vXkfxAYx6C2dxs378boK
         wUzmmLKNHPx3I+nRnaxezUi2Pc+vKHwHmInb02JouLLpiCfInt/4ebfsI5ivmq607qJS
         7fs1yOjmWl8OVbdX2agqTVFTyj5g/eNEg1FhyQE5AxEH+Azl1WxL2DuU6NhvZlm7ABOV
         7ftPMmCB372xSrPqRImi6ILg9iaE6S44fkQSALyfvhbmfLOUzWn4UHgqcDtbftsCfHkC
         s3L1/t6XnUtxHs26bC8ujTJqGFYKGRBdXJo8GjbHaMNC2T4QRDY0U8Wu9EiotVORHIvU
         Fm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7fJ7F08J9U7Fr6MXxHh1Vbug8WabRnCGXh/I0XbTQUU=;
        b=nP9jC2EtbsrynSENPvGhQ1xzTmEFdHugWQ7UnQopK9hFVMYsmvjrGqTtbW/DuiBfzY
         w10g2NSqzyaMK70nlBhFAiPl1k5kpKFgkwqY94trykVHXyE5NtDC7t1ajgXBiZcyCcq9
         zhTWNKLQtWSEp/dIWIyYqA3I6tBx2xdzJn6yPi0sAQOCkMwGyyZLsKmKcY+ZwfC9x6jg
         fMaH1Krii4OxlsNaOKspCxGbdd//8vqnhL7n5G9HPyv8X2pZo9oiGAUhesRy+T1dGyWy
         KfXymgHuKKKTlir9+WPzAynpvLLEnK487JrKN3fQnuLnTJZF/PDoCKnFwoDMh+LSo2/I
         +IZA==
X-Gm-Message-State: APjAAAUwNXEmWuZqTwlaL7KQQRELSTbCpGSYWsK7feN2kbNSjHV39Tf8
        MRKtd7AaTUlxxYlsmpg94xGcY8rrXSU4w4VBeOZ7rhh6
X-Google-Smtp-Source: APXvYqxTTKHomYtMeoFhJN0DtwiPXEjTulObN/lyI3gdxzuplOuu25FFBWCP47j8UDxsCpH5IpVIhxfgxOUtc/SBtoU=
X-Received: by 2002:a92:d849:: with SMTP id h9mr2713233ilq.301.1574245695089;
 Wed, 20 Nov 2019 02:28:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:aa09:0:0:0:0:0 with HTTP; Wed, 20 Nov 2019 02:28:14
 -0800 (PST)
From:   JH <jupiter.hce@gmail.com>
Date:   Wed, 20 Nov 2019 21:28:14 +1100
Message-ID: <CAA=hcWRrES4cpXvqBtD8-pyrUwz-BR03c-hSG-Xr4dei3AQi_w@mail.gmail.com>
Subject: kernel: Alignment trap
To:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am running 4G LTE (USB protocol) and WiFi on IMX6 board, the kernel
is 4.19.75 LTE. It is not clear where the kernel alignment trap came
from, the only thing I could see is the alignment trap message
generated immediate after USB GSM communication or mwifiex_sdio. Where
that the alignment trap came from? Which parts of the program could
contribute the kernel alignment trap, kernel iteself, or USB GSM or
mwifiex_sdio? Appreciate clues how to fix it.

Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
now attached to ttyUSB0
Nov 20 05:08:09 solar kernel: option 1-1:1.2: GSM modem (1-port)
converter detected
Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
now attached to ttyUSB1
Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info: trying
to associate to 'Solar Analytics Wifi' bssid 78:8a:20:49:4b:c5
Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info:
associated to bssid 78:8a:20:49:4b:c5 successfully
Nov 20 05:08:10 solar kernel: IPv6: ADDRCONF(NETDEV_CHANGE): mlan0:
link becomes ready
Nov 20 05:23:13 solar kernel: mwifiex_sdio mmc0:0001:1: info:
successfully disconnected from 78:8a:20:49:4b:c5: reason code 3
Nov 20 05:23:13 solar kernel: IPv6: ADDRCONF(NETDEV_UP): mlan0: link
is not ready
Nov 20 05:23:18 solar kernel: Alignment trap: not handling instruction
e8532f00 at [<b6c802b6>]
Nov 20 05:23:18 solar kernel: Unhandled fault: alignment exception
(0x001) at 0x38626667
Nov 20 05:23:18 solar kernel: pgd = 34bdb7e7
Nov 20 05:23:18 solar kernel: [38626667] *pgd=00000000

Thank you.

Kind regards,

- jh
