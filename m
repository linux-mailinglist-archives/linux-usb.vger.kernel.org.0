Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696C16C1E6A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Mar 2023 18:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjCTRqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Mar 2023 13:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjCTRpo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Mar 2023 13:45:44 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7C920068
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 10:42:01 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b20so17007456edd.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Mar 2023 10:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679334111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xu/5VY+GMl20szyPzaR/pEliU5nUFtwkgRgRzvdeeks=;
        b=n6VkiZSl5lvoMYFFvNH/ib80yHEvDoMOtObZq+B/l5LX1hnPp4dtnxmeMHOXPyorBX
         +dTpvF0/ehMgDqRAU+opPsgI91o1ssjUgBEZX7PJo81C1x4a7+CUgT/rsF1D/1jFFbfi
         0uuNc2UJWfVUrxxzSavkcX0f41jbT0Pdn4yL4ZgILogefjGMX4/1vXM/reuA/Xc6aLu/
         dCowmIbfAHO2DD4c04wGmGvIA0JX0Nj7CWvozw3FYzrJYS5cCj7y61dxPQfilU4G1SmR
         /V8EgOekrAOBIrLxi7CPCydVez+KdoL5ITJXiO+m3i4J8e566MPqJTbDQ8ySUu+HDG9m
         Ytqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679334111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xu/5VY+GMl20szyPzaR/pEliU5nUFtwkgRgRzvdeeks=;
        b=GkKtg5LekjgQa7F8OXzkRT5r4luMGqPUHc3GdpyVucdORfsJ9gW9/P/AOm+MgnBxI5
         YFIMf8CelTiJ6u2URYt0pZM05JLBqGx1cjw3oD7YetjsvQg13M7XyClY15rYAhPi1kyj
         KXp37g4EXWJEPVoy7bRB8NtGa3pRaVEXfiMqvkaQJB8raNKCZ3D2QoGbLGdW8+JiCuvA
         jisn77WqwSPOpWIeeo0qE/nXpdhVHA/LKEBLsJ7k65HGeaWI6W11Pj560Q0PAUEILZIo
         HkdvP4bRNZonOKrP37KGXxjctFSLqDGqxuQTxzoM3aigR1U0ZAnSf1Iu2tvp6ynQEp/I
         9N5w==
X-Gm-Message-State: AO0yUKW6KgacOWocCf1eW3smNGXIGcEb6GDmvW4gl3kz0Pa4PutsPC0N
        JoABR5N3LFqgObeC1oxH9n9cZVh2W7EuF449ndiDUzEE5as=
X-Google-Smtp-Source: AK7set/H7/FA8A98kKzqAKeOIzUQ8DZ1ln0zEsFiQyo8FTPJj8wI65xievrq2ZzUDVbO9fSsU2SkVQzISNEbKAXfj0o=
X-Received: by 2002:a17:907:119a:b0:931:6a82:ff26 with SMTP id
 uz26-20020a170907119a00b009316a82ff26mr4604981ejb.7.1679334111154; Mon, 20
 Mar 2023 10:41:51 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?G=C3=A1bor_Stefanik?= <netrolller.3d@gmail.com>
Date:   Mon, 20 Mar 2023 18:41:37 +0100
Message-ID: <CA+XFjiqbAXy4cODwmHyLQwmpG_ECVzS6m6c_LYe6=m7hHt7c7Q@mail.gmail.com>
Subject: RFC/Proposal: USB-PD state handoff via DT or ACPI, primarily for
 batteryless systems
To:     linux@roeck-us.net
Cc:     USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As of today, there are several SBCs on the market powered exclusively
via a full-featured USB-C port, using USB-PD. The Radxa ROCK 5B is
perhaps the best known example. These boards typically use a "thin"
USB-C controller and PD PHY chip such as the Fairchild/Onsemi
FUSB302B, requiring the USB-PD state machine to be implemented in
software.

Bringing up the USB-C port on such boards presents unique challenges:
- For full USB, PD & alternate mode functionality, the state machine
needs to be implemented in the HLOS (typically the Linux kernel).
However, the USB-PD specification allows power sources to have a
timeout (typically 5 seconds) within which a newly attached sink must
initiate PD communications - depending on the boot process, this may
be difficult to meet reliably. Power supplies tend to respond to
"late" PD communication in rather problematic ways (not responding at
all, forcing a hard reset, just straight up cutting power, or even
cycling power 3 times in the case of one of my power supplies), so the
5 second timeout is not safe to just ignore.
- To ensure timely PD communication start on boot, it's tempting to
implement a PD driver & state machine in the bootloader or firmware.
This, however, requires either implementing some kind of runtime
firmware<->OS interface (so the firmware can control the PD PHY, while
the OS can control the PD state machine & policy engine in the
firmware), or abandoning full functionality of the port, and
downgrading it to a power-only USB-C port.
- In theory, one can get the best of both worlds by implementing a
simpler PD driver in the firmware, and then handing off to a more
fully functional driver in the operating system, once it boots fully.
This is analogous to how display outputs are typically managed.
Unfortunately, this only results in further problems, as the OS-side
driver needs to discover the state of the USB-C connection and the
existing PD contract without resetting the port (as a reset could
involve a VBUS cut, and thus cause a boot loop, because the VBUS is
the board's sole source of power). The USB-PD standard seems to cater
to this situation using the "soft reset" feature - unfortunately, in
my testing, few (if any) PD power supplies implement the soft reset
mechanism correctly. Most supplies will accept and ACK a soft reset,
only to then issue a hard reset of their own in response. Others send
a garbled PD packet in response, and then cut power.

The alternative to a soft reset would be just retrying communication
with different parameters (e.g. sequence number), until a valid reply
is received. This works with some power supplies, which correctly
ignore out-of-sequence PD communications, but in others, it causes a
hard reset or VBUS cut, just like a proper soft reset packet would.

This leaves no reliable way to have the OS driver take over without
assistance from the firmware driver. To facilitate such assisted
handovers, a standardized way is needed for the firmware driver to
inform the OS driver of the state of each PD-capable USB-C port on the
system.

For a successful handoff, at lest 8 bits of data needs to be passed up
to the OS:
- Sequence number: 3 bits
- Spec version: 2 bits
- Current port data role: 1 bit
- Current port power role: 1 bit (may be omitted if the only goal is
to support batteryless systems with USB-PD as the sole power source,
as in this case, this will always be "sink", but systems with a
battery may want to do a handoff for faster boot as well, and they
would want to indicate "source" here if that's what was negotiated)
* Port orientation: 1 bit (not needed for FUSB302-based systems as one
can probe port orientation passively without the port partner
detecting a reset, but other PD chips may not offer this option)

Additionally, passing the active PDO to the OS as part of the handoff
data could also be useful.

Considering the market for SBCs with the 3 most popular architectures
(x86, ARM64 and RISC-V), they all seem to fall into 3 categories as
far as their boot process goes (u-boot or vendor bootloader + DT, UEFI
+ DT, UEFI + ACPI). Each of these boot processes potentially require a
different solution to the PD handoff problem.

I propose the following handoff mechanisms:
- For Device Tree systems with non-UEFI bootloaders (e.g. u-boot
without bootefi support), a new DT parameter could be defined on the
USB-C port device. e.g. of the form "pd-state =3D 0x8b;" which the
bootloader/firmware would update before passing control to the OS
kernel. This requires the bootloader to parse and modify the FDT blob,
but has no other dependencies, e.g. no need for runtime variable
support.
- For bootloaders implementing UEFI but not ACPI, FDT blob
modification can be avoided by passing the handoff data in a UEFI
variable. The device tree can then reference this variable by name
(e.g. pd-handoff-variable =3D "Pd0001" - different for each port on a
system with multiple PD-capable Type C ports), so when the operating
system boots, the kernel driver can retrieve this variable and
continue PD communications seamlessly.
- Finally, for bootloaders implementing ACPI, the DSDT entry for the
Type C port could include a new ACPI control method, e.g.
"Method(PDST, 0, NotSerialized)". This method, when called by the
operating system, returns the USB-PD state of the port at handoff, so
the kernel driver can pick up PD communication where the firmware has
left off. Unlike in the DT case, there is no need for separate UEFI vs
non-UEFI mechanisms here, because the ACPI Source Language is
versatile enough to enable firmware vendors to implement this control
method in a variety of ways (e.g. by reading a firmware variable,
reading a fixed memory location, calling a runtime service, or even
just by having the firmware patch the value returned by the method in
the DSDT AML itself).

Additionally, it would be useful for the OS-side driver to know if a
PD-enabled Type-C port is critical for the power supply of the system,
so it can e.g. avoid triggering hard resets on that port. For Device
Tree systems, the easy solution may be a boolean property, however I
wonder if it would be more descriptive to actually have the Type-C
port declare a regulator it produces (representing VBUS), and then
have the rest of the system's power regulators depend on it. The ACPI
equivalent to this would be having the port produce a power resource,
and have the rest of the system consume it.

Ideas, comments, etc. welcome.

Sincerely,
G=C3=A1bor Stefanik
