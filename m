Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA84A4C6E60
	for <lists+linux-usb@lfdr.de>; Mon, 28 Feb 2022 14:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbiB1Njh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 08:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiB1Njg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 08:39:36 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B516EB0D
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 05:38:57 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p4so5718781wmg.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 05:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Lsq1+UPMXvu21Yq54nzhd7lzaxAQP2VpMWfEq3Udb4w=;
        b=KJpX3mx17zrUSXxmWKDbYPcGQP3LYip5qxY9J7mObp+Q1xErUX57waBl0SxoMiQrwU
         1d5AHIKhSJc0R4z8H/D/Ya9LzcHYZeLqy5oswLw/iweOMIzRYR95Jaww/j7gnjWtKSZA
         d+s3jQ/3zY2/xdmJKH8sGb3R2EmwKUybLjXt9rwelFeZWTlvVWDJReAeqPveGu76zhp9
         EEPu9qtGVaUDutFM7Qq71Tb5iyVGBREi7kJCc+1owg8h70bGJPiIVYy48jSh4IyRX5cR
         RHHnqpLofPjuxSPz8m+yrUFMxwQOm4sFs5JL1S7dbiFFbZa4PpyqdsYewI5YQL3vDS7C
         86EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Lsq1+UPMXvu21Yq54nzhd7lzaxAQP2VpMWfEq3Udb4w=;
        b=DspOOd9t9LFxEclfNPrRMm7n1M7tVPbdRoJwhwHtMpJZYd7RQb/3Y6QhylLWJkbSqn
         JWonAcPbzRvzQ3dosxZPfcJ3lyMzP9YetkSD1ITCEkx9DGe+++GoRqX9BaJxu8TRCcY7
         zno8Jo4FSMDGKLjsjl8tPeetQWWXR7QCbmugV++ROTwuGBZW8LK6Jw61G9T3wRomiwhr
         HCOQMzON+aZ0lSXgkOwQxzBp0siLerXx5wR73uT02An7mjtQGd4eMIT4kV8S881S/RDY
         QrC8r6T4ATCRDEr1OongQMTAgpOXCpVNWPw1H+wcYh7dp6+k75qF58CrBLfhmS60vmoH
         wxZg==
X-Gm-Message-State: AOAM530LP8bkCJR2k4Q6JlJdl0wV6vPAT993cIc24p7LdV4j5oOGMTQy
        aTyE+HHz/aop98c9okwHZSKfyg6PKsuwDWTHrD8=
X-Google-Smtp-Source: ABdhPJzLrn4rg1Dc+WozrXhQeyoQP9k4mOzuD75VZ08kQRRDuKfNeyfkacIbxh96a+fALq32bz5SMhIyw4QvE+R7r6o=
X-Received: by 2002:a1c:a54f:0:b0:380:4f49:624a with SMTP id
 o76-20020a1ca54f000000b003804f49624amr12999770wme.164.1646055536494; Mon, 28
 Feb 2022 05:38:56 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:600c:1e8f:0:0:0:0 with HTTP; Mon, 28 Feb 2022 05:38:55
 -0800 (PST)
Reply-To: jean1nasri@gmail.com
From:   jean nasri <epoe1334@gmail.com>
Date:   Mon, 28 Feb 2022 13:38:55 +0000
Message-ID: <CAEJtD2t5Xj=AR3_YjFBWQWtY1g+-5mHM_w8z1s7vC2Arv1bO0g@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello
Do you have an account to receive donation funds? Please reply for
further explanation.
Nasri
