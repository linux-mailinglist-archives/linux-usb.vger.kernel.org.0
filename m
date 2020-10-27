Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C77729A7E0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 10:30:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895604AbgJ0JaD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 05:30:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895587AbgJ0JaB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 05:30:01 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16C932225C;
        Tue, 27 Oct 2020 09:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603790999;
        bh=EP+RJxMRyDXzl24doYQ2hDPaBhxK1tCPAAW10CdFHR0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=m9Cze78q/3PSW/KpXykPApuTZvsUBrXx7El+5M3Fsp3PaN+8CvwEN1j+Aqx6gKNYB
         bdX1m/bXv5jbXN7JjE9ouOKzDTZHwAYLNeugOPwbSm3eNAj+LKzpCMsxKvIaMNI5gt
         rylS5AX1fZ2uNTcN8UzkEJGy8F6WEFrxbP7eVL5k=
From:   Felipe Balbi <balbi@kernel.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 00/15] usb: dwc2: Fix and improve power saving modes.
In-Reply-To: <2edb35af-bf0b-bfab-69c7-9b7f0cac6a69@synopsys.com>
References: <20201011135035.7C61DA005E@mailhost.synopsys.com>
 <2edb35af-bf0b-bfab-69c7-9b7f0cac6a69@synopsys.com>
Date:   Tue, 27 Oct 2020 11:29:52 +0200
Message-ID: <875z6wc8z3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Minas Harutyunyan <Minas.Harutyunyan@synopsys.com> writes:
> On 10/11/2020 5:50 PM, Artur Petrosyan wrote:
>> This patch set fixes/improves partial power down, hibernation power
>> saving modes and adds support for host/device clock gating.
>>=20
>> Changes from V1:
>>   - Added new patches.
>>    1. usb: dwc2: Add support for dwc2 host/device clock gating.
>>    2. usb: dwc2: Add exit power saving mode before removing driver.
>>    3. usb: dwc2: Fix HPRT0.PrtSusp bit setting for HiKey 960 board.
>>=20
>>   - Updated patches
>>    1. usb: dwc2: Fix/update enter/exit partial power down.
>> 	- Updated the patch name from "usb: dwc2: Fix
>> 	dwc2_restore_device_registers() function." to "usb: dwc2:
>> 	Fix/update enter/exit partial power down."
>> 	- Updated entering and exiting partial power down function
>> 	flow. Before there was a lot of confusions with core
>> 	entering to partial power down in device or host mode.
>> 	- Added "rem_wakeup" for host exiting from Partial Power
>> 	Down mode from host remote wakeup flow. According to
>> 	programming guide in host mode, port power must be
>> 	turned on when wakeup is detected.
>> 	- Added "in_ppd" flag to indicate the core state after
>> 	entering into Partial Power Down mode.
>>    2. usb: dwc2: Fix wakeup detected and session request interrupt handl=
ers.
>> 	- According to programming guide added partial power
>> 	down exit flow in wakeup detected interrupt handler.
>> 	- Added clock gating exit flow from wakeup detected
>> 	and session request interrupt handlers.
>>    3. usb: dwc2: Fix suspend state in host mode for partial power down.
>> 	- Added "dwc2_port_suspend" and "dwc2_port_resume" functions to
>> 	"core.h" header file
>> 	- Updated "USB_PORT_FEAT_RESET" flow when core receives port
>> 	reset in Partial Power Down or Hibernation state.
>> 	- Added return "-ENODEV" if core is in suspend state
>> 	in "_dwc2_hcd_urb_enqueue" function to avoid port
>> 	reset issue, when an external hub is connected.
>>    4. usb: dwc2: Add part. power down exit from dwc2_conn_id_status_chan=
ge().
>> 	- Instead of clearing registers inline for exiting partial power down
>> 	mode, now calling the "dwc2_exit_partial_power_down" function without
>> 	restoring the backup registers.
>>    5. usb: dwc2: Update dwc2_handle_usb_suspend_intr function.
>> 	- Added changes suggested by Douglas Anderson from commit
>> 	"usb: dwc2: Get rid of useless error checks for
>> 	hibernation/partial power down"
>>    6. usb: dwc2: Fix hibernation between host and device modes.
>> 	- Added setting of "hsotg->bus_suspended" flag to 0 because before if
>> 	core exited from "GPWRDN_STS_CHGINT" interrupt in host mode the flag
>> 	remained true not letting enter to hibernation next time.
>>    7. usb: dwc2: Clear fifo_map when resetting core.
>> 	- Added "static inline void dwc2_clear_fifo_map()" helper
>> 	function to clear fifo_map with peripheral or dual role mode.
>> 	- Added a dummy version of "dwc2_clear_fifo_map()" helper
>> 	for host-only mode.
>>    8. usb: dwc2: Add power saving mode support from system issued suspen=
d/resume.
>> 	- Updated the patch name from "usb: dwc2: Add enter/exit hibernation
>> 	from system scheduled suspend" to "usb: dwc2: Add power saving mode
>> 	support from system issued suspend/resume."
>> 	- Fixed issue related to "spinlock already unlocked" reported by Doug
>> 	Anderson.
>>=20
>>   - Abandoned patches.
>>    1. usb: dwc2: Add port conn. sts. checking in _dwc2_hcd_resume() func=
tion.
>> 	- The changes of this patch are moved to the "usb: dwc2: Add power
>> 	saving mode support from system issued suspend/resume" patch.
>>    2. usb: dwc2: Add flag and debug messages for Partial Power Down mode.
>> 	- The changes of this patch are moved to the "usb: dwc2: Fix/update
>> 	enter/exit partial power down." patch.
>>=20
>>=20
>> Artur Petrosyan (15):
>>    usb: dwc2: Fix/update enter/exit partial power down.
>>    usb: dwc2: Add support for dwc2 host/device clock gating.
>>    usb: dwc2: Fix wakeup detected and session request interrupt handlers.
>>    usb: dwc2: Fix suspend state in host mode for partial power down.
>>    usb: dwc2: Add part. power down exit from
>>      dwc2_conn_id_status_change().
>>    usb: dwc2: Reset DEVADDR after exiting gadget hibernation.
>>    usb: dwc2: Add default param to control power optimization.
>>    usb: dwc2: Update dwc2_handle_usb_suspend_intr function.
>>    usb: dwc2: Fix hibernation between host and device modes.
>>    usb: dwc2: Fix HPRT0.PrtSusp bit setting for HiKey 960 board.
>>    usb: dwc2: Allow exiting hibernation from gpwrdn rst detect
>>    usb: dwc2: Clear fifo_map when resetting core.
>>    usb: dwc2: Clear GINTSTS_RESTOREDONE bit after restore is generated.
>>    usb: dwc2: Add power saving mode support from system issued
>>      suspend/resume
>>    usb: dwc2: Add exit power saving mode before removing driver

where are all the patches? I only got the cover letter. When resending,
please collect Minas' acked-by.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+X6JARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZmIg/+LlaU8LgMCybPfu0lXLTkmjoD9bPr33D1
FmmBm+9ooSkw038DnAt37xur2B4b6PmR0K+rhu2C+ODkunJjDKzchSVHg+Bm1uDE
Jf/5Er31FQTs7nu8w6EtrKmJ22roYuajNZnudp7u8KgE8vz2Ga1kmbuanqE+6YKu
R8p6MmNJt9zKo3iOg+229njNndhc65pg4cLGwu9qi2NLPI1BK881dKtJMPn8/MPt
AtXd1J/NbvuCWlV08Inp8sKy6pKRo+Wty82wgNLXx9rEY8UEC1UoMpHqo9GeFonb
ycypM8hyAnmLuZE4UAhPq/hnrl5B4PsxlumpDy/ys2awQYFWNKCPwgu59+C0X9Or
v6IUJRMcs2QJZQF7uQer2zC+9QlSq8JmBdWSrvFXOqQhgFQyLx1CivXFL6hOASCY
rmuEKM7M87/6oIsHfHK23N4pPuBuhRzymFeNphWHC3EgzLMxRg3lSryqVFzKHMZy
59oN+MybvHHMVX2bUNg3Dy8lekFm37gNo3cMfAIU4EABwbP6omtPhhgnWFaxyu+U
oRyflDhGQkAk3/XIiwEQLJsooml/1Poaq+aQQ2cT5C3mPMtnvISnf8onJHn2TrhE
RgTntG7i2Z0ypozH0fvtaefh6wlAC2bkkeqDohbuHkSswuZJSi26ouoSN70cEwdO
pjIydG5Lw/Y=
=43cs
-----END PGP SIGNATURE-----
--=-=-=--
