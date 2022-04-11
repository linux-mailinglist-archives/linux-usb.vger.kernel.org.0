Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70D344FC335
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 19:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348817AbiDKR3H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 13:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245656AbiDKR3G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 13:29:06 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462B225C6
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 10:26:51 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id lc2so11758038ejb.12
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 10:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=QdVBcinj38tWRTEOTYJBcwKqCMlbGmUYjUq6qlfOE7I=;
        b=UTMeqqZRzEs+YztkK6jE7H1rm+Gnq/GhHWzAkcR1/1R9AxnvUqhA+WOAeyO55V1RAA
         noKtPSsjE0NnPco5aKAWAO6ONIxmgFd1w8PzZgDhfgqDKwR7Y1QFMuaztgTGxTlbQA6C
         PzgoCeeNxE7Bm4UGwbw5vLhvoCg2MPCeDzq3CJ59EXYJtgl3lKxPDW+1qFmivBgsAgS0
         X0/6wkwVXiyP8rvsczAlKTTl5KHmqo3WgznTUgTUAFZQHV4owSmlIa/fZj57ci3LoDoS
         eePDBoz87vyKt8dtINUDqCzIs4FxeUeuuKoAMBGfBo81AXQxZ0YJ52zIZ/iwiwutwB+I
         6dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QdVBcinj38tWRTEOTYJBcwKqCMlbGmUYjUq6qlfOE7I=;
        b=cPwSIRar5A2MXU6ntqybr13RqY1remTQo/MiwVg85I0ljbfMMfi6H1PK9GfQbuOLh7
         dNyI/bofOLyQgOGWYZuzbUgKC0UisEqMiBCcgK1Cerwx7gML6zqIvh20AQLJGWrO1dyR
         UEh8+RC18PAlWPWIN1B4ltkwO+xIU4MwKxox8aUp55yljdpvBQBFTmfYsEoNlocrNyJc
         ZEF/anncWj07tBD/n3rFUBSgjRaW+1tD+VmCuA2VT42miNj6x4GF7xryZZHe5Fava0IW
         T9qpY7Nqswk0nGQse+fVPJJUcuI2eTbKxjGE5pJAJQcXRzNfv8cKGRxomr+rLp5bwNva
         NwCA==
X-Gm-Message-State: AOAM532X572EG8FR73Z/2CpGdId6tpiV6wAVLYiXcP4xiERGqphESZ0w
        H64QNVK/jr78VViA4mJNLTFj0M5LZwzkLXp/vIE18CQP
X-Google-Smtp-Source: ABdhPJx7PGbrKr5RbXzcElSySQXqvo1C9wnYbLsogJwptmrIaqkGA7hL1Ppz4c7DMe+55CUCI+eOVAtRX5e9i+Y8Q+A=
X-Received: by 2002:a17:907:7b8b:b0:6e8:9dd9:59ac with SMTP id
 ne11-20020a1709077b8b00b006e89dd959acmr2927802ejc.588.1649698009610; Mon, 11
 Apr 2022 10:26:49 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 11 Apr 2022 12:26:38 -0500
Message-ID: <CAHCN7xK9sZGXruaLzbam+t2REqvKiTrWbZ-GdA3gXux=9B-2Lw@mail.gmail.com>
Subject: Using PTN5110 w/ USB Hub
To:     Guenter Roeck <linux@roeck-us.net>,
        heikki.krogerus@linux.intel.com,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have a board with a dual role USB conttroller connected to a dual
role hub connected to a PTN5110 for enabing power to the USB-C.

SoC -> Hub -> PTN-> USB-C

The hope was the PTN5110 would enable/disable the src_en pin when I
connect a device that needs power.  Unfortunately, most of the
examples I can see for the device trees on a PTN5110 show some sort of
connection to a USB controller, but  I am going through a hub, not a
controller.

Is it possible to configure the PTN5110 to either not require
connection to a USB controller or plumb it to a USB hub?

thanks

adam
