Return-Path: <linux-usb+bounces-37381-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMC9OmFjBGq6HgIAu9opvQ
	(envelope-from <linux-usb+bounces-37381-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:41:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AFC5326F3
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73B1D302AF11
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 11:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300523FFAA1;
	Wed, 13 May 2026 11:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="B65h0YkW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C1B3FE342
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 11:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672421; cv=none; b=BvbFFGpTsWmIXXtrMDdqLcZpGlr7D2IxqOkq1Fli+woi81sRX18w3nsiLld2PR+oij3E6m/WkoZldEcdaT2w4srT12WavH5V1X5z5Jx3RAXGnA4hRe93AmnGbDdKDic2GqSzy+nzCQf84JDguRt+6mcDMNSr1q/IcL4i72xBqu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672421; c=relaxed/simple;
	bh=tOdHxbBJjFZBlIf8bIV0WunkgYiFanYFWu8qQaHdxOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjHroQJLvE61ocFr77sisbkTIdsx6XSluv7PT6D+RMgN+3j8VLLymSZ6RTps2Ed207Nz75EJGWW2fad8RAOXARVDu29Wag2p+fKFqDrokb5nPs+y8jRzI4IrELODsd5ZxKtckZNEjkPHGkXf8baw3vzyZ/cS3BUxK+kXTAsLhE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=B65h0YkW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso58398935e9.0
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 04:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1778672418; x=1779277218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WezRk8pMbMv4stSI3tk0Nplcuh6tkeeC0ibZoOc30qo=;
        b=B65h0YkWajVu8CydezqemBANjOIdhcG57LThR4v+a9w6H4VouIECRWrjZtM/cIQ4um
         Ju2H06xqoviGeLe53uUjWSiNFA14c8jCC9Al8l5sAcSSF1Rpe+H3YX2gADRyncvNF/r/
         YUbvIarEudeKdXfOSvODq5M8+hh0+ulcAkrKSYnRkluAbYjEFaWBC10YuAQ6xIh3djJs
         X+0h2gfikmsQ0qFeHCX/X2hDyDXCJ0HTzU3eJHxEcP2JY3/Dl4q0IJf+wy9rSMEhyMNw
         NpZq9kx4vslA/aMSV3CkegHog5dVoU4W7crgG1Ck4EXrGd/mUyz7EpsZ70VXnQrNeadd
         QXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672418; x=1779277218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WezRk8pMbMv4stSI3tk0Nplcuh6tkeeC0ibZoOc30qo=;
        b=Lh+79lUbRt4hEPATh+H5hPaU46fUtylOSJEWdxK8tZBUAbW2HYkDKAhRMBoCP7cfCk
         GColYYgYZTCOm+VZkIeBdaf+EA2EKJv8UmyZiV9ZAbYnttI+RKCoh46YX8nQfoCw8HcO
         MkO6sZre8x7ozM1hDGf3l2JBGjpwKfHEg59qNyUif0ubsVpE4ZTd5ClE+SJHETfaW2TC
         WJJWYV+hH/+apxhvgvmFZ4zSNwL6vPcii9sGO4DLs39ye/ag+f9DVBFvT7xN2uZ5znBz
         fMXN76V+fIUJ0Wm0YjfujKAzXQBat3jpYcQj1nCma0KpCTmPMfRhjlrv4wRiFmzyWWc3
         BWUw==
X-Forwarded-Encrypted: i=1; AFNElJ9xV3O0gAmyq3orHbQOOfFmljolu0B2toORzdBY1x5OJKcvPzOxwrTa/cdDCyj3TIchl805i821pFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUAVQncA4c+0mGzfbnHAe6D/LdOvXo3UIwznenMLMIAxb/AyMj
	//to8rN63MBnfIhVHT8BUtdxTPFrXOD1viogxxy1+6o789zilwSvtpvJVDDEJGtJeg==
X-Gm-Gg: Acq92OFV02a0PwZEKzC25GX3nsAEt2g6wVHqHVkbF8ahuK+3xYxkVVu/DyD2zTt6+Ah
	8Pla8Gc7m8AFqY7X8X22LKgw0dGGhsRIe3SgFMuwjAHqlREZ305ieqj+tYTerUHRhOgbiq4JJXm
	IAJFbxRaGuJmhf/svD2uUnBss1QGxP/RqnRIhTZgB2uPS40B79gulyqqoQexOUTaMVyTAc4DFl2
	vC75VACEt8LA/mWgitAKr8HBfSXUDamMjm2XifyPNURntLszBZrmGnYy10vp/huxcfNqBQ58UfE
	zoFAAQgF6LPw+Fcs7+zjH+xZgC/AL1rBluSmcJMfUmO1RUvO+pCUR4e6MwevdjjgqQDpu9aQrf1
	sr9QAXO9R3WgjVddKGJs1E0AeA5pTlCf45wRA+TH32fz1A+BkNo8KfppcEBinr0yzIy7SP0xdgy
	MX4nkB1LA3IgoQzKevcLO1oZcY/8iHrzagPB8JrwRa0Fdlz0WangP2qhtd8Vp3wdxpKVfg
X-Received: by 2002:a05:600c:3013:b0:48f:d1c0:5cd3 with SMTP id 5b1f17b1804b1-48fd1c05f08mr14509725e9.13.1778672418216;
        Wed, 13 May 2026 04:40:18 -0700 (PDT)
Received: from horizon.localdomain ([212.105.128.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fcdf64013sm53508475e9.2.2026.05.13.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:40:17 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Ricky Wu <ricky_wu@realtek.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Sean Rhodes <sean@starlabs.systems>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-mmc@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	rogerable@realtek.com,
	matthew.schwartz@linux.dev
Subject: [RFC PATCH 1/2] mmc: rtsx_usb_sdmmc: avoid false card-detect on tray readers
Date: Wed, 13 May 2026 12:40:12 +0100
Message-ID: <cad1837a6850835a922b87e21d49ec8821b5542c.1778672403.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778672403.git.sean@starlabs.systems>
References: <cover.1778672403.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 64AFC5326F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[starlabs-systems.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[starlabs.systems : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[realtek.com,sandisk.com,starlabs.systems,kernel.org,gmail.com,loongson.cn,vger.kernel.org,linuxfoundation.org,arndb.de,linaro.org,intel.com,linux.dev];
	TAGGED_FROM(0.00)[bounces-37381-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[starlabs-systems.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@starlabs.systems,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starlabs.systems:email,starlabs.systems:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Some Realtek USB SD readers with a tray can assert SD_CD even when no
card is present. This can make the MMC core believe a card exists, and
may trigger unnecessary initialization and suspend failures.

Debounce the CD signal and validate a newly detected card by probing for
a response (CMD0 + CMD8/CMD55/CMD1) before reporting it present. Also
treat SD_INT as a removal indication even if SD_CD stays asserted.

Tested on a Realtek RTS5129 USB reader (0bda:0129):
- Tray inserted, no card: no mmc device created (hot-plug and cold boot)
- Tray + SDXC card: hot-plug and cold boot detect mmcblk0

Tested-by: Sean Rhodes <sean@starlabs.systems>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 156 ++++++++++++++++++++++++++++--
 1 file changed, 148 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index 84674659a84d..ec3eeea78e95 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -19,6 +19,7 @@
 #include <linux/scatterlist.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/jiffies.h>
 
 #include <linux/rtsx_usb.h>
 #include <linux/unaligned.h>
@@ -30,6 +31,9 @@
 #define RTSX_USB_USE_LEDS_CLASS
 #endif
 
+#define RTSX_USB_SD_CD_DEBOUNCE_CNT	2
+#define RTSX_USB_SD_INSERT_RETRY_MS	1000
+
 struct rtsx_usb_sdmmc {
 	struct platform_device	*pdev;
 	struct rtsx_ucr	*ucr;
@@ -46,6 +50,8 @@ struct rtsx_usb_sdmmc {
 	bool			card_exist;
 	bool			initial_mode;
 	bool			ddr_mode;
+	u8			cd_debounce;
+	unsigned long		next_insert_check;
 
 	unsigned char		power_mode;
 	u16			ocp_stat;
@@ -72,6 +78,13 @@ static inline void sd_clear_error(struct rtsx_usb_sdmmc *host)
 	rtsx_usb_clear_fsm_err(ucr);
 }
 
+static int sd_set_bus_width(struct rtsx_usb_sdmmc *host,
+			    unsigned char bus_width);
+static int sd_set_timing(struct rtsx_usb_sdmmc *host,
+			 unsigned char timing, bool *ddr_mode);
+static int sd_power_on(struct rtsx_usb_sdmmc *host);
+static int sd_power_off(struct rtsx_usb_sdmmc *host);
+
 #ifdef DEBUG
 static void sd_print_debug_regs(struct rtsx_usb_sdmmc *host)
 {
@@ -768,12 +781,94 @@ static int sdmmc_get_ro(struct mmc_host *mmc)
 	return 0;
 }
 
+static bool sdmmc_validate_insert_locked(struct rtsx_usb_sdmmc *host)
+{
+	struct rtsx_ucr *ucr = host->ucr;
+	struct mmc_command cmd = { };
+	int err = 0;
+	bool probe_powered = false;
+	bool ddr_mode = false;
+
+	/*
+	 * Some readers with a tray assert the mechanical SD_CD pin even when no
+	 * card is present. Only report a card present when it responds to a
+	 * minimal reset/probe sequence, similar to the old rts5139 behavior.
+	 *
+	 * Must be called with ucr->dev_mutex held.
+	 */
+	if (host->power_mode == MMC_POWER_OFF) {
+		err = sd_power_on(host);
+		if (err)
+			return false;
+		probe_powered = true;
+
+		/* Issue clock signals to card for at least 74 clocks. */
+		rtsx_usb_write_register(ucr, SD_BUS_STAT,
+					SD_CLK_TOGGLE_EN, SD_CLK_TOGGLE_EN);
+		usleep_range(200, 400);
+		rtsx_usb_write_register(ucr, SD_BUS_STAT, SD_CLK_TOGGLE_EN, 0);
+	}
+
+	/*
+	 * Ensure the interface is in a safe, legacy / initial-clock mode before
+	 * probing for a response. The MMC core may not have configured ios yet.
+	 */
+	err = sd_set_bus_width(host, MMC_BUS_WIDTH_1);
+	if (err)
+		goto out;
+
+	err = sd_set_timing(host, MMC_TIMING_LEGACY, &ddr_mode);
+	if (err)
+		goto out;
+
+	ucr->cur_clk = 0;
+	err = rtsx_usb_switch_clock(ucr, 400000, SSC_DEPTH_512K,
+				    true, true, false);
+	if (err)
+		goto out;
+
+	cmd.opcode = MMC_GO_IDLE_STATE;
+	cmd.arg = 0;
+	cmd.flags = MMC_RSP_NONE | MMC_CMD_BC;
+	sd_send_cmd_get_rsp(host, &cmd);
+
+	/* SD v2.0+: CMD8 */
+	cmd.opcode = SD_SEND_IF_COND;
+	cmd.arg = 0x1aa;
+	cmd.flags = MMC_RSP_R7 | MMC_CMD_BCR;
+	sd_send_cmd_get_rsp(host, &cmd);
+	if (!cmd.error)
+		goto out;
+
+	/* SD v1.x: CMD55 */
+	cmd.opcode = MMC_APP_CMD;
+	cmd.arg = 0;
+	cmd.flags = MMC_RSP_R1 | MMC_CMD_AC;
+	sd_send_cmd_get_rsp(host, &cmd);
+	if (!cmd.error)
+		goto out;
+
+	/* MMC: CMD1 */
+	cmd.opcode = MMC_SEND_OP_COND;
+	cmd.arg = 0;
+	cmd.flags = MMC_RSP_R3 | MMC_CMD_BCR;
+	sd_send_cmd_get_rsp(host, &cmd);
+
+out:
+	if (probe_powered)
+		sd_power_off(host);
+	return !err && !cmd.error;
+}
+
 static int sdmmc_get_cd(struct mmc_host *mmc)
 {
 	struct rtsx_usb_sdmmc *host = mmc_priv(mmc);
 	struct rtsx_ucr *ucr = host->ucr;
 	int err;
 	u16 val;
+	u8 pend;
+	bool sd_int = false;
+	bool cd_raw = false;
 
 	if (host->host_removal)
 		return -ENOMEDIUM;
@@ -782,28 +877,71 @@ static int sdmmc_get_cd(struct mmc_host *mmc)
 
 	/* Check SD card detect */
 	err = rtsx_usb_get_card_status(ucr, &val);
-
-	mutex_unlock(&ucr->dev_mutex);
-
-	/* Treat failed detection as non-exist */
 	if (err)
-		goto no_card;
+		goto no_card_unlock;
 
 	/* get OCP status */
 	host->ocp_stat = (val >> 4) & 0x03;
 
-	if (val & SD_CD) {
-		host->card_exist = true;
+	cd_raw = !!(val & SD_CD);
+
+	/* Use SD_INT as a reliable removal indication on some tray readers. */
+	err = rtsx_usb_read_register(ucr, CARD_INT_PEND, &pend);
+	if (!err) {
+		sd_int = !!(pend & SD_INT);
+		if (sd_int)
+			rtsx_usb_write_register(ucr, CARD_INT_PEND,
+						SD_INT, SD_INT);
+	}
+
+	if (!cd_raw) {
+		host->cd_debounce = 0;
+		host->next_insert_check = 0;
+		goto no_card_unlock;
+	}
+
+	/*
+	 * rts5139-style: when a card is already known present, treat SD_INT as
+	 * a removal event even if SD_CD stays high (e.g. tray-based readers).
+	 */
+	if (host->card_exist) {
+		if (sd_int) {
+			host->cd_debounce = 0;
+			host->next_insert_check = 0;
+			goto no_card_unlock;
+		}
+		mutex_unlock(&ucr->dev_mutex);
 		return 1;
 	}
 
-no_card:
+	/* Debounce mechanical CD before probing for a response. */
+	if (host->cd_debounce < RTSX_USB_SD_CD_DEBOUNCE_CNT) {
+		host->cd_debounce++;
+		goto no_card_unlock;
+	}
+
+	/* Avoid pounding the bus with probes if CD is stuck asserted. */
+	if (time_before(jiffies, host->next_insert_check))
+		goto no_card_unlock;
+
+	if (!sdmmc_validate_insert_locked(host)) {
+		host->next_insert_check = jiffies +
+			msecs_to_jiffies(RTSX_USB_SD_INSERT_RETRY_MS);
+		goto no_card_unlock;
+	}
+
+	host->card_exist = true;
+	mutex_unlock(&ucr->dev_mutex);
+	return 1;
+
+no_card_unlock:
 	/* clear OCP status */
 	if (host->ocp_stat & (MS_OCP_NOW | MS_OCP_EVER)) {
 		rtsx_usb_write_register(ucr, OCPCTL, MS_OCP_CLEAR, MS_OCP_CLEAR);
 		host->ocp_stat = 0;
 	}
 	host->card_exist = false;
+	mutex_unlock(&ucr->dev_mutex);
 	return 0;
 }
 
@@ -1359,6 +1497,8 @@ static void rtsx_usb_init_host(struct rtsx_usb_sdmmc *host)
 
 	host->power_mode = MMC_POWER_OFF;
 	host->ocp_stat = 0;
+	host->cd_debounce = 0;
+	host->next_insert_check = 0;
 }
 
 static int rtsx_usb_sdmmc_drv_probe(struct platform_device *pdev)

