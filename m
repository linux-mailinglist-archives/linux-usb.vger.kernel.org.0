Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15F967675C4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 20:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjG1Spm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 14:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjG1Spl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 14:45:41 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0444B26B2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 11:45:39 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so2186846276.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 11:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1690569938; x=1691174738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX0Eqtwuf6gH7XoT7pLe8UQ7CGvTQx43mdPtZKRIMZI=;
        b=Ey6KlJ1LMYRJPfiRDt5TyagbL6NnPd/Ok8rI4o0YL8P+BZtdo8VqT7pQaze0Cefpje
         kNoNrVtdewwvZjxiVqqteo/nxnrLyyNlv+IUyOwbbr+CdEWdP8jiTS8Be97FBasyQpR9
         COair7kOqWt4GwuDni5JRmRInMd/3n876e8Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690569938; x=1691174738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX0Eqtwuf6gH7XoT7pLe8UQ7CGvTQx43mdPtZKRIMZI=;
        b=Ys8on73UcamE3Xnfz/GZ+hELAaVjrpJthEwma7ZUsO2N0vdr7I3hx9wEK4Xoo1em7G
         DJVDec2hV+s0gHAesoMJqc4ihHUKJprlLS6sxpsKzi3Y9aHygQFB1Q8DZXq+b2/+GmjO
         ZG+ndpFmCo6IIL3n7lte+lt+oaw4AsHYok/vJuJWfYydh/BMdnfwiahVdGD0pTIpKXPM
         mI2yHrq9XLsDnHbFOjF6TeGk5wXnHrk0nemzVr1pUGxhd3G6Is3vnCNiX6t9WpBLEJIU
         oOtKQctWioOYS/7ivVGQRjpLlhIsh7clK6EobY2I5qEcNJBmSDQ3UqAmyLEK2nywkLdU
         Kw3g==
X-Gm-Message-State: ABy/qLYqpqBk7slXjwLBB8FZs5DJO8809WIRQHartsOJGyexvvV6bS+F
        MtR14pKDHXgaCXYhtvFdYVD7iWO+x59K0e0d58uBMQ==
X-Google-Smtp-Source: APBJJlHCy81d9+dKLPZp93oxCop/WOhoB+kkVTnfxmWo9uRsnuG3Qv3NCE3baDpPegQ91lIKcQFY/r15tx4pNoOhzB0=
X-Received: by 2002:a25:ad51:0:b0:d20:e5c9:10e1 with SMTP id
 l17-20020a25ad51000000b00d20e5c910e1mr2163934ybe.21.1690569938021; Fri, 28
 Jul 2023 11:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230719122123.3702588-1-jagan@amarulasolutions.com>
 <CACdvmAia49_YiKpVvT=yeLWF+YGm+2vFK3rdwRB9XOAH5mm=-w@mail.gmail.com>
 <8ec1c4bb97ba0857275a540590fb302929436ba4.camel@collabora.com> <4659362.yKVeVyVuyW@phil>
In-Reply-To: <4659362.yKVeVyVuyW@phil>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sat, 29 Jul 2023 00:15:26 +0530
Message-ID: <CAMty3ZB5LE-GcFChZK3HXY6o6RMiuKoaYS4S7QasixiVqNK9gw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable TYPE-C PD for ROC-RK3399-PC
To:     Heiko Stuebner <heiko@sntech.de>, Da Xue <da@lessconfused.com>,
        Christopher Obbard <chris.obbard@collabora.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>,
        kernel <kernel@collabora.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+ Frank
+ Guenter
+ linux-usb
(for any suggestions)

On Sat, Jul 29, 2023 at 12:00=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> w=
rote:
>
> Am Dienstag, 25. Juli 2023, 10:02:21 CEST schrieb Christopher Obbard:
> > Hi Da, Jagan,
> >
> > On Tue, 2023-07-25 at 03:39 -0400, Da Xue wrote:
> > > On Mon, Jul 24, 2023 at 9:55=E2=80=AFAM Christopher Obbard
> > > <chris.obbard@collabora.com> wrote:
> > > >
> > > > On Wed, 2023-07-19 at 17:51 +0530, Jagan Teki wrote:
> > > > > The power supply circuit in ROC-RK3399-PC is
> > > > >
> > > > > Power Supply (or PPS) =3D> FUSB =3D> MP8859
> > > > >
> > > > > VUBS pin of FUSB and IN pin of MP8859 is supplied via TYPEC_IN.
> > > > >
> > > > > The MP8859 operated with 2.8V to 22V supply voltage and typical
> > > > > applications this supply can be 12V.
> > > > >
> > > > > This patch is trying to support the PD by changing the FUSB VBUS =
supply
> > > > > to 12V and tune the I2C7 timings from downstream kernel.
> > > > >
> > > > > Tested with PD3.0 PPS with supply voltages of 12V/3A and 20V/5A.
> > > >
> > > > Hi Jagan,
> > > >
> > > > This series works fine with a "dumb" (no PD negotiation) 5.1V Raspb=
erry Pi PSU.
> > > >
> > > > It also works fine with a Dell 45W USB-C Laptop Power Supply (model=
 AA45NM170) which provides 5V@3A,9V@3A,15V@3A,20V@2.25A, where Linux master=
 fails and just tells the USB-PD PSU to power-off.
> > >
> > > I think this depends on the recent Rockchip TCPM changes. FUSB302 has
> > > been a pain in the USB or else this platform would have launched a lo=
t
> > > longer ago.
> >
> > Sorry, I was testing this patch on top of next-20230724 which includes =
https://patchwork.kernel.org/project/linux-rockchip/list/?series=3D757752:
> >
> >  8be558dcffe69b078b34b1fa93b82acaf4ce4957 ("usb: typec: tcpm: add get m=
ax power support")
> >  1e35f074399dece73d5df11847d4a0d7a6f49434 ("usb: typec: tcpm: fix cc ro=
le at port reset")
> >
> > Can you check if I am missing any other patches ?
>
> so I guess the question is, are there any new clues and/or does this patc=
h
> make the situaton better or worse for the roc-rk3399-pc board as it stand=
s
> now.

It is working with PD3.0 (EHO 100W GaN) but seems to be inconsistent.
For the non-working cases, I did check in RK3399 and RK3588 designs
the PD run machine setup in tcpm with respect to the fusb302 chip
receiving hard reset due to BC_LVL, handler pending.

Here, is the sample log (please don't mind, the log combined with
other functions as I've enabled the static tcpm logs)
[    0.342297] FUSB: sw reset
[    0.346084] FUSB: fusb302 device ID: 0x91
[    0.346331] TCPM: Setting usb_comm capable false
[    0.351365] FUSB: pd :=3D off
[    0.351772] FUSB: vbus is already Off
[    0.352019] FUSB: charge is already Off
[    0.352342] FUSB: vconn is already Off
[    0.352680] TCPM: Setting voltage/current limit 0 mV 0 mA
[    0.353023] TCPM: polarity 0
[    0.353497] TCPM: Requesting mux state 0, usb-role 0, orientation 0
[    0.354544] FUSB: pd header :=3D Sink, Device
[    0.355097] TCPM: state change INVALID_STATE -> SNK_UNATTACHED
[rev1 NONE_AMS]
[    0.355469] FUSB: cc1=3DOpen, cc2=3DOpen
[    0.356107] TCPM: state change SNK_UNATTACHED -> PORT_RESET [rev1 NONE_A=
MS]
[    0.356424] TCPM: 1-0022: registered
[    0.356428] TCPM: Setting usb_comm capable false
[    0.357964] i2c 3-0011: Fixed dependency cycle(s) with
/i2s@fe470000/port/endpoint
[    0.362173] FUSB: pd :=3D off
[    0.362182] FUSB: vbus is already Off
[    0.362445] FUSB: charge is already Off
[    0.362778] FUSB: vconn is already Off
[    0.363126] TCPM: Setting voltage/current limit 0 mV 0 mA
[    0.363479] TCPM: polarity 0
[    0.363970] TCPM: Requesting mux state 0, usb-role 0, orientation 0
[    0.364339] sdhci: Secure Digital Host Controller Interface driver
[    0.365298] FUSB: pd header :=3D Sink, Device
[    0.365440] sdhci: Copyright(c) Pierre Ossman
[    0.366110] Synopsys Designware Multimedia Card Interface Driver
[    0.366222] TCPM: cc:=3D2
[    0.366758] FUSB: cc :=3D Rd
[    0.367564] sdhci-pltfm: SDHCI platform and OF driver helper
[    0.370341] ledtrig-cpu: registered to indicate activity on CPUs
[    0.371295] scmi_protocol scmi_dev.1: Enabled polling mode TX
channel - prot_id:16
[    0.372067] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
[    0.372670] arm-scmi firmware:scmi: SCMI Protocol v2.0 'rockchip:'
Firmware version 0x0
[    0.374620] TCPM: pending state change PORT_RESET ->
PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
[    0.374638] TCPM: state change PORT_RESET -> PORT_RESET_WAIT_OFF
[delayed 100 ms]
[    0.375435] TCPM: pending state change PORT_RESET_WAIT_OFF ->
SNK_UNATTACHED @ 920 ms [rev1 NONE_AMS]
[    0.379490] SMCCC: SOC_ID: ARCH_SOC_ID not implemented, skipping ....
[    0.381481] usbcore: registered new interface driver usbhid
[    0.381972] usbhid: USB HID core driver
[    0.385775] hw perfevents: enabled with armv8_cortex_a55 PMU
driver, 7 counters available
[    0.387875] hw perfevents: enabled with armv8_cortex_a76 PMU
driver, 7 counters available
[    0.390529] optee: probing for conduit method.
[    0.390926] optee: api uid mismatch
[    0.391234] optee: probe of firmware:optee failed with error -22
[    0.394071] NET: Registered PF_PACKET protocol family
[    0.394571] 9pnet: Installing 9P2000 support
[    0.394986] Key type dns_resolver registered
[    0.399904] registered taskstats version 1
[    0.400365] Loading compiled-in X.509 certificates
[    0.400933] mmc0: SDHCI controller on fe2e0000.mmc [fe2e0000.mmc] using =
ADMA
[    0.407446] mmc0: Failed to initialize a non-removable card
[    0.442034] rk808-regulator rk808-regulator.1.auto: there is no dvs0 gpi=
o
[    0.443181] rk808-regulator rk808-regulator.1.auto: there is no dvs1 gpi=
o
[    0.448771] vdd_2v0_pldo_s3: Bringing 1975000uV into 2000000-2000000uV
[    0.450335] vcc_3v3_s3: Bringing 3275000uV into 3300000-3300000uV
[    0.452301] vcc_1v8_s3: Bringing 1775000uV into 1800000-1800000uV
[    0.475134] ehci-platform fc800000.usb: EHCI Host Controller
[    0.475656] ehci-platform fc800000.usb: new USB bus registered,
assigned bus number 1
[    0.476412] ehci-platform fc800000.usb: irq 67, io mem 0xfc800000
[    0.476870] ohci-platform fc840000.usb: Generic Platform OHCI controller
[    0.477563] ohci-platform fc840000.usb: new USB bus registered,
assigned bus number 2
[    0.478298] ohci-platform fc840000.usb: irq 68, io mem 0xfc840000
[    0.480664] fan53555-regulator 0-0042: FAN53555 Option[10] Rev[1] Detect=
ed!
[    0.481424] fan53555-regulator 0-0043: FAN53555 Option[10] Rev[1] Detect=
ed!
[    0.484586] dwmmc_rockchip fe2c0000.mmc: IDMAC supports 32-bit address m=
ode.
[    0.485274] dwmmc_rockchip fe2c0000.mmc: Using internal DMA controller.
[    0.485875] dwmmc_rockchip fe2c0000.mmc: Version ID is 270a
[    0.486417] dwmmc_rockchip fe2c0000.mmc: DW MMC controller at irq
69,32 bit host data width,256 deep fifo
[    0.488188] dwmmc_rockchip fe2c0000.mmc: Got CD GPIO
[    0.491377] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[    0.492171] ehci-platform fc880000.usb: EHCI Host Controller
[    0.492179] ohci-platform fc8c0000.usb: Generic Platform OHCI controller
[    0.492680] ehci-platform fc880000.usb: new USB bus registered,
assigned bus number 3
[    0.493271] ohci-platform fc8c0000.usb: new USB bus registered,
assigned bus number 4
[    0.493350] ehci-platform fc800000.usb: USB 2.0 started, EHCI 1.00
[    0.494008] ehci-platform fc880000.usb: irq 70, io mem 0xfc880000
[    0.494520] hub 1-0:1.0: USB hub found
[    0.494542] hub 1-0:1.0: 1 port detected
[    0.494745] ohci-platform fc8c0000.usb: irq 71, io mem 0xfc8c0000
[    0.501157] mmc_host mmc1: Bus speed (slot 0) =3D 400000Hz (slot req
400000Hz, actual 400000HZ div =3D 0)
[    0.508986] ehci-platform fc880000.usb: USB 2.0 started, EHCI 1.00
[    0.510401] hub 3-0:1.0: USB hub found
[    0.510779] hub 3-0:1.0: 1 port detected
[    0.542084] hub 2-0:1.0: USB hub found
[    0.542438] hub 2-0:1.0: 1 port detected
[    0.562045] hub 4-0:1.0: USB hub found
[    0.562506] hub 4-0:1.0: 1 port detected
[    0.595247] mmc_host mmc1: Bus speed (slot 0) =3D 198000000Hz (slot
req 200000000Hz, actual 198000000HZ div =3D 0)
[    0.748985] usb 1-1: new high-speed USB device number 2 using ehci-platf=
orm
[    0.906736] hub 1-1:1.0: USB hub found
[    0.907309] hub 1-1:1.0: 4 ports detected
[    0.923345] dwmmc_rockchip fe2c0000.mmc: Successfully tuned phase to 51
[    0.923962] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
[    0.925357] mmcblk1: mmc1:aaaa SD32G 29.7 GiB
[    0.932234]  mmcblk1: p1 p2 p3
[    0.986929] Freeing initrd memory: 24648K
[    1.000498] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    1.001061] clk: Disabling unused clocks
[    1.001925] ALSA device list:
[    1.002190]   No soundcards found.
[    1.002595] dw-apb-uart feb50000.serial: forbid DMA for kernel console
[    1.004969] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[    1.005732] cfg80211: failed to load regulatory.db
[    1.007117] Freeing unused kernel memory: 9216K
[    1.029098] Run /init as init process
Loading, please wait...
Starting version 247.3-7+deb11u1
[    1.296214] TCPM: state change PORT_RESET_WAIT_OFF ->
SNK_UNATTACHED [delayed 920 ms]
[    1.301978] FUSB: start drp toggling
[    1.302699] TCPM: state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS=
]
[    1.304531] FUSB: IRQ: VBUS_OK, vbus=3DOn
[    1.307751] FUSB: IRQ: TOGDONE
[    1.314498] FUSB: detected cc1=3DRp-3.0, cc2=3DOpen
[    1.314880] FUSB: cc1=3DRp-3.0, cc2=3DOpen
[    1.315309] TCPM: state change TOGGLING -> SNK_ATTACH_WAIT [rev1 NONE_AM=
S]
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... =
done.
Begin: Running /scripts/local-premount ... done.
Begin: Will now check root file system ... fsck from util-linux 2.36.1
[/sbin/fsck.ext4 (1) -- /dev/mmcblk1p3] fsck.ext4 -a -C0 /dev/mmcblk1p3
[    1.315655] TCPM: pending state change SNK_ATTACH_WAIT ->
SNK_DEBOUNCED @ 200 ms [rev1 NONE_AMS]
[    1.516302] TCPM: state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED
[delayed 200 ms]
[    1.517159] TCPM: state change SNK_DEBOUNCED -> SNK_ATTACHED [rev1 NONE_=
AMS]
[    1.517824] TCPM: polarity 0
[    1.518454] TCPM: Requesting mux state 1, usb-role 2, orientation 1
[    1.519744] FUSB: pd header :=3D Sink, Device
[    1.520320] TCPM: state change SNK_ATTACHED -> SNK_STARTUP [rev1 NONE_AM=
S]
[    1.520745] TCPM: state change SNK_STARTUP -> SNK_DISCOVERY [rev3 NONE_A=
MS]
[    1.521388] TCPM: Setting voltage/current limit 5000 mV 3000 mA
[    1.522016] TCPM: vbus=3D0 charge:=3D1
[    1.522547] FUSB: vbus is already Off
ram: recovering journal
[    1.522857] TCPM: state change SNK_DISCOVERY ->
SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
[    1.528181] FUSB: pd :=3D on
ram: clean, 1521/594512 files, 74956/2374144 blocks
done.
[    1.528977] TCPM: pending state change SNK_WAIT_CAPABILITIES ->
SNK_SOFT_RESET @ 310 ms [rev3 NONE_AMS]
[    1.568848] EXT4-fs (mmcblk1p3): mounted filesystem
b550eef1-48e4-4bac-9312-2ea23c77a372 r/w with ordered data mode. Quota
mode: none.
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    1.650560] EXT4-fs (mmcblk1p3): re-mounted
b550eef1-48e4-4bac-9312-2ea23c77a372 r/w. Quota mode: none.
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Initializing random number generator: OK
Saving random seed: [    1.839341] TCPM: state change
SNK_WAIT_CAPABILITIES -> SNK_SOFT_RESET [delayed 310 ms]
[    1.839362] TCPM: AMS SOFT_RESET_AMS start
[    1.840087] TCPM: state change SNK_SOFT_RESET -> AMS_START [rev3
SOFT_RESET_AMS]
[    1.840461] TCPM: state change AMS_START -> SOFT_RESET_SEND [rev3
SOFT_RESET_AMS]
[    1.841161] TCPM: PD TX, header: 0x8d
[    1.844492] FUSB: sending PD message header: 8d
[    1.844836] FUSB: sending PD message len: 0
[    1.847576] FUSB: IRQ: BC_LVL, handler pending
[    1.847964] FUSB: IRQ: PD tx success
[    1.850111] FUSB: PD message header: 161
[    1.850445] FUSB: PD message len: 0
[    1.850802] TCPM: PD TX complete, status: 0
[    1.851211] TCPM: pending state change SOFT_RESET_SEND ->
HARD_RESET_SEND @ 60 ms [rev3 SOFT_RESET_AMS]
[    1.853070] FUSB: IRQ: BC_LVL, handler pending
[    1.853914] FUSB: IRQ: PD sent good CRC
[    1.856233] FUSB: PD message header: 1a3
[    1.856590] FUSB: PD message len: 0
[    1.857065] TCPM: PD RX, header: 0x1a3 [1]
[    1.857402] TCPM: AMS SOFT_RESET_AMS finished
[    1.857774] TCPM: state change SOFT_RESET_SEND ->
SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
[    1.864223] FUSB: pd :=3D on
[    1.864967] TCPM: pending state change SNK_WAIT_CAPABILITIES ->
HARD_RESET_SEND @ 310 ms [rev3 NONE_AMS]
[    1.877754] FUSB: IRQ: BC_LVL, handler pending
[    1.878606] FUSB: IRQ: PD received hardreset
[    1.879902] TCPM: state change SNK_WAIT_CAPABILITIES ->
HARD_RESET_START [rev3 HARD_RESET]
[    1.887331] FUSB: pd :=3D off
[    1.888078] TCPM: state change HARD_RESET_START ->
SNK_HARD_RESET_SINK_OFF [rev3 HARD_RESET]
[    1.888339] TCPM: vconn:=3D0
[    1.889118] FUSB: vconn is already Off
[    1.889370] TCPM: Requesting mux state 1, usb-role 2, orientation 1
[    1.890621] FUSB: pd header :=3D Sink, Device

Look like Frank sent some patch related(not 100% sure) to this in
linux-usb [1], but the result is the same even with this change. I'm
still debugging tcpm, any pointers on this would be useful.

[1] https://patchwork.kernel.org/project/linux-usb/patch/20230313025843.171=
62-5-frank.wang@rock-chips.com/

Thanks,
Jagan.
