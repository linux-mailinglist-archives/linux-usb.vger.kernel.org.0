Return-Path: <linux-usb+bounces-15641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C698CDCD
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2024 09:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C85D51C21009
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2024 07:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88C419414A;
	Wed,  2 Oct 2024 07:35:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F72194125
	for <linux-usb@vger.kernel.org>; Wed,  2 Oct 2024 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727854525; cv=none; b=u8w2hhzwMSUuKyuk5MWMaNNFhlipujrnzuu9LadlyZrj9aNlL9vzHvcytI+vJeyt8gu9GN2kH13XES6I681i4AZrSikpCZk8vxsv175+UsU+f+tbxvIZHO0n5dmYA7i1gHbhGam/1POb8Dh5Tni3EubJitULJGZemDJvYZtq4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727854525; c=relaxed/simple;
	bh=inFAjHiIyLx2Dla34EfsjrRtnjkXOfui2Awff155w58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ST/31t+plQhM8+QjuVyvynqBt+PIs5EO4HWAUeH4RRnp1r5oibide2w7PM+tepbJ6DFNNWlYSVqL39RnW1OgNaSb6oDroRcIovcYBKBC5jSRj5QNCrCUA9aZW2gIVbmbXoMq8c9fe2zgsv6CvH6RYU5lXHPN8kZOc7pYICTUfHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:80d:3d68:c8fe:1932])
	by albert.telenet-ops.be with cmsmtp
	id KKbF2D00X4Qoffy06KbFzU; Wed, 02 Oct 2024 09:35:16 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svtt5-0016yj-9G;
	Wed, 02 Oct 2024 09:35:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1svttD-003tb6-Hp;
	Wed, 02 Oct 2024 09:35:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: renesas: rcar-gen2: Switch HS-USB to renesas,enable-gpios
Date: Wed,  2 Oct 2024 09:35:13 +0200
Message-Id: <c88724ce1e0d755302659cd790c0869ff579684e.1727853953.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727853953.git.geert+renesas@glider.be>
References: <cover.1727853953.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2071d0968e564b4b ("Documentation: gpio: guidelines for bindings")
deprecated the "gpio" suffix for GPIO consumers in favor of the "gpios"
suffix.  Hence replace the "renesas,enable-gpio" property by
"renesas,enable-gpios" in HS-USB device nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7790-lager.dts   | 2 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-lager.dts b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
index 8590981245a62057..826a29064d27f663 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-lager.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-lager.dts
@@ -890,7 +890,7 @@ &hsusb {
 	status = "okay";
 	pinctrl-0 = <&hsusb_pins>;
 	pinctrl-names = "default";
-	renesas,enable-gpio = <&gpio5 18 GPIO_ACTIVE_HIGH>;
+	renesas,enable-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
 };
 
 &usbphy {
diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index 0efd9f98c75aced0..0a8eac57135f2e81 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -859,7 +859,7 @@ &hsusb {
 	status = "okay";
 	pinctrl-0 = <&usb0_pins>;
 	pinctrl-names = "default";
-	renesas,enable-gpio = <&gpio5 31 GPIO_ACTIVE_HIGH>;
+	renesas,enable-gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
 };
 
 &usbphy {
-- 
2.34.1


