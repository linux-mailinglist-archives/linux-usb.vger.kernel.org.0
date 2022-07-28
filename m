Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8895841E1
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 16:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbiG1OjL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 10:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbiG1Ois (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 10:38:48 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0434F6D2F1
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 07:36:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id o3so1971900ple.5
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=kCSqCOP5NnmgqzMKAvoC+xj8lkHVueu0SPSEqGKA1Ew=;
        b=Skf9kVOD3dwdpe4eu6U/64PTm/f35OkpoxGX7wyHsqjoW0uN+QMTbqPY5qcFxV3L7o
         1o0hHSPzSuWEBWlGxlTf0yiOofEvoXo4rPWVcUFydbo9rSp30LYhwNKYTVpUfWgygF3r
         6SZT8YA/NL8KBfjKgF9JVJOWWI0ILBYgRdTAxhuLOWouNHWK+xyinxdPc4dfmXr7lHAd
         yJpl3DEI9cFCFn0wI1DQGxBfaeq+jikl1E7FHP/7Zdp7f/nDKHfye+trRS4fNouljrIT
         ndabKf8oyFtjdBs3xMMaxbNV8G3NWMbW4qCFP3qWp7l0pzeRPWWn8QHKfgkGmNYuP2Qc
         hQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=kCSqCOP5NnmgqzMKAvoC+xj8lkHVueu0SPSEqGKA1Ew=;
        b=qWew87TWwgeBNtd8Jfjuutlflc7skka02DFcxANTA/zL4/2thTtOKUIUZFnrs8l8DV
         QG16Bn0CO2Gw2M6mu+27lU7xYKjgl8JnQ8/IAbGa0XDdleaL+cYZB57R+uMhtQv3lafj
         1yu/dSR/s6dq2tHRXi1ZznjMBfxZG7Q8hPmI2g0WNS3ODX6NNIoAxfvMfWvnWcH0gVvA
         XeXYl0GNtHfK/lo2zlamQenLET+LYmgQcxyQrkz196LX6t4GR3AbDyfpxU+6WC/oxys1
         YgHiPoKgj/HikBXHx/dy6is6HmTFPr5Oxf75LjUSfH8MupUH9qxyqacFHLJhLT2kFJE0
         dvOw==
X-Gm-Message-State: AJIora/j2lN4Ll8I2Qa19SaGLw/21/dlhcAye/5ARCDaHtvY4Qofmokg
        g/yr8Mp3Kq7jhe5yhFiTyRSL/wuoN2Dozhzn2sU=
X-Google-Smtp-Source: AGRyM1tA+CQ0WK6C4nB1IRc278P+MdnXH0A7f4dYaj4qt4xBiRsc9gsz99akFCW0uJNzkHSDr8vBsHe6ga1rtv5fj6Y=
X-Received: by 2002:a17:90b:38cf:b0:1f2:fb9c:6003 with SMTP id
 nn15-20020a17090b38cf00b001f2fb9c6003mr10507438pjb.214.1659019013293; Thu, 28
 Jul 2022 07:36:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:678e:0:0:0:0 with HTTP; Thu, 28 Jul 2022 07:36:52
 -0700 (PDT)
Reply-To: lisarobinsongift02@gmail.com
From:   Lisa Robinson <benjaminkitavi49@gmail.com>
Date:   Thu, 28 Jul 2022 17:36:52 +0300
Message-ID: <CAEwLOJV3yXz6RvH83+bjp5V=1G7=uc5FgobvAi_CobCciHsrSA@mail.gmail.com>
Subject: Donation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:644 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5002]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [benjaminkitavi49[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lisarobinsongift02[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [benjaminkitavi49[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=20
You were chosen by God to receive my Grant Donation of 1.200.000,00 =E2=82=
=AC
Please contact: Mrs Lisa Robinson via email:
lisarobinsongift02@gmail.com
Surname:
Country:
WhatsApp phone number:
