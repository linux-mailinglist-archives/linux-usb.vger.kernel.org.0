Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C934EC3CF
	for <lists+linux-usb@lfdr.de>; Wed, 30 Mar 2022 14:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345279AbiC3MLb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Mar 2022 08:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346250AbiC3MEs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Mar 2022 08:04:48 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A776B33E0A
        for <linux-usb@vger.kernel.org>; Wed, 30 Mar 2022 04:59:20 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id z16so18494835pfh.3
        for <linux-usb@vger.kernel.org>; Wed, 30 Mar 2022 04:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version;
        bh=D2R9FDpi4F3WmHmxTWnOyOWPW32Wxt7vEvG2A0S+zP4=;
        b=CedT00tgMJEymTmqTl5K+5bc4+Zopp0RKTvkdb6PGzHAR3bSN123SMHhzl0GabdlSW
         aRIq545/nt9WOphB6bDejRwa7FOdB+cCV1GISNYHdBkpfuJPXtu7cRcgKoS0BAJw9A3E
         jI1v3dIgvOqaaCKyLQyvTsCmQ+TqH+0Jb60iT8uSJLKvWBp+H8I6dknM2n5n4vDcWvkn
         Zqz1F0+MTuSKqLWjGBRwfEcBFKwI7OI8iOluz6IrSE2UPfCvz9QwbJrZlnl2wsaDhajL
         fp4NPL31Yfabnqw7FzrlUEK/BmLS9w7RU9hdEfKC9s+NnnWYUNCeGS/JMpWWxMJwd6XH
         LOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version;
        bh=D2R9FDpi4F3WmHmxTWnOyOWPW32Wxt7vEvG2A0S+zP4=;
        b=QxDCSFe/0dzvqrLe0a43TvLfdC03co+gZv09ICxHIz2jj7Yq77ZI6E/BZodNKgria0
         9HkoyaOFZzfnhazfsUu5uWJSACrsRICrzbcf3Z1XBvvWCpe+2T5PtbrBmiz5xqnMh7xv
         aWNPWu1Dob1zh61TBduxsf0y6C3IuS9rhypx3i31KaxCwB4cSV5WPk29wXQXW4/Yx8vb
         DPa+ubI6uuEfu8W3xnOY1gDcHLYmBS+Ej57NTZNee6kemCBG2UzCBXmACjB58QjtPk0/
         2ikYv3xMG1a/y0X+Htj32jw4S6E62FvORmTCHNa57H4IMChRlQEvhHMAi2kFfTQ96c+b
         xn0w==
X-Gm-Message-State: AOAM532h3Dgeae6fW+tdj4fsfkK1vsEaGQ15bwgoxU8xbq5XdJfpP6zB
        XhRaqMmVqIweF0hfqDnpoyRE2yL+rS4u0bsa
X-Google-Smtp-Source: ABdhPJw71EjdyYWGhxBK0lob911sgH64S7m59WbeY8N1nHBeBmPC3FMyotoLtmtt0Gkc6px7JRfFXw==
X-Received: by 2002:a65:4541:0:b0:382:a08a:bf37 with SMTP id x1-20020a654541000000b00382a08abf37mr5913611pgr.392.1648641555848;
        Wed, 30 Mar 2022 04:59:15 -0700 (PDT)
Received: from laptop.lockywolf.net ([240e:36f:d53:4610:4a9f:7c37:944c:aec])
        by smtp.gmail.com with ESMTPSA id j16-20020a63e750000000b00373598b8cbfsm19094778pgk.74.2022.03.30.04.59.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 04:59:15 -0700 (PDT)
References: <87sfr0okqm.fsf@laptop.lockywolf.net>
 <87r16knnw4.fsf@laptop.lockywolf.net>
User-agent: mu4e 1.6.3; emacs 29.0.50
From:   Vladimir Nikishkin <lockywolf@gmail.com>
To:     linux-usb@vger.kernel.org
Subject: Re: [xhci] usb 4-1: reset SuperSpeed Gen 1 USB device number 2
 using xhci_hcd
Date:   Wed, 30 Mar 2022 19:46:57 +0800
In-reply-to: <87r16knnw4.fsf@laptop.lockywolf.net>
Message-ID: <87y20r3bny.fsf@laptop.lockywolf.net>
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

> Vladimir Nikishkin <lockywolf@gmail.com> writes:
>
> I seem to be having a problem similar to the one Sedat Dilek had.
> My usb 3.0 'ASMedia Technology Inc. ASM1051E SATA 6Gb/s bridge, ASM1053E
> SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge, ASM1153E SATA 6Gb/s
> bridge' is getting reset under load.
> I tried adding the 't' flag, but the drives is still getting reset with
> the following message in dmesg:
> ```
> [  +0.004767] scsi host6: uas_eh_device_reset_handler start
> [  +0.066198] usb 2-2.4.2: reset SuperSpeed USB device number 91 using xhci_hcd
> [  +0.014680] scsi host6: uas_eh_device_reset_handler success
> [Mar29 23:01] sd 6:0:0:0: [sde] tag#18 uas_eh_abort_handler 0 uas-tag 11 inflight: CMD OUT 
> [  +0.000007] sd 6:0:0:0: [sde] tag#18 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e4 08 00 00 04 00 00 00
> [  +0.000042] sd 6:0:0:0: [sde] tag#17 uas_eh_abort_handler 0 uas-tag 10 inflight: CMD OUT 
> [  +0.000004] sd 6:0:0:0: [sde] tag#17 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e0 08 00 00 04 00 00 00
> [  +0.000071] sd 6:0:0:0: [sde] tag#16 uas_eh_abort_handler 0 uas-tag 9 inflight: CMD OUT 
> [  +0.000004] sd 6:0:0:0: [sde] tag#16 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d e0 00 00 00 00 08 00 00
> [  +0.000027] sd 6:0:0:0: [sde] tag#15 uas_eh_abort_handler 0 uas-tag 8 inflight: CMD OUT 
> [  +0.000004] sd 6:0:0:0: [sde] tag#15 CDB: opcode=0x8a 8a 00 00 00 00 01 97 1d dc 00 00 00 04 00 00 00
> [  +0.005166] scsi host6: uas_eh_device_reset_handler start
> [  +0.065988] usb 2-2.4.2: reset SuperSpeed USB device number 91 using xhci_hcd
> [  +0.014673] scsi host6: uas_eh_device_reset_handler success
> ```
>
> I have also attached the usbmon log:
>
> I have seen reports that firmware needs to be updated in those chips in
> order to support large drives
> (https://www.computerbase.de/forum/threads/asmedia-aktuelle-externe-gehaeuse-chip-firmware-fuer-8tb.1473501/page-2)
> Googling for ASM1153+Raspberryp Pi returns quite a lot of difficulties
> with using those chips. (Although I am not using it with Raspberry Pi)
> Maybe it is not on only the ATA command that is leading to a reset?
> In my case the device is getting reset after ~30 Gb transferred via
> rsync.
> Any debugging suggestions welcome. (I will try to rebuild the kernel
> with the sysctl debug patch.)

So I have rebuilt the kernel with the "SCSI ioctl error" reports, and I
do not see any reports when the disk gets reset.

Just in case it might be more useful, here is the usbmon dump:

http://public.lockywolf.net/pub/usbmon-dump.bus2-without-smart-udisks-with-tquirk.txt.gz

-- 
Your sincerely,
Vladimir Nikishkin (MiEr, lockywolf)
(Laptop)
