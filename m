Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A67D4C9DB3
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 07:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236520AbiCBGWN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 01:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbiCBGWK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 01:22:10 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A3370CF7
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 22:21:28 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id b37so350095uad.12
        for <linux-usb@vger.kernel.org>; Tue, 01 Mar 2022 22:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=/jtPWna49+ilTACF3yuz8A6a8AX5IHL0XkTLmK7g2p0=;
        b=fNouUhLSUl82PISdtrwGzYzvbvkLGOGJZa5dc4Qhmdsa9aQLKVR2LdDSPkaIAd4eKV
         t9Rn35XHQcSlxEscH6rS1ZNF44NLVh8NZAKQPyrTaGQFbpfgXUHBu1i/AHoH6wNU6UYs
         LF5CS8eUfqsWm6Z75Dhjo5wolG/GAQVadsVz2GBvxCeuiPWuax3KKdc+Uw78WIc1BIFN
         Lpb3YnhAOUywsAtS7JQtoQFsbXOKDCVAO7TOyO/JMcUiLEuf32fnndAOjOyjwu5V+b0A
         93VOlEbyCqbXNTz+vIWWS9/Df1EJrHiv6CeRFly5p6DiVFP1LE95fE/tgz2r9MfiJ1D8
         pPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=/jtPWna49+ilTACF3yuz8A6a8AX5IHL0XkTLmK7g2p0=;
        b=6FWG7ykMgRQV45DVVIIpZd2eT4iJYjzHhkllfNMNmCq2ngYGLyRkzTfQgOvaUsKItA
         NizdPFr9ZpJDp7jntKg5gzYM6cK4lmRe1KV0VWV3hfvb28uwik8qvlKKLsAyUnO9KeHe
         AoSdwUWLy+PD7iJPSMh3iXTSIFkR9Z8Uam3gguAFu9pV9kIxYadZ49N1EKSxKOeyTdql
         +gtXul34zXmpHuewt2GnFekTaw+Kl5jg3/D9OQyq3pgGn5rGvBqcnj2A1eC56Tx0uW/A
         RckGd87d1Ghl4Y/8Czy0GhqaDcObgX1TH0SrRt0qIZexDF7dFhaIJ9foRYjgEHgejMRq
         XGJA==
X-Gm-Message-State: AOAM531c78Wwbq+iHoK/MdP7HNfxSWGfXAuBeWeC3l0J5VEqTFw3dAKR
        hufEZV1gSb+FkHfZRJU2VPLJPsOb6f49ndFZiuk=
X-Google-Smtp-Source: ABdhPJzKveHX4DDx2osNcuMnkqdg8BV4L/FkOZvb7CQhpDKcXfchhyT4pTBc/Nhr1KQ8pSCtIUk+/zHbeaUr/cNthgc=
X-Received: by 2002:ab0:7e45:0:b0:340:b653:7a6b with SMTP id
 e5-20020ab07e45000000b00340b6537a6bmr10785896uax.31.1646202087512; Tue, 01
 Mar 2022 22:21:27 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac5:cde6:0:0:0:0:0 with HTTP; Tue, 1 Mar 2022 22:21:26 -0800 (PST)
Reply-To: jamesthomasinfo3@gmail.com
From:   james thomas <williamsjane347@gmail.com>
Date:   Wed, 2 Mar 2022 06:21:26 +0000
Message-ID: <CAFLGuG0RWyqB_J5AbanOme-vh6qFvkqB_YHuNUd8YX6ZnqqJwA@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:929 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [jamesthomasinfo3[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [williamsjane347[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [williamsjane347[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greeting

In a brief introduction, I am a lawyer ,JAMES THOMOS, from Northern
Ireland but now i lives in USA, I sent you  an email about your
deceased relative family , but I have not received any response
from you, deceased is a citizen of  your  country with the same
surname with you, he is an exporter of gold here in USA.

'He died a few years ago with his family, leaving his company,and huge
amounts of money deposited in the UBS INVESTMENT BANK  in LONDON.

I'm his personal lawyer and I need your cooperation So that we can get
the money from the bank before the government finally seizes  it, the
Total amount in the bank is =E2=82=AC6.7 million,EUR. but I will explain,mo=
re
detail if I hear from you.
