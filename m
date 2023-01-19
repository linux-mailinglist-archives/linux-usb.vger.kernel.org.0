Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 227E9673C6F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jan 2023 15:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbjASOlG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Jan 2023 09:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbjASOkK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Jan 2023 09:40:10 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B6A67974
        for <linux-usb@vger.kernel.org>; Thu, 19 Jan 2023 06:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1674139156; bh=tII4KgQVDHv8aIPFSz1AQlhY05ZkeX4hFZhDFjQXMQM=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=dslH0K+ynxVIPvXj2hMDK8P0Z2ahWrAbmY0Ai3eG0Aq/t/NYgtM+PPR2qy3kHDw9T
         dp0RgGjsyQqRxnx0i2kOLYgeJ4xOPadXVPZtQrYkcnGSmXIvcfr3jbtjugdzD7Cj2K
         a3uQLUWRRT+lkjumWg+8MfRLO6iO+kDqKoz582R3UT0CGsdu1czQLgaFcVFQXrNhfy
         hz36CN7ycS0+coYc3jJWIWppgzA3MNbU1jcNWdjIhcPH+X4L6EmtGHqiPBjPquBS7M
         CetCuexG3DECq6+qMfDzDAAstJS7EEETWxEnfW+Q1/aHT9DGfENdmy9SooNeGjrInq
         9xpjFgbqszAwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoRA-1pXNNi2VBW-00EwiG; Thu, 19
 Jan 2023 15:39:16 +0100
Message-ID: <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
Date:   Thu, 19 Jan 2023 15:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible problem with thunderbolt 4
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y8kXFFrue7l7DKf3@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NHoMIxFeQYJROrLP74TtdchqMIJhD7b/3aE8ghU8IZEqngDNaOO
 wpfOO8CBcnOfCVlvmGybLT614/TDlOiOyORQV8KQ0ANYeiZHyKBO85LCaKSZN+9pxhEaRnd
 M3nrZSXiNlJtobO758plisbIA/EFXouhQtgEr99laQ21eLvX+lHzdnIlvSWycygeGAzj5YQ
 QP05Y2C1RhofDjNSUagjA==
UI-OutboundReport: notjunk:1;M01:P0:06kRRVftPNU=;0IlJgq1wOF/s53912Yzv7QjqWAY
 N4GTO+06dlMU1L02DWHCdlYG2kh8t/R/rfL6e5v7FyyPN9oQpxwfZDmUpXoe9rkmK2gtvLA2c
 JWCuASzvGktACO8pn37aeCmlx2iuXqE/p4jTXDjG8WaESccPbzMRBG4T8DyKG+Hwmwks7vBWW
 kloDNhvhaDVj757g4nM0vEHgBKMDo0cDIgxa/yHt25pwhLjFgdw8shS3nlEYbJyREc66WrEGw
 8u079OPJNjHLrXsMWOi0zPAZG22jaQmpW9N75Kr/PCsncwp1TodltBpOwKhkGoTmjtOpOh4Qm
 8VBd3bkbn3UQYmRl1vf6yDq5HUv8FhtE8UI7/5nAPFilZB6dttpPXpv8ozR3IKpqAy+oYvl7R
 Q6qrVPAlX/3sOrvLWAJLDVdFxk0nk4xZUW1CocHXUXB+RsS0Y3to64tDFiiqOoHl2G/19f45q
 aaalHcIIk5K73pFnl07ebCkk9hrYWXsgUQ9J1wxf2bKl+3ypFQekkkV51KRfv1Qk5DOehPsPj
 EoYn82z3eguUT229rmsQ6os+O7LK4rc+GyTv8jx6HHrU0MAr2vQpGtCoXS5eTnTcgHVSzngN3
 h+qBAPXgm34FEmmWm3z5Hvbv60D0tdyeMue7EvC+YRHALjf9A1R1lWd33HHNaYG1JbE3X4AbG
 wXHWoXWHjMPURWUut0cil7L638CHVSJLcl1P4ZCMMYaYcy6hUDDp6NWx61r4s16bGvxQQs38u
 D9vpxIh0wTJXTj9ZS58MZhRi9p/H819MtIKrtXSnxnUOQIB2qWvtw1/705jTVv72umnN9fxFs
 zNCxFX4jFv2I6hSR4572750SzMcWLi3xjwvLnhrJcyIybuCNIO6IbsZuzgZzAbu0a9hcoQR8D
 XVL9QenmZZ7TatDAdMC6RB6PO2Ig9oDMpxtKnSTvgyUY5CLnAy+ZOO57kRU+ZNM3oaDLOf5jg
 csaTNg==
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
>> 8beb71759cc8fddd937cadf9ec482e524d4f0f1c is the first fixed commit
>> commit 8beb71759cc8fddd937cadf9ec482e524d4f0f1c
>> Author: Pierre Gondois <pierre.gondois@arm.com>
>> Date:=C2=A0=C2=A0 Wed May 18 11:08:58 2022 +0200
>>
>> =C2=A0=C2=A0=C2=A0 ACPI: bus: Set CPPC _OSC bits for all and when CPPC_=
LIB is supported
>> =C2=A0=C2=A0 =C2=A0
>> =C2=A0=C2=A0=C2=A0 [ Upstream commit 72f2ecb7ece7c1d89758d4929d98e95d95=
fe7199 ]
>> =C2=A0=C2=A0 =C2=A0
>> =C2=A0=C2=A0=C2=A0 The _OSC method allows the OS and firmware to commun=
icate about
>> =C2=A0=C2=A0=C2=A0 supported features/capabitlities. It also allows the=
 OS to take
>> =C2=A0=C2=A0=C2=A0 control of some features.
>> =C2=A0=C2=A0 =C2=A0
>> =C2=A0=C2=A0=C2=A0 In ACPI 6.4, s6.2.11.2 Platform-Wide OSPM Capabiliti=
es, the CPPC
>> =C2=A0=C2=A0=C2=A0 (resp. v2) bit should be set by the OS if it 'suppor=
ts controlling
>> =C2=A0=C2=A0=C2=A0 processor performance via the interfaces described i=
n the _CPC
>> =C2=A0=C2=A0=C2=A0 object'.
>> =C2=A0=C2=A0 =C2=A0
>> =C2=A0=C2=A0=C2=A0 The OS supports CPPC and parses the _CPC object only=
 if
>> =C2=A0=C2=A0=C2=A0 CONFIG_ACPI_CPPC_LIB is set. Replace the x86 specifi=
c
>> =C2=A0=C2=A0=C2=A0 boot_cpu_has(X86_FEATURE_HWP) dynamic check with an =
arch
>> =C2=A0=C2=A0=C2=A0 generic CONFIG_ACPI_CPPC_LIB build-time check.
>> =C2=A0=C2=A0 =C2=A0
>> =C2=A0=C2=A0=C2=A0 Note:
>> =C2=A0=C2=A0=C2=A0 CONFIG_X86_INTEL_PSTATE selects CONFIG_ACPI_CPPC_LIB=
.
>> =C2=A0=C2=A0 =C2=A0
>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Pierre Gondois <pierre.gondois@arm.co=
m>
>> =C2=A0=C2=A0=C2=A0 Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@i=
ntel.com>
>> =C2=A0=C2=A0=C2=A0 Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>> =C2=A0drivers/acpi/bus.c | 16 ++++++++--------
>> =C2=A01 file changed, 8 insertions(+), 8 deletions(-)
>>
>> I've no idea why this solves the issue on the Lenovo, and obviously it =
doesn't solve it on the HP, but maybe this rings a bell somewhere? (Note: =
in my woking kernel config (on the Lenovo) I have neither CONFIG_X86_INTEL=
_PSTATE nor CONFIG_ACPI_CPPC_LIB set...)
> Can you check if with this commit reverted does Thunderbolt use software
> or firmware connection manager? (You can see this in the logs when
> thunderbolt.dyndbg=3D+p is in the command line).
>
You're right! With this commit reverted it uses the software connection ma=
nager, with the commit applied it uses the firmware connection manager.
>> Previously you said you'd talk with your Windows folks about this; any
>> news from there?
> I've talked to them and still in talks with the UEFI folks but the
> current undestanding is that Windows does not do anything special when
> the system is rebooted (so equal to what Linux does). There is one
> "development" system in Israel lab that should be pretty similar to what
> the HP system of yours is but the person who was going to try to
> reproduce is in sick leave now.
Ok...

Regards,
Christian

