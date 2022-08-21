Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 486C259B6A8
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 00:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbiHUW5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 18:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbiHUW5M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 18:57:12 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE8A1EAE3
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 15:57:11 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id x64so7078520iof.1
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 15:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3yReDArWk/tTWOfO0XhicCU9gxuy/R2ix7OnvEXVX7k=;
        b=JwVTrn5y2FRLzPWf7Y/KtnJjkM1+N4dcG/MORk2oLK5dRfZwd96hOPt+3TBK5QrWYv
         g21bLJfNvr3/85FOhA0r9SyChFxp0Ri2pqTS4T4NMdhr355qpsAQhf4ywOg8xFKrAvYZ
         4qwFf5AWyJ2BYIFu9mfftqxGrZs61IfSYEHGRoraYENc0AZ2svJMdxs40UHVLti0eYHT
         UNt04fReV+Ne9nF8xlNVa3fLtAw75vfxT/gGTK+Ps80AcV+VQxsgq6aQgGEqN7q6xZyu
         MX/bei57wQEeCs22Gf/TdTN9OXUmoYJNEhvOm9gH5z3s4AP7RSk5yEnMWzPdue5Awklg
         uLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3yReDArWk/tTWOfO0XhicCU9gxuy/R2ix7OnvEXVX7k=;
        b=TcGt21ON/kciCaH1pnwZq75AYeOm8HsJRuIAWalL0waU9QnxoBW0/PRoBx08i1jaRR
         5M7fCzYrP8GR7KU0ocBD7PxuaPpJ42HnauArkDTLMwJ8NL0BaqYmgNsSzfeWzMjy5XKi
         8xz+JqeZAETqao3w3zGaoEOIxWXi0gpEgTfaEnGl7HLtWM/S5shCRp/3ql1qXpa7IUZ7
         YOQHF7ONJHM1OvQzNFB6TqhpArEd1F9ZFOd70ofiw209CogGy/NDFKDdI0kZweIVsQnE
         s2zfLFlMEqDseAtABDGP/f7Bn6VjWyrPk06Q6sY/yQLYNoMyK8SScfZtRtm9xv7mQ1x8
         6TfA==
X-Gm-Message-State: ACgBeo2XhQNxq08sPY635nxmU7cMSNGYz5rboDDW2TWMiWa8EPW71JCJ
        G7x2fBZ3uIxFlg+p6+xv99OExonKe2bZZ70XFcFoSHM0Uqw=
X-Google-Smtp-Source: AA6agR6Y1cYT9LRXZE/8tUQ+bAFDxu2hQOCGQdiU+fjb86gv+KShyH9bMLEWv3H763V3TalcoB1OX0/IzDvryh53dVk=
X-Received: by 2002:a5d:9408:0:b0:688:189d:267f with SMTP id
 v8-20020a5d9408000000b00688189d267fmr7161538ion.55.1661122631326; Sun, 21 Aug
 2022 15:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <YwJFZNUob3BtEM2h@rowland.harvard.edu> <CAA6KcBC+4c9JTAt6=HJOciVW=gJ0KsiRWJeNGx-X2g5s+aafFQ@mail.gmail.com>
 <CAAMvbhFWBhkdLW0i5pVsrkJpSKEpsN=9gbHHgaXSP2UavmwvdA@mail.gmail.com> <CAA6KcBAbHzvBbP5QzaC-aLKbq3T6J3VjahJjOssS1u++_DJqXQ@mail.gmail.com>
In-Reply-To: <CAA6KcBAbHzvBbP5QzaC-aLKbq3T6J3VjahJjOssS1u++_DJqXQ@mail.gmail.com>
From:   James Dutton <james.dutton@gmail.com>
Date:   Sun, 21 Aug 2022 23:56:35 +0100
Message-ID: <CAAMvbhE4N92eqihSuj_bUvm=aiC-q-sAacFRa6FJ51+RjDhj6A@mail.gmail.com>
Subject: Re: USB disk disconnect problems
To:     Matthew Dharm <mdharm-usb@one-eyed-alien.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
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

On Sun, 21 Aug 2022 at 22:26, Matthew Dharm
<mdharm-usb@one-eyed-alien.net> wrote:
>
> The next level of deeper power savings would be a system-wide suspend
> / resume, which we've already discussed and is a path which is already
> handled (and also different from the original scenario you described).
>

I tried a suspend / resume cycle.
1) The laptop suspends in that the screen blanks and the power LED
fades in/out as an indicator of suspend mode.
2) Power to the USB device is powered on while suspended. (LED light
on USB device remains on during suspend.)
3) I can remove and reinsert the USB during suspend and it still resumes ok.
4) On exit from suspend everything looks to work ok.

I see these messages in the syslog during the suspend/resume cycle:
<6>1 2022-08-21T23:18:57+01:00 nvme2 kernel - - -  [ 1127.688557] usb
4-2: reset SuperSpeed USB device number 2 using xhci_hcd
<4>1 2022-08-21T23:18:57+01:00 nvme2 kernel - - -  [ 1127.782252] usb
4-2: Enable of device-initiated U1 failed.
<4>1 2022-08-21T23:18:57+01:00 nvme2 kernel - - -  [ 1127.784263] usb
4-2: Enable of device-initiated U2 failed.

Is U1/U2 failing a problem that could maybe be causing the problems I have seen?
The error is in the logs, but the resume works, and the disk is accessible.


When the real problem occurs (not during suspend/resume), an extract here:
<6>1 2022-05-04T14:32:53+01:00 nvme2 kernel - - -  [20782.100705] sd
0:0:0:0: [sda] tag#8 uas_eh_abort_handler 0 uas-tag 2 inflight: CMD
<6>1 2022-05-04T14:32:53+01:00 nvme2 kernel - - -  [20782.100707] sd
0:0:0:0: [sda] tag#8 CDB: Write(10) 2a 00 1c 51 11 20 00 00 20 00
<6>1 2022-05-04T14:32:53+01:00 nvme2 kernel - - -  [20782.115321] scsi
host0: uas_eh_device_reset_handler start
<6>1 2022-05-04T14:32:53+01:00 nvme2 kernel - - -  [20782.248337] usb
4-1: reset SuperSpeed USB device number 2 using xhci_hcd
<4>1 2022-05-04T14:32:58+01:00 nvme2 kernel - - -  [20787.463620]
xhci_hcd 0000:00:14.0: Trying to add endpoint 0x83 without dropping
it.
<3>1 2022-05-04T14:32:58+01:00 nvme2 kernel - - -  [20787.463633] usb
4-1: failed to restore interface 0 altsetting 1 (error=-110)
<6>1 2022-05-04T14:32:58+01:00 nvme2 kernel - - -  [20787.471524] scsi
host0: uas_eh_device_reset_handler FAILED err -19
<6>1 2022-05-04T14:32:58+01:00 nvme2 kernel - - -  [20787.471540] sd
0:0:0:0: Device offlined - not ready after error recovery


So, it is attempting to recover, but the recovery fails.
What is error -110 and err -19 ?

Are there any "quirks" that I could try enabling in relation to reset problems?

Kind Regards

James
