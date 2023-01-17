Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAF366D8EA
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 09:59:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235593AbjAQI7E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 03:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235916AbjAQI6N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 03:58:13 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CBD4302AB
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 00:57:07 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id vw16so10566406ejc.12
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 00:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ic+1LtgNqBpfDdN0NuZpI4PQ3wUx0Qq4q2LLgSCdQQ=;
        b=i0r+uaSPW2GT/Q78IzAIDU72szwwZFWe4KVqhBtWx0LBIPPl2xC0aoDIf+S9brqaNB
         L62W7enU/bTpp4moG7iT/l73SiVjf+nq6VizSTev+h1GyO2uDTqMRT7VWMEkGRUb5eGZ
         dUe84T2WeQ9lkb/3whKUoRMFFhMCOGc+yzaqfcbt3yPiMFw39La3IFWAYwFfypHo001J
         0lOmDuoc9IJjLuyx30jdSrjDuEsgMrdvWJmABM61+K/zPhSIZn/gXmYRsB4FO2iBzJZf
         c+i2rsPw6r1Jx1GVZkUW+gfotYypmDxTVOWQsF67c3hehC/hNvYaseyycOgiMLTOBL7X
         Tw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ic+1LtgNqBpfDdN0NuZpI4PQ3wUx0Qq4q2LLgSCdQQ=;
        b=mYy1dYf1hiQRtDxmI7r+xSakTwlgkYkG7duGPv4nQyLWHa2uFY8DBic1H/hfeUM+x5
         SXF4Jp/TdXfBbHnSm0M2KV5ms5TJsZMHClDDuRR5BueKnzd0At8/5diDBFiU2ebwSOdy
         e9Nrb0nx+NqleAJlGaJ15Q/S71BlwZu6Mrvt+7CTB5itEPFV/nBFWVRoJ/t6/HXMpDoL
         OXLJI7WoBYXj8mX1579Ftv3F5vG6lZnV7KWjRZslzWgpmBeMK03GQ9d6rczem+us7r5C
         OliMfO6tGNr+7d6h2cY0bsvCSLm04f9ynBXbbpWNfnC9Mbp8aR93oheyxQ8l2+V2efxN
         8SQQ==
X-Gm-Message-State: AFqh2koGfFhuvJ9YEkz1umbDkdSgh5ev2eKDabzkXVP/jb3bfyCzwKX0
        oeBH6R2a0cwTeRFuyAJ1rebrMcgv+9/QV+SBCKo=
X-Google-Smtp-Source: AMrXdXsUdvhbljgvRW3uNh8kZSQLP7IhFvUAqBWD1wqVtDyehlGS6OYTVu01v24YxxtiaSaer1pBBTu5wwN8JflrjFk=
X-Received: by 2002:a17:906:f28b:b0:86e:c124:c995 with SMTP id
 gu11-20020a170906f28b00b0086ec124c995mr122149ejb.310.1673945825768; Tue, 17
 Jan 2023 00:57:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:c3a0:b0:46:4530:87f1 with HTTP; Tue, 17 Jan 2023
 00:57:05 -0800 (PST)
Reply-To: da263657@gmail.com
From:   Zaid Taghlaoui <mrkbeamans@gmail.com>
Date:   Tue, 17 Jan 2023 00:57:05 -0800
Message-ID: <CAO97YhhgferMvkms5hT=vv+29y_43Es+15djKi=aVXkKXS+cTA@mail.gmail.com>
Subject: Re: Investment Inquiry
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.3 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62f listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [da263657[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrkbeamans[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Good day,

With all due respect ,we are private investment, Loan, Instruments and
petroleum facilitators/agents with affiliations to Ultra High Net
Worth Individuals/angel investors who are currently offering soft
loans to individuals & corporate bodies. We offer Loan, Project
Financing, Instrument for trading such as SBLC/LC/BG etc for real.
PLEASE INDICATE AREA OF INTEREST.

If you have a good background in any of these sectors with the intent
to expand operations or start a project you deem viable, then kindly
email for further discussions.

Do reply if you have a need for our investment facility for further discussion.

I look forward to future business cooperation.

Kind Regard,

Zaid Taghlaoui
