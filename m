Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42C61141A82
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 00:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgARXy7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Jan 2020 18:54:59 -0500
Received: from metropolis.steve-m.de ([78.46.204.175]:33440 "EHLO
        metropolis.steve-m.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgARXy7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jan 2020 18:54:59 -0500
X-Greylist: delayed 488 seconds by postgrey-1.27 at vger.kernel.org; Sat, 18 Jan 2020 18:54:58 EST
Received: from [192.168.3.100] (p57AF1C03.dip0.t-ipconnect.de [87.175.28.3])
        (Authenticated sender: steve@steve-m.de)
        by metropolis.steve-m.de (Postfix) with ESMTPSA id 715E91A0041;
        Sun, 19 Jan 2020 00:46:49 +0100 (CET)
To:     linux-usb@vger.kernel.org
Cc:     johan@kernel.org
From:   Steve Markgraf <steve@steve-m.de>
Subject: Regression in 5.5.0-rc6 for FL2000 USB 3.0 to VGA adapter
Autocrypt: addr=steve@steve-m.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9cadc6b9-16f7-e072-abee-53ac5c143198@steve-m.de>
Date:   Sun, 19 Jan 2020 00:52:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi list,

Commit 3e4f8e21c4f27bcf30a48486b9dcc269512b79ff "USB: core: fix check
for duplicate endpoints" is causing a regression with devices based on
the Fresco Logic FL2000 chip, i.e. it is totally unusable.

The issue was first reported on the osmocom-sdr mailing list [1] and I
can reproduce it on my machine with 5.5.0-rc6, with rc5 everything is
working fine. By reverting the commit mentioned above, it is working as
well.

When connecting the device with rc6, I see the following dmesg output:
https://steve-m.de/files/fl2000_dmesg.txt

The output of lsusb -v:
https://steve-m.de/files/fl2000_lsusb.txt

Output of the Windows tool "USB Device Tree Viewer":
https://steve-m.de/files/fl2000_usbtreeview.txt

Output of the USB-IF USB 3.0 Chapter 9 tests with a version from around
the time the FL2000 was released to market (passing):
https://steve-m.de/files/fl2000_chapter9.html

By looking at the lsusb output, it almost seems like a descriptor
parsing issue, that now causes trouble after introducing the duplicate
endpoint testing.

Regards,
Steve

[1] https://lists.osmocom.org/pipermail/osmocom-sdr/2020-January/002025.html
