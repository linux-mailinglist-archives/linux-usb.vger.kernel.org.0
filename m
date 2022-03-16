Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D474DB01C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 13:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355922AbiCPMxO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 08:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356020AbiCPMxK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 08:53:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AE34F46C
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 05:51:56 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z26so2964433lji.8
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=H5UB8g+uOk5+rlXN9szYQCp81wiCHfqYY7NM4RxveBc=;
        b=mKKNk+1PpA0qzD3xt6P2T9bdpq37VN3bvYJE43iCuZ1j+5knXpxEHpB/mJDTrpdszi
         AiAjmGMvJwM5C+D8jsuqQ8vvRZnvA74zxh7Kkboj3wJze0NoWJ9FK60mR7CLFNftBJ5D
         mkcFvawVVDl4bvZosame15I9uHuzVAeDjdQNIMYfhqIqm0MGbjOyWb/JnCXmFEjYwO8y
         +SYWs+I9BlJ6yYs4gsP50zVsykpmY8MbYgkje6QYxxecZZcaVJwRCLbtuVxp03O2+2x1
         FftF3ulHV2WjAMG/sGSXOph85Cm+7qvovPaK2nTuvw+MmxJ+MwK370/Ky+xWtWMA9vaU
         T46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=H5UB8g+uOk5+rlXN9szYQCp81wiCHfqYY7NM4RxveBc=;
        b=UhD702SCFzJ1a9Kj64aVyBGR5oOsy7UeYDA3ub6zBzmmKFlX5jyKB4tWRvXMgHoHzS
         8jHhlY0Ikya+QCgHJxiaoC2bsX46YyHw5hchjyQCCwiI4IMEe3kSbVEDML8W01kEUJ//
         Rr9b8yMDexds77e66Avm/g4ChrNm/3Z9v4m4WrdS3X87T2kQo2mZDdwwXObHKXKMY79E
         oiRDe21IF4mw3Es4t6HIAUz5rIJEUv/ieV7mZyjeYCpGecPUxYePpVSIigrUQ7UM6a15
         UtNOlu0M5IbScUhaoJieuKDyPjxmXvEsmRx3I9ZQ7gtT5fjBaOR8J9YfZ9DNSQU8UwqR
         Jyyw==
X-Gm-Message-State: AOAM530p8kO07N616OG/QfkOoEr18lnMwazTRMZsRswtVpS+yDfR4idk
        bIbGwVaGqUtLF92c0iuaQRn5QMgcObk9mFr4Udc=
X-Google-Smtp-Source: ABdhPJzib/xWigZeqYTsyCUZeycBbvqSsfKrvbBv6JQ0qLfVRz4BvijPDq2DvfpOss308BH2Gv/5tV/tDHhOGTXcvL4=
X-Received: by 2002:a05:651c:1691:b0:247:da0e:7c56 with SMTP id
 bd17-20020a05651c169100b00247da0e7c56mr19005427ljb.296.1647435114574; Wed, 16
 Mar 2022 05:51:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:4918:0:0:0:0:0 with HTTP; Wed, 16 Mar 2022 05:51:53
 -0700 (PDT)
Reply-To: fbenson033@gmail.com
From:   Fred Benson <bfred8326@gmail.com>
Date:   Wed, 16 Mar 2022 13:51:53 +0100
Message-ID: <CAGMpz9G7gxmYaRQSyus2Xszk9TnE0gZJnhp3nEb5UGyfxSsnOg@mail.gmail.com>
Subject: i am sick
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MILLION_USD,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22d listed in]
        [list.dnswl.org]
        * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
        *      [score: 0.2381]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [bfred8326[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [bfred8326[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [fbenson033[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 MILLION_USD BODY: Talks about millions of dollars
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  2.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello
  i am Fred Benson from the united staes of america.i need your help
and support in the transfer of 4.5 million united states dollars into
your bank account abroad..
please get back to me for more details to proced.

Regards
