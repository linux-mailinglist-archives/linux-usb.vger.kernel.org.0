Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35E15F353A
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 20:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiJCSFG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 14:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiJCSEr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 14:04:47 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E555EDEBD
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 11:04:42 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id d8so8699469iof.11
        for <linux-usb@vger.kernel.org>; Mon, 03 Oct 2022 11:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date;
        bh=g7fk1eMcGJuJYwh/KqEqX0SJJw7tKnX6QwcwMfUq27w=;
        b=MW5nzgWjH+hcZxuWNQ2LyuAi/EV/oF3/MTso0LICjts/TJR6esvLvs3aYaZNoTBbjl
         sXu9NRuEHoDxZolclRTXfSz1d/yMkcPBaVnZukRNWvn74SUYipTwKsoJ5xStF+R0E4KG
         42zMmyuwWK2WARW4eQwBHWUjzY0OBLj6g0du+8gADW+En0y7ozYSXjQDrf5BdMyi5Z7h
         uT+vp2dDiaHVJF1VHfvliesf7Iphg2cT8kK6DLPhlIlr6U9AyQEkYBjCOdE8Fqvq1pQw
         TUebSE+LoB30yenowlWdEtp+/xFczdWQzWP01Iz0yn89q2FiJ9W9KI8RuQM3SVXj1LxE
         Ib+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=g7fk1eMcGJuJYwh/KqEqX0SJJw7tKnX6QwcwMfUq27w=;
        b=qNvodXuF7Oi8vV7sPMatmcwdD4en3PIE75sc5J4ATlGYTD6bPBGlD/X3a18AwkF/KR
         kLLWr0eJMHZuuiZWvLZmcdrsRbgIRpPbrcxS9IfuYLp3O+9fOR3bt2R3EaZT/wZXVmP8
         5xK5DL7MkU+0iA7O+zrNjDq+U/bhxOetce2Tq5PARxO7yW7Wu01bZnDJFGffyE1eTVER
         aFO3fDDh85RhfqHgOiLtykuaF6gyDG2hj/i24ec12XCSvLQzvmll3R4chDdjKPpCO9+U
         4ZjfROsLx7z4n8Hi2iuPQqgY5GA+6aeLy13dfrI5oQYp1x/JPlpEogk/T67NfOjZ3eYo
         +dQA==
X-Gm-Message-State: ACrzQf0EeQGOrNMeMjin7oXCnc2YkMdJ1Wl2xXZjYM8m/O4KCo6iwxc7
        K0D8FekwLelA35dfPT6/Ai5RZBplLOzVgOMi+In37VbFZWs=
X-Google-Smtp-Source: AMsMyM5ohDuGlzlEIe5v2HnkpPoFmQlk85nl/U/vP/gMqR3pDK6oh/BPldE6O3ak5ttI3PStAh8dOFtx6NuKFNmE8Do=
X-Received: by 2002:a02:54c1:0:b0:363:453e:2ccb with SMTP id
 t184-20020a0254c1000000b00363453e2ccbmr1054749jaa.228.1664820282061; Mon, 03
 Oct 2022 11:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
In-Reply-To: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
From:   James Dutton <james.dutton@gmail.com>
Date:   Mon, 3 Oct 2022 19:04:05 +0100
Message-ID: <CAAMvbhEV_ssOwsWU-37pauDSfM3Ekv2mrKWTjCP0vov84dMDMQ@mail.gmail.com>
Subject: Re: USB disk disconnect problems
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 21 Aug 2022 at 12:17, James Dutton <james.dutton@gmail.com> wrote:
>
> Hi,
>
> Say I have mounted a usb disk.
> I then disconnect the usb device
> Linux complains about failed writes etc.
> I then plug the usb device back in
> Linux still complains about failed writes, and does not recover.
>
> How do I get Linux to recognise the reinserted usb disk and carry on as normal?
>
> I know my suggested behaviour might be detrimental for some users, in
> case one modifies the usb disk in another computer and then comes
> back, but I would like an option that assumes it has not been plugged
> into anything else.
>
> The reason being, I have a system that boots from a USB disk.
> Due to interference, the USB device disconnects for a second or two
> and then comes back, but Linux does not see it and I have to reboot
> Linux to recover. So, in this situation I wish Linux to be able to
> recover immediately, without needing a reboot.
>
> The physical USB device removal then reinserting reproduces the
> problem I am seeing, so I thought it would be a good example to get
> working, if we could.
>
> Can anyone give me any pointers as to where to start with fixing this?
>
> Kind Regards
>
> James

I have done some more tests.
With the device plugged in, and me manually send a command to reset
the USB device.
Using instructions listed here:
https://askubuntu.com/questions/645/how-do-you-reset-a-usb-device-from-the-command-line

The reset fails.
It never recovers.
So, I think there is some problem relating to USB 3.x reset, and maybe
just my specific device which is an NVME storage in a USB dock.
I think the problem is more to do with the Linux kernel's USB 3.x
reset procedure, rather than any other cause.
Is there any quirk or test I can add, that would remove power from the
USB port and return it, as part of the reset procedure?
Or, is there any extra debug logging I can enable to help diagnose
where the reset function is failing?
