Return-Path: <linux-usb+bounces-37380-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD1vJFpjBGq6HgIAu9opvQ
	(envelope-from <linux-usb+bounces-37380-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:41:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 168775326E3
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 884DF30205FE
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 11:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEA03FCB05;
	Wed, 13 May 2026 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="rqAJu54F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B953FA5D8
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672421; cv=none; b=j3VNzUxSFbhEEirAzScfNkR/bufHg9Jorl701njHImFbQ4QZFnpwbEBj5zMAjLAzZv4l/wAtnvKE6aPSPCWH1yT1VE4q8FBQOXooUA7eco7eys/P3SxhONp4qM7ThtfOR92wnytfyMEPYvMtIDA+26pyV/Z0jkKpX+1oVwwVs+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672421; c=relaxed/simple;
	bh=Zo1bKwZlEZaICjjvIUgDqifzJHuTu0prbFdXHcd3FNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKG0DtbemFz641O5a24oh8mHdIv5vIpK5SGpILc9Be2YqbtbjU1ATl5k47AkLocfb0SE9zrJ0HSpncNSxH/U8foIUKBlPFADdj+Hzn3k9bRqqp8vAaRrG1XUnr718giCr5RuD+UtpXQMnq4zSgyipkJm3K+uiN9AfdfQTnbFqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=rqAJu54F; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so29056065e9.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 04:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1778672417; x=1779277217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fRyxJU14pJX/5AtyEOHNqc7Zwu4u8GCE+MLyPL2ieU=;
        b=rqAJu54FRTrpmGuLruV+gTNJJ5gAYFTpJWaWxHvKBjOC5UeJ+1srIe3wxOt676ty7Q
         zj4h4eZD9OytcJiO/+RNriMqRkfNSXoCva/2trzDr/a7g7N+rRcSfaYd35W7ltzVS6z8
         Pm+DVFULxI6dsWkSBLxewAiL4QqQYH1T1OnQncakKIS9IDjl8WeHSfNsMyOXWX3gYrKw
         gkm6c4J3DjbtfTV3m4axBeoIdZe0EDcF0Ce/FBZQIvY+NUSQSLJrxofNKrq/c5I7IsmC
         N9YaFZYjuSvom1dfCJlQiO0RCPV4sfROgNFQjXGWMWw7BPle1BPc1PrdbOSp6qB3lhAL
         2S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672417; x=1779277217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fRyxJU14pJX/5AtyEOHNqc7Zwu4u8GCE+MLyPL2ieU=;
        b=RYgR9FtwYAc4B9GfN8DMmCOJCFm7VTBXO8CrtMwCaGc/Fd8HWu0ztA0Wco2PzKxs7i
         H/C+VD6emzK7G6kCt8b6t8KHR3VLDEaQPFrtpD01cAiUd8RILRNBYzpmf7RZn770wjol
         Kuqv9FUFlGq7VtrsGFxG1LneeHKOle+RmGM/KK5hFs0eGG8+L1hF88iIlmLP7NhNyJI7
         dPWSGfAVa7KfzZtOd9JR9RkRagNQF/zMMNesOWjsnBW8e8k0Ho+R9cNj2TEm4WJXCzyW
         T7wcLCcmkbes+l1x3jXpfM5Wbythd9JEXdgui6R2q16if/gPhBwI9sK5nqbTPXxBIxu6
         eftA==
X-Forwarded-Encrypted: i=1; AFNElJ8jjynfFimgiBAH0sCGhVupUXgX9vnIBRPz7wEbuDF2b2/nFdLBIxpTTfekJmZ8wKNZ/BgkBd0ZofA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRS5j01i7GR9AGr8cftOuVYJwSS9tVw5DzwR4/rEX1ds3fwaUi
	HDIE1CWXaQUIL+wBhgCVRiGg8QMfskOGkPxiwr2FrsldYXFsrfSXLP5wq7aUKKIEqQ==
X-Gm-Gg: Acq92OGTHaQoOsJqO1Z4HiwkGuPyhQuTMpvI2nWKfg2q8mNU4fYCHTuZ8aTIrip+aCd
	ghULK6GpEOu5iNJlk2UarMnxJ+zBgTQkA7fOVwvi9pN9g1UVN5/kJfUkQ6ZcEfoNwoK9EqDbWtY
	TXy7pvtDHAa4r/GEC27jul9KskF7gDFQp5rE7ZnLI5VNORcPn/tGFOmo8Mek7mayzZTf8w0AM0D
	X88LPaZZ8B5jHLI5ekOvkGm8b9dSk1d+O23JCa0dPduQylLU9bLVNCH4GjbW8y7iv2tdHnD9xkk
	6M+Tvg/wZtZdKofXWE3Lbiw0mDTySAIovUEqG6YXUkiCDMDzn3/YxA7Y9ztChG/KIdizf++uwTL
	RWP6xvfyBxCBoXgAeQyVHnP0Ds9pphCnRVMdgjhoY4SLwXD1ShkHydWlpW6Ayv/bVqwd34fU3hJ
	PQ2VfI4myyCTFLkH+AYS0KmfJof1MUuNYnal6Iialie6XRf6Z+qT7rzCItLsqOk9by/kxW
X-Received: by 2002:a05:600c:1547:b0:48e:8499:4bd7 with SMTP id 5b1f17b1804b1-48fce9eb099mr33828485e9.17.1778672416784;
        Wed, 13 May 2026 04:40:16 -0700 (PDT)
Received: from horizon.localdomain ([212.105.128.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fcdf64013sm53508475e9.2.2026.05.13.04.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:40:16 -0700 (PDT)
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
Subject: [RFC PATCH 0/2] mmc: rtsx_usb_sdmmc: qualify card-detect on tray readers
Date: Wed, 13 May 2026 12:40:11 +0100
Message-ID: <cover.1778672403.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 168775326E3
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
	TAGGED_FROM(0.00)[bounces-37380-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[starlabs.systems:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Uffe, USB/cardreader folks,

Uffe suggested sending this as an RFC and adding the USB/cardreader side,
because this may need input on where the media qualification should live.

I previously sent an RFC for the USB/cardreader runtime-PM side of this
problem. That did not get USB/cardreader-side guidance on the detect
layering question; the only substantive feedback was that the MMC child
should already own runtime PM for a real inserted card. I have since
retested that, and it is correct: with real media inserted,
rtsx_usb_sdmmc holds runtime_usage=1 and the USB parent remains active
through runtime_active_kids=1.

The remaining failure is narrower: empty tray only. Raw SD_CD remains
asserted, the MMC core repeatedly probes non-existent media, and the
runtime-PM hierarchy does not settle.

This is an RFC for the Realtek RTS5129 tray-reader false-detect issue.

Short version: on these machines, raw SD_CD is not a reliable "card is
present" signal. It is asserted when the tray is inserted, even if the tray
contains no SD card.

That means the current driver reports card-present to the MMC core for an
empty tray. The MMC core then does what it should do: it tries to initialize
a card. The commands time out, no mmcblk device is created, but because
SD_CD remains asserted the detect path is entered again. In practice this
keeps rtsx_usb_sdmmc runtime-active and prevents the USB parent from
autosuspending.

I retested this on an RTS5129 reader:

  - tray removed: no mmcblk device, rtsx_usb_sdmmc suspends, USB parent
    suspends
  - empty tray inserted: no mmcblk device, repeated CMD0/CMD8/CMD55/CMD1
    probe loop, rtsx_usb_sdmmc remains active, USB parent remains active
  - tray + SD card: mmcblk0 appears and reads correctly; the MMC child
    holds runtime PM as expected

The old Realtek rts5139 staging driver did not treat raw tray/CD state as
sufficient. It qualified insertion by checking whether media actually
responded before reporting a card present. That approach works on this
hardware, and avoids papering over the issue in runtime PM.

I know the previous version put the validation directly in ->get_cd(), and
the objection was that MMC command probing does not belong there. I'm not
trying to ignore that feedback. The question for this RFC is the layering:

  - if the only exposed hardware bit is "tray inserted", not "card present",
    where should the Realtek-specific media qualification live?
  - is an rts5139-style qualification acceptable in rtsx_usb_sdmmc if it is
    kept out of the generic MMC core?
  - or should the USB/cardreader parent expose a qualified media-present
    state to the SD/MMC child?

This is intentionally copied to linux-usb and the char/misc/cardreader
maintainers, not just linux-mmc, because one possible answer is that the
USB/cardreader parent should expose a qualified media-present state rather
than having rtsx_usb_sdmmc compensate for raw SD_CD.

Patch 2 keeps the validation path in a known initial electrical state by
starting SD power-up at 3.3V, matching the old Realtek rts5139 driver. It is
included because the validation sequence must not inherit a previous 1.8V
state.

I have deliberately left the SDR/UHS rate patches out of this RFC. They are
separate capability work and just make this harder to review. This series is
only about making tray card-detect correct and stopping the empty-tray detect
loop.

Thanks,
Sean

Sean Rhodes (2):
  mmc: rtsx_usb_sdmmc: avoid false card-detect on tray readers
  mmc: rtsx_usb_sdmmc: start card power-up at 3.3V

 drivers/mmc/host/rtsx_usb_sdmmc.c | 161 ++++++++++++++++++++++++++++--
 1 file changed, 153 insertions(+), 8 deletions(-)


