Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFD0606A68
	for <lists+linux-usb@lfdr.de>; Thu, 20 Oct 2022 23:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiJTVjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Oct 2022 17:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiJTVjR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Oct 2022 17:39:17 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06672101E08
        for <linux-usb@vger.kernel.org>; Thu, 20 Oct 2022 14:39:17 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y14so2667560ejd.9
        for <linux-usb@vger.kernel.org>; Thu, 20 Oct 2022 14:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dXjH59Ze7Ap9DIR97XvQvC4939XBIzse6WQkBj8U28o=;
        b=Sb1IjOtJdvsttgemywwUu1oIisHMQmwzTHhWH7kCZc1zjN4dNhjdbLTdjm4nl6vlWu
         h+EFGD+3rP01tTFbLC7SOmuJYzBLcT5RkKfYMkr/M5Vu4rdOfDdvhd3rEGczH30GV1XY
         34OypFl4knI1beKgAAzvO8fLStkZo99k22Kd+g2pEbaWHh6gFcgZQPM74EbT+y5ufH0a
         8orPeuowJjU8ROepRU9VY+r3xHAsdpalEbDshJ9Fyzj6x86KNtKPxJ33jst4CYURhcyU
         4x95GbOQS5qm31bi6NbgvRxti+3gHWyxMmZQa4a/YDqnO1s33aD+U5JXQYukXN3R8l0F
         Hyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dXjH59Ze7Ap9DIR97XvQvC4939XBIzse6WQkBj8U28o=;
        b=YFp2NAuovjWT33+59lIZUv2ej5+R+mOktt4Qk9KbTcguo9zAvbgXoCPTWv3BjGS+p0
         3U/FCc0lEY1MD7GxtOjD9ZqAARSzzyo9vmeA2JA2XIkndzq1jA0LMjz0Uqd1wzi/Yv0f
         oMxcdj0J8nFUKoMEduJGxiDEs83D7+DD4UZrM8h436KTFMXNC2oSuAGo80+Y2nNNo5LS
         2hxNpXIKitByQUAzEJGQ6h2vhnD50t4yhEA0UX1qRqrq475aqkNiNgk4I/3IeiRrhdve
         yNwPPtUJavhT8aFNvihvswR7RSM9XmBU1SRqjDEruTEFTOf7ZYjjsTxx5Xii9Aa7+DCR
         dKTw==
X-Gm-Message-State: ACrzQf3tEmTFKUyEOoEodAhA/hT3Ca4Gyv9Fb4xU/Adzf6caMRYsVS1F
        W6BCllJA+aYkqiDIETpYeleS4B5+GHbxSUwDKW+bptzDFIk=
X-Google-Smtp-Source: AMsMyM6RDEeIrJ9zSRv4qYui1kl1QwwPAmtP2bIJmvPLkwbkht8PHkWvrp1qOXZI+puskMhu3EDrBH39iTyIW9Yafxo=
X-Received: by 2002:a17:907:60c7:b0:78e:1cc:57de with SMTP id
 hv7-20020a17090760c700b0078e01cc57demr12706611ejc.33.1666301955467; Thu, 20
 Oct 2022 14:39:15 -0700 (PDT)
MIME-Version: 1.0
From:   Chuck Evans <crtigermoth@gmail.com>
Date:   Thu, 20 Oct 2022 17:39:04 -0400
Message-ID: <CAGedn0=nwQwmzTJqY8KXVQ_AGCGE9Dm8vjgoX_7JAKyaoCUzdQ@mail.gmail.com>
Subject: Hp A10 has broken [AMD] FCH USB XHCI controller, UAS errors, please blacklist
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hp A10 has broken
"[AMD] FCH USB XHCI controller (rev 03)"
Uas driver throws constant errors on writes.
I have a Plugable brand sata dock with its own power that wrote 300000
files to an SSD without error on a ryzen system, but won't write 10
files on an HP A10 without a reset from UAS.

I have tested several A10 systems and several other USB SATA adapters
and a WD Black game drive SSD and all have the same problem.

Also queue_length cannot be changed, the USB driver makes that setting
read only, normally it is writable.

Please fix this and blacklist the AMD controller for UAS.

Thanks
Charles Evans
