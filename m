Return-Path: <linux-usb+bounces-32238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 35115D17D1C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 10:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2367430066C7
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 09:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF18A389E15;
	Tue, 13 Jan 2026 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Mnbzhntf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D73815E6;
	Tue, 13 Jan 2026 09:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768298354; cv=none; b=ioApoJdz6QfFv6CJEiqFNSmpGN/Hs/I9vtu48lgczncP/9dA0nYSSYW6f6obDtohFyrvNIs8InnaFBTAuyps00fJBw2EsmRJ5Iz1Hk2R8Bk+pD1xkMWpA52gf/nED5Uduijhn1XTL5Zqe2up3jd8r4fTEPtuwdQHqdNE3E6qMsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768298354; c=relaxed/simple;
	bh=L65M+7Z+spe/sZcMn6cUcnXCT/+UARmucheHIATP9PM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=W3SRQtn1cIJFt+jGdmYnOVr4oFjbR9faWh8N4UlXDdMc3xArlqKqyGwQUvnaYo+IFx0KBTIpy82li9yXSUKjDsj4Btzvwos3m9zMXc18rBRt2+XPw4POcFfA8WsOVDhuP4tC8i/p0hGaLr0Mm1/wfBCbucDOZyApjFh0f73LQr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Mnbzhntf; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768298324;
	bh=mUDgtWuMRKlj6wkMa6HuaRZdURpIO9pXWkSgV4HSZrM=;
	h=From:To:Subject:Date:Message-Id;
	b=MnbzhntfZYus3jJPMY2gnRQBO73IUCfrEIZUf2fQRlXBbXR3c8MVKNNGmxVuMsyrh
	 L19fDDHJmvFcPhpnV5b/iAR6v9ML227qBV//gyFZeo6H1nKeleu55dvdEJ1FCLhjvl
	 hq2LoqXL7KXBu0aBVRN2oFFscDwFZP12k2G/kTHo=
X-QQ-mid: zesmtpgz5t1768298316t1d4bc7f7
X-QQ-Originating-IP: lNw7JOveck1k1bw0GGhe7u4FIa4U2S8jHCjQ3As8Ols=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 Jan 2026 17:58:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7161545627503197472
From: Chaoyi Chen <kernel@airkyi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Pin-yen Lin <treapking@chromium.org>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v2 0/2] usb: misc: onboard_dev: Add WCH CH334 USB2.0 Hub (1a86:8091)
Date: Tue, 13 Jan 2026 17:58:25 +0800
Message-Id: <20260113095827.115-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MxdW4jxL6NvXQoGjJXfegqasCpNM/AnCRvrlI0oNG5deYMD6/7LhOh0F
	e+UbXWTGZLUMzkB7gUa3XVbDFbC082eJQObnWr6mWTklkODZuPSnsy8guTiSCHdXeCllIAj
	eO6kSjri0jYSGlWHwO8EtIdadSGj5QwnBVcKmLogj97AoDr4Whl8nIGeZ5jX0IXT8MKuCjM
	VyhNjhPRUGsjgsV8D0iVwkVmj4NIROHYF9vQjkWlyFMTBPENam9tJDXMm8JNCVDZ/zwE2NK
	1w6A/UIbdIHLRFBBeS432gePUqEHE5L9ypXeoY5wsl5O3Rj1mu/64LVIxGAynQJW00XZ4Xt
	U8K/CQeLBJ91NShmgMO8fxttQJwR4umHBeEK0qg6EY5hbmp15Rkd95l16PvA6s+7wehe4+W
	o5i7ZVtuMckbeIJhvzJo5qIgMsrVtozhfHYcvQN4FcCv7uH4cxqoLWGBUoT3UNj9cwQTF/o
	EFZ/IEz6c4douVFwTLUSlr+cndgWifrTh+lPdKnXCxKs166FwzzkoQaeCkS3KgOcvU0+hHS
	CFP6tuaXZp1MrTBjSYFVsxOr92YlAEOqAYIALupVS2afRstqdgJ2nl1j/qj7NESTIpCORpy
	XooPRHdWpXPA9uKGCkB7vgkI0cxSgm6MFo1yuDJ32YQCysjJJjc4M0eh1xKkb+RR/O2r4jx
	//9RtWYZGRbVrxnOVZmB6h1S/NE7cBfHsGGiMousC1vOllNjtOSljQef1cPWvZHYpdAvVcO
	IbA6YUGU6NS7rugozAygzcxN2NI6rOappynsimn5l9bbBFGSaXuPjS8hkUb1vJHwgU2jJbq
	sCAruZH6EfNhSvokUV8vZQF1vxa+QPzyRBUEX6z/pHwhLlq9ju7yZb4RLKRZYvLuR/rHwxH
	Ex8Fav72SzQwc9lR1mu9fhFJSLEMpvtNdc0VDFcLBH1VoVjhgXb5OhLNKHrPSYrNcLkrjBA
	Fzfz+xXxH/Ai2Qs0gnDlpycTBQa96Yp3QURystXEIVP1AG41RlD0hhYmFVO/TIuEvwQaonL
	hAfQl/AQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Hi,

This series add support for WCH CH334/CH335 USB2.0 Hub (1a86:8091).

Changes in v2:
- Link to v1: https://lore.kernel.org/all/20260112022823.91-2-kernel@airkyi.com/
- Add missing driver (PATCH 2).
- Fix the incorrect reset GPIO polarity.
- Use a more meaningful supply name.

Chaoyi Chen (2):
  dt-bindings: usb: Add binding for WCH CH334/CH335 hub controller
  usb: misc: onboard_dev: Add WCH CH334 USB2.0 Hub (1a86:8091)

 .../devicetree/bindings/usb/wch,ch334.yaml    | 65 +++++++++++++++++++
 drivers/usb/misc/onboard_usb_dev.h            |  8 +++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml

--
2.51.1


