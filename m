Return-Path: <linux-usb+bounces-5178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6118307EE
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 15:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4607B21379
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 14:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F315C2030E;
	Wed, 17 Jan 2024 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="Q/gl4Y1f";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="C12IYFij"
X-Original-To: linux-usb@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A391208A2
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705501436; cv=pass; b=ehnljbZgRhqRYDKSh42T7oqDYp0wvIhbpNntEvJ7ekY8ztwroh0MRXCNowlIqdJf2n2t2d74Ptvr94maOfuDu6uFPgXPSLzf7awi0yXuaoal6OuzWoBZlF3cj4MlMVBypFDq3q7f+ETolTCpZJXKEnR1h5U2YrhpYIZyJG+mhNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705501436; c=relaxed/simple;
	bh=R8mwZGVKLfN/I/PJ4CEOCjrh/T/NYWBo6zQLTz3X8rE=;
	h=ARC-Message-Signature:ARC-Authentication-Results:X-RZG-CLASS-ID:
	 DKIM-Signature:DKIM-Signature:X-RZG-AUTH:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type; b=n1wfD6tNl11GweLMd5U+dZ0iMd2wMFON65uDMYFsWOGkmoEHa0e43sTisC5Z+rCjXhS/jFVqSelNza4gxPgkVONoWXeOY/SdajSKcBnF69MbY9CRFINcN3SuGrWXITqx27Ge+kEo+m0qQJ5ZzyOSFiBPViDS6pY6vxB2wmRmX5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=Q/gl4Y1f; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=C12IYFij; arc=pass smtp.client-ip=85.215.255.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
ARC-Seal: i=1; a=rsa-sha256; t=1705500708; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=NL2/Jv0T8UYwkzGtmTSyUwoBJQbfgUY5YfRyeIhO/+pP2pWh62yDUJxW0KUZm5DpG9
    jmJ70ei80UKOoLm3vaRjpi4mj+VLbpPnJ8BO/BnQ+RixFEzM/6C11h5042gEzvgMYy8Q
    H12eO/i/OpP4xJZhSP1NKQ5yCMSVoTh6KOg5cMISh/4sVf79MpSBojpXzQODGVnN4Bj3
    0UmalHZtDqoTXgGnLyiRtioWmuchOzdVDUtlzGHdz7tbBcL7g+u5Fawa9hIcs+vunZ0I
    R6LINbO7rPWEkIYHp9KLAFbex+INeOwIZ5QVWoFcBpTZFRpvFDNXHs/MG83wwdqfsct6
    YKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1705500708;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=jh9FGe8vStIeRRF3PqvRTaMC1+IZ9fjf3nNT4co5uko=;
    b=Gfml+1fRN98pjpcUOQs9ws0dy1xoPP2WqthY44L/Cs638Od6F1BcoFnTSW0gBt8o2J
    kFWlffsnOUu4nJcyc/8/tca0syMovP6Kd6cObBX45feRaXKr2jwz+2r2m2NBanqtjXX/
    ddcV1LQlsCCk3y6mfB9xDbp14lWcKVNisCVjYzzLdJnGK8mblGMIp99URvzWF48dB6VK
    o0EbA1B6/mhAvvZrpKjVNH39XH3wS29IPABHi5dvvEPrqL6Z3S1mlY9iVo3bj5HmALcg
    hETNnGHPBTxurbM9Yq8Gb2R8gXeaNKyyYs/7BqtIn3/7Y7rB3EYWjoXokIkPosc75c0+
    +D5A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1705500708;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=jh9FGe8vStIeRRF3PqvRTaMC1+IZ9fjf3nNT4co5uko=;
    b=Q/gl4Y1ffT84kWn39ci+WGd7DBgeVv5HQnTMsqI2Y066pOULp61BWMOAm0XR9xixMR
    Ah6zM/w9eHF7Q+lXI/3sQLLHp4TuUiYzmFserUDoxRyBLlhLI/IzKiw8QiilQGrO7gTS
    APkZLzzPB/btTQZoJ+UDla3dW07m3kZ7AxMbRf6Xz4MHFooGm2MlohNXMljd9mturesF
    YyyzfJT7sRFqD/dWOG8FLdA0Mc6AV5+M0KMFXH6gHNXUnZkqYpJAaoFkd/0Z/6hqjbL7
    GT1RUBFW3DdbU4MyBEjrgD8PSoywHGuWYarYfbdF532S4KnlQkuSv1YBucfpsccSgTef
    n8cQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1705500708;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=jh9FGe8vStIeRRF3PqvRTaMC1+IZ9fjf3nNT4co5uko=;
    b=C12IYFijPOsNycgy48yRdEjpmxMD5kegIAtG1UG93xCIPAk6f84FXa9D6Y8TkAKnIv
    PPSrFXpiYczRqg80ZaBw==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpPD3fBonz7dJLi1xPuooJ6RC45Y4g=="
Received: from nimes.fritz.box
    by smtp.strato.de (RZmta 49.10.2 AUTH)
    with ESMTPSA id c5619e00HEBlXVu
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 17 Jan 2024 15:11:47 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: bruno@clisp.org
Cc: gregkh@linuxfoundation.org,
	larsm17@gmail.com,
	linux-usb@vger.kernel.org,
	oneukum@suse.com,
	stern@rowland.harvard.edu
Subject: [PATCH] uas: Disable UAS driver for Realtek RTL9210 M.2 NVME Adapters
Date: Wed, 17 Jan 2024 15:11:32 +0100
Message-Id: <20240117141132.1023457-1-bruno@clisp.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2270283.o7ts2hSHzF@nimes>
References: <2270283.o7ts2hSHzF@nimes>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

Various products that make use of the Realtek RTL9210 M.2 NVME Adapter:
  - SilverStone TS16
  - Sabrent NVMe M.2 enclosure (Model EC-SNVE)
  - UnionSine Dual Protocol M2 NVMe to USB 3.1
malfunction when the UAS driver is used. At least for the
SilverStone TS16, it works fine when the usb-storage driver is used.

In my case, the SilverStone TS16 is identified by this output of
"lsusb -v":
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0x9210 RTL9210 M.2 NVME Adapter
  bcdDevice           20.01
  iManufacturer           1 Realtek
  iProduct                2 USB 3.1 Storage Device
  iSerial                 3 221010010470

Signed-off-by: Bruno Haible <bruno@clisp.org>
Link: https://lore.kernel.org/linux-usb/2270283.o7ts2hSHzF@nimes/
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 1f8c9b16a0fb..5287c7a446f1 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -83,6 +83,13 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_LUNS),
 
+/* Reported-by: Bruno Haible <bruno@clisp.org> */
+UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
+		"Realtek",
+		"USB 3.1 Storage Device",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
 UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
 		"Initio Corporation",
-- 
2.34.1


