Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3B455B5AB5
	for <lists+linux-usb@lfdr.de>; Mon, 12 Sep 2022 14:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiILM6O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Sep 2022 08:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiILM6N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Sep 2022 08:58:13 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AFFE037
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 05:58:11 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id p18so8500638plr.8
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xY4qrk1/0MMoestEFqRu5d/rvu2VFBaTf/98DrxMe94=;
        b=T0dGpBG+WQfCt2I5TtZ4r2v1/o+d1whW3swi3Dv/ABu2JsYVLDfOw5p7Wd+5M8nK36
         TvXeCDSCD79ExBBk7s8nnem7eTIjPoQFhnZsf8V5BdGcTiFu0xkLGcuD3Dw05Npq5sqC
         zO+NT6lNAdQ9lWU/LKd9X4Zh/oqdvg/f40W5ii9pSRyRb8UFysTv4zV1C/bes1BLl5at
         3e8e1OPwB8cFZkojoMIiq8NextPjT0ZxCq9glxaL/gMGxLaKhy68SE1vTPUhMlYyXH1F
         lGtrLsyLyalF/MCnkS/XClb5bfpg9XiZQ9USy/FZhV8Xdm2hk+Dfb/vpxQ8EJYMyZUVV
         x20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xY4qrk1/0MMoestEFqRu5d/rvu2VFBaTf/98DrxMe94=;
        b=B5P+UHLxywAPH22RpszLvVsSEWWdWM0Arw6AEzPiZufIF2//CNDN8oAksDQeTcEWyx
         Py/mmqqHlwiLaZnyOe+s6IHEa9yOZzbP9K1240oYWi9UvxCkbqRkq3TegV1CEqF5Sn5G
         411/7xqIaPvhKMBnKeigpUaVKSxvsbUfmUlOpg9ymfu6JImDEYU8wCJscAYmgQKenKTj
         A0RPHnG7+PWZoz8VgNkrzr9aJ+DeW3b1zfO+K1CRNfawHJ4QQzrh+F2MAvMrzQ0tcCbu
         2bjKstA9oFi5PSf1SOe+XyBJVnIU4PRYBuFXmtyRMLWGf7zEU91eWcmLZRdF5G8Bm4sz
         qs7g==
X-Gm-Message-State: ACgBeo3vndEdtXZxdZv+FwU5Xr6fyaf05EWwjcZlmqmp2x7HI2lliAcn
        sChJLI6vK9V0X6wecyeXwotbHm73a6c=
X-Google-Smtp-Source: AA6agR6QxkuJrAE1PZE2/q80VubDiT1dOqlOZMbCL/P1E88l7OG7B5U0I66rihnJXAFfO7S3xRNilg==
X-Received: by 2002:a17:902:aa41:b0:173:1571:4025 with SMTP id c1-20020a170902aa4100b0017315714025mr26824559plr.110.1662987491131;
        Mon, 12 Sep 2022 05:58:11 -0700 (PDT)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id 4-20020a631944000000b00419b66846fcsm5442956pgz.91.2022.09.12.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 05:58:10 -0700 (PDT)
From:   sunghwan jung <onenowy@gmail.com>
To:     jilin@nvidia.com
Cc:     atanasd@gmail.com, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 1/1] usb: storage: Add quirk for Samsung Fit flash
Date:   Mon, 12 Sep 2022 21:58:06 +0900
Message-Id: <20220912125806.7568-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <095677b6-5b6c-1b35-fe9e-00dcedd0a11f@nvidia.com>
References: <095677b6-5b6c-1b35-fe9e-00dcedd0a11f@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 12, 2022 at 7:56 PM Jim Lin <jilin@nvidia.com> wrote:
>On Sat, 2022-09-10 at 20:52 +0900, SungHwan Jung wrote:
>External email: Use caution opening links or attachments
>>I have found that the read rate of "samsung Bar plus" is slower than on windows 11 (210mb/s -> 70mb/s) and recovered by disabling quirks (using /etc/modprobe.d)
>>This patch affects not only "Samsung Flash Driver FIT", but also other usb flash storages. (They may use the same controller?)
>>But I can't reproduce the timeout problem without quirks.
>>Could you provide information to reproduce the timeout problem or logs?
>>It may help us find other solutions to fix it.
>>
>>Thanks,
>>SungHwan.
>Issue was reproduced after device has bad block.
>
>--nvpublic

If bad blocks cause the issue, in my opinion, it's better to apply this quirk by users (additional kernel parameters with a bootloader) if their flash drive has bad blocks, not the kernel patch, because the performance degradation is severe for several USB storage that didn't have bad blocks.
