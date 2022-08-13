Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0590C59182C
	for <lists+linux-usb@lfdr.de>; Sat, 13 Aug 2022 03:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbiHMBhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Aug 2022 21:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiHMBhm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Aug 2022 21:37:42 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7011BAA4D9
        for <linux-usb@vger.kernel.org>; Fri, 12 Aug 2022 18:37:41 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 204so3959565yba.1
        for <linux-usb@vger.kernel.org>; Fri, 12 Aug 2022 18:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=N0dzuM0ocna0N5gIxya/NfCznfjfxWYEFZdv4NxhT3g=;
        b=fF9aLrS3m8LplURPKanxang1yCUuCe/J444nKl3BCsfiQNiKATqrZ6IB8lLxwE+jlz
         dvuLAaWw0JwvO7OsjYABd6xuCZdFwnPCsbekTAKRh/76JIyF4/9sSJHCqCIwP5NUhjqC
         whIA1lorOd1KM/0EPaKUf73SQspgeTwDEjOTzrN6gwaF0RselhgC747qOADAXE59iGbT
         o5rl06/eTiDzAKdZcd6092yy4E/nhU8GtnlfKLHjH9wPBh7uJkHydL3MDVRYIxNgCEAo
         NJTMc9RVL7Tnbkia2YAOhcvvIBtM9SGSLLNVvMSdhZv5yJUEj3FE5ZVPexoQwetv7Htl
         veDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=N0dzuM0ocna0N5gIxya/NfCznfjfxWYEFZdv4NxhT3g=;
        b=4RhnW1BWtRoo9lXoB8lQuZCRCdz4jP+oyu6bpJwJcnuQyMe36RUxs7sBUXq6mIIOvg
         wlvhiwW/v36D4xTyg87xR0vJ1TxXs7kmFR9OlykU0tEM1VW5h95KPkvhD/znPKdNyPVM
         vpGYFVpwNXx5zhwU+tQB6oDhdVSKkG+3osWazgyuXx0/WThBhJAfz8cB5HyfkWWFeP/H
         M8uOevqNQMFil2THdA6LznEYuSeRjuQqJzE19UPGC7V6ei422cscmmjsXdzBJjMExCCu
         Luzxe4qD7noEryKIjVY/F7EbXSMPKRM+DyAa02JKe/lerW2bHDXYPDdhnpBpi6OtS4W6
         HDhA==
X-Gm-Message-State: ACgBeo2xf3096RknSaFFCM/vB9HaDdgu7wIGv5U1Z1A88ywg7jA1KFfG
        D6+rhZxJjffis2xMiA9nfXZhQRbuvmqpW2HUAfKyWplAPL6QtA==
X-Google-Smtp-Source: AA6agR7sPH3i43cSmKcMf5GipoD1qpXp7joDi3cWRkat4jxyCuAfdpcCyiESr5IrkQea431kYyD7398HOljIChTZ9Sc=
X-Received: by 2002:a25:4186:0:b0:684:fef4:5445 with SMTP id
 o128-20020a254186000000b00684fef45445mr1681874yba.252.1660354660603; Fri, 12
 Aug 2022 18:37:40 -0700 (PDT)
MIME-Version: 1.0
From:   Frank Mori Hess <fmh6jj@gmail.com>
Date:   Fri, 12 Aug 2022 21:37:29 -0400
Message-ID: <CAJz5Opd7VxpLSdvDCivgKbazG-t8uGcqazMVjs864w-AhviuRw@mail.gmail.com>
Subject: [BUG] usb: dwc2: split interrupt in transactions silently dropped due
 to driver latency
To:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
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

When there is interrupt latency, the dwc2 driver can fail to issue its
"complete split" transactions during the microframes they were
scheduled for.  When this happens, the result from the transaction is
silently lost without producing any error.

The reason the complete splits need to happen on time, is the
"transaction translator" on the hub discards responses from its
complete split pipeline after keeping them only 1 microframe, as
specified by the usb standard. So if the complete split transactions
are late, there is no way to recover.  An error must be returned so
higher level code can deal with the lost transaction (in my case, the
USB HID driver needs to re-sync with my keyboard after losing an
interrupt urb).

Instead, the current code silently continues by issuing a new "start
split".  This next split transaction may succeed, but it is not enough
since the devices thinks it has already successfully sent its
interrupt transaction (it has in fact succeeded in sending the
transaction to the hub, buy the hub then discarded it).

My hack to fix this was to change dwc2_hc_nyet_intr() so it sets
qtd->error_count=3 when past_end is true.

Also I should mention I am using an old kernel 5.4.13, but based on
inspection of the mainline master branch, this problem still exists in
current kernels.

-- 
Frank
