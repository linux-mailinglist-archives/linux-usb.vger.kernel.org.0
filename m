Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 951C45B78A4
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 19:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233580AbiIMRrI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 13:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233577AbiIMRqf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 13:46:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85FBA6E2C1
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 09:43:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D0C5861342
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 16:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44B76C433D6
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663087427;
        bh=nBOEki4j4khLp1Y1/4tol0ObnjY7POQg/ohKqNDciEY=;
        h=From:To:Subject:Date:From;
        b=Dk26QgM5GONPLhbJjd8+KTy0YRr3vg1fcrr7X1OyvCJvAoNXs4Qr8iCgMxh+MUxk6
         Hl9O/qrXoGC8TgIcG5jI3lrynAoRiyKIeQyjY4cwNuGn3DRPUQAoiKUHiNCeWicFO3
         EqjRACHR8NlihBp69Qpcz1QMxcCU1CTl4p2zRnpjhLGnPUapseG01rb/mBNRWetgG4
         8ZM1FbHKHK4DqZJuUEs3ywrQ+USJtUDTtbEdysvRLk+g7tG+dwPQrxX33nE5XF8PpT
         NRljDnw8AVMJF4sqp3eJsXWLAQ+Zy6lH8fS95+NeZ3tMYaoLoqph/X5o1WU6HNZLPR
         N7km+5TD4/WWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2B377C433E4; Tue, 13 Sep 2022 16:43:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216483] New: Logitech HID++ feature ADC_MEASUREMENT=0x1F20
 reports battery information
Date:   Tue, 13 Sep 2022 16:43:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pfpschneider@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216483-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216483

            Bug ID: 216483
           Summary: Logitech HID++ feature ADC_MEASUREMENT=3D0x1F20 reports
                    battery information
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.7
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pfpschneider@gmail.com
        Regression: No

This report may only be relevant for Logitech headset devices and is certai=
nly
not relevant for USB in general but there doesn't seem to be a better compo=
nent
to use.


The HID++ feature ADC_MEASUREMENT=3D0x1F20 provides battery information for=
 some
Logitech devices, perhaps only a few devices.  I have a report of this feat=
ure
on a Logitech PRO X Wireless Gaming Headset, as shown by the following outp=
ut
from Solaar (https://github.com/pwr-Solaar/Solaar).  So this information mi=
ght
be useful for kernel-level control and reporting on headset devices.

```
Solaar version 1.1.4

  1: Logitech PRO X Wireless Gaming Headset
     Device path  : /dev/hidraw2
     USB id       : 046d:0ABA
     Codename     : PRO Headset
     Kind         : headset
     Protocol     : HID++ 4.2
     Serial number:
     Model ID:      000000000ABA
     Unit ID:       FFFFFFFF
          Firmware: U1  12.01.B0203
     Supports 6 HID++ 2.0 features:
         0: ROOT                   {0000}
         1: FEATURE SET            {0001}
         2: DEVICE FW VERSION      {0003}
            Firmware: Firmware U1  12.01.B0203 0ABA
            Unit ID: FFFFFFFF  Model ID: 000000000ABA  Transport IDs: {'bti=
d':
'0000', 'btleid': '0000'}
         3: DEVICE NAME            {0005}
            Name: PRO X Wireless Gaming Headset
            Kind: None
         4: EQUALIZER              {8310}
         5: SIDETONE               {8300}
         6: ADC MEASUREMENT        {1F20}
```

I have documentation for the feature but I can't distribute it. Here is the
code in Solaar that handles the feature.  The mapping from levels to remain=
ing
capacity is not based on the battery in the device so a good implementation
should get the actual information from Logitech.

```
    ADC_MEASUREMENT=3D0x1F20,

# voltage to remaining charge from Logitech (for a different battery)
battery_voltage_remaining =3D (
    (4186, 100),
    (4067, 90),
    (3989, 80),
    (3922, 70),
    (3859, 60),
    (3811, 50),
    (3778, 40),
    (3751, 30),
    (3717, 20),
    (3671, 10),
    (3646, 5),
    (3579, 2),
    (3500, 0),
    (-1000, 0),
)

def get_adc_measurement(device):
    try:  # this feature call has been known to produce errors so be extra
cautious
        report =3D feature_request(device, FEATURE.ADC_MEASUREMENT)
        if report is not None:
            return decipher_adc_measurement(report)
    except FeatureCallError:
        return None


def decipher_adc_measurement(report):
    # partial implementation - needs mapping to levels
    adc, flags =3D _unpack('!HB', report[:3])
    for level in battery_voltage_remaining:
        if level[0] < adc:
            charge_level =3D level[1]
            break
    if flags & 0x01:
        status =3D BATTERY_STATUS.recharging if flags & 0x02 else
BATTERY_STATUS.discharging
        return FEATURE.ADC_MEASUREMENT, charge_level, None, status, adc

```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
