Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7659E7536C3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jul 2023 11:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235139AbjGNJjZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jul 2023 05:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbjGNJjX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jul 2023 05:39:23 -0400
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72AE812D
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 02:39:22 -0700 (PDT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-563668b61e5so2451904eaf.3
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 02:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689327562; x=1691919562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KHHzU7x7Uj0oUhbg7yvB3g2/zOBU5hseuF/BXLOMt0=;
        b=dEGkGgcoW7YniYVsRgqOMLZekP8rr/V2+KVBQrbDSO8aJLkWh8psCkyOt+gpyx1yg6
         G4Mtr9heOZeMSZ3Ih6ztMDYtLprA3S9wF2d69n4X26GClCtUCUY10ovnSPUHTCQ6dHrn
         fNUCYlS2A08RToCMUVNOUGclG5xXh67IcMXlIFs+2t6DeqUFW5LI/PWWtbMh6vtTwg7e
         zAqDu2ah4OJzpJpRw9n/4FheecBHWinKONQHGk1xtWxGtbV4T/L63ZppJX1jAJZ1pWkb
         pm8X+0fgZX3mXbZ76ma2nK+sOms1z0ntwCoKiZOsap3IZ9UQtyZ7ng0FHUxf/pzLn/z+
         NF3A==
X-Gm-Message-State: ABy/qLbfOMgWkUgNkQ0X7zOW2fawNjpiQaSCuVibBhHZDOzkNK9zslQK
        hX5VWEBsMW2aaLsd+luHlRABOiQbHVZbacaH/GJ9hxc9+ugY
X-Google-Smtp-Source: APBJJlECE/T73Vf3y+9L5a/sFYEvp9yWUZCY5KubJr49qX1T/Yq21R4eLmkgdx54Nu3PRiX6hQF471EOVA43hTqQHT9AITWgBoP6
MIME-Version: 1.0
X-Received: by 2002:a05:6870:70a:b0:1b0:77e0:3cdc with SMTP id
 ea10-20020a056870070a00b001b077e03cdcmr4072235oab.4.1689327561878; Fri, 14
 Jul 2023 02:39:21 -0700 (PDT)
Date:   Fri, 14 Jul 2023 02:39:21 -0700
In-Reply-To: <CALm+0cXi-YsnJBdBt38v4gEoR7oEeaoj3wXjEw3m=25RSLEs8g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003c330106006f39b9@google.com>
Subject: Re: [syzbot] [usb?] memory leak in raw_open
From:   syzbot <syzbot+feb045d335c1fdde5bf7@syzkaller.appspotmail.com>
To:     andreyknvl@gmail.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        qiang.zhang1211@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file drivers/usb/gadget/legacy/raw_gadget.c
patch: **** unexpected end of file in patch



Tested on:

commit:         7c2878be Add linux-next specific files for 20230714
git tree:       linux-next
dashboard link: https://syzkaller.appspot.com/bug?extid=feb045d335c1fdde5bf7
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1310af86a80000

