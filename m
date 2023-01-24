Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5CF679AE9
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 15:01:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234190AbjAXOBV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 09:01:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234436AbjAXOBO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 09:01:14 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A172101
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 06:00:51 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so10992938wmc.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 06:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=oWEc4uOq8bLUh6Nx1RGkTFdwMGqgPouUyrZV5GhD1XQnz9zmAAo0u10ftJx9mcEDNt
         8Z/Nzc5vJ6yMzGKv0sYen1W1j3+K21mZfb2YqcmUpEgVseGN2Zzv1MiSqaWSTeDE97tH
         9fURq4+Qr/d3y38ENW7fdrkrKI0J/mNpnxB3K1IdGyuuYXI4yf5M1pwi0E2FBjSh200J
         PtSAoIf0RFOU4h+CuzouzFuZPNHPNTBg2too+mmJIO3jGZlyzabRUAIxyyjn64N3mETy
         cofavk1imbk85NShYpjjPPzIO1PQqV3TcbugSEaO4uYFkEHefaktB4kFd6PA/gcchMyJ
         vyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=6PCTABf84gS88LxXwHtdYkvOYEcXh2JMZrxFN29NhS+tROGUYSBy7jUHfwInwD6NTf
         5f6kjXJ/3ynxm3fqJHjHTvfPrFYJuktx5qUWj67In4323Z7t85LMUEGls1qBoRdbyl7l
         Ons9L6yOGB/N/YfQhiGFAvxg57kn//7dS05vBzX+izmQnPiaRQoTtrUM+fb570WUpDop
         VZd1vdBwSsZtyAogcDO8MifJtjq7nUBlZC60QxorLZixdRAB2Rp9LSVQh9jrTiHWj/0H
         Zr+I3JWmVmbX/OXBLol3FJLzGCRW2TL307tCTNpMOu1chqm0kNW9VW8YDTQZFS+YjPGN
         CuLQ==
X-Gm-Message-State: AFqh2kqjKOw+88cDYHs5QLkyt+VG8d2utsRmkEb4ulByJ3TTyp0g0V+7
        AAUlgPqwS0evTj/PzRAy3YAg39RX5f9btGZgRYc=
X-Google-Smtp-Source: AMrXdXt/HZxf2fEbSBzCqsotdMxVJ89ypk7KdPEM0o0PD1czqxb1DJenyBcpevlxgn3gjPjvLXvFqSH3TyRxOdWmEdU=
X-Received: by 2002:a05:600c:1f17:b0:3db:2858:db85 with SMTP id
 bd23-20020a05600c1f1700b003db2858db85mr1216384wmb.104.1674568838668; Tue, 24
 Jan 2023 06:00:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6000:15c9:0:0:0:0 with HTTP; Tue, 24 Jan 2023 06:00:37
 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <wregds1@gmail.com>
Date:   Tue, 24 Jan 2023 06:00:37 -0800
Message-ID: <CAEn8=5nXHA0e7JhnNWwzR7KinCWEZfV7KbrPrCG2HTYYksKwaw@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:343 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [wregds1[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [wregds1[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
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
