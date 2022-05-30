Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 905C053879A
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 20:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238647AbiE3S5v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 14:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbiE3S5u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 14:57:50 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0593D3BA75
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 11:57:48 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id v19so7357268edd.4
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 11:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2E+wfmBVWpkQQkARl2QMzEWWZdJ8K+8aL74VbKAAak=;
        b=DkB+scwGuyRb79DTgnoXmNYDIA90Oc6SwILpeXASYNrEAlBsJd2fMejXqQfHPziWqr
         sGc7HvJAcKRpqavxmFegyml/MP8ZdL4yd3mYgnIgtL3/wwxH5g7013lYSK1g139nc3E6
         qkFK5AGa23roAHyIxbf0K1e0bL+8+3rdbiinYeSZNlwrpoM6wOQwajpAGCnDutyyprm4
         Yr3hxWamhcMCjcw1yRRhBDRfSsw21jeC4BQUYMGJNGH7ZPNz+yKCFScmfsbkdmweQVSJ
         DXIjCkFZYXrhESb0n1ZLJouo0qsNuHaoWLQKVCVETH2JZVd5GMCLTSImHHbVxbHt3ito
         4//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2E+wfmBVWpkQQkARl2QMzEWWZdJ8K+8aL74VbKAAak=;
        b=u2ZpmmDAzpbdQc92+SReEOcBK8PtwVjjaw+6E4WwQkdZ2WloMUOG8TGfx+FRzxlPMI
         T4BAkIRgkwWfn7jdhicKqn5PqBL91YpkzRv/eFlnSOR2/wEzHU4viAOuU/GiUNztOosK
         Lk6Iawjzge/W7dYNYFnVFu/smNz3dj96+e2kGRkct9WBzL5uuZyk8h30nK0J4QH0ZNcF
         Alk71tKPaU/w/UHKaEiQCyKH/y6104zeseEOP6a51F9G03yuPPSiwMPFfbqSzzjqVmpb
         2fE6cd7IJsdJ4AODqgFLeByrX3vKioBP/xPtFnFChOst+6Knc2KCyctJlULlVS4FvCDy
         0ucQ==
X-Gm-Message-State: AOAM5338hLtAyqOgLJR8sJ9b6Z/vC/Tx+ceY+pgJETjJ7QcCwEEDDHi5
        RC61nj+kXSVUepGVBRbMWFMy5DRzAWONy5OwnNsCjkeKq7mrog==
X-Google-Smtp-Source: ABdhPJys5meWxAT53e+BW1XtrjYVyu9mIHiXH08EfFfjv/jNm2tSRqeylVsVmu1RjZru+0Bh/xy43NL5ft2xKCeROGQ=
X-Received: by 2002:a05:6402:35cd:b0:42b:7545:9726 with SMTP id
 z13-20020a05640235cd00b0042b75459726mr39779843edc.77.1653937066147; Mon, 30
 May 2022 11:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
 <YpCVc6eYkpmjP9AF@lahna> <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
 <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com> <YpSUSk9u5z3ueufa@lahna>
In-Reply-To: <YpSUSk9u5z3ueufa@lahna>
From:   Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Date:   Mon, 30 May 2022 20:57:34 +0200
Message-ID: <CALhB_QNh3vMn2+6H41MC_O0sKPfjiVrPeqmvpnLk=tuHUPQGdg@mail.gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
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

Many thanks for your continued support ...

On Mon, May 30, 2022 at 11:54 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> > On Sun, 2022-05-29 at 21:51 +0200, Stefan Hoffmeister wrote:
> > > I have managed to wedge the system into a state where it does not
> > > know about Thunderbolt, and now, on what I presume to be USB-C only
> > > ("usb_typec_revision" == 1.2? Seems ... low?), both DisplayPort
> > > outputs on the docking station are now active, and I do get
> > > meaningful entries from the DRM subsystem (and hence X). I am half-
> > > way happy: I want exactly that over Thunderbolt for the bandwidth ;)

> Can you paste contents of
> /sys/kernel/debug/thunderbolt/0-0/port5/regs and port6/regs here?
> Once you have conneted the dock with Thunderbolt cable. That should show
> if the both DP IN adapters are connected and hence if both DP tunnels
> are up. I'm guessing they are but better to check.

Steps, for a hopefully consistent and reproducible experience:
* disconnect dock from power
* add both (2.5K + 4K) screens to the dock (DisplayPort), 2.5K next to
power inlet, 4K further to the middle
* add power to dock
* plug Thunderbolt connector into notebook
* warm reboot notebook
* boot to Wayland (and log in) - X shouldn't be any different

$dmesg | grep HDMI

[    5.128604] thunderbolt 0000:00:0d.2:  Port 5: 8086:9a1f (Revision:
5, TB Version: 1, Type: DP/HDMI (0xe0101))
[    5.133597] thunderbolt 0000:00:0d.2:  Port 6: 8086:9a1f (Revision:
5, TB Version: 1, Type: DP/HDMI (0xe0101))
[   12.459885] thunderbolt 0000:00:0d.2:  Port 10: 8086:15ef
(Revision: 6, TB Version: 1, Type: DP/HDMI (0xe0102))
[   12.469951] thunderbolt 0000:00:0d.2:  Port 11: 8086:15ef
(Revision: 6, TB Version: 1, Type: DP/HDMI (0xe0102))

"8096:9a1f" is the laptop's TB4 NHI; "8086:15ef" is the JHL7540 of the
Thunderbolt dock

Below I have dropped the data as of "logged into Wayland" (which is
way beyond the timestamps above).

In that state, the 2.5K screen is running at 60 Hz (on port 10?) and
the 4K screen is literally lifeless / dark. Just by looking at the
"regs" data, port 10 has more data than port 11.

FWIW, when I say "Wayland", this is just disclosure. I believe that X
is the same, I am just trying to diagnose some different scenario on
Wayland. I am also flipping between the "native" HDMI port of the
notebook and Thunderbolt / DisplayPort for those reasons, so I am
treading a delicate path to have the right things plugged into the
right port for repro. Caveat emptor?

BR
Stefan
********** $ grep thunderbolt boot_thunderbolt.txt  ********************
[    4.497375] ACPI: bus type thunderbolt registered
[    4.497710] thunderbolt 0000:00:0d.2: total paths: 12
[    4.497998] thunderbolt 0000:00:0d.2: allocating TX ring 0 of size 10
[    4.498020] thunderbolt 0000:00:0d.2: allocating RX ring 0 of size 10
[    4.498035] thunderbolt 0000:00:0d.2: control channel created
[    4.498038] thunderbolt 0000:00:0d.2: using firmware connection manager
[    4.498039] thunderbolt 0000:00:0d.2: NHI initialized, starting thunderbolt
[    4.498041] thunderbolt 0000:00:0d.2: control channel starting...
[    4.498042] thunderbolt 0000:00:0d.2: starting TX ring 0
[    4.498046] thunderbolt 0000:00:0d.2: enabling interrupt at
register 0x38200 bit 0 (0x0 -> 0x1)
[    4.498049] thunderbolt 0000:00:0d.2: starting RX ring 0
[    4.498053] thunderbolt 0000:00:0d.2: enabling interrupt at
register 0x38200 bit 12 (0x1 -> 0x1001)
[    4.586628] thunderbolt 0000:00:0d.2: USB4 proxy operations supported
[    4.586632] thunderbolt 0000:00:0d.2: security level set to none
[    4.592985] thunderbolt 0000:00:0d.2: current switch config:
[    4.592990] thunderbolt 0000:00:0d.2:  USB4 Switch: 8087:9a1f
(Revision: 5, TB Version: 32)
[    4.592994] thunderbolt 0000:00:0d.2:   Max Port Number: 13
[    4.592995] thunderbolt 0000:00:0d.2:   Config:
[    4.592997] thunderbolt 0000:00:0d.2:    Upstream Port Number: 7
Depth: 0 Route String: 0x0 Enabled: 1, PlugEventsDelay: 10ms
[    4.593001] thunderbolt 0000:00:0d.2:    unknown1: 0x0 unknown4: 0x0
[    4.677387] thunderbolt 0000:00:0d.2: 0: uid: 0xcce0a46080879309
[    4.875540] thunderbolt 0000:00:0d.2:  Port 1: 8086:9a1f (Revision:
5, TB Version: 1, Type: Port (0x1))
[    4.875546] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[    4.875547] thunderbolt 0000:00:0d.2:   Max counters: 16
[    4.875549] thunderbolt 0000:00:0d.2:   NFC Credits: 0x47800000
[    4.875550] thunderbolt 0000:00:0d.2:   Credits (total/control): 120/2
[    5.042614] thunderbolt 0000:00:0d.2:  Port 2: 8086:9a1f (Revision:
5, TB Version: 1, Type: Port (0x1))
[    5.042621] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[    5.042622] thunderbolt 0000:00:0d.2:   Max counters: 16
[    5.042624] thunderbolt 0000:00:0d.2:   NFC Credits: 0x80000000
[    5.042625] thunderbolt 0000:00:0d.2:   Credits (total/control): 0/2
[    5.083002] thunderbolt 0000:00:0d.2:  Port 3: 8086:9a1f (Revision:
5, TB Version: 1, Type: Port (0x1))
[    5.083012] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[    5.083014] thunderbolt 0000:00:0d.2:   Max counters: 16
[    5.083015] thunderbolt 0000:00:0d.2:   NFC Credits: 0x83c00000
[    5.083016] thunderbolt 0000:00:0d.2:   Credits (total/control): 60/2
[    5.123582] thunderbolt 0000:00:0d.2:  Port 4: 8086:9a1f (Revision:
5, TB Version: 1, Type: Port (0x1))
[    5.123594] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[    5.123597] thunderbolt 0000:00:0d.2:   Max counters: 16
[    5.123601] thunderbolt 0000:00:0d.2:   NFC Credits: 0x83c00000
[    5.123603] thunderbolt 0000:00:0d.2:   Credits (total/control): 60/2
[    5.128604] thunderbolt 0000:00:0d.2:  Port 5: 8086:9a1f (Revision:
5, TB Version: 1, Type: DP/HDMI (0xe0101))
[    5.128617] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 9/9
[    5.128622] thunderbolt 0000:00:0d.2:   Max counters: 2
[    5.128625] thunderbolt 0000:00:0d.2:   NFC Credits: 0x4100000d
[    5.128627] thunderbolt 0000:00:0d.2:   Credits (total/control): 16/0
[    5.133597] thunderbolt 0000:00:0d.2:  Port 6: 8086:9a1f (Revision:
5, TB Version: 1, Type: DP/HDMI (0xe0101))
[    5.133605] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 9/9
[    5.133606] thunderbolt 0000:00:0d.2:   Max counters: 2
[    5.133607] thunderbolt 0000:00:0d.2:   NFC Credits: 0x100000d
[    5.133608] thunderbolt 0000:00:0d.2:   Credits (total/control): 16/0
[    5.146090] thunderbolt 0000:00:0d.2:  Port 7: 8086:9a1f (Revision:
5, TB Version: 1, Type: NHI (0x2))
[    5.146095] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 11/11
[    5.146096] thunderbolt 0000:00:0d.2:   Max counters: 16
[    5.146097] thunderbolt 0000:00:0d.2:   NFC Credits: 0x41800000
[    5.146098] thunderbolt 0000:00:0d.2:   Credits (total/control): 24/0
[    5.151093] thunderbolt 0000:00:0d.2:  Port 8: 8086:9a1f (Revision:
5, TB Version: 1, Type: PCIe (0x100101))
[    5.151104] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[    5.151108] thunderbolt 0000:00:0d.2:   Max counters: 2
[    5.151110] thunderbolt 0000:00:0d.2:   NFC Credits: 0x40800000
[    5.151114] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[    5.156079] thunderbolt 0000:00:0d.2:  Port 9: 8086:9a1f (Revision:
5, TB Version: 1, Type: PCIe (0x100101))
[    5.156088] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[    5.156091] thunderbolt 0000:00:0d.2:   Max counters: 2
[    5.156093] thunderbolt 0000:00:0d.2:   NFC Credits: 0x40800000
[    5.156096] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[    5.158692] thunderbolt 0000:00:0d.2:  Port 10: not implemented
[    5.161302] thunderbolt 0000:00:0d.2:  Port 11: not implemented
[    5.166290] thunderbolt 0000:00:0d.2:  Port 12: 8086:9a1f
(Revision: 5, TB Version: 1, Type: USB (0x200101))
[    5.166299] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[    5.166302] thunderbolt 0000:00:0d.2:   Max counters: 2
[    5.166304] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[    5.166307] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[    5.171822] thunderbolt 0000:00:0d.2:  Port 13: 8086:9a1f
(Revision: 5, TB Version: 1, Type: USB (0x200101))
[    5.171825] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[    5.171826] thunderbolt 0000:00:0d.2:   Max counters: 2
[    5.171826] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[    5.171827] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[    5.171828] thunderbolt 0000:00:0d.2: 0: linked ports 1 <-> 2
[    5.171829] thunderbolt 0000:00:0d.2: 0: linked ports 3 <-> 4
[    5.178167] thunderbolt 0000:00:0d.2: ICM rtd3 veto=0x00000000
[    5.182315] thunderbolt 0000:00:0d.2: current switch config:
[    5.182318] thunderbolt 0000:00:0d.2:  Thunderbolt 3 Switch:
8086:15ef (Revision: 6, TB Version: 16)
[    5.182321] thunderbolt 0000:00:0d.2:   Max Port Number: 13
[    5.182322] thunderbolt 0000:00:0d.2:   Config:
[    5.182323] thunderbolt 0000:00:0d.2:    Upstream Port Number: 1
Depth: 1 Route String: 0x1 Enabled: 1, PlugEventsDelay: 10ms
[    5.182325] thunderbolt 0000:00:0d.2:    unknown1: 0x0 unknown4: 0x0
[    5.687160] thunderbolt 0000:00:0d.2: 1: reading drom (length: 0x66)
[   12.349348] thunderbolt 0000:00:0d.2: 1: DROM version: 1
[   12.364493] thunderbolt 0000:00:0d.2: 1: uid: 0x16b26bdc8584100
[   12.402123] thunderbolt 0000:00:0d.2:  Port 1: 8086:15ef (Revision:
6, TB Version: 1, Type: Port (0x1))
[   12.402134] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[   12.402138] thunderbolt 0000:00:0d.2:   Max counters: 16
[   12.402139] thunderbolt 0000:00:0d.2:   NFC Credits: 0x7800046
[   12.402142] thunderbolt 0000:00:0d.2:   Credits (total/control): 120/2
[   12.439798] thunderbolt 0000:00:0d.2:  Port 2: 8086:15ef (Revision:
6, TB Version: 1, Type: Port (0x1))
[   12.439809] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[   12.439812] thunderbolt 0000:00:0d.2:   Max counters: 16
[   12.439814] thunderbolt 0000:00:0d.2:   NFC Credits: 0x0
[   12.439816] thunderbolt 0000:00:0d.2:   Credits (total/control): 0/2
[   12.439819] thunderbolt 0000:00:0d.2: 1:3: disabled by eeprom
[   12.439822] thunderbolt 0000:00:0d.2: 1:4: disabled by eeprom
[   12.439823] thunderbolt 0000:00:0d.2: 1:5: disabled by eeprom
[   12.439825] thunderbolt 0000:00:0d.2: 1:6: disabled by eeprom
[   12.439827] thunderbolt 0000:00:0d.2: 1:7: disabled by eeprom
[   12.444782] thunderbolt 0000:00:0d.2:  Port 8: 8086:15ef (Revision:
6, TB Version: 1, Type: PCIe (0x100102))
[   12.444791] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[   12.444794] thunderbolt 0000:00:0d.2:   Max counters: 2
[   12.444795] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[   12.444797] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[   12.449813] thunderbolt 0000:00:0d.2:  Port 9: 8086:15ef (Revision:
6, TB Version: 1, Type: PCIe (0x100101))
[   12.449824] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[   12.449827] thunderbolt 0000:00:0d.2:   Max counters: 2
[   12.449829] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[   12.449831] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[   12.459885] thunderbolt 0000:00:0d.2:  Port 10: 8086:15ef
(Revision: 6, TB Version: 1, Type: DP/HDMI (0xe0102))
[   12.459896] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 9/9
[   12.459899] thunderbolt 0000:00:0d.2:   Max counters: 2
[   12.459901] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[   12.459903] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[   12.469951] thunderbolt 0000:00:0d.2:  Port 11: 8086:15ef
(Revision: 6, TB Version: 1, Type: DP/HDMI (0xe0102))
[   12.469962] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 9/9
[   12.469965] thunderbolt 0000:00:0d.2:   Max counters: 2
[   12.469966] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[   12.469968] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[   12.475010] thunderbolt 0000:00:0d.2:  Port 12: 8086:15ea
(Revision: 6, TB Version: 1, Type: Inactive (0x0))
[   12.475021] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[   12.475024] thunderbolt 0000:00:0d.2:   Max counters: 2
[   12.475025] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[   12.475027] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[   12.480040] thunderbolt 0000:00:0d.2:  Port 13: 8086:15ea
(Revision: 6, TB Version: 1, Type: Inactive (0x0))
[   12.480055] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[   12.480058] thunderbolt 0000:00:0d.2:   Max counters: 2
[   12.480059] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[   12.480061] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[   12.480147] thunderbolt 0-1: new device found, vendor=0x16b device=0x9010
[   12.480150] thunderbolt 0-1: i-tec TB3CDUALDPDOCKPD
[   12.500425] thunderbolt 0000:00:0d.2: ICM rtd3 veto=0x00000001
[   12.500434] thunderbolt 0000:00:0d.2: ICM rtd3 veto=0x00000000
[   12.500438] thunderbolt 0000:00:0d.2: ICM rtd3 veto=0x00000001

********** $ cat /sys/kernel/debug/thunderbolt/0-0/port5/regs
********************
# offset relative_offset cap_id vs_cap_id value
0x0000    0 0x00 0x00 0x9a1f8086
0x0001    1 0x00 0x00 0x05080239
0x0002    2 0x00 0x00 0x010e0101
0x0003    3 0x00 0x00 0x80500010
0x0004    4 0x00 0x00 0x4100000d
0x0005    5 0x00 0x00 0x00004809
0x0006    6 0x00 0x00 0x00000000
0x0007    7 0x00 0x00 0x00000000
0x0008    8 0x00 0x00 0x00000000
0x0039    0 0x04 0x00 0xc009048f
0x003a    1 0x04 0x00 0x00004008
0x003b    2 0x04 0x00 0x8d10214a
0x003c    3 0x04 0x00 0x3f290005
0x003d    4 0x04 0x00 0x80c0a334
0x003e    5 0x04 0x00 0x88c0a234
0x003f    6 0x04 0x00 0x00000204
0x0040    7 0x04 0x00 0x88c0a234
0x008f    0 0x05 0x00 0x40000500
0x0090    1 0x05 0x00 0x00000000
0x0091    2 0x05 0x00 0x00000000
0x0092    3 0x05 0x00 0x00000000
0x0093    4 0x05 0x00 0x00000000
0x0094    5 0x05 0x00 0x00000000
0x0095    6 0x05 0x00 0x00000000
0x0096    7 0x05 0x00 0x00000000
0x0097    8 0x05 0x00 0x00000000
0x0098    9 0x05 0x00 0x00000000
0x0099   10 0x05 0x00 0x00000000
0x009a   11 0x05 0x00 0x00000000
0x009b   12 0x05 0x00 0x00000000
0x009c   13 0x05 0x00 0x00000000
0x009d   14 0x05 0x00 0x00000000
0x009e   15 0x05 0x00 0x00000000
0x009f   16 0x05 0x00 0x00000000
0x00a0   17 0x05 0x00 0x00000000
0x00a1   18 0x05 0x00 0x00000000
0x00a2   19 0x05 0x00 0x00000000
0x00a3   20 0x05 0x00 0x00000000
0x00a4   21 0x05 0x00 0x00000000
0x00a5   22 0x05 0x00 0x00000000
0x00a6   23 0x05 0x00 0x00000000
0x00a7   24 0x05 0x00 0x00000000
0x00a8   25 0x05 0x00 0x00000000
0x00a9   26 0x05 0x00 0x00000000
0x00aa   27 0x05 0x00 0x00000000
0x00ab   28 0x05 0x00 0x00000000
0x00ac   29 0x05 0x00 0x00000000
0x00ad   30 0x05 0x00 0x00000000
0x00ae   31 0x05 0x00 0x00000000
0x00af   32 0x05 0x00 0x00000000
0x00b0   33 0x05 0x00 0x00000000
0x00b1   34 0x05 0x00 0x00000000
0x00b2   35 0x05 0x00 0x00000000
0x00b3   36 0x05 0x00 0x00000000
0x00b4   37 0x05 0x00 0x00000000
0x00b5   38 0x05 0x00 0x00000000
0x00b6   39 0x05 0x00 0x00000000
0x00b7   40 0x05 0x00 0x00000000
0x00b8   41 0x05 0x00 0x00000000
0x00b9   42 0x05 0x00 0x00000000
0x00ba   43 0x05 0x00 0x00000000
0x00bb   44 0x05 0x00 0x00000000
0x00bc   45 0x05 0x00 0x00000000
0x00bd   46 0x05 0x00 0x00000000
0x00be   47 0x05 0x00 0x00000000
0x00bf   48 0x05 0x00 0x00000000
0x00c0   49 0x05 0x00 0x00000000
0x00c1   50 0x05 0x00 0x00000000
0x00c2   51 0x05 0x00 0x00000000
0x00c3   52 0x05 0x00 0x00000000
0x00c4   53 0x05 0x00 0x00000000
0x00c5   54 0x05 0x00 0x00000000
0x00c6   55 0x05 0x00 0x00000000
0x00c7   56 0x05 0x00 0x00000000
0x00c8   57 0x05 0x00 0x00000000
0x00c9   58 0x05 0x00 0x00000000
0x00ca   59 0x05 0x00 0x00000000
0x00cb   60 0x05 0x00 0x00000000
0x00cc   61 0x05 0x00 0x00000000
0x00cd   62 0x05 0x00 0x00000000
0x00ce   63 0x05 0x00 0x00000000

********** $ cat /sys/kernel/debug/thunderbolt/0-0/port6/regs
********************
# offset relative_offset cap_id vs_cap_id value
0x0000    0 0x00 0x00 0x9a1f8086
0x0001    1 0x00 0x00 0x05080239
0x0002    2 0x00 0x00 0x010e0101
0x0003    3 0x00 0x00 0x80600010
0x0004    4 0x00 0x00 0x0100000d
0x0005    5 0x00 0x00 0x00004809
0x0006    6 0x00 0x00 0x00000000
0x0007    7 0x00 0x00 0x00000000
0x0008    8 0x00 0x00 0x00000000
0x0039    0 0x04 0x00 0x0009048f
0x003a    1 0x04 0x00 0x00004008
0x003b    2 0x04 0x00 0x46102102
0x003c    3 0x04 0x00 0x00410005
0x003d    4 0x04 0x00 0x00c0a334
0x003e    5 0x04 0x00 0x00000000
0x003f    6 0x04 0x00 0x00000000
0x0040    7 0x04 0x00 0x00000000
0x008f    0 0x05 0x00 0x40000500
0x0090    1 0x05 0x00 0x00000000
0x0091    2 0x05 0x00 0x00000000
0x0092    3 0x05 0x00 0x00000000
0x0093    4 0x05 0x00 0x00000000
0x0094    5 0x05 0x00 0x00000000
0x0095    6 0x05 0x00 0x00000000
0x0096    7 0x05 0x00 0x00000000
0x0097    8 0x05 0x00 0x00000000
0x0098    9 0x05 0x00 0x00000000
0x0099   10 0x05 0x00 0x00000000
0x009a   11 0x05 0x00 0x00000000
0x009b   12 0x05 0x00 0x00000000
0x009c   13 0x05 0x00 0x00000000
0x009d   14 0x05 0x00 0x00000000
0x009e   15 0x05 0x00 0x00000000
0x009f   16 0x05 0x00 0x00000000
0x00a0   17 0x05 0x00 0x00000000
0x00a1   18 0x05 0x00 0x00000000
0x00a2   19 0x05 0x00 0x00000000
0x00a3   20 0x05 0x00 0x00000000
0x00a4   21 0x05 0x00 0x00000000
0x00a5   22 0x05 0x00 0x00000000
0x00a6   23 0x05 0x00 0x00000000
0x00a7   24 0x05 0x00 0x00000000
0x00a8   25 0x05 0x00 0x00000000
0x00a9   26 0x05 0x00 0x00000000
0x00aa   27 0x05 0x00 0x00000000
0x00ab   28 0x05 0x00 0x00000000
0x00ac   29 0x05 0x00 0x00000000
0x00ad   30 0x05 0x00 0x00000000
0x00ae   31 0x05 0x00 0x00000000
0x00af   32 0x05 0x00 0x00000000
0x00b0   33 0x05 0x00 0x00000000
0x00b1   34 0x05 0x00 0x00000000
0x00b2   35 0x05 0x00 0x00000000
0x00b3   36 0x05 0x00 0x00000000
0x00b4   37 0x05 0x00 0x00000000
0x00b5   38 0x05 0x00 0x00000000
0x00b6   39 0x05 0x00 0x00000000
0x00b7   40 0x05 0x00 0x00000000
0x00b8   41 0x05 0x00 0x00000000
0x00b9   42 0x05 0x00 0x00000000
0x00ba   43 0x05 0x00 0x00000000
0x00bb   44 0x05 0x00 0x00000000
0x00bc   45 0x05 0x00 0x00000000
0x00bd   46 0x05 0x00 0x00000000
0x00be   47 0x05 0x00 0x00000000
0x00bf   48 0x05 0x00 0x00000000
0x00c0   49 0x05 0x00 0x00000000
0x00c1   50 0x05 0x00 0x00000000
0x00c2   51 0x05 0x00 0x00000000
0x00c3   52 0x05 0x00 0x00000000
0x00c4   53 0x05 0x00 0x00000000
0x00c5   54 0x05 0x00 0x00000000
0x00c6   55 0x05 0x00 0x00000000
0x00c7   56 0x05 0x00 0x00000000
0x00c8   57 0x05 0x00 0x00000000
0x00c9   58 0x05 0x00 0x00000000
0x00ca   59 0x05 0x00 0x00000000
0x00cb   60 0x05 0x00 0x00000000
0x00cc   61 0x05 0x00 0x00000000
0x00cd   62 0x05 0x00 0x00000000
0x00ce   63 0x05 0x00 0x00000000

********** $ cat /sys/kernel/debug/thunderbolt/0-1/port10/regs
********************
# offset relative_offset cap_id vs_cap_id value
0x0000    0 0x00 0x00 0x15ef8086
0x0001    1 0x00 0x00 0x0608020a
0x0002    2 0x00 0x00 0x010e0102
0x0003    3 0x00 0x00 0x80a00008
0x0004    4 0x00 0x00 0x00800000
0x0005    5 0x00 0x00 0x00004809
0x0006    6 0x00 0x00 0x00000000
0x0007    7 0x00 0x00 0x00000000
0x0008    8 0x00 0x00 0x00000000
0x000a    0 0x03 0x00 0x00000339
0x000b    1 0x03 0x00 0x40110005
0x000c    2 0x03 0x00 0x00000000
0x000d    3 0x03 0x00 0x00000000
0x000e    4 0x03 0x00 0xffffffff
0x000f    5 0x03 0x00 0x00000000
0x0010    6 0x03 0x00 0x000009c4
0x0011    7 0x03 0x00 0x00c80002
0x0039    0 0x04 0x00 0xc009044f
0x003a    1 0x04 0x00 0x00004008
0x003b    2 0x04 0x00 0x000fff40
0x003c    3 0x04 0x00 0x3a290005
0x003d    4 0x04 0x00 0x00c0a234
0x003e    5 0x04 0x00 0x00c0a334
0x003f    6 0x04 0x00 0x04000204
0x0040    7 0x04 0x00 0x00c0a234
0x004f    0 0x05 0x01 0x40010500
0x0050    1 0x05 0x01 0x00000000
0x0051    2 0x05 0x01 0x0000d282
0x0052    3 0x05 0x01 0x00000000
0x0053    4 0x05 0x01 0x00000004
0x0054    5 0x05 0x01 0x00000000
0x0055    6 0x05 0x01 0x00000000
0x0056    7 0x05 0x01 0x00000000
0x0057    8 0x05 0x01 0x00000000
0x0058    9 0x05 0x01 0x00000000
0x0059   10 0x05 0x01 0x00000000
0x005a   11 0x05 0x01 0x00000000
0x005b   12 0x05 0x01 0x00000000
0x005c   13 0x05 0x01 0x00000000
0x005d   14 0x05 0x01 0x00000000
0x005e   15 0x05 0x01 0x00000000
0x005f   16 0x05 0x01 0x00000000
0x0060   17 0x05 0x01 0x00000000
0x0061   18 0x05 0x01 0x00000000
0x0062   19 0x05 0x01 0x00000000
0x0063   20 0x05 0x01 0x00000000
0x0064   21 0x05 0x01 0x00000000
0x0065   22 0x05 0x01 0x00000000
0x0066   23 0x05 0x01 0x00000000
0x0067   24 0x05 0x01 0x00000000
0x0068   25 0x05 0x01 0x00000000
0x0069   26 0x05 0x01 0x00000000
0x006a   27 0x05 0x01 0x00000000
0x006b   28 0x05 0x01 0x00000000
0x006c   29 0x05 0x01 0x00000000
0x006d   30 0x05 0x01 0x00000000
0x006e   31 0x05 0x01 0x00000000
0x006f   32 0x05 0x01 0x00000000
0x0070   33 0x05 0x01 0x00000000
0x0071   34 0x05 0x01 0x00000000
0x0072   35 0x05 0x01 0x00000000
0x0073   36 0x05 0x01 0x00000000
0x0074   37 0x05 0x01 0x00000000
0x0075   38 0x05 0x01 0x00000000
0x0076   39 0x05 0x01 0x00000000
0x0077   40 0x05 0x01 0x00000000
0x0078   41 0x05 0x01 0x00000000
0x0079   42 0x05 0x01 0x00000000
0x007a   43 0x05 0x01 0x00000000
0x007b   44 0x05 0x01 0x00000000
0x007c   45 0x05 0x01 0x00000000
0x007d   46 0x05 0x01 0x00000000
0x007e   47 0x05 0x01 0x00000000
0x007f   48 0x05 0x01 0x0000000a
0x0080   49 0x05 0x01 0x06410641
0x0081   50 0x05 0x01 0x00000000
0x0082   51 0x05 0x01 0x00000000
0x0083   52 0x05 0x01 0x00000000
0x0084   53 0x05 0x01 0x00000000
0x0085   54 0x05 0x01 0x00000000
0x0086   55 0x05 0x01 0x00000000
0x0087   56 0x05 0x01 0x00000000
0x0088   57 0x05 0x01 0x00000000
0x0089   58 0x05 0x01 0x00000000
0x008a   59 0x05 0x01 0x00000000
0x008b   60 0x05 0x01 0x00000000
0x008c   61 0x05 0x01 0x00000000
0x008d   62 0x05 0x01 0x00000000
0x008e   63 0x05 0x01 0x00000000

********** $ cat /sys/kernel/debug/thunderbolt/0-1/port11/regs
********************
# offset relative_offset cap_id vs_cap_id value
0x0000    0 0x00 0x00 0x15ef8086
0x0001    1 0x00 0x00 0x0608020a
0x0002    2 0x00 0x00 0x010e0102
0x0003    3 0x00 0x00 0x80b00008
0x0004    4 0x00 0x00 0x00800000
0x0005    5 0x00 0x00 0x00004809
0x0006    6 0x00 0x00 0x00000000
0x0007    7 0x00 0x00 0x00000000
0x0008    8 0x00 0x00 0x00000000
0x000a    0 0x03 0x00 0x00000339
0x000b    1 0x03 0x00 0x40110005
0x000c    2 0x03 0x00 0x00000000
0x000d    3 0x03 0x00 0x00000000
0x000e    4 0x03 0x00 0xffffffff
0x000f    5 0x03 0x00 0x00000000
0x0010    6 0x03 0x00 0x000009c4
0x0011    7 0x03 0x00 0x00c80002
0x0039    0 0x04 0x00 0x0009044f
0x003a    1 0x04 0x00 0x00004008
0x003b    2 0x04 0x00 0x000fff40
0x003c    3 0x04 0x00 0x00400005
0x003d    4 0x04 0x00 0x00c0a234
0x003e    5 0x04 0x00 0x00000000
0x003f    6 0x04 0x00 0x04000000
0x0040    7 0x04 0x00 0x00c0a234
0x004f    0 0x05 0x01 0x34010500
0x0050    1 0x05 0x01 0x34010500
0x0051    2 0x05 0x01 0x34010500
0x0052    3 0x05 0x01 0x34010500
0x0053    4 0x05 0x01 0x34010500
0x0054    5 0x05 0x01 0x34010500
0x0055    6 0x05 0x01 0x34010500
0x0056    7 0x05 0x01 0x34010500
0x0057    8 0x05 0x01 0x34010500
0x0058    9 0x05 0x01 0x34010500
0x0059   10 0x05 0x01 0x34010500
0x005a   11 0x05 0x01 0x34010500
0x005b   12 0x05 0x01 0x34010500
0x005c   13 0x05 0x01 0x34010500
0x005d   14 0x05 0x01 0x34010500
0x005e   15 0x05 0x01 0x34010500
0x005f   16 0x05 0x01 0x34010500
0x0060   17 0x05 0x01 0x34010500
0x0061   18 0x05 0x01 0x34010500
0x0062   19 0x05 0x01 0x34010500
0x0063   20 0x05 0x01 0x34010500
0x0064   21 0x05 0x01 0x34010500
0x0065   22 0x05 0x01 0x34010500
0x0066   23 0x05 0x01 0x34010500
0x0067   24 0x05 0x01 0x34010500
0x0068   25 0x05 0x01 0x34010500
0x0069   26 0x05 0x01 0x34010500
0x006a   27 0x05 0x01 0x34010500
0x006b   28 0x05 0x01 0x34010500
0x006c   29 0x05 0x01 0x34010500
0x006d   30 0x05 0x01 0x34010500
0x006e   31 0x05 0x01 0x34010500
0x006f   32 0x05 0x01 0x34010500
0x0070   33 0x05 0x01 0x34010500
0x0071   34 0x05 0x01 0x34010500
0x0072   35 0x05 0x01 0x34010500
0x0073   36 0x05 0x01 0x34010500
0x0074   37 0x05 0x01 0x34010500
0x0075   38 0x05 0x01 0x34010500
0x0076   39 0x05 0x01 0x34010500
0x0077   40 0x05 0x01 0x34010500
0x0078   41 0x05 0x01 0x34010500
0x0079   42 0x05 0x01 0x34010500
0x007a   43 0x05 0x01 0x34010500
0x007b   44 0x05 0x01 0x34010500
0x007c   45 0x05 0x01 0x34010500
0x007d   46 0x05 0x01 0x34010500
0x007e   47 0x05 0x01 0x34010500
0x007f   48 0x05 0x01 0x0000000a
0x0080   49 0x05 0x01 0x06410641
0x0081   50 0x05 0x01 0x00000000
0x0082   51 0x05 0x01 0x00000000
