Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF75528C42
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 19:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244141AbiEPRtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 13:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiEPRtE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 13:49:04 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEC237AAA
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 10:49:02 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id e78so7270658ybc.12
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 10:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=c+XYJ6UmUrmztEeFysS4Y+AivJx6yqRIXFkNZ1sWGxc=;
        b=K6hFtgfLomYaIJWKDWA9uZ6hxBqOAA2jDZmZvJFhBkM12mfl9CWyttv6RbeHzy1LP/
         MtHuP4vy4hJcBSLEfjne2E9wseitffSTr693bnr2WDQAIZCOKeJEf7RxV5xaiUK9vkGM
         /BgsjGb48tdJ9XY/Fydv1f3sxkeZgCK8Yfiy14fLGG6fmZ5nH3u7uTRCYH2LFTIDZwAC
         RBd6QEfNLDbMo0VDGd2dNcPKnPTidbEO49GoMMtzjm9itW17gSCJV+egB20BSeoPJQai
         w0+Nz5g7UTt8kiZuZG1KdE2diJf4hpuL2u8EvxH+seyM8mBnxJrvBcN4vwqZhw01/mxL
         cBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=c+XYJ6UmUrmztEeFysS4Y+AivJx6yqRIXFkNZ1sWGxc=;
        b=SnLMUi7yhk+7A2et+7NwQntaQ8nway4ZF6q64vgSR/n9D5CfOBHieieVjIEV8VpccO
         6b85aBbSDPvUKigzQi5frUKm448e4YXgMdo9O8AhlLpxUzx+vIH5dXUYq5D1g4jl5dGG
         tH66QiBXrbmjNU14Eapm6tPyuxAFOA04k1mQBVkrz8VrDyLRg/kN3YIlS6CY0NnV01vN
         xgpI6FthbcbQNuPWaith2wG1kJbvMRVN1odoumpD8WrNCabp34lgg7bz4rJ2B5p0CKx9
         7iqXbRxh/0Ec5A9Foloj6xIy/rlOtzzVqa3lY0m0gGDNmrc87IQwyjQlewtIHwDPeIml
         oFUA==
X-Gm-Message-State: AOAM5306prY1lmZXu10ikVDSk/vsSUyIvLKoSvbkDo7vhbtSEZJxJGE3
        e6N1wcKDXsaB9vmhlhA+Kd7KThf198klLcnnCcOJ/Os66B8=
X-Google-Smtp-Source: ABdhPJyXNpOz73XStcAryzsNNNZrNtG6RXvduIr6AU2TzXyHWSmnah/5AE+VGcaHa2rAhjyPiK5v43ZmTtOQuxyCcn8=
X-Received: by 2002:a25:d915:0:b0:64d:b727:1228 with SMTP id
 q21-20020a25d915000000b0064db7271228mr5134272ybg.52.1652723341947; Mon, 16
 May 2022 10:49:01 -0700 (PDT)
MIME-Version: 1.0
From:   Gary van der Merwe <garyvdm@gmail.com>
Date:   Mon, 16 May 2022 19:48:51 +0200
Message-ID: <CAJixRzqf4a9-ZKZDgWxicc_BpfdZVE9qqGmkiO7xEstOXUbGvQ@mail.gmail.com>
Subject: Bug report: pl2303 unknown device type -
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

We have a Cashino PTP-lil/BT24 Slip printer[1]. When configured in
serial mode, it uses a pl2303 chip.  This has not detected by the
kernel since 5.13.  The bcdUSB is 1.01, and the driver was changed to
only allow 1.10 and 2.00 [2]  Please consider adding 1.01 as an
allowed pl2303 bcdUSB.

Thanks, Gary

# uname -a
Linux GAU233333LD12 5.17.6-051706-generic #202205090841 SMP PREEMPT
Mon May 9 08:51:54 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux

# journalctl -b -k -g pl2303 -o cat
usbcore: registered new interface driver pl2303
usbserial: USB Serial support registered for pl2303
pl2303 3-3:1.0: pl2303 converter detected
pl2303 3-3:1.0: unknown device type, please report to linux-usb@vger.kernel.org

Full output of lsusb -v: https://launchpadlibrarian.net/599900231/lsusb-v

[1] https://www.cashinotech.com/ptp-iii-80mm-portable-mobile-thermal-printer_p23.html
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/serial/pl2303.c#n421
