Return-Path: <linux-usb+bounces-30971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C9C8A523
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 15:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A0F63A6374
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 14:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B912C2FF641;
	Wed, 26 Nov 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aODGwThE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E62FF154
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764167208; cv=none; b=cMJlEWVSNQH99vv7evMVEvOQDGPoemRzCzIfnDhVMg5IFa2CYdM2gsO+68byLOEOC+8RmgwQs8VA9a6PdAicZR11Leh9pvrtpj9Ev29bVUcQvLTBrjFvjc3U11v53ryF6GaKOf4LRyD7nurWAbJRtG37V9Bo1bfF8SQUbGSs7QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764167208; c=relaxed/simple;
	bh=UtIV+W7d7ULadwt/sLLNw6mYocR6DZ/FNq904K4QJ5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5ttZOn87qKw9/sSZTRFeDXW7KjYwc4HFhz+4rTXioxOV35k862mrU+V2zzRkMBs/4ZzNOm/aWm9qX+RokhFwLsVozBjpxZTNvj2hbMIEfWoXIWsqETg/CegaPsznAHA0/FdTfzCKfTvW1VkDSzmzaM9TQgLHuuzGZ8i6v2bTZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aODGwThE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so4152176f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 06:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764167205; x=1764772005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7+0q2fDpd6+EuSksJmjo28BND5c7J6ErJw4jw4MspM=;
        b=aODGwThEueEn2kNHyVABn8jKXEBGYcMHPwQKDFrl93E46pJprKrkyxC+xgPCvaZuTR
         JKxx6wvBgAiThuLtR7CudaRfO8r0zvbkb4JNuhNXGSjdKPSF/NGsaUzy7tHyW9NS8Rjw
         1YdznmGR9hqjndprQ8zS5Dy+31jJrtnyw1ZvuPgf0dNQN0uIbKKEPikM5N5UPWjo49TV
         Ib+a0HAk32CG34U5ch+80WVsdRPhCBI1K4VuCohMD9Qv8jooFvAoqz8rcZgZfad7Q7OH
         lyz/bKMmUOYK0swDXfXr8KwfB1pve3xrU3DbLAaKAPHMnPJVjR73cDJVPkhsOUjp+/wA
         sGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764167205; x=1764772005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7+0q2fDpd6+EuSksJmjo28BND5c7J6ErJw4jw4MspM=;
        b=oGySKVrm03qBBYY0UuQScvqBTb4hYbs5RdEaMk+Zj5BpFuqHlVTvvjYkosxG7v6JRJ
         5278xOtApUA4jYfIe21YxQJCJl0kTAXm4nLRIdVkuxX/7lMkdGK8HWhgYHnZ9KsZvxmM
         /Qchct7Tadlf1iXbBTaQbf2JbbCWWAyDETgdN5r1eVMnpOwPqPBC2XwFsVWCPZ4Z5h9E
         FRzpWO+3oMw1ryivRg/kXqee07rQzc6duSqql3V1dYXDgvzRAY7s9Jzd7GXa1PgAu9cs
         6PAIn9Je6dp6wzx5lVBWnC+kL7BMOxedL3qNKYK1xa3Ip9riHoO/hkFpcaSgGmKV9Jw7
         sNlg==
X-Forwarded-Encrypted: i=1; AJvYcCXBixW8Ytt+GuABercf4nCWOuzykhHqwYEjObKnvkA5TKQ30BIhL1G7Vtp++VpQ50xhCJBnZsSK9Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGuGWwrbsxowDhbUh7VbCa7Mv0WIkNCt7IUA+IN7AAHI1XPRq3
	+Es9lUNzSbOizAuyPzIWZ4fv6OJSjswfHtTI5or86lBeY1uOml1I6d2V
X-Gm-Gg: ASbGncvSOVL5KhYCk1obG5jGrZUbCBiityJ2FBnNJgaHA/yJf76V+40HKxTlPIQCCPZ
	rpkdlqle3Fd7Q9e+jSfwn6RpWLTmUCPUBamdRcgRHrmiB2IMUjmpauxTVLcWu25Wum6hVGCgdPM
	IH89699DrrwmmVRFMH/ScHFaHDlEmjGxiV6/pyq1aCdGeZIL4l62N+nA26CzW50jqmL9lUOv3Xw
	f9pwaBl2HlENs6kK9LIrH3qF1PrpVISroPTUf2q++ROfbQ0WkZQ5+fctGPPxdynKyUtgkguAsOk
	Pz07F308TwZLexEi5P75vR+wiN/S6/IL06ScqRvVdUXgxriEWPZdFSec3BZ/dUiG/VhK1FVUvc0
	NcxeIc7QIooa/ZifbPcpF8wwRwAnGkPjCwXavswBM+/RQR9DXxaIEY91rSR/TNlh/KiXf/YLxkY
	Qt0BAflQmnFgO015v3oGNCeClq4BsNwpv2lQleh9qbh2E7PMWWc9fpcVkjJmPYV0ru248hfyrX/
	xwUprAJZu47OQd2DqfxVcVXNmnpXZM=
X-Google-Smtp-Source: AGHT+IHKzcxDPECg6FQQpq4XEfmLomZ0DwQtDXQr5GpFRlVzcVTsGaMvqNdJwSnnqvXHluhw9RjSzA==
X-Received: by 2002:a05:6000:2088:b0:42b:4951:8af3 with SMTP id ffacd0b85a97d-42e0f35679fmr6956708f8f.43.1764167204511;
        Wed, 26 Nov 2025 06:26:44 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm42112330f8f.40.2025.11.26.06.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:26:43 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH v3 0/2] Add Telit Cinterion FE910C04 new compositions
Date: Wed, 26 Nov 2025 15:26:38 +0100
Message-ID: <cover.1764167099.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Telit Cinterion FE910C04 new compositions.
Also puts Telit Cinterion 0x10c7 composition in the correct order
inside the source file.

v3:
- Fix commit message of the first patch

v2:
- Fix author's email of the first patch


Fabio Porcedda (2):
  USB: serial: option: add Telit Cinterion FE910C04 new compositions
  USB: serial: option: move Telit 0x10c7 composition in the right place

 drivers/usb/serial/option.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

-- 
2.52.0


