Return-Path: <linux-usb+bounces-28274-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FBEB83C6F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6808D1892C65
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039D530497C;
	Thu, 18 Sep 2025 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBjC3d2y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73823019CE;
	Thu, 18 Sep 2025 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187476; cv=none; b=FdcPISy3/Xq4ysT7/7EXpYnMfLIv9Yd+uH98TBFyZ5ynwDN5oaAlO69oZchLeCXnSifH/j53COG3KH/FUsxf3MkNi3LEDMP7ZQ27lX0VacIcv3wCU2zrV1hFjHWT5K+i8QDYbpae156OaYYdEZ8xyxoHsNsWia545zYkWz0uM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187476; c=relaxed/simple;
	bh=9E6Z92AOi+KdNts18MJdP6mLHSc2LaCN1iJmxhy0MmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gxajv1cBrgaNgoM+UebKz3HlEy1lT7XLM5g7O4w8bd3Sfa4dHwC1preYbkYRknzLmPuzvTNJOFL5vkxHOHw7yfnrG5ni+X6UE3nX1DieqtrIvFjdAXnJ1BEcaIfSSwNB3vcSQdjK6C6UgYhcydzaLc57ZwkYyfnEtKPceo5EdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBjC3d2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AD8EC113CF;
	Thu, 18 Sep 2025 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758187475;
	bh=9E6Z92AOi+KdNts18MJdP6mLHSc2LaCN1iJmxhy0MmE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oBjC3d2y/sD+A1TF8p5R4/HlXs8nXNIDuY5DE4K7v3GH62Q9Pd8VLJvthKKn9JB73
	 Ia0DK3MvMCKumOPl4ZgI+hKAk6VxtzWH5gey+mgka3GdOth8HeTpYsRZSVBqq88uSx
	 3WGLodAqEGfrXdu69BHBL8aGzyN79zcXHCkY6CfcyGKb8gFvRXkSg4vn7tKGmyW0EN
	 Zn+AjMlBdlblAy8hZsVARCRSTegjvzHWGFoNmtzsmr81hSYvU9QLadjmCyiUiEu9Jj
	 Sb9TDuNvIWF+GkYxHGVxVdaEDV2ViaGasmo4Hs/TXZHLG6Bku9rnYUF2bf5mh8jnQ1
	 5rjCO0UFuvr9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5246CCAC597;
	Thu, 18 Sep 2025 09:24:35 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+cryolitia.uniontech.com@kernel.org>
Date: Thu, 18 Sep 2025 17:24:34 +0800
Subject: [PATCH v4 5/5] ALSA: doc: add docs about improved quirk_flags in
 snd-usb-audio
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-sound-v4-5-82cf8123d61c@uniontech.com>
References: <20250918-sound-v4-0-82cf8123d61c@uniontech.com>
In-Reply-To: <20250918-sound-v4-0-82cf8123d61c@uniontech.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>
Cc: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>, 
 Nie Cheng <niecheng1@uniontech.com>, Zhan Jun <zhanjun@uniontech.com>, 
 Feng Yuan <fengyuan@uniontech.com>, qaqland <anguoli@uniontech.com>, 
 kernel@uniontech.com, linux-modules@vger.kernel.org, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758187473; l=6710;
 i=cryolitia@uniontech.com; s=20250730; h=from:subject:message-id;
 bh=q9YL4dfxFW+wi9X8O0Or99A8F8YKo075b5AcBcYqJxY=;
 b=uCg6M3hiY8Wd7YpIvXBnafcDsWT6B8dy07XMZfeLqvpIyqE/wG1BT3+czVunfGCP32HJ/3n5W
 0qgvBmcU2+nDkrs3HY9g9h307cGRCly7B0lU2sHpq/snHw0sxHilKfo
X-Developer-Key: i=cryolitia@uniontech.com; a=ed25519;
 pk=tZ+U+kQkT45GRGewbMSB4VPmvpD+KkHC/Wv3rMOn/PU=
X-Endpoint-Received: by B4 Relay for cryolitia@uniontech.com/20250730 with
 auth_id=474
X-Original-From: Cryolitia PukNgae <cryolitia@uniontech.com>
Reply-To: cryolitia@uniontech.com

From: Cryolitia PukNgae <cryolitia@uniontech.com>

Just briefly described about the option.

Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
 Documentation/sound/alsa-configuration.rst | 108 ++++++++++++++++++++---------
 1 file changed, 75 insertions(+), 33 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index a2fb8ed251dd0294e7a62209ca15d5c32c6adfae..efffe3d534beeddcb6a47ac27a24defb6879f534 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2297,39 +2297,81 @@ skip_validation
     of the unit descriptor instead of a driver probe error, so that we
     can check its details.
 quirk_flags
-    Contains the bit flags for various device specific workarounds.
-    Applied to the corresponding card index.
-
-        * bit 0: Skip reading sample rate for devices
-        * bit 1: Create Media Controller API entries
-        * bit 2: Allow alignment on audio sub-slot at transfer
-        * bit 3: Add length specifier to transfers
-        * bit 4: Start playback stream at first in implement feedback mode
-        * bit 5: Skip clock selector setup
-        * bit 6: Ignore errors from clock source search
-        * bit 7: Indicates ITF-USB DSD based DACs
-        * bit 8: Add a delay of 20ms at each control message handling
-        * bit 9: Add a delay of 1-2ms at each control message handling
-        * bit 10: Add a delay of 5-6ms at each control message handling
-        * bit 11: Add a delay of 50ms at each interface setup
-        * bit 12: Perform sample rate validations at probe
-        * bit 13: Disable runtime PM autosuspend
-        * bit 14: Ignore errors for mixer access
-        * bit 15: Support generic DSD raw U32_BE format
-        * bit 16: Set up the interface at first like UAC1
-        * bit 17: Apply the generic implicit feedback sync mode
-        * bit 18: Don't apply implicit feedback sync mode
-        * bit 19: Don't closed interface during setting sample rate
-        * bit 20: Force an interface reset whenever stopping & restarting
-          a stream
-        * bit 21: Do not set PCM rate (frequency) when only one rate is
-          available for the given endpoint.
-        * bit 22: Set the fixed resolution 16 for Mic Capture Volume
-        * bit 23: Set the fixed resolution 384 for Mic Capture Volume
-        * bit 24: Set minimum volume control value as mute for devices
-          where the lowest playback value represents muted state instead
-          of minimum audible volume
-        * bit 25: Be similar to bit 24 but for capture streams
+    The option provides a refined and flexible control for applying quirk
+    flags.  It allows to specify the quirk flags for each device, and could
+    be modified dynamically via sysfs.
+    The old usage accepts an array of integers, each of which apply quirk
+    flags on the device in the order of probing.
+    e.g. ``quirk_flags=0x01,0x02`` applies get_sample_rate to the first
+    device, and share_media_device to the second device.
+    The new usage accepts a string in the format of
+    ``VID1:PID1:FLAGS1;VID2:PID2:FLAGS2;...``, where ``VIDx`` and ``PIDx``
+    specify the device, and ``FLAGSx`` specify the flags to be applied.
+    ``VIDx`` and ``PIDx`` are 4-digit hexadecimal numbers, and could be
+    specified as ``*`` to match any value.  ``FLAGSx`` could be a set of
+    flags given by name, separated by ``|``, or a hexadecimal number
+    representing the bit flags.  The available flag names are listed above.
+    An exclamation mark could be prefixed to a flag name to negate the flag.
+    For example, ``1234:abcd:mixer_playback_min_mute|!ignore_ctl_error;*:*:0x01;``
+    applies the ``mixer_playback_min_mute`` flag and clears the
+    ``ignore_ctl_error`` flag for the device 1234:abcd, and applies the
+    ``skip_sample_rate`` flag for all devices.
+
+        * bit 0: ``get_sample_rate``
+          Skip reading sample rate for devices
+        * bit 1: ``share_media_device``
+          Create Media Controller API entries
+        * bit 2: ``align_transfer``
+          Allow alignment on audio sub-slot at transfer
+        * bit 3: ``tx_length``
+          Add length specifier to transfers
+        * bit 4: ``playback_first``
+          Start playback stream at first in implement feedback mode
+        * bit 5: ``skip_clock_selector``
+          Skip clock selector setup
+        * bit 6: ``ignore_clock_source``
+          Ignore errors from clock source search
+        * bit 7: ``itf_usb_dsd_dac``
+          Indicates ITF-USB DSD based DACs
+        * bit 8: ``ctl_msg_delay``
+          Add a delay of 20ms at each control message handling
+        * bit 9: ``ctl_msg_delay_1m``
+          Add a delay of 1-2ms at each control message handling
+        * bit 10: ``ctl_msg_delay_5m``
+          Add a delay of 5-6ms at each control message handling
+        * bit 11: ``iface_delay``
+          Add a delay of 50ms at each interface setup
+        * bit 12: ``validate_rates``
+          Perform sample rate validations at probe
+        * bit 13: ``disable_autosuspend``
+          Disable runtime PM autosuspend
+        * bit 14: ``ignore_ctl_error``
+          Ignore errors for mixer access
+        * bit 15: ``dsd_raw``
+          Support generic DSD raw U32_BE format
+        * bit 16: ``set_iface_first``
+          Set up the interface at first like UAC1
+        * bit 17: ``generic_implicit_fb``
+          Apply the generic implicit feedback sync mode
+        * bit 18: ``skip_implicit_fb``
+          Don't apply implicit feedback sync mode
+        * bit 19: ``iface_skip_close``
+          Don't closed interface during setting sample rate
+        * bit 20: ``force_iface_reset``
+          Force an interface reset whenever stopping & restarting a stream
+        * bit 21: ``fixed_rate``
+          Do not set PCM rate (frequency) when only one rate is available
+          for the given endpoint
+        * bit 22: ``mic_res_16``
+          Set the fixed resolution 16 for Mic Capture Volume
+        * bit 23: ``mic_res_384``
+          Set the fixed resolution 384 for Mic Capture Volume
+        * bit 24: ``mixer_playback_min_mute``
+          Set minimum volume control value as mute for devices where the
+          lowest playback value represents muted state instead of minimum
+          audible volume
+        * bit 25: ``mixer_capture_min_mute``
+          Be similar to bit 24 but for capture streams
 
 This module supports multiple devices, autoprobe and hotplugging.
 

-- 
2.51.0



