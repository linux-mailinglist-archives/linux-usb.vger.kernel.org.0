Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 230C8586DB0
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 17:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbiHAPYt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 11:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbiHAPYs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 11:24:48 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A8F1A393
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 08:24:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q7so12656011ljp.13
        for <linux-usb@vger.kernel.org>; Mon, 01 Aug 2022 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=H7EqoS/qvZrzUFGpiuwMmXWqEyQsuSkYXi2DgfW0Vt8IOC5wCRwU0DuL7ERFGXfSE5
         GY4t9nE32pV4Ihf7V+MW9lkCzj76uJ/tHqyjOzo8Wmq8Nr88pVaWFC/7Iw2dqN4MA+wU
         g57NKQ9yeYW5syJIHGqBDuKvGM4G262+3zcorlsEcfo8kYIESLevQGFy376DRSWljMr9
         BF+J7HKk6cNx0ez5F3arOffyzLItiHqgAT4WAbtgDTMYin+6LWIOU5oVsoJO9vVGaTHV
         KuXcVt2C1wmdEyJjsPSa1BYW66mgQSNwrRmqlBDUQ3C3vGpR92bAryy9zHHe4V6o8zFV
         qhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=q9Slei3vdZHf3BWZhWjxjnYHcSiTDd6lLLw5COAJJH4=;
        b=GDIUzVORM8DjvcXgBHfrCcDbKF3a+aWz0YcWtVmFmUuw7HFNfhgncqHmFaUJQlHOop
         mYylwHJz5GVRXYoEoy1h4lF/RVz9G0VD43jJf+9dsoTaj8jtis67Gsr5pSeg53vbtlhT
         189QKh7i1T5lAFPmgKy+qxKXxrfbOjy+SwgJWHPWW99mdGbobEIXzNLWnnsYLOyINuZJ
         swFyXCmbh3YsKSCMt234YvEzUY8+dWxtaAajcrtFb0T7Lv53MxpyNlogheUU508aby8l
         FOf8995SrjY+h33UZGaW8dPjeZfnkWI+afSn6Fl9DFeaAydm9vJff1AINQv60F4DVuPr
         0TKA==
X-Gm-Message-State: AJIora/fVxf1ow6mc7Yo/Q9Hr9dYaO43VYw3O+UhhIVDY2xpNMmuc4dF
        8Z0EAVZY/3/j0JAkt2EUZ0NAQFTeiqGXkM8s1Tw=
X-Google-Smtp-Source: AGRyM1vtT+8AZ0mgdfSSxHvbE6uHtR+P+OD5jx7hGpm/nGwU3sOWGUmzdqzGQLTTrjjx0wP38pT+QrFoEDSsT2PlktQ=
X-Received: by 2002:a2e:be90:0:b0:25e:1496:a0b8 with SMTP id
 a16-20020a2ebe90000000b0025e1496a0b8mr5457330ljr.194.1659367482429; Mon, 01
 Aug 2022 08:24:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:cb52:0:b0:1fa:aaed:e6d9 with HTTP; Mon, 1 Aug 2022
 08:24:41 -0700 (PDT)
From:   Bright Gawayn <gben68387@gmail.com>
Date:   Mon, 1 Aug 2022 20:54:41 +0530
Message-ID: <CAG1+V0w5tHH6DP1KcRXfenALBSVZi9YpOA7LFceeN7Kk1wSqrA@mail.gmail.com>
Subject: Lucrative business proposal very urgent!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.9 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:244 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5658]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gben68387[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [gben68387[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.5 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello dear My name is Mr Bright Gawayn,  It's my pleasure to contact you today.

We use a certain raw material in our pharmaceutical firm for the
manufacture of animal vaccines and many more.

My intention is to give you the new contact information of the local
manufacturer of this raw material in India and every details regarding
how to supply the material to my company if you're interested, my
company pays in advance for this material.

Due to some reasons, which I will explain in my next email, I cannot
procure this material and supply it to my company myself due to the
fact that I am a staff in the company.

Please get back to me as soon as possible for full detail if you are interested.

Thanks and regards
Bright.
