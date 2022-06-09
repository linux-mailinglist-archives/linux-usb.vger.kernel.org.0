Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A637D54535A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 19:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345120AbiFIRuL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 13:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345104AbiFIRuF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 13:50:05 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD082A3075
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 10:50:04 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 63so2594784qva.10
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 10:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=uETXtarVwZqoq55uxf85U5YgwPdkdqdQ5+5+F1r3C0I=;
        b=VmKJJeFJ/KpF94CjEx2z9QMo8W5JAOrBhtUecqJOMf9RpCQXqOgyLBmK+0MGMtvKgG
         d383zpVuUCLAtexvVAQp6Dw5M/5BJ2Bh2dYFnfeV+vZ+fORy+klYMeCc/+rQvLh+Mezh
         4USK9Md/f77a7IXs/q+ICXKUeCPt6UlZELPsq8/aLoun08cbrWV6qKg9TauEWfP3bICV
         vl05I+cvjEaXNPK4Y4xArpbGFqsKiuRKii8UK6XjKxX7dorcHkd73qFlEK1TFvGEj3Xb
         UwZroqOGGE+AsWCjx91SQiws3Q6VVgFyNLeKFK1wvcr6sFcgSP/whXFj2e3AL02wvoFw
         0NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=uETXtarVwZqoq55uxf85U5YgwPdkdqdQ5+5+F1r3C0I=;
        b=6RHIWWt43HHeVUW0cVucBZYULhmiZBxptufHAZHb0X9ATYXMfhkkmf0dSRRrar9Dd3
         Km8gB8uXHqUe0dZb0HXtYR5zzUGtBnCfUdfxlR/JotkWBict3QiShgGgskBtsWTz9XO8
         e0x8lPaCkFRaenX/oCFnR/21fXSn9MHCUXseoDp+4L+d1evHVKz7DYO17UFoHOJvmTz0
         e+1uWqIIGd9xZxsTiEVszovJnTS3loVqnm/+EifG0+pPzziS3ymDki95ee5rxMoU6fJO
         t6fy9lRI6sWZJcklcDQgGBWN0eTDWo9bKwhzK0G9DjI0OuqPy/2wz7z16vgtMzXNkvRN
         lwuQ==
X-Gm-Message-State: AOAM533VjPuOlNXfn0dYvNnSxavx8GGsaitdm5PNgXmwgGLC2OHKxOUS
        H1UTndB2P1LhFGUSaH9GYpfWhfjxCSc2p1MHtco=
X-Google-Smtp-Source: ABdhPJy00pd3ZYGHsJSDqW9XsYBDB1hWGyWJ8WvXwUJCZUS3xCW4nAYhM7ez+pRufSm71ks8L6GoTQd+pzdP2m5H0tM=
X-Received: by 2002:a05:6214:5296:b0:464:4d6d:afe2 with SMTP id
 kj22-20020a056214529600b004644d6dafe2mr44588326qvb.70.1654797003980; Thu, 09
 Jun 2022 10:50:03 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mihirpat56@gmail.com
Sender: charlesjuntikka2204@gmail.com
Received: by 2002:a05:6214:234a:0:0:0:0 with HTTP; Thu, 9 Jun 2022 10:50:03
 -0700 (PDT)
From:   "Mr. Mihir Patel" <ij261347@gmail.com>
Date:   Thu, 9 Jun 2022 10:50:03 -0700
X-Google-Sender-Auth: lrm3pJEjGuhz9CMPhyphcr2Uatg
Message-ID: <CAEOqroo4fPUsT_30zD2YjHDYXk-5HmVWmHQx0pAnY_o3eBGGXg@mail.gmail.com>
Subject: Greetings to you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.4 required=5.0 tests=ADVANCE_FEE_5_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_SCAM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:f35 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5022]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [charlesjuntikka2204[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ij261347[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mihirpat56[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 HK_SCAM No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.4 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings,


I am contacting you for us to work together on a profitable business
because you bear the same last name with a late client of our bank. I
want to present you as his true next of kin to inherit his fund in our
bank. As his account officer I have some necessary documents in my
disposal to achieve this.


I therefore reckoned that you could receive this fund as you are
qualified by your last name. All the legal papers will be processed in
your name as the deceased's true next of kin.

Please revert back to me for further details if you can handle this with me.


Mr. Mihir Patel
Customer relation officer
