Return-Path: <linux-usb+bounces-21706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF5A5E9A7
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 03:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707B51898728
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 02:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A4577104;
	Thu, 13 Mar 2025 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Eeb/c1/f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39FFEC4
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 02:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741831979; cv=none; b=sUfu93AseNcwJpLYb3cHo9xfOLMjWyssa0YhiV5wJx52MRn477lc1ZpNgytJu8Sr6tMDKLc+64kRvISd7aTYSKe8OvAVTiW0wBplorBj86Q+avu1H3IFV1xBCbZpZYD/pk+UcAOHM0PBIZVjKy5IYZH8E3Y0dFXJoY9I1/S0ZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741831979; c=relaxed/simple;
	bh=urlgLqvDiogZJxi7LKcjuJGbQr0RUqAHZ2fqkHShHGA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tFZfJSpw9X7AABSDBmNlG/qJYqisVcNt5OTWO8yRt74IjxmWFK5s3yRJM0XQVw/gzlVv11eS1Q5Dib0XRWoWoyj8Ti4kpuzyPVSoWFLpzkqZ5+po1XDOmi9oWRRND5RzBFEBJUrpBojHy+UzcRRXVGRhCj7A//XnQQAO/PWy3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Eeb/c1/f; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: aaac4d5affb011ef8eb9c36241bbb6fb-20250313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=o+R+TtVhCJzsi6fca5mKxBt11HGGbKJuyWjAS8q4keE=;
	b=Eeb/c1/fRm7TREFW7z6Li/Z8KNn2JUOuKcl9eEcDA0KZwX8gajYasj7ka/NyfCTBO/whCEqyACwfWXuFcQ0kHfrXVeAcvYDrLdzOGggDmMreu+n2eIamka4kuYFc2sFW2hT1GmKDOvW1BmHibwM5sJvnFEGuqktiCC0wA1LPqvc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8ded1d5b-b363-48b8-b21c-bdabac24a815,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:2de94d8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: aaac4d5affb011ef8eb9c36241bbb6fb-20250313
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 813332132; Thu, 13 Mar 2025 10:12:51 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 13 Mar 2025 10:12:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 13 Mar 2025 10:12:50 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Anuj Mittal <anuj.mittal@intel.com>, Steve Sakoman <steve@sakoman.com>,
	"Alexander Kanavin via lists . openembedded . org"
	<alex.kanavin=gmail.com@lists.openembedded.org>,
	<openembedded-core@lists.openembedded.org>,
	=?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, <linux-usb@vger.kernel.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] bluez5: upgrade 5.72 -> 5.77
Date: Thu, 13 Mar 2025 10:12:43 +0800
Message-ID: <20250313021247.2615117-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N

From: gudnimg <gudni.m.g@gmail.com>

Changelog:
* https://github.com/bluez/bluez/releases/tag/5.77
* https://github.com/bluez/bluez/releases/tag/5.76
* https://github.com/bluez/bluez/releases/tag/5.75
* https://github.com/bluez/bluez/releases/tag/5.74
* https://github.com/bluez/bluez/releases/tag/5.73

Changes relevant to the build:
* One patch file is dropped.
* /etc/bluetooth is now installed with 555 permission bits when systemd
is not enabled. The do_install function was edited to change it back to
755. This was causing test failure when testing SDK packaging
* Added a few missing PACKAGECONFIGs which are enabled by default.
- asha-profiles: new in BlueZ 5.77
- ccp-profiles: new in BlueZ 5.73
- micp-profiles: new in BlueZ 5.70
- csip-profiles: new in BlueZ 5.67
- bass-profiles: new in BlueZ 5.67
- vcp-profiles: new in BlueZ 5.66
- mcp-profiles: new in BlueZ 5.66
- bap-profiles: new in BlueZ 5.66

(From OE-Core rev: ebbdb7cf5c0a3f0e6773704d4c4cc570358ec611)

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   | 22 +++++++-
 ...d-without-systemd-in-the-user-sessio.patch | 56 -------------------
 .../0001-test-gatt-Fix-hung-issue.patch       |  7 +--
 ...et-for-building-tests-without-runnin.patch |  7 +--
 .../bluez5/{bluez5_5.72.bb => bluez5_5.77.bb} |  2 +-
 5 files changed, 28 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.72.bb => bluez5_5.77.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 39e1bf389ce4..e927d3071e5d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,6 +18,14 @@ PACKAGECONFIG ??= "obex-profiles \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     a2dp-profiles \
     avrcp-profiles \
+    bap-profiles \
+    bass-profiles \
+    mcp-profiles \
+    ccp-profiles \
+    vcp-profiles \
+    micp-profiles \
+    csip-profiles \
+    asha-profiles \
     network-profiles \
     hid-profiles \
     hog-profiles \
@@ -39,6 +47,14 @@ PACKAGECONFIG[network-profiles] = "--enable-network,--disable-network"
 PACKAGECONFIG[hid-profiles] = "--enable-hid,--disable-hid"
 PACKAGECONFIG[hog-profiles] = "--enable-hog,--disable-hog"
 PACKAGECONFIG[health-profiles] = "--enable-health,--disable-health"
+PACKAGECONFIG[bap-profiles] = "--enable-bap,--disable-bap"
+PACKAGECONFIG[bass-profiles] = "--enable-bass,--disable-bass"
+PACKAGECONFIG[mcp-profiles] = "--enable-mcp,--disable-mcp"
+PACKAGECONFIG[ccp-profiles] = "--enable-ccp,--disable-ccp"
+PACKAGECONFIG[vcp-profiles] = "--enable-vcp,--disable-vcp"
+PACKAGECONFIG[micp-profiles] = "--enable-micp,--disable-micp"
+PACKAGECONFIG[csip-profiles] = "--enable-csip,--disable-csip"
+PACKAGECONFIG[asha-profiles] = "--enable-asha,--disable-asha"
 PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
@@ -51,7 +67,6 @@ PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,python3-docutils
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0001-adapter-Fix-up-address-type-when-loading-keys.patch \
@@ -107,6 +122,11 @@ do_install:append() {
 	# Patch python tools to use Python 3; they should be source compatible, but
 	# still refer to Python 2 in the shebang
 	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
+
+	# Fix the /etc/bluetooth directory permissions when systemd is disabled
+	if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'false', 'true', d)}; then
+		chmod 0755 ${D}${sysconfdir}/bluetooth
+	fi
 }
 
 PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
deleted file mode 100644
index 618ed734a96a..000000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From f74eb97c9fb3c0ee2895742e773ac6a3c41c999c Mon Sep 17 00:00:00 2001
-From: Giovanni Campagna <gcampagna-cNUdlRotFMnNLxjTenLetw@public.gmane.org>
-Date: Sat, 12 Oct 2013 17:45:25 +0200
-Subject: [PATCH] Allow using obexd without systemd in the user session
-
-Not all sessions run systemd --user (actually, the majority
-doesn't), so the dbus daemon must be able to spawn obexd
-directly, and to do so it needs the full path of the daemon.
-
-Upstream-Status: Denied
-
-Not accepted by upstream maintainer for being a distro specific
-configuration. See thread:
-
-http://thread.gmane.org/gmane.linux.bluez.kernel/38725/focus=38843
-
-Signed-off-by: Javier Viguera <javier.viguera@digi.com>
-
----
- Makefile.obexd                                                | 4 ++--
- .../src/{org.bluez.obex.service => org.bluez.obex.service.in} | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
- rename obexd/src/{org.bluez.obex.service => org.bluez.obex.service.in} (76%)
-
-diff --git a/Makefile.obexd b/Makefile.obexd
-index de59d29..73004a3 100644
---- a/Makefile.obexd
-+++ b/Makefile.obexd
-@@ -1,12 +1,12 @@
- if SYSTEMD
- systemduserunitdir = $(SYSTEMD_USERUNITDIR)
- systemduserunit_DATA = obexd/src/obex.service
-+endif
- 
- dbussessionbusdir = $(DBUS_SESSIONBUSDIR)
- dbussessionbus_DATA = obexd/src/org.bluez.obex.service
--endif
- 
--EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service
-+EXTRA_DIST += obexd/src/obex.service.in obexd/src/org.bluez.obex.service.in
- 
- if OBEX
- 
-diff --git a/obexd/src/org.bluez.obex.service b/obexd/src/org.bluez.obex.service.in
-similarity index 76%
-rename from obexd/src/org.bluez.obex.service
-rename to obexd/src/org.bluez.obex.service.in
-index a538088..9c815f2 100644
---- a/obexd/src/org.bluez.obex.service
-+++ b/obexd/src/org.bluez.obex.service.in
-@@ -1,4 +1,4 @@
- [D-BUS Service]
- Name=org.bluez.obex
--Exec=/bin/false
-+Exec=@libexecdir@/obexd
- SystemdService=dbus-org.bluez.obex.service
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index b1e93dbe19ef..ae113a9a6d7a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From fb583a57f9f4ab956a09e9bb96d89aa13553bf21 Mon Sep 17 00:00:00 2001
+From eeb62ab04b3789a27074236cd0bed7cc64759f4d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
@@ -21,16 +21,15 @@ no action.
 Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
 
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
-
 ---
  unit/test-gatt.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unit/test-gatt.c b/unit/test-gatt.c
-index 5e06d4e..4864d36 100644
+index 1613fbc..25dd614 100644
 --- a/unit/test-gatt.c
 +++ b/unit/test-gatt.c
-@@ -4546,7 +4546,7 @@ int main(int argc, char *argv[])
+@@ -4547,7 +4547,7 @@ int main(int argc, char *argv[])
  			test_server, service_db_1, NULL,
  			raw_pdu(0x03, 0x00, 0x02),
  			raw_pdu(0xbf, 0x00),
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 881494a3543e..37253b9725b2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,20 +1,19 @@
-From 738e73b386352fd90f1f26cc1ee75427cf4dc23b Mon Sep 17 00:00:00 2001
+From c06fecbb009f4c42f01d86383d4571c96ba872f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  Makefile.am | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index e738eb3..dab17dd 100644
+index 0ae7211..c8bcaca 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -710,6 +710,9 @@ endif
+@@ -713,6 +713,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb b/meta/recipes-connectivity/bluez5/bluez5_5.77.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.72.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.77.bb
index 9fda960ea72e..55264fd6b760 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.72.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.77.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "499d7fa345a996c1bb650f5c6749e1d929111fa6ece0be0e98687fee6124536e"
+SRC_URI[sha256sum] = "5d032fdc1d4a085813554f57591e2e1fb0ceb2b3616ee56f689bc00e1d150812"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.45.2


