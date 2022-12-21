Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21FAC653026
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 12:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbiLULYN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 06:24:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234534AbiLULX7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 06:23:59 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C7A22B30
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 03:23:51 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id co23so14599741wrb.4
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 03:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwfLJ2j9ddDE9ndQsP/1NZjFMdx9BPUMMCB4FULzZy4=;
        b=KfsHMQwomiQjJsqsvnN2cDI1EZRH17lULriN+nItf+G19LQ3Km0MC1B6pzc8ByMRqx
         t+s/xDq+rIriJp8B+isKnNxKmQXC19HmmWGl/hW9FT8SYOZKLtWjJ2zcoW5+/FnBt88C
         lUDVq6tfBaZAv36Wa6auqiuyou1EDmT51JitJb8vmSjrxMcYfVt5+VrlsqYKN4ZXR2yH
         W17nkq4rRAsFzmECIBjHEps/WWKXnz6axHeQS1s2AvXbE2wYVB1a5JCePMRx+fJ3qnpq
         sn+fQaVQRDV9hRCLBycFxnWo5k8OPchHHXE+Kdcps3nCKYoHIPgNEV35/1534lEmRrDi
         VGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwfLJ2j9ddDE9ndQsP/1NZjFMdx9BPUMMCB4FULzZy4=;
        b=IpBma8TqI3lV4V7XkjNFwhI5qMj91qLMEj6qTTkZmQExPuQ7PRSWAHySrCoaAZP3Sw
         /G0Oj3Rlcq8C43RG1GqaqYtw8XPdJL06MgUe65rCwHg1F5qaG4bWafWwenARnDrAX/1/
         tktQg4ZYviyWGmzWUAjIGxzZY1+bulGo0XgO9RXp73N2E6ZFn9HmPf4jrA5bNCOtN/7g
         a7xb8eLJnk5C9am8KrHPCG1XsJGxz5gnGr2CUyjCIn/g7//2kHkhmSD4USqkAgW/KKEW
         5gU4tDGa/WkoinZAnvaj1CyVQ0rcJRtqeKh+iwFwgx1wlz8rEI4ZD5JQrUW+YN/9FPBv
         IfyA==
X-Gm-Message-State: AFqh2kqTEloOJ/KtY96cbWdJeGquJ5iQqT2BR17IY64HYqMxnqCQVG3I
        n+uh9Y/Aq5RLGeUlq8+dZLKxJycvuTqD3gYduKI=
X-Google-Smtp-Source: AMrXdXubFeAiMHXUnQV489/0ANb6Lta636lfLCjt+qPIgGUM8fVo7B+tszPiVs5Bqh/RMAgAPpM6V8GLCDp89M+FdHQ=
X-Received: by 2002:a5d:5485:0:b0:25b:7a31:21b9 with SMTP id
 h5-20020a5d5485000000b0025b7a3121b9mr52205wrv.249.1671621829958; Wed, 21 Dec
 2022 03:23:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a5d:5290:0:0:0:0:0 with HTTP; Wed, 21 Dec 2022 03:23:49
 -0800 (PST)
Reply-To: shellymarhkva@gmail.com
From:   Shelly Marhevka <kekererukayatoux@gmail.com>
Date:   Wed, 21 Dec 2022 11:23:49 +0000
Message-ID: <CAN5qXwGe_rVdZjTtWmef58X678cwvpsCost-1-=GS1juRS9AsQ@mail.gmail.com>
Subject: Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:434 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6163]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kekererukayatoux[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A mail was sent to you sometime last week with the expectation of
having a return mail from you but to my surprise you never bothered to replied.
Kindly reply for further explanations.

Respectfully yours,
Shelly Marhevka.
