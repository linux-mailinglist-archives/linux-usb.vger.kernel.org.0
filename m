Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42F64FDC5D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Apr 2022 13:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242078AbiDLKUy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Apr 2022 06:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354278AbiDLKDW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Apr 2022 06:03:22 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5746E572
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 02:09:59 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id 63so7987958uaw.10
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=/mhawLYqSD4ihGrLIqf8HesRiShc0rzLBY5rz5Z4/wY=;
        b=We5/BapYZVp8dkE48MZpLyA9uGAXLOxWh3SXIlJL0gRR7ogUK+y5b6AZbH2O8TjUas
         OvYvvrsKIRGB8kVec6kvRlD8kxG7F4IDjhx29BpKnTuV+4FRVC28tpH8nGZAP5KT/Y/O
         WCImvJ7RsCutjmypIjYdy39FWx20WT6LSeUvN5TgTW/p/oVbN9fYoP8n5XvtHA6kpEFA
         5EOeaeEzbcTZ1grIaEy/TYRk28MqeLlgSPx3EGFLRat4+51dE+8FR+QvbAy/C0MnzbQD
         77QY1adJoSspaFxgM+aL5xbvRMpJqnATCKlqvQVUroBvoicuySuYoQu0HG6yQ5xPfqMQ
         dkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=/mhawLYqSD4ihGrLIqf8HesRiShc0rzLBY5rz5Z4/wY=;
        b=2ehIkMGdYR2sJu7kpwSH1vqYHKDIk3VDcmL1T1zv2PIFxOSUgB2lMna2CRvWK2Ga/o
         vuqUq8n9UGXBpzKEy85WxrbBHrRrjWsYlxZhiI616j2Pq5iVStUXyFwkNxwwGYMGhRJs
         DqrQkqVo6sMS/TnLPEkoAlUZi5juYFzMNaN1bix2PsqYMTBrtPvSNM98crRDfEBIhIOZ
         1oqhyPxbsdvqZ+yKB4xTS3Q0NMPloQCfqJDAcJoboDTea1jILrw9dPJXiTEpMKKFaDtc
         ucz96NR6SF26aHaai+3so7g8i1k+itjWD2wBxK4qnk6PC0Klvm/+uC9MDdtFCsbUL0yN
         vmAQ==
X-Gm-Message-State: AOAM533vuq8fnsP05gGafiXJ2eaQeswg7JqlLcYjKtPMpb7mj0e4xlOP
        /KzVIXII4IEgg6++feh237HjmGQwjWOkZdW/cec=
X-Google-Smtp-Source: ABdhPJyCfvlk2Vr9MKFBzxXN2MrWm1fNVWpRgcEJZ6UoSD6pWU6UrwmP8KFeqcyi8HOEhBwVkgFfRNiEitzWJ15ZK7I=
X-Received: by 2002:ab0:5a26:0:b0:35d:dbe:637d with SMTP id
 l35-20020ab05a26000000b0035d0dbe637dmr997712uad.38.1649754598230; Tue, 12 Apr
 2022 02:09:58 -0700 (PDT)
MIME-Version: 1.0
Sender: barristerhassanmohamed@gmail.com
Received: by 2002:a05:6102:126f:0:0:0:0 with HTTP; Tue, 12 Apr 2022 02:09:57
 -0700 (PDT)
From:   "Dr. Aisha al-gaddafi" <dr.aishaalgaddafi09@gmail.com>
Date:   Tue, 12 Apr 2022 09:09:57 +0000
X-Google-Sender-Auth: EZLUjUQ9-5HyJcyl4F0hPY-3vKI
Message-ID: <CAKXgMZ5LYdRb0fnT7fw9Ww5TCH7rqiJSxtqp_eRfX0ZyxnZdBQ@mail.gmail.com>
Subject: Please i need your help
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,MILLION_USD,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3,UNDISC_MONEY,URG_BIZ autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:92c listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7037]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dr.aishaalgaddafi09[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  1.3 MILLION_USD BODY: Talks about millions of dollars
        *  0.0 T_US_DOLLARS_3 BODY: Mentions millions of $ ($NN,NNN,NNN.NN)
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

 Please i need your help

I am sending my greetings to you from the Sultanate of Oman, In the
capital city of Muscat.

May i use this medium to open a mutual communication with you, and
seeking your acceptance towards investing in your country under your
management as my partner, My name is Aisha Gaddafi and presently
living in Oman, i am a Widow and single Mother with three Children,
the only biological Daughter of late Libyan President (Late Colonel
Muammar Gaddafi) and presently i am under political asylum protection
by the Omani Government.

I have funds worth =E2=80=9CTwenty Seven Million Five Hundred Thousand Unit=
ed
State Dollars=E2=80=9D -$27.500.000.00 US Dollars which i want to entrust o=
n
you for investment project in your country.If you are willing to
handle this project on my behalf, kindly reply urgent to enable me
provide you more details to start the transfer process.

I shall appreciate your urgent response

Thanks

Yours Truly Aisha
