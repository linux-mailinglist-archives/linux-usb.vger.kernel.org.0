Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614F3627110
	for <lists+linux-usb@lfdr.de>; Sun, 13 Nov 2022 17:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbiKMQ6W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Nov 2022 11:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbiKMQ6V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Nov 2022 11:58:21 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B399E12083
        for <linux-usb@vger.kernel.org>; Sun, 13 Nov 2022 08:58:18 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id t25so23105896ejb.8
        for <linux-usb@vger.kernel.org>; Sun, 13 Nov 2022 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+PAI4rgqgu8lkz8iluiDX4+RYG6mJwQ4g48BRbmTMI=;
        b=CgJQJfJ0aafgHyCTs+OdYpq7YnO5Gp2Hjd8N/1xlhJlZBQVj0n1KlvLj6OtycVEWpA
         e0Q0KWgM/75SHQxIP5iJFBdpjIHQqlPNyJVBo0lKgZRNoEwdmfLkV31Khh+TLaOKLJl1
         9DkkHDhTKQp/kuFg+i/CnROKAhjkFBRDBgHb5c2U7gUJ5D/vTeVe2iABhaO1HzGD5ajq
         TyfBBzOCSy1/wX+F/j7JsqtO9cIgPLu3Hj3e9LBzdDLNBgJqphRrTSlAbVxIBWgbGKGQ
         Wqw/wcSd/X+PFuAH+Cj3xZeygl5VfE2otJ60aNbtZ+X5nkCjFqOaIyF894lW8/nTPt9B
         yHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+PAI4rgqgu8lkz8iluiDX4+RYG6mJwQ4g48BRbmTMI=;
        b=iBk1o1VOdHxE9wEwwTb3YL1Ek0xobzycAF9RqhgXqz49LL5BB9PUUVm45U4hwPlguu
         0IXGkab+azsSPu5oK4lMJstfqieWVBvn1GQ5V547h+zwHlxlZTdXEAsldZHmBZmPp4y2
         VeM2fe17gIiJw659deFrYOz8GT2kQ11K694jz9BvPGsPfkV0Y0jEB1pxEUJ40FHBHTbq
         RSVCFnd+I3BgDrHRLFJXbF6mkn11/DWr25u3FkvKYa5GaDG65LfxwRzEMeLYO3NUWNwm
         BBtjHGVZT2DKcgYZ7LK3jetQVqYO5hU5alH9jGqnLoQYpedCr1Oi8sVTeS96CFS1s7iU
         3+dA==
X-Gm-Message-State: ANoB5pkKfxmw86nrP5JCjQoxNANebrSUt0djYI1KtVQLHJhMdDxufbQM
        Yx2uQt1MJ9VrmggG+kAfgkKaegRPMI94UhIjh3Y=
X-Google-Smtp-Source: AA0mqf7T6+pXvxOD/YYqVp/dQJdsdztD+PvwTHlh/hkXO4VG8KvqijrGldFV3sTK2GJfWnkRTrAzjzzmxqxcfILJRZc=
X-Received: by 2002:a17:906:b2c7:b0:78d:260d:a6e4 with SMTP id
 cf7-20020a170906b2c700b0078d260da6e4mr7872144ejb.93.1668358697188; Sun, 13
 Nov 2022 08:58:17 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:829e:b0:26:9d34:e59e with HTTP; Sun, 13 Nov 2022
 08:58:06 -0800 (PST)
Reply-To: illuminatiinitiationcenter8@gmail.com
From:   Garry Lee <raimonmasereka18@gmail.com>
Date:   Sun, 13 Nov 2022 19:58:06 +0300
Message-ID: <CAL82SyJ90foXGQJwMW25==nkxO4JWkXAxbK+ZG4QahCD9tuzAw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,
        UNDISC_FREEM,UPPERCASE_75_100 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:629 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [illuminatiinitiationcenter8[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [raimonmasereka18[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [raimonmasereka18[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 UPPERCASE_75_100 message body is 75-100% uppercase
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
        *      information
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
DO YOU WANT TO BE RICH AND FAMOUS? JOIN THE GREAT ILLUMINATI ORDER OF
RICHES, POWER/FAME  NOW AND ACHIEVE ALL YOUR DREAMS? IF YES EMAIL US :
MAIL: illuminatiinitiationcenter8@gmail.com

YOUR FULL NAME:
PHONE NUMBER :
COUNTRY :
GENDER:
