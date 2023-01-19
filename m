Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D7E6734A4
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jan 2023 10:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjASJnH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Jan 2023 04:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbjASJnD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Jan 2023 04:43:03 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8719269B18
        for <linux-usb@vger.kernel.org>; Thu, 19 Jan 2023 01:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1674121370; bh=Mghf2X8utTGvrIhRmMFvpd4/dyYaSIW8CseRj/FYlc4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=j9hdICcYQuX11YQRUNjQEDVYy57gFJaR6wWiY1i+G+7Iyy/V4t+TTsZn/3revsJ2J
         SDKyKW1wjImxM9mMmImRkxQ+SD8J1iRlDhtiIZs3Js1UKtVQcQ5VRxUJPMk6bh02U4
         XU9DfDKhb9YraNaWx3Ov+xL6q8NC+KMBlgRtwzucTF6vgZH4EN4vyLtYKWVWvMFIkh
         +5Sp36jyqEqQ4sdOFfiNriZkus3RMmFCSEPj7GbniNs8igm2BavhgBcHImTcRDA4HT
         wDznZs5DP4HPgGaSnDtfwNhlh5d9yU8G3P7HKfqOLGeX6fS+k1Of1x8cPPhfm2JgwH
         LAw/Ty81fX90g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjS9I-1oqZkW32yo-00kxTF; Thu, 19
 Jan 2023 10:42:50 +0100
Message-ID: <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
Date:   Thu, 19 Jan 2023 10:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible problem with thunderbolt 4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
Content-Language: en-US
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y76TS54PJpmseZs3@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tp7wItFB39epj+WIrRt5lbFziPVZBdSuib9Y2/Drk7BF2pn4wA7
 VyZ3Mf3eLCdOAghre4DwAQApbKNom5eV+hHCj4ljuGB80yjNrg9iWW6ZUEjFgzIovV0HzdC
 dFZu2zLp5QvdnvrfbAJbsHg6ccLPi/aXFIpUOsllrmc87dY5Nz3n/Tk0cKfoabGd2tRipGD
 GEJJK+DBMcnqMvys+I/GA==
UI-OutboundReport: notjunk:1;M01:P0:Z+quJP1EZ1k=;26N96013ERhiIWwXj78KQAk5KNb
 MquFpoM/REFmsrm27S8F9sDnbx0BZpmec22rdptbZVMciuu1C6nPMi9yHvhI9UAsvaG49/vw9
 9oaQINqn74H0LzkfjomBYYSB4eX/WaYiiPOlgqSJA/k8PGkGZpw2kdERuOMMomU55eJJJKwWI
 BmiQKIMQSV2bnSz9KFEzT7gWnLYXMWM4lyGMS0Vzt4/k0BLjEdRLOcRfl9nSIwlgl6EFcqVVE
 D3H57/qZXHFAS6vc21ksr5KlFQx9J8hIum2NUebO7Xa7M6QFucKQke+qD0giJSuGNabEfExvy
 LWZDPcZNGMzeG/4kL6shvJKLlJVoiaBUAZZhfAuXTQQwlk/asQd7x2NaGwqbdv7vIKHsP+RS2
 uyaO9lz+cQu6aV5k/ynUwTs9F5dRKfP2RZl6hFg6ltAYnSMFj1QfKEZPlw2HgI8j6oli+FSTz
 ekIApBE4VwF1iy34521krfYCrfqRDWKT8U9d4hJs2UJWIbMzjGie9/OQ9pGQdW2TAGswxo19q
 vyeJB8xk6q2vD7yqubNZHakYOJYHngDexNDqenAF6Lnhh8YrJO+BqPiffBx7qFKhh3rChv7Me
 2ikHGraAK1QRrDF7nOYCZNkCwUa4npiqUZZBnt3YXCUpoMoPE0zAuGGLG+XQfS0NN89PLGLio
 3B+HTF1WlSw/Z4F15SQkuZ79SSZsTwWyomm4QF1lYj1OFZGdTUuenK5VZkNcb/GL7CopWU+3L
 T9scOYlSLG2NZcOLlqU9crT04ADM81zspl6Bp3bL+EtEQRbUUbbaczxFw4sctzXzSFW74zqym
 WW0w1y0j8sNssuNuqvEQcdvcnXLoTvw3zfolnQZD1/qCKI+XwgLQBAUNs/S/h18N7qdkEIFEw
 LkvJaGUHGVv7VF8AmGmpCrd9SVdtssYRSvvLaHHkwqlSUp2YVSoFqYZnTdfjTP7X43Ra1SZGg
 6q04Uw==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

>> What I _did_ find out is this: if I disable ACPI on the kernel command
>> line (acpi=3Doff), things work fine. I can even boot with the dock
>> unplugged, then plug it when linux is up, and it works in linux, and
>> also after the reboot in the firmware!
>>
>> Of course switching off ACPI is not a real option... but maybe this
>> brings some light into the dark...
> It pretty much disables a lot of functionality so I don't think it helps
> here, unfortunately.

I may have some more information on this issue, though I'm not sure if thi=
s will help... the thing is this:

this week I got a brandnew Lenovo Thinkpad Yoga X1 along with a Lenovo Thu=
nderbolt 4 Workstation Dock, all thunderbolt 4. And at first it seemed to =
behave exactly like the HP combo; namely after booting Ubuntu 22.04 (which=
 ships with a=C2=A0 5.15 kernel) the dock is gone in the firmware after th=
e reboot, and subsequently later in Windows. Same behaviour with 5.18.9. A=
nd to my big surprise, with 5.18.11 the issue is gone! I've bisected it do=
wn to this commit:

8beb71759cc8fddd937cadf9ec482e524d4f0f1c is the first fixed commit
commit 8beb71759cc8fddd937cadf9ec482e524d4f0f1c
Author: Pierre Gondois <pierre.gondois@arm.com>
Date:=C2=A0=C2=A0 Wed May 18 11:08:58 2022 +0200

=C2=A0=C2=A0=C2=A0 ACPI: bus: Set CPPC _OSC bits for all and when CPPC_LIB=
 is supported
=C2=A0=C2=A0 =C2=A0
=C2=A0=C2=A0=C2=A0 [ Upstream commit 72f2ecb7ece7c1d89758d4929d98e95d95fe7=
199 ]
=C2=A0=C2=A0 =C2=A0
=C2=A0=C2=A0=C2=A0 The _OSC method allows the OS and firmware to communica=
te about
=C2=A0=C2=A0=C2=A0 supported features/capabitlities. It also allows the OS=
 to take
=C2=A0=C2=A0=C2=A0 control of some features.
=C2=A0=C2=A0 =C2=A0
=C2=A0=C2=A0=C2=A0 In ACPI 6.4, s6.2.11.2 Platform-Wide OSPM Capabilities,=
 the CPPC
=C2=A0=C2=A0=C2=A0 (resp. v2) bit should be set by the OS if it 'supports =
controlling
=C2=A0=C2=A0=C2=A0 processor performance via the interfaces described in t=
he _CPC
=C2=A0=C2=A0=C2=A0 object'.
=C2=A0=C2=A0 =C2=A0
=C2=A0=C2=A0=C2=A0 The OS supports CPPC and parses the _CPC object only if
=C2=A0=C2=A0=C2=A0 CONFIG_ACPI_CPPC_LIB is set. Replace the x86 specific
=C2=A0=C2=A0=C2=A0 boot_cpu_has(X86_FEATURE_HWP) dynamic check with an arc=
h
=C2=A0=C2=A0=C2=A0 generic CONFIG_ACPI_CPPC_LIB build-time check.
=C2=A0=C2=A0 =C2=A0
=C2=A0=C2=A0=C2=A0 Note:
=C2=A0=C2=A0=C2=A0 CONFIG_X86_INTEL_PSTATE selects CONFIG_ACPI_CPPC_LIB.
=C2=A0=C2=A0 =C2=A0
=C2=A0=C2=A0=C2=A0 Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
=C2=A0=C2=A0=C2=A0 Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
=C2=A0=C2=A0=C2=A0 Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@inte=
l.com>
=C2=A0=C2=A0=C2=A0 Signed-off-by: Sasha Levin <sashal@kernel.org>

=C2=A0drivers/acpi/bus.c | 16 ++++++++--------
=C2=A01 file changed, 8 insertions(+), 8 deletions(-)

I've no idea why this solves the issue on the Lenovo, and obviously it doe=
sn't solve it on the HP, but maybe this rings a bell somewhere? (Note: in =
my woking kernel config (on the Lenovo) I have neither CONFIG_X86_INTEL_PS=
TATE nor CONFIG_ACPI_CPPC_LIB set...)

Previously you said you'd talk with your Windows folks about this; any new=
s from there?

Thanks and best regards,
Christian


