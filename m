Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734FB57EEE3
	for <lists+linux-usb@lfdr.de>; Sat, 23 Jul 2022 12:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237174AbiGWKyL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Jul 2022 06:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbiGWKyL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Jul 2022 06:54:11 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCD621AB
        for <linux-usb@vger.kernel.org>; Sat, 23 Jul 2022 03:54:10 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id 125so6429590vsx.7
        for <linux-usb@vger.kernel.org>; Sat, 23 Jul 2022 03:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=IOEh+bGB6OPK0FtUJ0WJwcWYyeF+VSgg/kxtMIHFNmE=;
        b=Q/VHzE5Zz/wN5o7hkwkZOaDK0a8sNLOkN6tjWNobQI8zgDJmOsFNWwmf9TDw0HgDLp
         K3sf6ezhMtKwxvKh2wIfrsmwMSXz1kS2uNrIXqHyiJWzv0DDXPR9VS1VAF2CzExwQ/yN
         nwj58Qi1KKilgmPgFMHPDaP6+Vu+xwtrFC5eso8P8t6gPQNQT1Ciq38eUoEkHkA5uXGi
         T+Clda8LbrgGZ+CAUarE8RHTly8rB4MELaT7StsyKSrp72Sxs4eadf1LUEThNscW2OX0
         yp74BqDzVkpY8aUFSn65Ls3Ogg5BbLfueuW0yWilliWx2bLfxrQqKvfUoyPXOoJGZDQp
         i57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=IOEh+bGB6OPK0FtUJ0WJwcWYyeF+VSgg/kxtMIHFNmE=;
        b=K1Wn4ignZ7B6zirBcp18tpvb156HBuLgrxXn5gWxbwFGJux7BdwjxNx1+ju6xwkBnQ
         tSz5sfeHugKQiME7IgZaphAijeHef+/rS9aLukEGEM8vLdJ8aSAgCmD/tof0TzG9QQSW
         e1aVeFIoNh0wblF2xvh+1z7E3MzOD81TcW9pFpMoYLNkMiWhs7RzndCF19HyXD4IP0KH
         00Hy5lMlzH7DTozKv35exdXi6doGmJuD6J9Q9uIBFRnK6gEt7+UtlP5TZehAAjVSvQX4
         v4lkO/CJAYQfZBw6RtQH1DgsuVnUVto4JAyKQzAtvYpI6Obh56x0bQpQ94NYZOXEppcT
         bAug==
X-Gm-Message-State: AJIora/uu7ANT5uKzjAU8g9wgE4eIepQ3r71oLVQDZOeb8vFxZFd6Vc+
        vRuFwZSvlqMnIEcx+4dTaXjHs0IuZC/2XrBGR9s=
X-Google-Smtp-Source: AGRyM1s0MXWdQ2wacSA1x6IeIgbjatyIfMu6hSuucJ+hyD52lw22OCXryLEIOMsWrNEh7+GX1Mtzd3PwQZ+WmckT0Jk=
X-Received: by 2002:a67:b246:0:b0:357:c2e8:480e with SMTP id
 s6-20020a67b246000000b00357c2e8480emr1246948vsh.9.1658573649183; Sat, 23 Jul
 2022 03:54:09 -0700 (PDT)
MIME-Version: 1.0
Sender: jesusada306@gmail.com
Received: by 2002:a05:6102:207:0:0:0:0 with HTTP; Sat, 23 Jul 2022 03:54:08
 -0700 (PDT)
From:   Hannah Wilson <hannahdavid147@gmail.com>
Date:   Sat, 23 Jul 2022 10:54:08 +0000
X-Google-Sender-Auth: 3cZQhmY5dhFGy3KUky8FW3RGwJ4
Message-ID: <CAFpsEpHU9Y2Lp8bAu3=cXOQ2UZHBAvAdXbBdpEvc-86QzVfz_w@mail.gmail.com>
Subject: HELLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.4 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_MONEY_PERCENT,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e33 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jesusada306[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jesusada306[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings My Dear,
  I am glad to know you, but God knows you better and he knows why he
has directed me to you at this point in time so do not be surprised at
all. My name is Mrs.Hannah  Wilson David, a widow, i have been
suffering from ovarian cancer disease. At this moment i am about to
end the race like this because the illness has gotten to a very bad
stage, without any family members and no child. I hope that you will
not expose or betray this trust and confidence that I am about to
entrust to you for the mutual benefit of the orphans and the less
privileged ones. I have some funds I inherited from my late
husband,the sum of ($12,000.000,) deposited in the Bank.  Having known
my present health status, I decided to entrust this fund to you
believing that you will utilize it the way i am going to instruct
herein.
Therefore I need you to assist me and reclaim this money and use it
for Charity works, for orphanages and giving justice and help to the
poor, needy and to promote the words of God and the effort that the
house of God will be maintained says The Lord." Jeremiah 22:15-16.=E2=80=9C
It will be my great pleasure to compensate you with 35 % percent of
the total money for your personal use, 5 % percent for any expenses
that may occur during the international transfer process while 60% of
the money will go to the charity project.
All I require from you is sincerity and the ability to complete God's
task without any failure. It will be my pleasure to see that the bank
has finally released and transferred the fund into your bank account
therein your country even before I die here in the hospital, because
of my present health status everything needs to be processed rapidly
as soon as possible. Please I am waiting for your immediate reply on
my email for further details of the transaction and execution of this
charitable project.
Best Regards.
Mrs.  Wilson David Hannah.
