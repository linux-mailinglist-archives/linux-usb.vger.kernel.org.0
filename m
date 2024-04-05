Return-Path: <linux-usb+bounces-8954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A86899408
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 06:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0FBE1C2573A
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 04:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052D91C687;
	Fri,  5 Apr 2024 04:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alextjam.es header.i=@alextjam.es header.b="aF8vnGgh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BU+TzWR+"
X-Original-To: linux-usb@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE2E546
	for <linux-usb@vger.kernel.org>; Fri,  5 Apr 2024 04:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712290370; cv=none; b=mDEEGaamA6w0iLj3/KaHqKku4Fhy2TwfYmoZViyo9C6OL8zNUXDVm+FTODZFHFP3875/buaW0QclALPOpAJMp8H+qWVvyA8bFPRiCxrP/n4XgicAScikPGtOqxsLZQgeulLEV7DHEQ5T7JHViAPjo9BRlclkwx+9KXwB8EKLUAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712290370; c=relaxed/simple;
	bh=67Id1kJ37uJQ0YfWr8yaOuICLBeSQtvN6WzB8CIUz1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sirzqq6uTqVdsR9755v35sOExK6sBbYX0SO+hJj6K7LxtfJgR/MdS5d1Qqf8c3gm+uXa8Wrqq6jykDbDO2ycrqWuJOLv6IiMjabLKOA0ppUzQnch9fBfhOPorcShp3CcY3UAFIMc4GXd3XoQwrFiIpOGf1yHPvTEGYUJSZRB2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alextjam.es; spf=pass smtp.mailfrom=alextjam.es; dkim=pass (2048-bit key) header.d=alextjam.es header.i=@alextjam.es header.b=aF8vnGgh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BU+TzWR+; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alextjam.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alextjam.es
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfout.west.internal (Postfix) with ESMTP id C1FC41C0009E;
	Fri,  5 Apr 2024 00:12:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 05 Apr 2024 00:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alextjam.es; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1712290366; x=1712376766; bh=j9f9fgXE/goO6cs2O2x7K
	PATRksFTc6bvY8ODQTAKcI=; b=aF8vnGghyNpaYQIBehCETogodkTXn4GRPj7NL
	LFDgc2EV6NY0FCApaSxVlX+LFJGnECA1rorOb3Nm3bxvprLj+AE79lxjJnZH2Xrm
	uoYPn0sP0YcfNxILNqQb+KPIr+khIdJHQfYkIfpn+Y66H+agkycIj/U3K4LM5oK0
	UqAawYyqgmP4V0bgV8hBGirYdcI6/Q6Xm4spw7giWQFFMc9yFapRgBg36d9r3BMF
	JDE2vy+sQCXHxLO/JhovxA173ZcPVU7MopOiU/qdAlYkWGJ7vKM/NsJaTx9tZbin
	7jXhtfkzpMuNvTCv+Pz7h3W66cRC3VF4CKYPhmlAgvqruxJOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712290366; x=1712376766; bh=j9f9fgXE/goO6cs2O2x7KPATRksF
	Tc6bvY8ODQTAKcI=; b=BU+TzWR+1eKictsVJQpHa5FZ1bZi/PYAMBkoFaMe9MrA
	TcRd0Q+QxhR8O20IhgGMH+6oZnNFu1Akh1GwGCKF47f1XnPa7pchB4GlzSH1WppC
	UpSH4HL9ulJDOlMB7oQg3nDoDwpqMPPAnpmHjwRw41NY33+7l783+j88VNaplzI1
	XSAcf6HELjsGajw1XQKHOHEXNHPKci5HGINAjaquHYr7pIuwn+mCCmGKp+iVkqob
	XXzhydawqMobCWRYgml8fBkuvfngpWK8tNopWVLWwnsqmNRR5prjMCSZ9NBwOBy+
	9XetPHni4MPRIsOi1nQzVBYSUzUYyW8u3+XcmZB72w==
X-ME-Sender: <xms:PXoPZtI5rHiZWFWL2F_thXtzYEAxXZmspzt0Mw5rhHFOQI34znf0zQ>
    <xme:PXoPZpJm1c47IQc3Ym6ua-FUhLzkspZCytFAPE6oX1kKbHCjAo68JjAK0hdbHp74l
    RWUlWJ1LzpFbZQc0Nw>
X-ME-Received: <xmr:PXoPZlsw_OwCmmkNkRMIg9XlALrLKVkV1Nn4mh3_seS4ygskHCsxiJXCCH4vegGVoA1kFTaXJ4c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefledgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehlvgigucfl
    rghmvghsuceoghhithesrghlvgigthhjrghmrdgvsheqnecuggftrfgrthhtvghrnhepfe
    ffieehkeffffeifedtieehvddtjeegkeeigeejvdejgedugfdthedvveevgefhnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhithesrghlvg
    igthhjrghmrdgvsh
X-ME-Proxy: <xmx:PXoPZubEmT2rKN0uRH_0ALbhyryBmWNR-TQ_U6tkOqhUzgoaM_FFcA>
    <xmx:PXoPZkY-q5UMsYVoq8GoyL5B__S2RFNyzUcpdBfQGGofgGWwPPPkeA>
    <xmx:PXoPZiAESzGTrlExDqQ_H9T2RHAyiHwz6ZTtSTfvE-9952bgr6zUvw>
    <xmx:PXoPZiYTw2IMJ7rlMOXgtPUEjE5Gql3O9L-x7JB4iYeD9QqIYTJNwQ>
    <xmx:PnoPZk65jVu8xK_YtLio2-ZhlYfzOp5HnqXp1LDox2FsUOl1iITQl37_>
Feedback-ID: i584946e0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Apr 2024 00:12:45 -0400 (EDT)
From: Alex James <git@alextjam.es>
To: linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Alex James <git@alextjam.es>
Subject: [PATCH] drivers/thunderbolt: Enable NVM upgrade support on Intel Maple Ridge
Date: Thu,  4 Apr 2024 23:11:52 -0500
Message-ID: <20240405041152.38324-1-git@alextjam.es>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Maple Ridge supports NVM firmware upgrade with the same flows used
on previous discrete Thunderbolt contollers from Intel (such as Titan
Ridge). Advertise NVM upgrade support for Maple Ridge in icm_probe() to
expose the corresponding files in /sys/bus/thunderbolt. The NVM firmware
process was successfully tested on a system with a JHL8540 controller
(ASUS ProArt Z790-CREATOR).

Signed-off-by: Alex James <git@alextjam.es>
---
 drivers/thunderbolt/icm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index baf10d099c77..7859bccc592d 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2532,6 +2532,7 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 
 	case PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_MAPLE_RIDGE_4C_NHI:
+		icm->can_upgrade_nvm = true;
 		icm->is_supported = icm_tgl_is_supported;
 		icm->get_mode = icm_ar_get_mode;
 		icm->driver_ready = icm_tr_driver_ready;
-- 
2.44.0


