Return-Path: <linux-usb+bounces-19701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3826A1BCEC
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 20:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42A72188CEEE
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 19:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D73224B01;
	Fri, 24 Jan 2025 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r8iGu4Sr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED9202C27
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 19:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737747647; cv=none; b=dhj8UX7pqSeo8S2R/yj1x+zE3xKeTnA6IgBfYaC1DE1jrvf0z85q8zvaI+4suDbSN8y4ue6lXJZfK7Nh3nzmLt7d/4xi7fjHa7gCq7WTuyJfKWni9WzY0jIBuhFlnQCP+tQqVPXwRKccezc08LdKndJvcN+vEvd8TvG4XjHMuNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737747647; c=relaxed/simple;
	bh=QwYO9PZxCThzcCpITbcXVs1XiBBnSgAirneVfxCQzwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t+m0AqopEPNGgY3x64q1qbqjYS7AyBt2ww93uI9GuAjZKZiEGCbF81iZKgdCKKMVVHJTq0b+LsZnp+cbrYxCfLbPXvfZrl1mhJFRpdAauOoKGAxYETfMd/Toq1o6DIN+bsKFFWoIGFbvOOmjis3AIqg29/V/h/NmccimdqNN530=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r8iGu4Sr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2162c0f6a39so68008615ad.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 11:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737747643; x=1738352443; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RsA2Td0GmZhvsNv3upCcErafZhW9TcZYUo0FDnBPQBg=;
        b=r8iGu4Sr/GQUJmhf6uELTcKf7ZHAwBRsKre/QpKLe/GD0HXoS734flNQpnWs+mPWij
         P40DE+OfMjTAryITZUPjQpMO3DH2S55rjTQMjT/TATItjNtMuNufQJqEA1jDjQ3BGBk4
         3OKC2GKbcc+Ep6GoYE8n/V4EuI5TJMAk/aG5wcCiGtSS0MOgtGDme+Sr9Ic2oC8CnsUI
         AygUPE/ROlUzzvzVhg5iUXO7uJjHDUi8RNUQWfGk7p+G4Aq9kOCQLjVFXBsd24ZPg8fU
         HrR+H0j5/01kWltSBeQ9/zVR9dGJSRXpf1JXldFyzNxAHMnXFjfnW5GhXe2mPua2sIo6
         5K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747643; x=1738352443;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsA2Td0GmZhvsNv3upCcErafZhW9TcZYUo0FDnBPQBg=;
        b=sjcyyo8BJKvB6akGrEdNPb8B9O5M+99rsW85h1nDybg9QLBl3XiuTz3IsqRXtpC2z1
         QgPH90bhnsguWcEZiKfagBstak7b2VMs9Bi+F9X+VsyoXXSdLeTuucH6N6Xp1PaLtH/K
         NG308nGpcHbdlLCt84hvWcM7oQeIwlXyelH4luai5arHMgIv/foO+e4TgdFDXrhEGSAF
         nNCOtt0vrGPkev6nz1BDEuF3SapCyco0v9beiQobMq18mfBHcOOKX7UhzbHyKxM7NtrJ
         o9pAvt9td4fzXjlJ7Snoc7xs4AQY1MBdZIEIuGl0Pk1Sv/Bn+IsUFrXPezTF/UgmJbW+
         ho8w==
X-Forwarded-Encrypted: i=1; AJvYcCUCLLv/5NEfUj70r6Um/Nlv1cty1nXYk4ygCtE96SwV6ECKdjkjuFvobihRAoTVanY4S9hNErBHoNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwg0G5OvMwm+q0RPVI1iuEIk/l1lRN9sGE1EKoTHtncLkBG7V
	JnJw+VYtLPQk+3QE4orNwT+FyfbCjtOwwGJtqQohf6AssKO9z6CKS5AkurEVlw==
X-Gm-Gg: ASbGnctNtl5OtJsi64ehobDItlosRCkms69J9S7z4KqMu5HEQJGbOhOX92mLStii8fz
	ChWiUDSo4K1ZsY1Y74OT2Qc+K8e9ytt6Q1hCTYDKVCvL6+eiIemCxibh1uSpb7JNC6x/94JOFab
	hw0tLKm9txAwRT1RFc9caLf4fpMKIdg30wYtuEKZr0UGJKEREW/DVE2Wgt3g6hS+t8SDAkswhg0
	2+QYAif2p7kVgPvyPak5BFuWnjY3o3ekssBM9fUuT/PbaDzODGgn8WuccNsyFn1YJT1ts7RnmKv
	f6/6GaXSJaTyM1J/hdHrtU68Ton2C9W5BtwPSSPr
X-Google-Smtp-Source: AGHT+IHi8ugXNTLktZ75i6e/hZMghmmljaGGFz8gyT88jOcuSFXoV3Q30l2pcd5HlYB7doPvxH4tkQ==
X-Received: by 2002:a05:6a21:6b17:b0:1e4:745c:4965 with SMTP id adf61e73a8af0-1eb696de77bmr13239928637.8.1737747643397;
        Fri, 24 Jan 2025 11:40:43 -0800 (PST)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78e351sm2298237b3a.180.2025.01.24.11.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 11:40:42 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Fri, 24 Jan 2025 19:40:38 +0000
From: Benson Leung <bleung@chromium.org>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	abhishekpandit@chromium.org, dan.carpenter@linaro.org
Cc: bleung@chromium.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, akuchynski@google.com,
	ukaszb@chromium.org
Subject: [PATCH 2/2] usb: typec: thunderbolt: Remove IS_ERR check for plug
Message-ID: <Z5PstnlA52Z1F2SU@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes these Smatch static checker warnings:
drivers/usb/typec/altmodes/thunderbolt.c:354 tbt_ready() warn: 'plug' is not an error pointer

Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")

Signed-off-by: Benson Leung <bleung@chromium.org>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/altmodes/thunderbolt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 94e47d30e598..6eadf7835f8f 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -351,10 +351,10 @@ static bool tbt_ready(struct typec_altmode *alt)
 	 */
 	for (int i = 0; i < TYPEC_PLUG_SOP_PP + 1; i++) {
 		plug = typec_altmode_get_plug(tbt->alt, i);
-		if (IS_ERR(plug))
+		if (!plug)
 			continue;
 
-		if (!plug || plug->svid != USB_TYPEC_TBT_SID)
+		if (plug->svid != USB_TYPEC_TBT_SID)
 			break;
 
 		plug->desc = "Thunderbolt3";
-- 
2.48.1.262.g85cc9f2d1e-goog

