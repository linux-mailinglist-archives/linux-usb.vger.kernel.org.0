Return-Path: <linux-usb+bounces-37563-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNX4Get0Cmq41gQAu9opvQ
	(envelope-from <linux-usb+bounces-37563-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 04:09:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A42E5564ECD
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 04:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CCDD301F18F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 02:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3102B261B92;
	Mon, 18 May 2026 02:09:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from tpecef21.compal.com (exmail3.compal.com [59.120.207.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A5F1F37D3;
	Mon, 18 May 2026 02:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=59.120.207.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070181; cv=none; b=Po0ftrDBmL4/lO0m7Iprnllt4OkhvuSFCJQmR0DfdA/Dfrv9bnV4cBEsV4NNGNjkhIwhCrsDcrVXLHVmBSTlyDTga8JV5FDk2zad2C10usv7Osfl2+342qK+fbQ96QuywCeitNDqyEOlh1qQ4lgaVmOlNPiWcKN7ygBjyHvNtKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070181; c=relaxed/simple;
	bh=rzoCcBQ8by8M5svA0axYj2TNGJGHdiXTF6Eg5lqDjb4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I4K96OwVCeI01S5wwQPDnG3+9q6OmoCwyQbcgxqxygufedYqULMNmVztxG9gcmhD85vv52Blwx3TYtlhxVDuTfY5hL4k1AnRAKHVfJA6tN/tocRrENeroKF4uV3KTaJmeNgQV7lHgpuSwwRP18uEszB6wyTnp41EOHkALQSrf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.com; spf=pass smtp.mailfrom=compal.com; arc=none smtp.client-ip=59.120.207.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.com
X-UUID: 7fdd8e9a525c11f18b9b2d0ef2884acc-20260518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:deb77c85-37a7-467e-824f-bea035d0ab36,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:8cd37ce1-02d4-4065-accc-97789b7ab0e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|850|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7fdd8e9a525c11f18b9b2d0ef2884acc-20260518
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1976489773; Mon, 18 May 2026 09:54:26 +0800
X-UUID: 7dc523c0525c11f1a42089d3d1632821-20260518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:3143d83d-4197-4709-aa54-04bce10e0f5c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:d8d87ca4-a669-48ac-a1cb-3b38a93be682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|850|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7dc523c0525c11f1a42089d3d1632821-20260518
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 2011231038; Mon, 18 May 2026 09:54:22 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.29;
 Mon, 18 May 2026 09:54:18 +0800
Received: from SDMR01.tpe.compalcomm.com (10.113.2.107) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 18 May 2026 09:54:18 +0800
Received: from localhost ([10.113.70.1]) by SDMR01.tpe.compalcomm.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 18 May 2026 09:54:18 +0800
From: Jack Wu <jackbb_wu@compal.com>
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e-m
Date: Mon, 18 May 2026 09:54:18 +0800
Message-ID: <20260518015418.327252-1-jackbb_wu@compal.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 18 May 2026 01:54:18.0496 (UTC) FILETIME=[3D143000:01DCE669]
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-29950.003
X-TM-AS-Result: No-10--1.503500-8.000000
X-TMASE-MatchedRID: RtHHqK+8YWPJ+P2VFrJmrEkXVQaP16N5tGx+miwM7d3dC+Bs3HApSUmp
	6+bNSfqBh/CVyipgEfZZrmOTQ1vpL63XYtsOH2/QRYNhzuZZjRDn0oaU6WM++yIeU+yFXn+49WS
	TU5Hd4RnYeXOEzfM22Vztkif7r1iVJU0nG3tpe+D+pgwsOtbJY5K8CvXZ80MHrNSifc7aHXV9Su
	bnPXCGzr5V40+3FpmWpmcL/Wp+R46LSBmdjXatOd9AsbFExCVPjOYqV6AKVU92dBWxz66y1/hdb
	kKx5t5FQByVZYibFxpprHDlfzYAbSeCoNkC91GeUG9FuKxZE9E=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.503500-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-29950.003
X-TM-SNTS-SMTP:
	12807CBA57080A65C920DC2ADDB639E2662AF8F04D30F6D9C19F396EF9DCA7C52000:8
X-Rspamd-Queue-Id: A42E5564ECD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[compal.com : SPF not aligned (relaxed), No valid DKIM,reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37563-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[jackbb_wu@compal.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea & 0x413c:0x81eb.

It is 0x413c:0x81ea
T:  Bus=3D02 Lev=3D01 Prnt=3D01 Port=3D05 Cnt=3D01 Dev#=3D110 Spd=3D480  Mx=
Ch=3D 0
D:  Ver=3D 2.10 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D413c ProdID=3D81ea Rev=3D 5.04
S:  Manufacturer=3DDELL
S:  Product=3DDW5826e-m Qualcomm Snapdragon X12 Global LTE-A
S:  SerialNumber=3D358988870177734
C:* #Ifs=3D 7 Cfg#=3D 1 Atr=3Da0 MxPwr=3D500mA
A:  FirstIf#=3D12 IfCount=3D 2 Cls=3D02(comm.) Sub=3D0e Prot=3D00
I:* If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3D30 Driver=
=3Dqcserial
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D42 Prot=3D01 Driver=
=3Dusbfs
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 2 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D60 Driver=
=3Dqcserial
E:  Ad=3D84(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
E:  Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3D40 Driver=
=3Dqcserial
E:  Ad=3D86(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
E:  Ad=3D85(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
I:* If#=3D 4 Alt=3D 0 #EPs=3D 1 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3D(none)
E:  Ad=3D87(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D32ms
I:* If#=3D12 Alt=3D 0 #EPs=3D 1 Cls=3D02(comm.) Sub=3D0e Prot=3D00 Driver=
=3Dcdc_mbim
E:  Ad=3D88(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D32ms
I:  If#=3D13 Alt=3D 0 #EPs=3D 0 Cls=3D0a(data ) Sub=3D00 Prot=3D02 Driver=
=3Dcdc_mbim
I:* If#=3D13 Alt=3D 1 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D02 Driver=
=3Dcdc_mbim
E:  Ad=3D8e(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D0f(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms

It is 0x413c:0x81eb
T:  Bus=3D02 Lev=3D01 Prnt=3D01 Port=3D05 Cnt=3D01 Dev#=3D109 Spd=3D480  Mx=
Ch=3D 0
D:  Ver=3D 2.10 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D413c ProdID=3D81eb Rev=3D 0.00
S:  Manufacturer=3DDELL
S:  Product=3DDW5826e-m Qualcomm Snapdragon X12 Global LTE-A
S:  SerialNumber=3D358988870177734
C:* #Ifs=3D 1 Cfg#=3D 1 Atr=3Da0 MxPwr=3D  2mA
I:* If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3Dqcserial
E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
v2:
  -sorted by PID and add the newline separator before the Huawei devices.
---
---
 drivers/usb/serial/qcserial.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index 1a930dc668e4..bb1647a17066 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -186,9 +186,11 @@ static const struct usb_device_id id_table[] =3D {
        {DEVICE_SWI(0x413c, 0x81d0)},   /* Dell Wireless 5819 */
        {DEVICE_SWI(0x413c, 0x81d1)},   /* Dell Wireless 5818 */
        {DEVICE_SWI(0x413c, 0x81d2)},   /* Dell Wireless 5818 */
+       {DEVICE_SWI(0x413c, 0x81ea)},   /* Dell Wireless DW5826e-m */
+       {DEVICE_SWI(0x413c, 0x81eb)},   /* Dell Wireless DW5826e-m QDL */
        {DEVICE_SWI(0x413c, 0x8217)},   /* Dell Wireless DW5826e */
        {DEVICE_SWI(0x413c, 0x8218)},   /* Dell Wireless DW5826e QDL */
-
+
        /* Huawei devices */
        {DEVICE_HWI(0x03f0, 0x581d)},   /* HP lt4112 LTE/HSPA+ Gobi 4G Mode=
m (Huawei me906e) */

--
2.34.1



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This message may contain information which is private, privileged or confid=
ential of Compal Electronics, Inc. If you are not the intended recipient of=
 this message, please notify the sender and destroy/delete the message. Any=
 review, retransmission, dissemination or other use of, or taking of any ac=
tion in reliance upon this information, by persons or entities other than t=
he intended recipient is prohibited.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

