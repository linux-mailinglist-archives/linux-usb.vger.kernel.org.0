Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 761AA78B136
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 14:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjH1M7Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 08:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbjH1M7U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 08:59:20 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F4311A
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 05:59:17 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so8562954a12.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 05:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693227554; x=1693832354;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXa6vdwW1rKA6FCiOnM2gWFayg+FQIarMaRqCB7nxbI=;
        b=B8pX1c+SjOkMkGYjFGRVdXR3I1wzPJff9f3HReqrGiAry1v+ErH/9bIU9zvLxjRa9t
         NA1cKHZtNgf5AnkX2J/EEAwy/JOLyOhissAmMnsvVH3ULGeaHKi2PYPkC7RJ5VO3Op8U
         dWb7Xy4UpIyB4npxeF3nAtCDxxZtqVZgLDrTTvvC85zjNmf28jQ7BYsuYZRZ84vz217t
         MGwh5mxJ1C6cwBWpX1zmqq04s3sAXqdiRLKUSZg0vbF8m2/dLG8bzd1/ojbYWD4bojUS
         NUUmHJWp2yzyd+2Hz2IMXWv5rLXG4wYNcTFShsBWueQB+kJhcQbk1JKiFirY7WYFvEhp
         CqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693227554; x=1693832354;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SXa6vdwW1rKA6FCiOnM2gWFayg+FQIarMaRqCB7nxbI=;
        b=VAC/K8Clj4DFMIdl4n5cPhMAaDao5W0d4xeaAm/y76fQACyBkhXOI5OLeTzq8YB0Ay
         +SNpgZIzoxGE/SVI3OG3QtfK37shaKX8dlRY091arkaAyjD17I0fgEslupIn28cgG7Hh
         4qhdR6wGlrj9NBHnt2VflgeehKH0nd7mR6Hv21nOa6ir8TaqyjkYgLCgVtk4/4oYzUky
         31CCsDmYbAFU18iNFDNSb7P/LgLh7dSWylb9b0aqb9+Mvz73xMtb6oVDsg4i2pC2V6qN
         iKUWKEy6tMfNV8U64SaUQwQNMWooM403eypbGQl7tjldQGIK952bNMSJIxCR/Gu0m6dm
         EZQQ==
X-Gm-Message-State: AOJu0YzI8OYWcLR2pZiFiRSfvtFF6XWg6fIYaPh8FeWpaMX4EHiOOQjJ
        4z+gVHpn34YH+GIfj1a/oypRWJH0P4U=
X-Google-Smtp-Source: AGHT+IFjO7dMdX8+01KAt1m2grWpjVdgLpefelZF0Wcix6qhDvUjJ1WUBtpXVlDzdT25m6FNRGSTVw==
X-Received: by 2002:a17:907:7714:b0:99b:4210:cc76 with SMTP id kw20-20020a170907771400b0099b4210cc76mr25207306ejc.28.1693227554039;
        Mon, 28 Aug 2023 05:59:14 -0700 (PDT)
Received: from ?IPV6:2a02:908:1983:ea0::b283? ([2a02:908:1983:ea0::b283])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906805200b0097073f1ed84sm4614903ejw.4.2023.08.28.05.59.13
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 05:59:13 -0700 (PDT)
Message-ID: <deb7252f-a8b7-2a08-fe49-92e1145394dd@gmail.com>
Date:   Mon, 28 Aug 2023 14:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     USB list <linux-usb@vger.kernel.org>
From:   Julian Sikorski <belegdol@gmail.com>
Subject: Lacie USB3-FW needs a few resets to be detected properly
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have noticed that my Lacie USB3-FW drive now needs about two minutes 
and a few resets to actually be detected properly. It did not do that in 
the past so it seems to be a regression:

[24854.772068] scsi 2:0:0:0: Direct-Access     LaCie    Rugged FW USB3 
051E PQ: 0 ANSI: 6
[24854.773042] sd 2:0:0:0: Attached scsi generic sg0 type 0
[24854.781956] sd 2:0:0:0: [sda] 1953525168 512-byte logical blocks: 
(1.00 TB/932 GiB)
[24854.782035] sd 2:0:0:0: [sda] Write Protect is off
[24854.782039] sd 2:0:0:0: [sda] Mode Sense: 43 00 00 00
[24854.782154] sd 2:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[24854.782158] sd 2:0:0:0: [sda] Preferred minimum I/O size 512 bytes
[24854.782161] sd 2:0:0:0: [sda] Optimal transfer size 33553920 bytes
[24884.819549] sd 2:0:0:0: [sda] tag#22 uas_eh_abort_handler 0 uas-tag 1 
inflight: IN
[24884.819568] sd 2:0:0:0: [sda] tag#22 CDB: Inquiry 12 01 b9 00 04 00
[24884.825472] scsi host2: uas_eh_device_reset_handler start
[24884.939830] usb 4-2: reset SuperSpeed USB device number 3 using xhci_hcd
[24884.953133] scsi host2: uas_eh_device_reset_handler success
[24915.029395] scsi host2: uas_eh_device_reset_handler start
[24915.029460] sd 2:0:0:0: [sda] tag#1 uas_zap_pending 0 uas-tag 1 
inflight:
[24915.029465] sd 2:0:0:0: [sda] tag#1 CDB: Inquiry 12 01 b9 00 04 00
[24915.143528] usb 4-2: reset SuperSpeed USB device number 3 using xhci_hcd
[24915.157265] scsi host2: uas_eh_device_reset_handler success
[24945.233369] scsi host2: uas_eh_device_reset_handler start
[24945.233457] sd 2:0:0:0: [sda] tag#2 uas_zap_pending 0 uas-tag 1 
inflight:
[24945.233464] sd 2:0:0:0: [sda] tag#2 CDB: Inquiry 12 01 b9 00 04 00
[24945.347775] usb 4-2: reset SuperSpeed USB device number 3 using xhci_hcd
[24945.361485] scsi host2: uas_eh_device_reset_handler success
[24975.446411] scsi host2: uas_eh_device_reset_handler start
[24975.446494] sd 2:0:0:0: [sda] tag#13 uas_zap_pending 0 uas-tag 1 
inflight:
[24975.446504] sd 2:0:0:0: [sda] tag#13 CDB: Inquiry 12 01 b9 00 04 00
[24975.562542] usb 4-2: reset SuperSpeed USB device number 3 using xhci_hcd
[24975.575688] scsi host2: uas_eh_device_reset_handler success
[24975.933649]  sda: sda1 sda2
[24975.934132] sd 2:0:0:0: [sda] Attached SCSI disk

I only use this drive for cold backups which means it does not get 
connected all that often. I can reproduce it on at least one different 
machine. I am on 6.4.12 kernel now. Back in September 2021 when we 
figured out a quirk needed to get UAS working the startup delay was not 
there. This appears to have been in kernel 5.14-5.15 timeframe. I tested 
with 6.0.8 on an older system and it seems to be affected too. Testing 
earlier kernel versions is going to be difficult.

Best regards,
Julian
