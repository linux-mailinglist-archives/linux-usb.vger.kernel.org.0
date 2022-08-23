Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969AA59E19D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 14:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350616AbiHWLRv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 07:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357857AbiHWLQs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 07:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD24BD287
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 02:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661246405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=RK7XtREpFLhbfzxnimWw3D/7SMk9co/GteGqXfWisLY=;
        b=HTaQIHQkbtv4MdLYbkrzG8WXezxFEpZPKvd8+wZZ+rl6PZEPQbqo3mi+xzVnoCSyTv6tJ+
        7+65s3at5Hbjfp5aqnffq8zPLRdlO/6czvqIbI7ErIngV09FbKJU92wxAPWrVwwvldy129
        I3VaS90APFUrC2pNd2A/qctZpVZ87zs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-t6LFKt7uPmicf4EJBctJfw-1; Tue, 23 Aug 2022 05:20:04 -0400
X-MC-Unique: t6LFKt7uPmicf4EJBctJfw-1
Received: by mail-qv1-f72.google.com with SMTP id ea4-20020ad458a4000000b0049682af0ca8so7147518qvb.21
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 02:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc;
        bh=RK7XtREpFLhbfzxnimWw3D/7SMk9co/GteGqXfWisLY=;
        b=ff2cy9ZvHiQjD4o6xwTZqQIum2iiVmeNsoJgRTp4jA0o+9qWp9CHlPe5zVsRSq2y+4
         j66PsDBTU8d9YFOvBbLzqUKBXH1zAqaFrWkMaH7teLA3NEoFdLybAhd4PZmVVEB8iwgv
         oflyS1tNVICB4A0SVfUtWfd/vj15UOVL+iqXrtqstQrBsVIuRqwTVZqSDaW+AyK1PDnj
         /WXe4ZXfgAMckaVhvRlZ8ji7yeLIEpRQX7f5gfi50uZo4zqJFluDCuAfjcWqXcSMpFt4
         a9Iw5cw71dtaYRPThz7s07VamsdwP1CRUyKhWTmwq0/hxaFjqO6qhSoDswdNhe8GFl3C
         idmA==
X-Gm-Message-State: ACgBeo1pzOoKVD7qbx/X3VszdHyCmk7ldRQS4TqwJBFKGe7LOB4xvDxX
        z4PUCV7j3PGmc2YsbooGOV2FYefFVgbDXhO/evqOb+Y9tACqSGa1n9/ymrsufvY375fXUDztttG
        DQCvOoBHzGQFC23yqIJTr
X-Received: by 2002:a05:620a:1990:b0:6bb:61c3:8970 with SMTP id bm16-20020a05620a199000b006bb61c38970mr15401560qkb.394.1661246403623;
        Tue, 23 Aug 2022 02:20:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4scwdvU3X5bSXYFjzLfBWQF4j11vAlCrZyx7tLKMNMOtVgqKg9TOrjDWVBkK33M3QbDk49fg==
X-Received: by 2002:a05:620a:1990:b0:6bb:61c3:8970 with SMTP id bm16-20020a05620a199000b006bb61c38970mr15401551qkb.394.1661246403407;
        Tue, 23 Aug 2022 02:20:03 -0700 (PDT)
Received: from [10.35.4.238] (bzq-82-81-161-50.red.bezeqint.net. [82.81.161.50])
        by smtp.gmail.com with ESMTPSA id j10-20020ac8664a000000b0033fc75c3469sm9976682qtp.27.2022.08.23.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 02:20:03 -0700 (PDT)
Message-ID: <3745745afedb2eff890277041896356149a8f2bf.camel@redhat.com>
Subject: Commit 'r8152: fix a WOL issue' makes Ethernet port on Lenovo
 Thunderbolt 3 dock go crazy
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     netdev@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Hayes Wang <hayeswang@realtek.com>
Date:   Tue, 23 Aug 2022 12:20:00 +0300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-5.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


I recently bisected an issue on my Lenovo P1 gen3, which is connected to the Lenovo Thunderbolt 3 dock.

After I suspend the laptop to ram, the ethernet port led on the dock starts to blink like crazy,
its peer port on my ethernet switch blinks as well, and eventually the switch stops forwarding packets,
bringing all my network down.

Likely the ethernet card in the dock sends some kind of a garbage over the wire.

Resuming the laptop, "fixes" the issue (leds stops blinking, and the network starts working again
after a minute or so).

I also tried to connect the dock directly to my main desktop over a dedicated usb network card
and try to capture the packets that are sent, but no packets were captured. I will soon retry
this test with another network card. I did use promicious mode.


This is the offending commit, and reverting it helps:

commit cdf0b86b250fd3c1c3e120c86583ea510c52e4ce
Author: Hayes Wang <hayeswang@realtek.com>
Date:   Mon Jul 18 16:21:20 2022 +0800

    r8152: fix a WOL issue
    
    This fixes that the platform is waked by an unexpected packet. The
    size and range of FIFO is different when the device enters S3 state,
    so it is necessary to correct some settings when suspending.
    
    Regardless of jumbo frame, set RMS to 1522 and MTPS to MTPS_DEFAULT.
    Besides, enable MCU_BORW_EN to update the method of calculating the
    pointer of data. Then, the hardware could get the correct data.
    
    Fixes: 195aae321c82 ("r8152: support new chips")
    Signed-off-by: Hayes Wang <hayeswang@realtek.com>
    Link: https://lore.kernel.org/r/20220718082120.10957-391-nic_swsd@realtek.com
    Signed-off-by: Jakub Kicinski <kuba@kernel.org>


WOL from dock was enabled in BIOS, but I tested with it disabled as well, and
no change in behavier.

Any help is welcome. I can test patches if needed, the laptop currently runs 6.0-rc2
with this commit reverted.

When I find some time I can also narrow the change down by reverting only parts
of the patch.

Best regards,
	Maxim Levitsky

