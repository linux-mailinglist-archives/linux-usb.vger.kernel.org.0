Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28D5050E515
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 18:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243209AbiDYQF5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 12:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238364AbiDYQFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 12:05:53 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D1D10FDD
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 09:02:48 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id m128so9945841ybm.5
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 09:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=AnoxsUyEFgN3XdZ685ciOUKLANyGyEmghgwG0SZOFvQ=;
        b=iS92SYNByfDWD0i6E2DSsLe0b5rG7+SUkRtngQAwfoBL9DV89zzzDadIyJ7taKkeK5
         CY9yOvRpIUORonwgkxptcxFhbGW0fGhuyd6AMdYmnA1XR9bJWtkGjFjJ9yJ16QAcV13h
         rbAoG2N1UnhlTtxpwHlZ2YOWwyDO4PM65+wOmyWwSJMHn92wk014rLI2wI1a/GGxgXmm
         6dKtcb4i2at9pq0o4oF0OXWy6XE7DHnDMNtlpFpcb+j5bRCaHaeslzWDbngubm6MZYx8
         v1z3c/Flt5CLdFjuvPFf4UnJbyafr7s6dTOaQNngGpI+GBzl1Y92jdRJgZM+kmQ8R3+W
         ZvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=AnoxsUyEFgN3XdZ685ciOUKLANyGyEmghgwG0SZOFvQ=;
        b=3udo+bp8i+64p1FqgOGCL63YmNz4zXQrg4rjON/G3259B2QOacg7anN/AB73xtCa+p
         XJazQjLZrsFWJKmuW58ipteZPJHMlSD9Jwf58IhL9qzMIA1IFrGgs7m+bWhRv+Q+hiGF
         wutHeH/9kmdH8OcNn9Rs1NPRDMaQeitURZlnQXua8k+970/vHkdPwiMfCuSjJmV0AcFA
         pyTAzMCwJIxKslr1MgGiHvontwKqieAe/Ug8DLA7My7S2pHo5cPblT3hJ2LbUaxFIN6j
         ZoOhQcnjJH55foKBfn432fsrnanGMOXUkj4TXIYvBP7v6PhsoeR0GqDMnbA+Cc72/a96
         HGLw==
X-Gm-Message-State: AOAM5338wZ+M7dSCFlooCjJ3hJsPeo27H4hvmcAif1GiEXTLCSC+duMv
        3yhxeyV5AN5Xb7raEyDPyIcuBTYX0cP/4+81Efo=
X-Google-Smtp-Source: ABdhPJzE2g+ys+axjXmWe6Sh6KD+yUKPLIWIrTwTPo+iuFwSo7llfPjdnyfK/ZkmtviB+q+mXX77/+D4pCxQUYq3pwA=
X-Received: by 2002:a25:c884:0:b0:633:7961:8a06 with SMTP id
 y126-20020a25c884000000b0063379618a06mr16796929ybf.38.1650902567598; Mon, 25
 Apr 2022 09:02:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:508e:0:0:0:0 with HTTP; Mon, 25 Apr 2022 09:02:46
 -0700 (PDT)
Reply-To: nikkifenton79@gmail.com
From:   Nikki Fenton <37737duueu@gmail.com>
Date:   Mon, 25 Apr 2022 18:02:46 +0200
Message-ID: <CADhR1xsFvWgCnX=EEKXiUhqfNe9Cpc4sBEr_yXzD=dxW1JohFA@mail.gmail.com>
Subject: Please Read
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,FROM_STARTS_WITH_NUMS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b29 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4975]
        *  0.7 FROM_STARTS_WITH_NUMS From: starts with several numbers
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [37737duueu[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [nikkifenton79[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

How are you,
Your urgent responds will be highly appreciated. I viewed your profile
on Linkedin regarding a proposal that has something in common with
you,reply for more details on my private
email bellow.

Nikki Fenton,
nikkifenton79@gmail.com
