Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B049C691D4C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 11:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbjBJKxl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 05:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjBJKxj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 05:53:39 -0500
Received: from mail-yw1-x1141.google.com (mail-yw1-x1141.google.com [IPv6:2607:f8b0:4864:20::1141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE5D126D8
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 02:53:38 -0800 (PST)
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-520dad0a7d2so62692047b3.5
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 02:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=jUqnHJa2PorU5DS/9f/K5xHrE2Q+e9qogm2VRF7IK3MUAuzX202WXqrYW6ul1sqUBH
         Dmxd0GgfUS5PfPOoTddiJPaWdOotyQfpUsknRoBHTvPKeV2ns+iy8K/p7m5NXSYORca2
         O04ObyQBA3VJLqfYCVLxLF8J2ZUMeg1jRrxCiBSVcfe1gjr8+BDQuRTrPYt5o0Sh3/+t
         /PHnuN+vMfWcVrkiiUBnbdYeu4rxUo3rW5XZB6A/dsGJ3eTnEPX7BKEkjCibui0On8RB
         WppS131JDJyaZiWEN1YLTY5oZbybTrCtprJXjrffDVYzDqKOaDCYTPC43CeiSuB7ajgs
         /keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=CUhjDQXCGPqVXWK/sslpIknRd2B5AL0BAymUeC2H8YCmML93jJugW79NDfPsBRuJQ6
         CYgXqK+Ggcl2Bew0+ZPS2yW9YBAZA2Njkt7yF/u7K9NfX4QdgWr/0Le0+p0jk8kOGfjb
         89Zf0o9LIE3n1c0MW383JY0u6sToJ2lV8EjCZnTAeOjA66X4VYLcsWx2Xrks4DDZ02rX
         a8y+LdiRruwamIwa9C1rR+x4+dtBtpb/PVF4ZSZhaNDZTHpTT94wESvRZN7x6k3/eeXh
         ojNJT7oJ/9XJDKnotA9rl6WweWTwpcrj298UbvRzNx4myhB4iNc6qgd6rhKXQIdLjGEB
         qV7w==
X-Gm-Message-State: AO0yUKV4okb/hKq0rNPogYI0zyy+IlD+0TZcCDBoikZW5M8Ub3REByMZ
        MkaBwGTPzziH08IGkAT5Y9nLBCObYC9JWb7gNLs=
X-Google-Smtp-Source: AK7set8zt0IcHyBuLuc9G2no/fpt8D/3slvc7923e4J+po4zq9nwhZ0s+LYsrVn33anVfXUJCGbYFLCRfx0loLae0W0=
X-Received: by 2002:a81:4f57:0:b0:52e:de55:4f27 with SMTP id
 d84-20020a814f57000000b0052ede554f27mr15387ywb.294.1676026417466; Fri, 10 Feb
 2023 02:53:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7010:c510:b0:32d:e821:f337 with HTTP; Fri, 10 Feb 2023
 02:53:36 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <getw24139@gmail.com>
Date:   Fri, 10 Feb 2023 02:53:36 -0800
Message-ID: <CAEoTnMtorHk8PQkx3qXozFVL6V5AwJaemRbPnW-KoCXv5otu1A@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1141 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5004]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [getw24139[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [getw24139[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
