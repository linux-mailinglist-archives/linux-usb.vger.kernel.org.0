Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD6255B17F
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jun 2022 13:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbiFZLYc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jun 2022 07:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiFZLYb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jun 2022 07:24:31 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D221614D0C
        for <linux-usb@vger.kernel.org>; Sun, 26 Jun 2022 04:24:30 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id 9so4304763ill.5
        for <linux-usb@vger.kernel.org>; Sun, 26 Jun 2022 04:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47J8KqnfrqplqqZvrtcJ7K97hLnM4B492m14DE55E74=;
        b=VnARN87QF/3RV5pUnv+eoxk+SYmJLmxGvz3xqijcVtydw/Xt6fZwiZAm6Ph9sgHTpb
         QCT3hMxTLXvuSBjf/CUZ+86swBmXSuqNXxU4F2/v1wkHC1cgo4V6Ya+i9NVm0LQVR7hv
         NJNNVNsV+IWibWJj7LMbjCS/F5Sqo+yVEpReog6dUmPZfgrJ68aA0A+kdvxiPTLJZ8+R
         NpS3jk3e2Sb36CbefBrqONPhiBzIYxgXgK+qlI9IAOKenwKPON8f8qhU3mJhkafbUDQd
         ZaGFGGlv0Go7BO2KEIlTRJ+gV3RNME3n8md6nCX/CUWq/khzdAUz5LitxG8EG6R08vTr
         chCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47J8KqnfrqplqqZvrtcJ7K97hLnM4B492m14DE55E74=;
        b=4EjG3erm/qSQIzei8Hl2ixcm4ggaStWeSjlwaVgGxV9VhxAPg+Sa5pG9P7EuIwku+q
         buLUHPXYdKFuWpVGX8j63LGmA514FfwmQuQBpvunBI/2RttddwyzPOi0mNoE4YWPacbl
         seflinyF8Wp2QyQaa4tPGPARH+S7ZGE6BltTr094cNTdA6Z5Yf2FsfmjnMEkE4ylLuYc
         C6yOceMbEIbg1QbUVZ8ArpD653cNGeCy5Y6SxcZWAZuuBn1ioxA0sKdmVCsi6jvIbgxD
         pBPby6krZAAzPEEiMGUIfgHp9eFupy6RsiOgqEIGwoyKUYP1Pc26V3V08QbdpymWbeQK
         ob2g==
X-Gm-Message-State: AJIora9hDEBhHN0cfGNsaRZYYKu+jTAS1gssD5cbUSyDzIteUVLQshOG
        G/VsyMJ9JFFhrdDG9Zcfyzok/pbbYqJTHHS45FE=
X-Google-Smtp-Source: AGRyM1u7UiOKUCfmClA17c/WCCx4wIs2v4mHe7BzhUozQjmb8w+90WSBq6JfvgsRL5HNSQDth2fUM/24h+o1g+8TkR0=
X-Received: by 2002:a05:6e02:1a43:b0:2da:6945:c7f2 with SMTP id
 u3-20020a056e021a4300b002da6945c7f2mr4445050ilv.82.1656242669935; Sun, 26 Jun
 2022 04:24:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6602:27cc:0:0:0:0 with HTTP; Sun, 26 Jun 2022 04:24:29
 -0700 (PDT)
Reply-To: gdasg1357@gmail.com
From:   Bertov Ignatev <ojj37884@gmail.com>
Date:   Sun, 26 Jun 2022 04:24:29 -0700
Message-ID: <CALiaVRsJAi2PFKwNRiDLhBNQHZTeUpOkW5prci4PfxsEhWjn_w@mail.gmail.com>
Subject: CAN WE PARTNER WITH YOU?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5416]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:12f listed in]
        [list.dnswl.org]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ojj37884[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ojj37884[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gdasg1357[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Hello,

I am Bertov Ignatev, I represent a top government official in Ukraine.
Due to the current war between Russia and Ukraine  we need help to
move out funds deposited in a finance house in a country i will
disclose to you later.

We need a trustworthy person to receive such funds into your account.
You will be rewarded with 20 % of the total amount that will be
transferred to your designated bank account, as long as you are
willing to cooperate with us.

Let me know if you are willing to work with us in this regard for
further directives.

Regards,
Bertov Ignatev.
