Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C805550977
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jun 2022 11:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiFSJKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jun 2022 05:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiFSJKs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jun 2022 05:10:48 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A1395B9
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 02:10:48 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b8so11277401edj.11
        for <linux-usb@vger.kernel.org>; Sun, 19 Jun 2022 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mJ5c9KEFNZ2QCfCdXVco9+nCYOmDwU8rLKzMW/bJOt4=;
        b=SHZwW7os1fwhjhtEL5YHbpFkimMsczDnDnDGNM+sgpZ5yuLyr2cIhHFg+/nmsm4j6+
         3VVMH4SqtB+nkEqQ+7JPN4igdR6vUKKSIpf8uHpr9c3JF2qtLFxRok0iTO+Wyiw7Ar1w
         h7yUW/CyXBEnbHjh22zjkXrbWBW2qAVUNwHVcdtRCYfsAYvBuEvP5hr2HJ8Yxv6Plvvv
         0/mw63fricEjXgGSwU3Q+bjkK49M69uYMvSsKCatyypK39RbsCM+KhMB7uCCy0Ztxqml
         9eQRxBLXUhvJtFdW3sBHrLy4NBSQDr8vqA6dzHtIWoWa6kQdYVZFe3rkpoE23sTFYcWO
         7w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mJ5c9KEFNZ2QCfCdXVco9+nCYOmDwU8rLKzMW/bJOt4=;
        b=jlm/LRVnB9qOkv51PEb6sNfIcsjqibyA0cQICVJqaifO53r3DRXqp8DBxtE3ysPP4x
         i44vMfrtucvWPR/+8Co48kLTOlKnQRCZ5ViAzBDLuEDRxESvtqlqJYaCd9GSO2ZhOLrp
         WUatopaVBY+dqnE3/uHCwWEcD771DiFTt7jMxZanN4bQTmG94mYjsn4FwbSnaMu2lJ1Z
         AeCVgPAC8voJI3w8HCiAVMc0z+VPxFQHhUgEmad/YxXFBHnUYxxFr6v0hTSiHOn8RLE2
         DrkhmrR4+K4th73yNad3ws8jdco4sLSEGid680xQmjyV2mj50wyXKz4zBUJc2Lx0gpII
         8DeQ==
X-Gm-Message-State: AJIora/75MxDNWhcIR8I/dI3tIo0XhKTO42nexE7wQqAyeonDk4L2sIG
        BeCtHWNx2/Xbfd2tPhy7pb3vB0SPnf1XOopiMw==
X-Google-Smtp-Source: AGRyM1sUnTpr+GGzh6337CpaRqUrM5lMV144yL/fpL5eCaeHPWewQ7l0p+JCyZhVD5JzvI17MH+cCqNa5ZTkL3gSVxo=
X-Received: by 2002:aa7:d484:0:b0:435:65b0:e2d8 with SMTP id
 b4-20020aa7d484000000b0043565b0e2d8mr12258493edr.373.1655629846540; Sun, 19
 Jun 2022 02:10:46 -0700 (PDT)
MIME-Version: 1.0
From:   Giles Roadnight <giles.roadnight@gmail.com>
Date:   Sun, 19 Jun 2022 10:10:37 +0100
Message-ID: <CAA0uCUZSVmAijR8VkkCbW4nEVo=v__U_sjB0UVSbNQsgPKTxrA@mail.gmail.com>
Subject: Re: pl2303 converter detected, unknown device type
To:     johan@kernel.org
Cc:     glance@acc.umu.se, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Was there ever any resolution to this? I am having the same issue and
have tried multiple combinations of different Raspberry pi os and pi
and get the same issue.

Johan - did you add support for this model? If so how to update to the
latest version so that I can use this usb device?

(forgive the basic questions, I am not very experienced with linux so
don't know what bit I need to update to get the latest usb drivers -
or whatever it is you updated)

Thanks

Giles Roadnight
http://giles.roadnight.name
