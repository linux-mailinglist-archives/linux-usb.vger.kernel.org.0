Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 006AB53C954
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 13:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244028AbiFCLad (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 07:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243993AbiFCLab (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 07:30:31 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA5C3C704
        for <linux-usb@vger.kernel.org>; Fri,  3 Jun 2022 04:30:29 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t6so10039598wra.4
        for <linux-usb@vger.kernel.org>; Fri, 03 Jun 2022 04:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=Sj1JgJ8x+sHmv5YsFVMnzGJQE7Yy+bvCQPFP6Zk0olPliSdJ6enlQGkjd69WGbrMDb
         YExpy9CDr39c6BAFYl8kaMatMe5wb+wwd4B5LL+vQQPE070glNXXL5fJKhmm8vsJiid7
         s9y9STr2i7O3mv/JiLLQ3b+zLBLRdEfVY/jN76xI6NJc4Vv8mB3mAl4JRpBguHh/mRoe
         TUeFjDfk9LK6n/NL0x99j5ZzRfl1Gp94kzoKB+P06GC79AQ1CL0PhUYS+P5O6cEU+I9Z
         pyF5RPnEn/5wKFB1oyBvpWriux6UP26xprsK2VomSolE/Jraah3Dbm+Agd+mPErHnmyp
         YoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=PaEzrm9U0WjJMxkE+zbw8yGRv0uhjcRl9sFl9vmbKpk=;
        b=c4t0piphfB0KRrMy8ueDWvVWj0Vr67WVMCCDqIPcC88VlG84jl8n9JgXJJLmSDWLWQ
         O8IOOF1zfLYRM45l16+aexcQLjJc07mJZDDuoX5cF47v1Ibnijpgrd9K8Ihv70mQc9AY
         BkUE0JVOig1/7n+wgJEZhe+01koa0qm50epNVvkyLScFh2RgIqJeUd88hqOy/S3liMgY
         JSg9sWCm+AyOkrpifd+h/mQ6phdXO6hu5tmUqHKq9kXbZqrBf+IO5TP0R5jwTLkKvdQQ
         f3l+bS5jjtHX8CqbfuRvIgH2506JJ1MhP0uDse3mjaSovBzaa91i3kiWcmC40MDcBzAu
         IlWQ==
X-Gm-Message-State: AOAM530WGUuvZhqO3MzShwusTFW0wXHVKbcq/ppAuLbhqn5Eb+IWqKtO
        vfQdgc8vPI3avk8FM/obci2UC465QeZxa7by7l8=
X-Google-Smtp-Source: ABdhPJxr2zQzgUbHv84DMoOWa3jTlKiUfLZKmcXJH45TuwD8LGInSqYHLVfqwPzn6+FKSdabatdr51vzVut3+kXMIyI=
X-Received: by 2002:a05:6000:1815:b0:210:dd9:a9c2 with SMTP id
 m21-20020a056000181500b002100dd9a9c2mr7852403wrh.385.1654255828374; Fri, 03
 Jun 2022 04:30:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:64ed:0:0:0:0:0 with HTTP; Fri, 3 Jun 2022 04:30:27 -0700 (PDT)
Reply-To: markwillima00@gmail.com
From:   Mark <mariamabdul888@gmail.com>
Date:   Fri, 3 Jun 2022 04:30:27 -0700
Message-ID: <CAP9xyD3pcxdX8rGO0TxHtPtgaprxHS=bt+nXHTfh4628ktSeJQ@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
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
