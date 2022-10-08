Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6C85F862B
	for <lists+linux-usb@lfdr.de>; Sat,  8 Oct 2022 19:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiJHRL1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Oct 2022 13:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiJHRLY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Oct 2022 13:11:24 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE7E46215
        for <linux-usb@vger.kernel.org>; Sat,  8 Oct 2022 10:11:23 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id w10so10826335edd.4
        for <linux-usb@vger.kernel.org>; Sat, 08 Oct 2022 10:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5FO62lWuXXjkWadjwalneNxwoveR/Ow6np6vHDk1vM=;
        b=oWmrc0xeK3r0LS7Q41Ku+pVzay4ZN+XZH9XIUbYo2sYhFHyFSWj77seJdaRe1OyWXX
         UozxQJIgbO26Mf+sbSZjoGAHdAXqsKAs5PbzfAX6lVn4SiieeyuSdzRNq01GA+O71E45
         mc5v9n4H603c20glqu+DeAtTb0w9H6Q8bWylXo48TUKYPWuT+oebyrkCGeAyPjAj47Cs
         338LFZLbsavKpsRJVX8vrZZgtTolj1AOtXXYcNOfpP9cvqFC33VQfoQL+8wmgUCXkcum
         8l1r6OjMNQG6zw8EGkyCTbnXp65V/ZtVWesL8lk98h+pOvxF0t8JyTDq403Qa5BRcBld
         lRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5FO62lWuXXjkWadjwalneNxwoveR/Ow6np6vHDk1vM=;
        b=VFlD8WIF6yYTrohOpB3TbkpE5ACyy/L1Zo0dbm5AULK6nzSvLDa0A9OmKGNkkRM2Av
         Uaa0D0jrd1jycFGQD/BKSFsjFDCAqZNLeNF72cbMtqoaAXUPSXV8PuITFj3wODLHPxJM
         8mU2sk7BgWgCn08c97EotYuRjbCFMLiWy796h7e8ajLr/NXZtd51ey6bBD1LisfL6nsC
         0S54EGRQqi7HFf8HnHrCrtEHgx49uYLSUENCyvzwlpEJm+3JRWov9sPBfO/+HC7tQbY+
         MwWqiC5wLfhnxuxQ5zPRUtS6PxJNcc7Q3/4mdLBxHwqDt9K9AMNv3fTcC2vnN6wREAeK
         YVmg==
X-Gm-Message-State: ACrzQf1KQq0OWPSwVq7+tFWc1PqtH+qy3wmqW5Re60waQ3uGTOYQjZ4+
        /+8jNFMMTfZAGVBBszB+hUh4RSYZE9OZbA0KuEA=
X-Google-Smtp-Source: AMsMyM7O7x2niW6Ou65IfxEfKdq+oD3JSwWJvD1qNxlLTCyM+1NRgwPoi2IF2yIJVLOoNCJclVEd02DDz4rkuFdC6NM=
X-Received: by 2002:a05:6402:430a:b0:459:a049:76da with SMTP id
 m10-20020a056402430a00b00459a04976damr9459254edc.272.1665249081668; Sat, 08
 Oct 2022 10:11:21 -0700 (PDT)
MIME-Version: 1.0
Sender: mohamadohamad60@gmail.com
Received: by 2002:a17:906:7d4e:b0:781:83bc:483c with HTTP; Sat, 8 Oct 2022
 10:11:20 -0700 (PDT)
From:   Sawadogo Mahama <sawadogomahama801@gmail.com>
Date:   Sat, 8 Oct 2022 18:11:20 +0100
X-Google-Sender-Auth: C6ncKqifvA4M2aUfD-qjadbZIhk
Message-ID: <CAOiY58UTAeY77=xgqv=m-fbbD1HecJUbOGrHTrNBhqBbE0x+eg@mail.gmail.com>
Subject: YOUR URGENT RESPOND NEEDED
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:544 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5015]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mohamadohamad60[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mohamadohamad60[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear Friend,

My Name is Mr.Sawadogo Mahama; I am a banker by profession. My reason
forcontacting you is to transfer an abandoned $25.3 Million United States
Dollars to your account.

Further details of the transaction shall be forwarded to you as soonas I
receive your return mail indicating your interest.

Thanks and hoping to hear from you soon.

Mr.Sawadogo Mahama
