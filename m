Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44164527125
	for <lists+linux-usb@lfdr.de>; Sat, 14 May 2022 15:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbiENNKA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 May 2022 09:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbiENNJ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 May 2022 09:09:59 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3C324976
        for <linux-usb@vger.kernel.org>; Sat, 14 May 2022 06:09:57 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id be20so12899956edb.12
        for <linux-usb@vger.kernel.org>; Sat, 14 May 2022 06:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ZsxzBeDHPDudppaH7m9Qmlnh5FEP11JaUD+knYKJFYQ=;
        b=qdawVVPbguZp23j3pYTgyx5NNdrsiqhzSdzk/0HU3RTymjZ4W3oTtvm7db87vdQdCW
         dslCGd8edjoF+1wkrEskDKnblrahzpVcjStHmSL33LI2YxciQ75ZoZNA/DBD4366sTOs
         LRUH2dfCn6nGnnrsyNl1p0CqVWTi3FJoZ9+jjrrKzlww+nyjBm3ExwU2BDCM8+BbQPdJ
         EjZ4ADqR49V5c48P2/rJgbeuyqx/kUJM0hk8AMMHmqUpOKn9XstnelvEeE0y5UwjAN80
         btXFxPerJEFwrzC4taZKQP8SK2Pt/IZMlEJz6aO1lpAToUkUe9q4H8uJKsnZzXl9hNfO
         ip3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=ZsxzBeDHPDudppaH7m9Qmlnh5FEP11JaUD+knYKJFYQ=;
        b=T7Cwsl8BYzN4ST2b7xPt7WEkx0wTAluPUf2AZESloXetqa+fQIiyXPOQRfG4ZleEva
         UytkDpXCIQzYqJn+GpycJTPU/RikqXOyzE6nBK9g4Tdmri5uzHfMI5PAfzFq0Wtc19vM
         jcDJ6z9LbTdUI+gidJFTrRCg3DpEpAiLtiU8pW8clkJUPPoMvOtHXTmbeCO3Vz4jzHgG
         SX0310PnRYYpAgABzhSL+S69ZztMfLz5f2sTCAUwq23+zW+uaLSRfCX1ZvrF8jbYdik7
         RrMtx3zHynu5BsnYUJpHu8AURYG5movaQGkJ0chxAEaS1oWk2tFI+EdodqyCGtWifzUY
         xVBA==
X-Gm-Message-State: AOAM53115dOIKS1Li4/PILp6/UO7u/u96YnkS3t/5FGu8tvE7jRPxC6V
        3JvwtEwmw0OtbZaIxw3BtsrYMofWSBcCpg+7Aaw=
X-Google-Smtp-Source: ABdhPJxrxjyO9Sf9HbD0G8I2AJym4uDNRy2ZZQ9XPw5ZpIL3AHezowARBg5PQ+m3tWfVeu90Lu0W1QFqGjOV4c3qaGw=
X-Received: by 2002:a05:6402:424d:b0:428:bf2b:b13e with SMTP id
 g13-20020a056402424d00b00428bf2bb13emr3700201edb.306.1652533796128; Sat, 14
 May 2022 06:09:56 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsrosefrank7@gmail.com
Received: by 2002:a17:907:d13:0:0:0:0 with HTTP; Sat, 14 May 2022 06:09:55
 -0700 (PDT)
From:   oscar luise <oscarluise25@gmail.com>
Date:   Sat, 14 May 2022 13:09:55 +0000
X-Google-Sender-Auth: 8cGRzHpos-ylZgLMmPZt4VS8IIo
Message-ID: <CAA1wdeGKGOccryqw5+sPd5t+GDqhu4A_qBHg4+XJiJeN-t7rzg@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.3 required=5.0 tests=ADVANCE_FEE_4_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HK_SCAM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:531 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrsrosefrank7[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [oscarluise25[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.5 HK_SCAM No description available.
        *  2.3 ADVANCE_FEE_4_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Barrister Oscar Luise,My late client Engineer Victor left over in
his ATM account the sum of =E2=82=AC 2.7Million can I present you as his ne=
xt
of kin to enable the bank to re-issue the ATM card.

Regards
