Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFDCB547B19
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jun 2022 18:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbiFLQ5m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jun 2022 12:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiFLQ5l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Jun 2022 12:57:41 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F095FB5
        for <linux-usb@vger.kernel.org>; Sun, 12 Jun 2022 09:57:40 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id v22so6476910ybd.5
        for <linux-usb@vger.kernel.org>; Sun, 12 Jun 2022 09:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=qcNcKm5ssADtdjjBUet1aHzke4+v8usdKVzv1gusB/I=;
        b=B2mNH7ibIflpBLQCxda79F904nJAKTKZbwY8BmxSaHvyfOr5BbiH70l9djLPceFYRf
         W+24fW/TTtxwR2V/CrI+xJxXxgQJ9QFLUJgng2rvUrtJtsX1KyixSy0Ec8Dtdcox68CU
         CkVefojtGpZINkTvXgV1qB7fiO8aFaeo8v4SpQi1hBGZnQbweXLqV4SwfACLjhzdrIVd
         UmuqHidZVUj2N30MWlGtR4heiyoPNOzHYH1oQO3OVjNJWD7Pi9E5lmJuMPpPtIl6mpWg
         95xvJkpj7txBS37BGk8c16mMuYuqZzVnrHlMJ5EDUpf3nV95/PTDXBU65bQlji8E8zIs
         RyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=qcNcKm5ssADtdjjBUet1aHzke4+v8usdKVzv1gusB/I=;
        b=AszDWWm2LlvRHIujoktydW9NJtlLN4Vprt6gU/cnYnXmv+HfSkQV2qPL4m1RdfrPF+
         DSHt4YwGEbibL2ziwP1WbqIc55BvbXngK+vcvKtUKfsHRTc/kvssxS0KuemDBp52kRV6
         WPa3nlpysrJ9RFbvRB8kUZCDW65AjFiIbv7QMk3mLOMrzIXIF3oRoZ0JZ1OoiG2KO17z
         gQ1++F/rprHsQCy9pgTCJ1swP+U+Z1YlHF8pSIHlKUe300s9+qJtWW57eCAwGbaE70ZL
         PqxA1ew069nX0DI+VcO67m+Xkm2Donomfv/x49eHBZfbPoCv4Z43zfIhvYHjt9px7QoL
         k5uQ==
X-Gm-Message-State: AOAM530OcFIe8ev4zrVON3EI6ZvtnJmufP3Sl+MEez7zu/uozje7ITFr
        RPIP8EBnHr3ikJFKn0nO/08F1WSZR4uq9C3Dmfk=
X-Google-Smtp-Source: ABdhPJzCLSfiDrN6HgFYN6NHEY/V65VE3i2hT5yvI8xkHNIbf3ZKxH2ducyV9ZhTBQo9J7+4Vb2qkFbB7BfnkMKM7Zo=
X-Received: by 2002:a05:6902:705:b0:664:b994:8bec with SMTP id
 k5-20020a056902070500b00664b9948becmr3286018ybt.282.1655053059489; Sun, 12
 Jun 2022 09:57:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:6a0e:b0:2d6:ff6c:531b with HTTP; Sun, 12 Jun 2022
 09:57:39 -0700 (PDT)
Reply-To: filodavid817@gmail.com
From:   "R.Chantal" <chantalmadin@gmail.com>
Date:   Mon, 13 Jun 2022 02:57:39 +1000
Message-ID: <CABdsQ=GEFiXFxEX94VXyaF-LbiBC3SyY3Sf2+oLcsJ5Bmfk9sg@mail.gmail.com>
Subject: SANTANDER BANK COMPENSATION UNIT, IN AFFILIATION WITH THE UNITED NATION.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.9 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_SCAM,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b30 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6813]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [chantalmadin[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [filodavid817[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 HK_SCAM No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SANTANDER BANK COMPENSATION UNIT, IN AFFILIATION WITH THE UNITED NATION.
Your compensation fund of 6 million dollars is ready for payment
contact me for more details.

Thanks
