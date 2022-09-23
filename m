Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294B05E7B94
	for <lists+linux-usb@lfdr.de>; Fri, 23 Sep 2022 15:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbiIWNOJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Sep 2022 09:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbiIWNOB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Sep 2022 09:14:01 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B5813C853
        for <linux-usb@vger.kernel.org>; Fri, 23 Sep 2022 06:14:01 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id ml1so9009244qvb.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Sep 2022 06:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=XS4HjndqR8gCuhjt/0t11leOEDf1Us4myMxbLd2Wcyag/LblgaC/ZJNK+1bDuBcEuQ
         IQrJC9T3hdEosqssSyOiBlER6uJORfKO0WaL5tAHHZhduLqILY1IuKeKBmQc8z05gutN
         FX4iF+5Vod3r+7qm6+n1wsWO3wlKDmucxdE3daPtlLralO81c+jtSQmdNuxz2JZfYquX
         Jeqm67uCeLDNQt8f9IFDTT9FUSbvau0AcepZk8uBTHNNbGOyP+JD/L85wQ9oanESy4vf
         GoC8IV+TTjELcIwyIBbaWfSm7f6ldyuqRivhZrBw0Y4SRWXqiw402vffCZSvia1D/ru1
         oVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=AdjY7g7OPKw4EvAw6Prcfc6OiWxEcZYFfcPOLlxbQREQz/vAQ9EGNC2mTZqISWT6vE
         dxdedwb/UJFmZPGh1dk0i1rrG/SS9xrc5TGbXrSrl7LuFMdBRMXHVntBNhkROCSriKWM
         PhRdZjz5LWm0k0cYLL25xrEvqhbf2apf12KVzwB9bk2H6By+6JjEI7U7SvsI7HDt9APN
         v/0w6+KkUUchQZ8y9yiLpi20lnra8zMFBNtYrGq/b5E3hoyjLUXnBJr3atNKe/xudIbO
         sgoYUsY82K6tWPP4bVe/VkNPR7vJ3zKRNxuvH0pYiTImyGpWQnj1Pi2pqZUTuibOBOoC
         Zmbg==
X-Gm-Message-State: ACrzQf29ulSdOQoQvaGzk026E9L75YM1yTYlqIFztDHwy2IUciWG6dhX
        uRDj5On+WAp4QkszfsT0wAGZVbEFk7dwRcsfg/Y=
X-Google-Smtp-Source: AMsMyM7Lg4Nl+ezhQfp6VfYOF3UI0jD1mLZQNAG84Lhz9RmLUYFHfTwlPiBnhiIahRbpLjfWjzurrTGuNe1W5MV/nMc=
X-Received: by 2002:ad4:5949:0:b0:4ad:89bb:f00f with SMTP id
 eo9-20020ad45949000000b004ad89bbf00fmr5152702qvb.114.1663938840401; Fri, 23
 Sep 2022 06:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:5945:0:0:0:0:0 with HTTP; Fri, 23 Sep 2022 06:13:59
 -0700 (PDT)
Reply-To: sb9174937@gmail.com
From:   Susan Bikram <susanbkrm@gmail.com>
Date:   Fri, 23 Sep 2022 06:13:59 -0700
Message-ID: <CAHU_H-xKfHmCZ+F-WcWasvdztzPw9=9FK5bv8AS7ViUr6D_ryw@mail.gmail.com>
Subject: Waiting to hear from you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:f36 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  1.0 HK_RANDOM_FROM From username looks random
        *  1.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sb9174937[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [susanbkrm[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Susan
