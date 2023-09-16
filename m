Return-Path: <linux-usb+bounces-240-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C767A2FC0
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 13:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A18B128241A
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 11:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD3713AC6;
	Sat, 16 Sep 2023 11:42:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49D1107
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 11:41:59 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EEECC9
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 04:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1694864515; x=1695123715;
	bh=cdygQT4m/Zqxs94pWuWjnhXWsAvNqdUcOsqh2JljqP0=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UtejPTIXPcyq1wzeHnzXvt1kOTDSFaY+jWPm9iSoVB9qVUsTa9JT4GSLg4wKqjGpy
	 zsgdmu6QOE8RARcdeSbIbwc+0IPz1ylH1DHfVNdalkm1wFjgmMowmfyfAxPu1bjBVY
	 RyKw7fvNzr0WUylRY2WvrUi9r+k1eUkjm5ixTvGmTLY4211kGRY4Ws7ZsY4TLpUE0z
	 HcnQs+ida10uskYGVUaE5z3esns3gXJ9dxD1AnkMPLzNOlBKykplayw9O4egUg2He4
	 hWNw9EsSvwdxpBlEv9ElOGDUMs6OJ/BoRs82sc00K/Zk/ZuIiXiwR0RdqtDr/y2eu1
	 e5UklkpgWXevQ==
Date: Sat, 16 Sep 2023 11:41:49 +0000
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Louis-Marie <rauline.lm@protonmail.com>
Subject: Lenovo Hybrid Dock MAC passtrough patch
Message-ID: <guK8MKcjWbPsZ1LuRVYxFf7WfsWa025shmVj7iq289LHf59N6i6OlkD0N9KhICJzbMfFW2aXYbguZ1NtZNn6PlA_-JvF3k7uJtG89THdZ6w=@protonmail.com>
Feedback-ID: 8843366:user:proton
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,
I would like to submit a patch for enabling mac passtrough for the Lenovo H=
ybrid Dock.
Tested with Fedora 6.4.12.



diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.cindex 0c13d99=
50cd8..02e6404bf6ea 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -781,6 +781,7 @@ enum rtl8152_flags {
=C2=A0#define DEVICE_ID_THINKPAD_USB_C_DONGLE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x720c
=C2=A0#define DEVICE_ID_THINKPAD_USB_C_DOCK_GEN2 =C2=A0 =C2=A0 0xa387
=C2=A0#define DEVICE_ID_THINKPAD_USB_C_DOCK_GEN3 =C2=A0 =C2=A0 0x3062
+#define DEVICE_ID_THINKPAD_HYBRID_USB_C_DOCK =C2=A0 =C2=A0 =C2=A0 0xa359

=C2=A0struct tally_counter {
=C2=A0 =C2=A0 __le64 =C2=A0tx_packets;
@@ -9583,6 +9584,7 @@ static bool rtl8152_supports_lenovo_macpassthru(struc=
t usb_device *udev)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DEVICE_ID_THINKPAD_THUNDERBOLT3_DOCK_GEN2:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DEVICE_ID_THINKPAD_USB_C_DOCK_GEN2:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DEVICE_ID_THINKPAD_USB_C_DOCK_GEN3:
+ =C2=A0 =C2=A0 =C2=A0 case DEVICE_ID_THINKPAD_HYBRID_USB_C_DOCK:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DEVICE_ID_THINKPAD_USB_C_DONGLE:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
@@ -9832,6 +9834,7 @@ static const struct usb_device_id rtl8152_table[] =3D=
 {
=C2=A0 =C2=A0 { USB_DEVICE(VENDOR_ID_LENOVO, =C2=A00x7214) },
=C2=A0 =C2=A0 { USB_DEVICE(VENDOR_ID_LENOVO, =C2=A00x721e) },
=C2=A0 =C2=A0 { USB_DEVICE(VENDOR_ID_LENOVO, =C2=A00xa387) },
+ =C2=A0 { USB_DEVICE(VENDOR_ID_LENOVO, =C2=A00xa359) },
=C2=A0 =C2=A0 { USB_DEVICE(VENDOR_ID_LINKSYS, 0x0041) },
=C2=A0 =C2=A0 { USB_DEVICE(VENDOR_ID_NVIDIA, =C2=A00x09ff) },
=C2=A0 =C2=A0 { USB_DEVICE(VENDOR_ID_TPLINK, =C2=A00x0601) },
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 15e9bd180a1d..ad98c8ffbc69 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -470,6 +470,9 @@ static const struct usb_device_id usb_quirk_list[] =3D =
{
=C2=A0 =C2=A0 /* Lenovo ThinkPad USB-C Dock Gen2 Ethernet (RTL8153 GigE) */
=C2=A0 =C2=A0 { USB_DEVICE(0x17ef, 0xa387), .driver_info =3D USB_QUIRK_NO_L=
PM },

+ =C2=A0 /* Lenovo ThinkPad Hydrid USB-C Dock */
+ =C2=A0 { USB_DEVICE(0x17ef, 0xa359), .driver_info =3D USB_QUIRK_NO_LPM },
+
=C2=A0 =C2=A0 /* BUILDWIN Photo Frame */
=C2=A0 =C2=A0 { USB_DEVICE(0x1908, 0x1315), .driver_info =3D
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 USB_QUIRK_HONOR_BNUMINTERFACES },

Signed-off-by: Louis-Marie Rauline <rauline.lm@protonmail.com>

Thanks,
Rauline Louis-Marie


