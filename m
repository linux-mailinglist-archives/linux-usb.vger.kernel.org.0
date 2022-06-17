Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8B954EF84
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jun 2022 05:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379964AbiFQDHZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 23:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379955AbiFQDHX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 23:07:23 -0400
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B60663CE
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 20:07:22 -0700 (PDT)
X-Sender-Id: wpengine|x-authuser|2d6e3f16fed58b409179a0e47fdebeccd1f557da
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id D28272A1FE4
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 03:07:21 +0000 (UTC)
Received: from pod-140840 (unknown [127.0.0.6])
        (Authenticated sender: wpengine)
        by relay.mailchannels.net (Postfix) with ESMTPA id 37D872A158A
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 03:07:21 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1655435241; a=rsa-sha256;
        cv=none;
        b=Gn6GTHUy51iAJe4bRNCzNsxRcGdYDb0bbdH2bUjCyANOsQA2u9vw9OliYqMp6OFj71oCve
        qTxW7fXR7aGbbb/dWCDQVlPaerMqGWpK6/ksvUSfWxonwxgDMVmQy3rjBKYq/U7qSDPhPz
        QMTLJG221rBQVBcogU2f/OqC1jakUSF0rpjiLdoQB33MVFoClYhsli3nEZbluP/7Z5iZX6
        jC0uYC2yK6+PoAaJ8/xXR04m8KVQDZQLp8zPd4SqyqA5iabc6pnX/j1L3VSywgC3jM8Wyf
        eMrogHxl1E9gWxKwsUcmbRhPN2/oSkBUx4m4ISp3t56LshRjHFFTA6i2zO3Aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
        s=arc-2022; t=1655435241;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:dkim-signature;
        bh=UgyZHEXvfPck5HHiUcPwQ5f8DxnB5yD5z6WwZbHQL7Y=;
        b=JRgKV4C1Qnc/+9PyVGsdvigBcxLjHs2bcdibb44D31DM1eb6lnH6beQ9BHAcIVwANvy99q
        gPmgXXjPbEPupwpnz6Gd800udliGgBGZKzZyxAus4FURPdF3jJuRaqMRhTm2FnxyoMVgOL
        cw/4ccejGcTnE9G9dAcaZSqzi3lPURoR0PKknLkQd3qS2TbpTLpcqlAdQD9bNy9uFZRQ1N
        P1udfFyF+t5LR6u+Wj/DYnpIwQ9bL7jH0xHTnKiQjAi9QN1ww7W/o9Un2e17Pqh7eZFsau
        ur3k1+acAJNN7ETxhENCTBZBVMA6EOfLV9N/O9iLpjfOeKbS7ZLRMuSDTqqayA==
ARC-Authentication-Results: i=1;
        rspamd-786f5898df-986g9;
        auth=pass smtp.auth=wpengine
 smtp.mailfrom="info=tuscany-cooking-class.com@mail1.wpengine.com"
X-Sender-Id: wpengine|x-authuser|2d6e3f16fed58b409179a0e47fdebeccd1f557da
X-MC-Relay: Neutral
X-MailChannels-SenderId: wpengine|x-authuser|2d6e3f16fed58b409179a0e47fdebeccd1f557da
X-MailChannels-Auth-Id: wpengine
X-Quick-Turn: 733342607d0783b1_1655435241571_672140334
X-MC-Loop-Signature: 1655435241570:180967805
X-MC-Ingress-Time: 1655435241570
Received: from pod-140840 (250.168.238.35.bc.googleusercontent.com
 [35.238.168.250])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
        by 100.96.96.51 (trex/6.7.1);
        Fri, 17 Jun 2022 03:07:21 +0000
Received: from pod-140840 (localhost [127.0.0.1])
        by pod-140840 (Postfix) with ESMTP id 7B196BDE24
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 03:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail1.wpengine.com;
        s=mx; t=1655435240; bh=UgyZHEXvfPck5HHiUcPwQ5f8DxnB5yD5z6WwZbHQL7Y=;
        h=To:Subject:Date:From:Reply-To:From;
        b=ORXMmtaq5a8IIluo4uNZU5Xa2Vwv9GQOONKfceICtueKTC7Ni83zdbGZpYSnrJZmf
         QE1KsggN78+KrbhuEOP+Wh1vd4sktFL/NwbDINs5daaXEiyUD9i7zUK+W3oxMJQ5yx
         z5tX6bZnX7OIlhV389JCYlz9l0gohxja9kW8RBjL7Eil/wyqlbGTlUl6Xo8x99UZoq
         pdP07xglhLKa0S5TRMgIvugJOm88o0BrYehQ50Aaxt9dXzfRkCYiQyeekWZRhCX8w7
         aDw/nUt3VFd07rkemSR35wBbRHRswc32BTUEPbM4YuU2V9bRVhh/0TGIXJl3GNHgCV
         PJdEAEWHP38jw==
Received: from pod-140840:apache2_74:245 (localhost [127.0.0.1])
        by pod-140840 (Postfix) with SMTP id 7723BBDE2A
        for <linux-usb@vger.kernel.org>; Fri, 17 Jun 2022 03:07:19 +0000 (UTC)
Received: by pod-140840:apache2_74:245 (sSMTP sendmail emulation); Fri, 17 Jun 2022 03:07:19 +0000
X-AuthUser: 2d6e3f16fed58b409179a0e47fdebeccd1f557da
To:     linux-usb@vger.kernel.org
Subject: Your Enquiry on Good Tastes of Tuscany
X-PHP-Originating-Script: 33:PHPMailer.php
Date:   Fri, 17 Jun 2022 03:07:19 +0000
From:   Good Tastes of Tuscany <info@tuscany-cooking-class.com>
Reply-To: info@tuscany-cooking-class.com
Message-ID: <R0i9o1DsiT744AJErdukn3Of2s7spnzpX4wU4FR1no@tuscany-cooking-class.com>
X-Mailer: PHPMailer 6.5.3 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_FRAUD_PHISH,
        T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear 🍓 Diana just viewed your profile! Click here: https://queen22.page.link/photos?20vq 🍓 oocioi,

Thank you for your interest in our Good Tastes of Tuscany Cooking program.

We have received your request and our Customer Support Team will get in touch with you shortly.

Have a great day !

Your Actual Enquiry:

Name : 🍓 Diana just viewed your profile! Click here: https://queen22.page.link/photos?20vq 🍓 oocioi
email ID : linux-usb@vger.kernel.org
Contact No. : 493673897183
Country : wuny78
ubm3wu

Thank you,
MASSIMO BROGI

