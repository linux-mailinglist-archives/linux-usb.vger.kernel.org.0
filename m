Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB05C6F5A78
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 16:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbjECOzp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 10:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjECOzn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 10:55:43 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDF75593
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 07:55:42 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-77d508ba6faso413325241.2
        for <linux-usb@vger.kernel.org>; Wed, 03 May 2023 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683125741; x=1685717741;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1o3TDsmabgBewcVwpqP80qF6wI2yiYJ2QQkuG02ZCd0=;
        b=lJ5gznFzSlQ5Ml+5omFF8hQ3FNlj1hjA7kuGJiyjII1MWTiYJJKCftyEtbnuX05HCk
         9PYeBmloZi1Dr91C7DAVkGuhjA9MpmVsxB/+p8B+c72RdJpAL8U7n5zQqPHm3ztvIOur
         tLUSGgwJcSJJByc3v2gMhFQ7bvhxu4ITQ4NIAsieUipmzXmfaxm7FjENAULz07lGDrFR
         NuJj+gdIer7ylAsngJvVSoULhlwHBqFTzhN44GEmoAG0Nahkcxz/KhkXOvTi+oCEUCHw
         38TxyLBhOguYj3WHYGMJc3sAGnM8FJvl03o3SjTgMgQzbYIeD6oa1Jfzj8ev9hW+mz3T
         n7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683125741; x=1685717741;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1o3TDsmabgBewcVwpqP80qF6wI2yiYJ2QQkuG02ZCd0=;
        b=PiDYWfmicGCTluAeDszFdwPXy631OqDHHZkXFKR9XPG/+bhbaeA6etW/E63pI6E65a
         p6drzwxiK8xyuuwSxIrO7oHEYiDsTKzo+QtzGiv5Wg9pOgSpAP/D1n9A1Hj6N21+4Rgj
         kY6VeAs+d+/msuUzjZvlqLT53jEm/wfRJb/E12JFMsOjMrsye0+GfWFaIMOPTMBA9Zkc
         JxGqmF9zoDcG5NNFgX3N1wJJlIoaEe4sx3K+E7wMgaHYGH/vawqRb4iLQbHKg0gAxCDA
         9/62R720+O5AzYIlW7T9af52BUUDlJtO2tLflvJmMzhJXHEOrB9v45olUXYl6+dPWC0T
         rNyQ==
X-Gm-Message-State: AC+VfDyECqVWVM26KwonfOpiA0vU7AI8A7vmY4O+3pZ2FlyT22qeimJV
        NG2z0cKZHVb+qDuEfeUljqw9T78hq/QeDz2njeE=
X-Google-Smtp-Source: ACHHUZ45jDdwNjVH5mHQzajHmtgbXbVYpj3l9YaVlgeG4fb+eI/Z+HwUUK0dTe0z1j0LRi9D2gAVXbbkBouj98be/jI=
X-Received: by 2002:a67:f707:0:b0:430:4241:d78e with SMTP id
 m7-20020a67f707000000b004304241d78emr1345974vso.28.1683125740890; Wed, 03 May
 2023 07:55:40 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mrstheresenina112@gmail.com
Sender: peterhhenry4352@gmail.com
Received: by 2002:a05:612c:14f:b0:38c:fa1c:2d3a with HTTP; Wed, 3 May 2023
 07:55:40 -0700 (PDT)
From:   "Mrs. Therese Nina" <mrstheresenina112@gmail.com>
Date:   Wed, 3 May 2023 07:55:40 -0700
X-Google-Sender-Auth: gghKug8jdNCHvwSik4n2Fcl3_Vc
Message-ID: <CADzTqjTmO=q4AiSWyLEOusJdoONh=U33injY9FTO-Zrkcqg4Tw@mail.gmail.com>
Subject: Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FRAUD_5,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:935 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [peterhhenry4352[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [peterhhenry4352[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrstheresenina112[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.2 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  1.1 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Good Morning

I write you this letter from the heart full of sincerity and tension,
My Name is Mrs. Therese Nina, from Norway, I know that this message
will be a surprise to you. Firstly, I am married to Mr. Patrick Nina,
A gold merchant who owns a small gold Mine in Austria; He died of
cardiovascular disease in mid-March 2011. During his lifetime he
deposited the sum of =E2=82=AC 8.5 Million Euro in a bank in Vienna, the
Capital city of Austria.

I am not in good health in which I sleep every night without knowing
if I may be alive to see the next day. I am suffering from long term
cancer and presently I am partially suffering from a stroke illness
which has become almost impossible for me to move around, I have
decided to donate what I have to you for the support of helping
Motherless babies less privileged Widows' because I am dying and
diagnosed with cancer for about two years ago.

I need a very honest person who can claim this money and use it for
Charity works, for orphanages, widows and also build schools for less
privilege that will be named after my late husband and my name; and I
will give you more information on how the fund will be transferred to
your bank account.

Warm Regards
Mrs. Therese Nina
