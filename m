Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8873D21DB94
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 18:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbgGMQVZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 13 Jul 2020 12:21:25 -0400
Received: from sender4-op-o17.zoho.com ([136.143.188.17]:17784 "EHLO
        sender4-op-o17.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729593AbgGMQVY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 12:21:24 -0400
X-Greylist: delayed 903 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Jul 2020 12:21:24 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1594656370; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Ha7k+CCN6jQjNKDb9ZYB9YU+RHDYozuTji9vMqqkS7jG0IuxNO3WiNBnxfIM4c5/Rg0r8G48GlemAobS3waazvNhRBeRYlTKFVGEeC2KdekLQWmAzIBAHsxdQWo3kPSlnn/tIYd707Gh6/abNU/UadVBlbpHylcKIAmG+1jMwpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1594656370; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=7KSZTOs+/hEim4hLOZbcVt3SaaLm51cMpcgcMyNKHMI=; 
        b=PQ1bMLrOEE/yW35Dr8naMJFU5An/qYubYn4i55Xq2fC4Rbx8KaGfmBErywraGRNOZDNaeJIuhe8DnUMjj/vADSZ2kF9kl1oOcmiF0lX+tJ03KpeojWmX1aXXttNCzz1p+MlcaQlLiqpxePRg8PzQjOx+pYhMJRO5L6b/WSD7rBE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from gothmog.test (pool-108-28-30-30.washdc.fios.verizon.net [108.28.30.30]) by mx.zohomail.com
        with SMTPS id 1594656369264747.1241619546078; Mon, 13 Jul 2020 09:06:09 -0700 (PDT)
From:   Dan Robertson <dan@dlrobertson.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dan Robertson <dan@dlrobertson.com>
Message-ID: <20200713160522.19345-1-dan@dlrobertson.com>
Subject: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
Date:   Mon, 13 Jul 2020 12:05:21 -0400
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When testing suspend for another driver I noticed the following warning:

WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
Hardware name: Hardkernel ODROID-N2 (DT)
[..]
pc : reset_control_assert+0x184/0x19c
lr : dwc3_meson_g12a_suspend+0x68/0x7c
[..]
Call trace:
 reset_control_assert+0x184/0x19c
 dwc3_meson_g12a_suspend+0x68/0x7c
 platform_pm_suspend+0x28/0x54
 __device_suspend+0x590/0xabc
 dpm_suspend+0x104/0x404
 dpm_suspend_start+0x84/0x1bc
 suspend_devices_and_enter+0xc4/0x4fc

In my limited experience and knowlege it appears that we hit this
because the reset control was switched to shared and the the use
of the reset control was not changed.

> * Calling reset_control_assert without first calling reset_control_deassert
> * is not allowed on a shared reset control. Calling reset_control_reset is
> * also not allowed on a shared reset control.

The above snippet from reset_control_get_shared() seems to indicate that
this is due to the use of reset_control_reset() in dwc3_meson_g12a_probe()
and reset_control_deassert is not guaranteed to have been called
before dwc3_meson_g12a_suspend() and reset_control_assert().

After some basic tests with the following patch I no longer hit the
warning. Comments and critiques on the patch are welcome. If there is a
reason for the current use of the reset control, I'd love to learn why!
Like I said before, I have not really looked at this driver before and
have verify limited experience with reset controls... Was working on
another driver, hit the warning, and thought I'd take a shot at the
fix :-)

Cheers,

 - Dan

Dan Robertson (1):
  usb: dwc3: meson-g12a: fix shared reset control use

 drivers/usb/dwc3/dwc3-meson-g12a.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)


