Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB60C4CF189
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 07:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbiCGGEo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 01:04:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbiCGGEn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 01:04:43 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7B34BB97
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 22:03:49 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id g1so28847088ybe.4
        for <linux-usb@vger.kernel.org>; Sun, 06 Mar 2022 22:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=7Im1JG6q3q15hqSa7NWQHVGGERLfnPf1iBbuaSTqgJQ=;
        b=GZny26WQcyEOyJd44AurZOqPO+AdC9i4bKcGkAyR1ayHvSWByHEudh6Rg05W5sPneA
         ws35oehONDHtYFuZfkDrPpM8eHsSb82dPK9Euzp9/mXeYu17c8ik3O0G/YNEF4nunGOa
         e5L8JccZlyNWdBghnpP4PIc/tqWVLSUSoRZAsejrHSB0Gdb3/IXP3utDZXdKZyFoeoKF
         AWWqu6mX0u3YqJ2zUHKtI/ihfWjpqTSqqnuqvFuZtAUgVsj/opKiSdjLbktDC70lPNev
         FeHwRy4pI4gCjRR36hysJ+w64SjLn8TzPJhi3ANVeke8Krx5xWzaHviGt8cPvjjPupHf
         6r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=7Im1JG6q3q15hqSa7NWQHVGGERLfnPf1iBbuaSTqgJQ=;
        b=SYQLJCbTNVMDjlQ1jg/dYwt9WWnz8yGydx8/Hep+19dFfABnTJwfb59nuFF13GUTLm
         J9+Gh9nNWgE8FOYmtUaykhmvEfvmcPbtB6eC0AhNtWNrcQF6+4snDC8nBw7yY0zS4gUu
         ChYL7H8fbdae6G2NH6c7qAQHflUCn88g4R4W782ksryxmqxenJuy7xJ4wUnLTbiwdgSd
         uMSvAQTCjo7nMcihnRCc8JVoHeiyjyD6i1N31k/OAlHdgs62UQDBIfsdKD0KR3RxKzdI
         rZffY3xMRDYkYty+NIocMXfEkcIap6STTu70MkCmRCE6jbiTS3KcH1wLRNPkYB9Jjr4+
         IeVg==
X-Gm-Message-State: AOAM533zH9EngNApppboSTk6hJ2+pNsIT7qvlNn7lsAAM3zKFuSNF4f7
        e31wACjcW9zpXX7rcnvC3RUzWsX7mV1VlZsPcfA=
X-Google-Smtp-Source: ABdhPJx8P2cqNcGslmdfPuj3OpFXSfz0rTLAdfNRN6AkdV5WysOrWQGBl18YDpXHl1aZ5OHjlYwbRFuMcNQnFHTPV7c=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr6669301ybs.140.1646633028871; Sun, 06
 Mar 2022 22:03:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6918:b986:b0:a4:b698:78d9 with HTTP; Sun, 6 Mar 2022
 22:03:48 -0800 (PST)
Reply-To: markwillima00@gmail.com
From:   Mark <markpeterdavid@gmail.com>
Date:   Sun, 6 Mar 2022 22:03:48 -0800
Message-ID: <CAC_St2_1W3MTaTuXfaJdVY4hwQ3oGs9gQ3WUw9kGY--umB5Wzg@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b33 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [markwillima00[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [markpeterdavid[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
Good day,

The HSBC Bank is a financial institution in United Kingdom. We
promotes long-term,sustainable and broad-based economic growth in
developing and emerging countries by providing financial support like
loans and investment to large, small and
medium-sized companies (SMEs) as well as fast-growing enterprises
which in turn helps to create secure and permanent jobs and reduce
poverty.

If you need fund to promotes your business, project(Project Funding),
Loan, planning, budgeting and expansion of your business(s) , do not
hesitate to indicate your interest as we are here to serve you better
by granting your request.


Thank you
Mr:Mark
