Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3955EF2F5
	for <lists+linux-usb@lfdr.de>; Thu, 29 Sep 2022 12:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232298AbiI2KE2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Sep 2022 06:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiI2KE1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Sep 2022 06:04:27 -0400
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C6D135049
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 03:04:26 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id a9-20020a056e0208a900b002f6b21181f5so748066ilt.10
        for <linux-usb@vger.kernel.org>; Thu, 29 Sep 2022 03:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kKyHOEpCJ5NG+fJtehJCRdbE07moUT6YKSmoqVz/cxM=;
        b=ujv7g7QGp6N6ehPUZjfuDqer3UTTT1f8/Ynr4vo0grX15+yu/91XfS0y9UbHxXPnFH
         S2gItjPZziRg5gClRFW1JWp1nNLwsrwXQ/iDADXxzsUfARB0bKuadSD4BUUsc7o1fOcb
         bR5XsjRZjw2weemR3H6hJkk4bInkWK9n4Z35aCP7Rq5QZTGxBshKst9xS8s/vTdP3tpI
         JDOlznIe9ZKetMZ7oeeLaPE+lV1+7/1AXEIpTq/dVTqnpek/Ioy8b+DVTxPnLar5bmya
         R9TjNlj4w3Mw+Z4Yb4WnpfySKVVFeGkJSVgcwBj/9WREqF3zNj/Aet1Lj/M9FMG3zZpY
         +YrA==
X-Gm-Message-State: ACrzQf2RbswyCRP7+Kc5DdVfIHqs1zeocFtLQ/6921InGzoSFuLGRLmg
        j6nA+KdQFFQuhhkAoiXDwMJWDf79ldsWIiV8WChXib4lr9V9
X-Google-Smtp-Source: AMsMyM5hrdvfjBXrvdF3axXYIap/5cPPwvQ+yU4iaGIU2ecLgzan8htkb2x3x7pqSZZMyfQQghHnWGW6p/fKEJnxTyvJtEQTxXz8
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e06:b0:2f6:355d:99ea with SMTP id
 g6-20020a056e021e0600b002f6355d99eamr1180224ila.172.1664445866334; Thu, 29
 Sep 2022 03:04:26 -0700 (PDT)
Date:   Thu, 29 Sep 2022 03:04:26 -0700
In-Reply-To: <a93ab7b9-668c-149b-8fdf-3c2d0eebabd3@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009c5fa105e9ce000b@google.com>
Subject: Re: [syzbot] KMSAN: uninit-value in idmouse_open
From:   syzbot <syzbot+79832d33eb89fb3cd092@syzkaller.appspotmail.com>
To:     linux-usb@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo https://github.com/google/kmsan.git on commit ce8056d1f79e: failed to run ["git" "checkout" "ce8056d1f79e"]: exit status 1
error: pathspec 'ce8056d1f79e' did not match any file(s) known to git



Tested on:

commit:         [unknown 
git tree:       https://github.com/google/kmsan.git ce8056d1f79e
dashboard link: https://syzkaller.appspot.com/bug?extid=79832d33eb89fb3cd092
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=121d662f080000

