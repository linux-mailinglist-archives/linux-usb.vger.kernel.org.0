Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A182D27C47
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 13:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730626AbfEWL5N convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 23 May 2019 07:57:13 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:62432 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729698AbfEWL5M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 07:57:12 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=SVR-IES-MBX-03.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hTmLO-0005nq-MO from Carsten_Schmid@mentor.com 
        for linux-usb@vger.kernel.org; Thu, 23 May 2019 04:57:10 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Thu, 23 May 2019 12:57:06 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
 SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with mapi id
 15.00.1320.000; Thu, 23 May 2019 12:57:06 +0100
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Crash/hung task in usb-storage thread
Thread-Topic: Crash/hung task in usb-storage thread
Thread-Index: AdURXgfVXaop83lMT6KXMlJmy+L2Dg==
Date:   Thu, 23 May 2019 11:57:06 +0000
Message-ID: <dca3ea08836e475894bdebc7eb28acff@SVR-IES-MBX-03.mgc.mentorg.com>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi USB maintainers,

we recently have seen a problem with usb-storage when trying to read from a device.
This happened on a 4.14.86 kernel.

The kernel's dmesg shows: (log has been submitted via DLT)
1200.862250 kernel: usb 1-3.1: reset high-speed USB device number 10 using xhci_hcd
1285.466289 kernel: usb 1-3.1: reset high-speed USB device number 10 using xhci_hcd
1291.911286 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
1292.018079 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
1292.043073 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
1292.069078 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
1292.093066 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528

These messages continue until the hung task mechanism steps in:
1472.135076 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
1472.135628 kernel: INFO: task usb-storage:7930 blocked for more than 120 seconds.
1472.135633 kernel: Tainted: P U W O 4.14.86-apl #1
1472.135634 kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
1472.135637 kernel: usb-storage D 0 7930 2 0x80000080
1472.135642 kernel: Call Trace:
1472.135656 kernel: __schedule+0x1c2/0x7b0
1472.135661 kernel: schedule+0x2e/0x90
1472.135664 kernel: schedule_timeout+0x230/0x470
1472.135678 kernel: ? usb_hcd_submit_urb+0x98/0xba0 [usbcore]
1472.135719 kernel: ? schedule_timeout+0x230/0x470
1472.135728 kernel: ? usb_hcd_submit_urb+0x98/0xba0 [usbcore]
1472.135731 kernel: ? __switch_to_asm+0x40/0x70
1472.135733 kernel: ? __switch_to_asm+0x34/0x70
1472.135735 kernel: ? __switch_to_asm+0x40/0x70
1472.135737 kernel: ? __switch_to_asm+0x34/0x70
1472.135741 kernel: wait_for_common+0xb5/0x170
1472.135744 kernel: ? wait_for_common+0xb5/0x170
1472.135748 kernel: ? wake_up_q+0x80/0x80
1472.135752 kernel: wait_for_completion+0x18/0x20
1472.135760 kernel: usb_sg_wait+0x114/0x170 [usbcore]
1472.135946 kernel: usb_stor_bulk_transfer_sglist.part.3+0x62/0xb0 [usb_storage]
1472.135951 kernel: usb_stor_bulk_srb+0x46/0x80 [usb_storage]
1472.135955 kernel: usb_stor_Bulk_transport+0x123/0x390 [usb_storage]
1472.135960 kernel: usb_stor_invoke_transport+0x3c/0x520 [usb_storage]
1472.135965 kernel: ? wait_for_common+0xb5/0x170
1472.135968 kernel: ? wait_for_common+0x149/0x170
1472.135971 kernel: ? wake_up_q+0x80/0x80
1472.135975 kernel: usb_stor_transparent_scsi_command+0x9/0x10 [usb_storage]
1472.135979 kernel: usb_stor_control_thread+0x1eb/0x2d0 [usb_storage]
1472.135984 kernel: kthread+0x122/0x140
1472.135988 kernel: ? fill_inquiry_response+0x20/0x20 [usb_storage]
1472.135991 kernel: ? kthread_create_on_node+0x60/0x60
1472.135994 kernel: ret_from_fork+0x35/0x40
1472.163072 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528

There has been a similar bug being fixed in 3.17 kernel series, maybe the bug has been re-introduced?
https://bugzilla.kernel.org/show_bug.cgi?id=88341

As USB seems to be the causing subsystem, i submit this query here.

Any idea what could cause this?


Best regards
Carsten
