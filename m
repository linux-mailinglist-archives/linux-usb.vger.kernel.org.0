Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8165EF318
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 12:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbiI2KMJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 06:12:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234284AbiI2KMI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 06:12:08 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F75521806
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 03:12:07 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-349c4310cf7so9653767b3.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 03:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=iaIz21G2zZ/MCfL16XpSgJk9cBO01cTOT9Bbjcb9/tU=;
        b=cxJwavNTjpv4Tfd1Q7Gis+OHO8jlVI43EjdLsZBC1Bs2cwMqoy7wbPxW8BP0tmCp/N
         a1K3PD4wKaLSflIk/XV+sqI0fcftbPj3dZtwhzTqGZfU57hHgaM4wtFPkpzlmm2uCxfi
         RMpt1HQa4y+MDzJJcsEyhigllU/hX7Imr+n2WCesHjIEk3pmfb9zIKjVE5HwmezUSA/1
         /HJR3YQNKlTTXgdxYUrH2juv/N9yla+ALcnf059XVQaVxDtAWH4soB66F8MCESqD/hQ3
         EMtKlf4pqwY3mr+mwp70wpjJDg+IEvS45bwFZ0G8MOetkfUM/yYVbbY0RJresVkugkz+
         Wh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=iaIz21G2zZ/MCfL16XpSgJk9cBO01cTOT9Bbjcb9/tU=;
        b=TasO5GV7KmRNDyhDMrZupMY/H8XZ2qZI8fE1BVO/B2tfkYBpIOoa3LJ0hl3ChRZ8mN
         ngKtQGrPfF9LCmGu8CCx4GfRIvsKB0GiLMKATCneTIpt2nolRKCNflc3UK7piRWR/84S
         7sY2uMbkeXoSXbVbl8S+opOAu8Xd24Scc8W8UuWZeaqn8S1NfSeq0hpxXZZgi1AAXu4o
         1N23TnQ3F9G1zYNusEoqPbV7IHEgfasvEFYG+EWs6Q7bNOpM6EHVIO1Cgz4SrDyjmEXB
         oB0Y5jVSxqDUKxnbtnHzuW84m7HRbQT8Ie8MUoEu9IJUGNo6L/9juKv9c05wa4dDwddX
         bksw==
X-Gm-Message-State: ACrzQf09Ing1qigr0waPraC8TtJl3nDRi9TP0U3Xn/K5dSzuYVBdIcaB
        Z+zFIMp5Al3mPzJ/rgkHEsooFObBgBSMMnPrr8wf4Q==
X-Google-Smtp-Source: AMsMyM4qx0fLNr9dEN8U+32RQ06Fqd9p9s4+/JZZH/q111Ly1GzUmbjQFoOJagKdvYxl7IF4ouVrJ0F+cdk8oVf74B0=
X-Received: by 2002:a81:92ce:0:b0:354:8b77:be31 with SMTP id
 j197-20020a8192ce000000b003548b77be31mr2331645ywg.20.1664446326580; Thu, 29
 Sep 2022 03:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006f6f8f05e90366aa@google.com> <a93ab7b9-668c-149b-8fdf-3c2d0eebabd3@suse.com>
In-Reply-To: <a93ab7b9-668c-149b-8fdf-3c2d0eebabd3@suse.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Thu, 29 Sep 2022 12:11:30 +0200
Message-ID: <CAG_fn=WiRoi5+bD1J=Zb43UCotn0oet8EHbCRBH4SuTO9FiKHg@mail.gmail.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,


On Thu, Sep 29, 2022 at 11:42 AM 'Oliver Neukum' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
>
>
> On 19.09.22 10:21, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    ce8056d1f79e wip: changed copy_from_user where instrumented
> > git tree:       https://github.com/google/kmsan.git master
> > console output: https://syzkaller.appspot.com/x/log.txt?x=16a02941900000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
> > dashboard link: https://syzkaller.appspot.com/bug?extid=79832d33eb89fb3cd092
> > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165e850e900000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123a8c96900000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com
>
> #syz test https://github.com/google/kmsan.git  ce8056d1f79e

Please use "#syz test https://github.com/google/kmsan.git master" instead.
KMSAN still lives in a downstream tree, it doesn't contain your commits yet.
