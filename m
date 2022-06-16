Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E21154DDFC
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 11:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358507AbiFPJNq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 05:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359661AbiFPJNp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 05:13:45 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299605643B
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 02:13:45 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so1235706pjl.4
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=FzyLVwzVPz8cS5Ma8kiHNsmifm8mNlCNezMarmScPzg=;
        b=LhU6DDtWtfEVWezHfrbjBDpo2w7OAwy+yasngKU8LUhImRqguoUDRNro3xx8F88BaR
         xJSqN9Jkc3pb/acN+N5P8PMRJJ+dwvGxES+Die0ES1TUexaQKpdK7/I0C/qsr5iJ2YHR
         UIb6NkWh0tOrIrwbQzmDDzN1sQ8/oG8F3bixdW/Lj9H5lt1BJpkpjDsulTrle4P+olgO
         5XgyeWj+h/UFcSc3S2GHqPnbDeCOV6YwlaFVNTuwElIEU+ARSHsTcn/wSrkOB2T5g7vu
         wZUo0dKXeZGnYNC6bVKsLxuMe6re1g+hXB0es8jZF/sTuejjZCK3qxZHkbvqD4CYeReE
         1gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=FzyLVwzVPz8cS5Ma8kiHNsmifm8mNlCNezMarmScPzg=;
        b=q4tnWAYkIg23pkUWy7Z9xarrsmLR7b7ADgdboxYVYMIWbD9eUJ5BP4NXMY0r59Ni3J
         wntauAVtCSlq1RyxKlZ3xKogk957rBXW610++JXwWoifR6z+c4iixQ29C/e8ScZoHfIH
         oo/E7HEavgrENyeVoQTgcIL7ZPqmxFCra11eq95mbuVwmbz/WqBnFVLuout+eQ0SjZjU
         nxDdhgdchhHzBCLVHF52myJKo3vymrCTRw++jXsXTs2BDQNvTWHAaKb05/uudv3aUzMY
         15o/0qZ2jDyL68aCgLAHPc+VVDF0AEyMJVjIarSdcZldcDgsvBHub1FQB+TcyI3V1rAM
         TfOQ==
X-Gm-Message-State: AJIora/Uwvn3oqNjcrI32Tk6SQ9SH2UgsgYZp8IiLHdJeqDr1j3yz4om
        +gxYPFdPals0U9HUMH/AHbesvXnDaAy4wZw4Q0g=
X-Google-Smtp-Source: AGRyM1tqk5QXBK/w2Lc1C571AQBVybIOHFkDW8ZNkMisvved4+bbHYr2VD3G7QSZsd//fI68Dzat7ecxGpXXq3S95Gk=
X-Received: by 2002:a17:902:f1cc:b0:167:cfa7:e047 with SMTP id
 e12-20020a170902f1cc00b00167cfa7e047mr3561096plc.168.1655370824536; Thu, 16
 Jun 2022 02:13:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:522:1843:b0:44c:7d25:c510 with HTTP; Thu, 16 Jun 2022
 02:13:43 -0700 (PDT)
Reply-To: erlingperson605@gmail.com
From:   Erling Persson <customabu9@gmail.com>
Date:   Thu, 16 Jun 2022 10:13:43 +0100
Message-ID: <CAP=owVNkfndhgqGQhnrbG24HNOYAddDV6LmtvJvrojboQGyOBQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1035 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [customabu9[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [customabu9[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [erlingperson605[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Message from Stefan Erling Persson, owner of Erling-Persson family
philanthropic foundation  and you have been selected as benefactor of
3.5 Million Euro from our personal donation in the year 2022. REPLY TO
CLAIM YOUR DONATION.
