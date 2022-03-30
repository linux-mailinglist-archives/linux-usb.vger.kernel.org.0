Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA6A4EB8B8
	for <lists+linux-usb@lfdr.de>; Wed, 30 Mar 2022 05:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240176AbiC3DUM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Mar 2022 23:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241298AbiC3DUL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Mar 2022 23:20:11 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB041905BC
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 20:18:22 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id o13so16438958pgc.12
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 20:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version;
        bh=d5PrXmjlVV+n4kFaqkChC2P0jRxIvJLjnA0nD3aygdk=;
        b=NkNr9zBpJWVJzqCnY0V8iQizwCUWsuiiPUzaZvyU3mk8KJD1qAVoyQTWptlOIONpBy
         UWy6lSc6dAYHYBNId9Ovh6iKMPyGr75PPlcFn5YktFu6FrKzFVCVUFVtUsg3T5SaijWH
         M0grb9Kfo52c/9D/fdB9xAz00FSABZ0S4OoLAaxcl6/CiKPZppZ9J0PtwpuFHoPFSUzI
         e28JjA/cxLqE+WnJv3VhJC8kn5vqVCFdur+NvznhQDu7uuz0zpx3wGBkZvroS51RPqjH
         Bh2Oxw52xsuOhzJcFT4QBGFEuAFMFw0MpQsK9TM/DOQ9TEUcqKnGBoMCNAyBByxfdhg0
         DXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version;
        bh=d5PrXmjlVV+n4kFaqkChC2P0jRxIvJLjnA0nD3aygdk=;
        b=2ofwokespgjEEEZxv6cvl2W5t/+Rdr0IXDvk6HQ9mqFeRcTXA6KGjlNb9VF3h17fj5
         DOaEw7DI/uy3RsZ3tcChAVQ5s54cwjBnvQYMG6OJeX8OBwwzBrm5cXuzAIfmq46FUfmE
         iVCa8kZ6sLp6rjr6t0eujW2RrFhyAkrUiUsAn1riMDQ4bGV2NE/vvidcFUUnWls32Fha
         QF2GHidSwloUNjWb82ihHxCZq4Z4LNFcF/ZfVXzctMw8TcWAYIFgKIt13JpuicWfSEgL
         PwoLGeb80GtBzAb45oJU+i9rwxAbchF2iNIaDbeETiElleGDl4c1gChdtg+pvROC4wMe
         y2sw==
X-Gm-Message-State: AOAM533n3qiOcWV2x7ZkFWb3KZb3ylFP4gqCYP9m5dyM9qmsysYCnLH1
        IP+hOl2CUcJdLi/P/2NsHVfE+xy23NTWWohm
X-Google-Smtp-Source: ABdhPJxYrfJ81XUmKwhs8CVOGuQsFDGRr7p7JPn0mKY+YiVpCt+fUHE0PefV83EEsHSLr8NfY3YJWw==
X-Received: by 2002:a05:6a00:cc5:b0:4fb:4969:3eb with SMTP id b5-20020a056a000cc500b004fb496903ebmr14915431pfv.59.1648610301836;
        Tue, 29 Mar 2022 20:18:21 -0700 (PDT)
Received: from laptop.lockywolf.net ([2001:470:24:315::102])
        by smtp.gmail.com with ESMTPSA id v22-20020a056a00149600b004fb34a7b500sm13329690pfu.203.2022.03.29.20.18.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 20:18:21 -0700 (PDT)
References: <87sfr0okqm.fsf@laptop.lockywolf.net>
User-agent: mu4e 1.6.3; emacs 29.0.50
From:   Vladimir Nikishkin <lockywolf@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: Re: [xhci] usb 4-1: reset SuperSpeed Gen 1 USB device number 2
 using xhci_hcd
Date:   Wed, 30 Mar 2022 11:02:34 +0800
In-reply-to: <87sfr0okqm.fsf@laptop.lockywolf.net>
Message-ID: <87r16knnw4.fsf@laptop.lockywolf.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Vladimir Nikishkin <lockywolf@gmail.com> writes:

I seem to be having a problem similar to the one Sedat Dilek had.
My usb 3.0 'ASMedia Technology Inc. ASM1051E SATA 6Gb/s bridge, ASM1053E
SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s
bridge' is getting reset under load.
I tried adding the 't' flag, but the drives is still getting reset with
the following message in dmesg:
```
[  +0.004767] scsi host6: uas_eh_device_reset_handler start
[  +0.066198] usb 2-2.4.2: reset SuperSpeed USB device number 91 using xhci_hcd
[  +0.014680] scsi host6: uas_eh_device_reset_handler success
[Mar29 23:01] sd 6:0:0:0: [sde] tag#18 uas_eh_abort_handler 0 uas-tag 11 inflight: CMD OUT 
[  +0.000007] sd 6:0:0:0: [sde] tag#18 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e4 08 00 00 04 00 00 00
[  +0.000042] sd 6:0:0:0: [sde] tag#17 uas_eh_abort_handler 0 uas-tag 10 inflight: CMD OUT 
[  +0.000004] sd 6:0:0:0: [sde] tag#17 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e0 08 00 00 04 00 00 00
[  +0.000071] sd 6:0:0:0: [sde] tag#16 uas_eh_abort_handler 0 uas-tag 9 inflight: CMD OUT 
[  +0.000004] sd 6:0:0:0: [sde] tag#16 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e0 00 00 00 00 08 00 00
[  +0.000027] sd 6:0:0:0: [sde] tag#15 uas_eh_abort_handler 0 uas-tag 8 inflight: CMD OUT 
[  +0.000004] sd 6:0:0:0: [sde] tag#15 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d dc 00 00 00 04 00 00 00
[  +0.005166] scsi host6: uas_eh_device_reset_handler start
[  +0.065988] usb 2-2.4.2: reset SuperSpeed USB device number 91 using xhci_hcd
[  +0.014673] scsi host6: uas_eh_device_reset_handler success
```

I have also captured the usbmon log. The file is too big for an email
attachment, so I uploaded it to my server.
http://public.lockywolf.net/pub/usbmon-dump.bus2-without-smart-udisks.txt.gz


I have seen reports that firmware needs to be updated in those chips in
order to support large drives
(https://www.computerbase.de/forum/threads/asmedia-aktuelle-externe-gehaeuse-chip-firmware-fuer-8tb.1473501/page-2
and also
https://jamesachambers.com/fixing-storage-adapters-for-raspberry-pi-via-firmware-updates/
)
Googling for ASM1153+Raspberryp Pi returns quite a lot of difficulties
with using those chips. (Although I am not using it with Raspberry Pi)
(https://github.com/raspberrypi/linux/issues/3070
https://bugzilla.redhat.com/show_bug.cgi?id=1230336
https://community.home-assistant.io/t/usb-boot-on-raspberry-pi-4/172223/61
https://blog.franco.net.eu.org/notes/a-solution-to-io-errors-on-usb3-external-hdd-enclosures.html)


Maybe it is not on only the ATA command that is leading to a reset?
In my case the device is getting reset after ~30 Gb transferred via
rsync.

Disabling uas makes the issue a little less likely to get hit, in the
sense that even though resets happen, they do not interrupt a transfer,
but in fact the issue still remains: after ~50 "minor resets", the
device get reset in some other fundamental way, so that /dev/sdX
numbering changes.

Any debugging suggestions welcome. (I will try to rebuild the kernel
with the sysctl debug patch.)


-- 
Your sincerely,
Vladimir Nikishkin (MiEr, lockywolf)
(Laptop)
