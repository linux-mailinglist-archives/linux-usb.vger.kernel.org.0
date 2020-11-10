Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B292ACCA6
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 04:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387641AbgKJD4a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 22:56:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:58470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387627AbgKJD43 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 22:56:29 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C755720663;
        Tue, 10 Nov 2020 03:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604980588;
        bh=UxWtPP/nZuP9tQ1qeRE/h1mJ1akoEMmtf4XQKpw+wc0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vZvQrtzO7kaWOyHpsHyGD+vyKiV9DYIZ7na4W/v7Qiu4JULCspQtN5qk29Z5/N7Nh
         65WkoOiPjLx2FP1JIA9O+7wCr1vKJ5Q+UrfIvlb3Q7HxHNRuOq1X+RrVtq5+Ps2YDo
         Rd+rpUC9lFGiG93mo17lCrr9eOtPWP0tpUVjqqdM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Daniele Palmas <dnlplm@gmail.com>,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Jakub Kicinski <kuba@kernel.org>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 12/14] net: usb: qmi_wwan: add Telit LE910Cx 0x1230 composition
Date:   Mon,  9 Nov 2020 22:56:08 -0500
Message-Id: <20201110035611.424867-12-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110035611.424867-1-sashal@kernel.org>
References: <20201110035611.424867-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Daniele Palmas <dnlplm@gmail.com>

[ Upstream commit 5fd8477ed8ca77e64b93d44a6dae4aa70c191396 ]

Add support for Telit LE910Cx 0x1230 composition:

0x1230: tty, adb, rmnet, audio, tty, tty, tty, tty

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
Acked-by: Bjørn Mork <bjorn@mork.no>
Link: https://lore.kernel.org/r/20201102110108.17244-1-dnlplm@gmail.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 2f79a5f1552d4..0e8177f0cc883 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1257,6 +1257,7 @@ static const struct usb_device_id products[] = {
 	{QMI_FIXED_INTF(0x1bc7, 0x1101, 3)},	/* Telit ME910 dual modem */
 	{QMI_FIXED_INTF(0x1bc7, 0x1200, 5)},	/* Telit LE920 */
 	{QMI_QUIRK_SET_DTR(0x1bc7, 0x1201, 2)},	/* Telit LE920, LE920A4 */
+	{QMI_QUIRK_SET_DTR(0x1bc7, 0x1230, 2)},	/* Telit LE910Cx */
 	{QMI_QUIRK_SET_DTR(0x1bc7, 0x1260, 2)},	/* Telit LE910Cx */
 	{QMI_QUIRK_SET_DTR(0x1bc7, 0x1261, 2)},	/* Telit LE910Cx */
 	{QMI_QUIRK_SET_DTR(0x1bc7, 0x1900, 1)},	/* Telit LN940 series */
-- 
2.27.0

