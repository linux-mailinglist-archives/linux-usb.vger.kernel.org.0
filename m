Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A9B4B7AD9
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 23:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237170AbiBOW6C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 17:58:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242704AbiBOW6A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 17:58:00 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0375AE869D
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 14:57:50 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id bn33so668412ljb.6
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 14:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=7eZfU/Oj4orIJvjjtuxsHvVPZZBz/MXQuHg7G80qy0Q=;
        b=igoxRaDybYy+29m+vb61zat++ryEklLAP3K0xuRJ4NIesHgWYobmWtssUw++TjKA01
         6/shSA26vfBiaVomC5p8U9fTQDUeGhmSKgqHvYEh5R4LR8XB2Wy//SyZKU/0VKPI2ZKM
         Hfer/s+cbMBhM5Zy+BvyiETVdWIltOj5hJFYIdzBFMgXRm3zxHVGZx3FbcrAQJrB/rSJ
         5sg7q8G3BZ0rdvIDLpLXiuQ2AAiYKatVwgVOvjhGuLwVC5K1Vvzjwb6Tosszhc6612xY
         5IoUOdgZDIf8GZYq83F/6rVJOUq/HwQ4vuRjBuK1U1F5DEglWaccDbp6WguWek+C47/B
         jAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=7eZfU/Oj4orIJvjjtuxsHvVPZZBz/MXQuHg7G80qy0Q=;
        b=gEy4iYBXjrQ+v2MC6Zd3GRfwirp/9r/m41dJWFnAjzKSsXUWXMrQiImGBxEshXZM16
         /Rdt7iiaDFkVhofreJhFnDkZCRpMtKgJ1c2DbWC+c3owWGbA2bH+wA+zsXnkogRmslab
         Oi8/khIJD6YlnA1DO5RyaQxZkOChtYrCIwswusfEqRz0XCkI660uRHdicyUTGM/70GnJ
         ZNA+35OTyU6k5oVvJFT/69NBHIuM6cDoq4jLYwn77oHmOUZXbeBq6uaTaYP0guDPRKNL
         K48UHpkARVlJFokF00bIq9BmgYdLh4McheK+YsY20wwaaGVOyuIs8nkB0djaEMHBVdJ/
         iKmw==
X-Gm-Message-State: AOAM533lb+4//w+Lt4oFZsoTzAQo0yvYSzepMx64vD/URwothd/5ybwI
        I6lZ9t54gY0mCVJWCkaatl5XcSFyafIUABLetxU=
X-Google-Smtp-Source: ABdhPJxigpcENFh7uLKqYUV8hsPaeqSDt+AXiLj6LEmjjkAvgBsomJ9Shi8tmW+3zM72tAXgtiHghD3fowSFS+vSmr8=
X-Received: by 2002:a2e:995:0:b0:244:e3d0:78d8 with SMTP id
 143-20020a2e0995000000b00244e3d078d8mr58546ljj.172.1644965868226; Tue, 15 Feb
 2022 14:57:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:6749:0:0:0:0:0 with HTTP; Tue, 15 Feb 2022 14:57:47
 -0800 (PST)
Reply-To: a7329hb@gmail.com
From:   "Mr. Kevin  Nathan" <diplomatsilverlinelogistics@gmail.com>
Date:   Tue, 15 Feb 2022 22:57:47 +0000
Message-ID: <CACAamWxUEe6aK-zzrHMEeGxDjUy5__v=uT0sLH5Ue5Fkpd5J4A@mail.gmail.com>
Subject: Can I give you this trust ?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:244 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4997]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [diplomatsilverlinelogistics[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Good Day Friend,

I am Mr. Kevin Nathan  and I have been diagnosed with Esophageal
cancer. It has defied all forms of medical treatment, and Right now, I
have only about a few months to live and I want you to distribute my
funds to charities. I have set side 30% for you and your family.

I would like you to acknowledge the receipt of this e-mail as soon as
possible. via email : a7329hb@gmail.com

Yours truly,


Mr. Kevin  Nathan
