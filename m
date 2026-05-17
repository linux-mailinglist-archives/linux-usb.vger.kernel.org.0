Return-Path: <linux-usb+bounces-37552-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC+dGqzfCWqctgQAu9opvQ
	(envelope-from <linux-usb+bounces-37552-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 17:33:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5F561FD5
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 17:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBB1B300CCB4
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 15:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F4B38A71F;
	Sun, 17 May 2026 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SajrVGvr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16492C21F1
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779031971; cv=none; b=Z8ZDvhqqSZejfWBhqKxYXKmt6sxAM5IzSTPQZVv4hoCUz90sdpwjjN2CYrt/5CukbhKgtQ+ybME8s34MNlVFlzk3SR2jtiENA5rz+iElIhOMh71F56vaZ5sMocexbyau7gZImximEKyzClxw9/srsVBsLlOIu+d0Dhmd1+FBqc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779031971; c=relaxed/simple;
	bh=nIkhANwfUYNk2cvMxwiDTqwmsh3YjN8mg0957jUG1dI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hflN7wqplvnhqkfp78dAHXuxjs2b0owHKNLVlgGwHsRYWmyPuKIqqbFygI1eDcDG3H50F/wj5ZLqKGl0lcXwYw94IYTfo+fXJ5gDX6HEhMoKX1EnAfukzX9n/iQHmigNIXtyg5UVTbM7l2wmthKJQnGVX//iXhq338RfmzglVG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SajrVGvr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so14841715e9.3
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 08:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779031968; x=1779636768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1K7luyMFctbC2xxMMOief5UX3f4LZLtzL3tSnkI5JFM=;
        b=SajrVGvrdmRL+zhorNnVx5YqpSt7jVdkJkhNivWoaWHIhoovKeQs+bB2q7y12OflK/
         Xv8qrpw4ehRdKG3xVaQ9Yr92SbNIr0Y2V4mE0DGU1RefLBocmrGkeYO7onL1X44G/EDJ
         zm+c+v/5rr/KWUutXTSvgINl0cKmQRh7wClkXznbfutVy2ir0Xn3xql2tqFzifH5FtQw
         iV0pL/DqAXxXv6tTi21hFJjBj+eUjVewVs41wLI1HCqReTLKJwEItoGCuiHbQg7/+EQl
         IkjTdcSpXY53GpUr4S4WC8LaXYZ5Ox9ANxlG87/TQPivgk6qWbJV/hRvNWPjEOQBEyHd
         k6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779031968; x=1779636768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1K7luyMFctbC2xxMMOief5UX3f4LZLtzL3tSnkI5JFM=;
        b=nRBJoSLlu8j54FnPXE9I+kBz5vTavUlZ59F1JoDZJjdKnpT9boh2Y9vObC9ynA5wBP
         7/Br7m8FJd8WcMLJJtYEZ3H4CGmdJTWvgNTh2ifZOaO4GTUQnvR1puWDYw0PlJD4KAmq
         lpKPMrgXz8fADMocZ9Km1gEBfBvQabl8De6NX1W6/pksn6MD5MDFRJqfDIPrf8m9dL32
         crUY8yySWjXkDSZIAWlRhzccQqiQIIvBTJivLc0522GcTeVm9R9QzB2lqbTcRLfmogBb
         +TWkpkbCdzbWKjeOS1ohESViLDJ3HAx0U+aezRmD7wLyjD0lztRFlt+el8aIL9RWCXMS
         rOvw==
X-Forwarded-Encrypted: i=1; AFNElJ+bZ8XSe46+TGeY0U+kka+xjNXsNS44UduAn/hrh0ELhVoXFXKjKEDsOzVPOEs1bX0LcD+z3hvhTlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgrzZas00U1dGXDCwtSrdkkVbTw+iq5E0clZSdYDJH8/74OKmP
	iYHVRz5mpaPCFsV3rTxaQ3UWXd3YbgpBzH7kuBaZSNjiVbkPZaXtvB8=
X-Gm-Gg: Acq92OGicNEeNs8zLTAZU9Ws+oL+emGiBFK8hvL5b53uRgVi24a5g4RD9GIBtQMGqyT
	h8uGx0pDvfDwqXj2uEFi8r0JRRBdBz8n6tSKBMjMV60dxpVmJAVE6eptOKLMuEjoVBwa6jY9OEm
	blsSP7T0tFFUDDuQV6B7j5EcCp6CYix0kOC5YyiURepWTzbnTA65mvNsB9Dm3c+EC7prxHFPXQf
	Ie+30PRE6f5QJ9LrCUi3KpjGk6r0iqPgRfkuSk+9VQhlO5CZzIBMwGQ7Kgcmkmy5KCsd1NuSzo4
	hUu78YiJvTVmNGGmfFJJ7ZH6Xd6UEbTME6Hp78chcb1H5kHQydGBZ6Dc+sJKA5Zxvx9O6322DCM
	QkmihqY/9+d6QL8WTdEgWNtTWTG/ynEQOrhteYygRFd41s6KR3Pw70TD+XwlzmwXWfgPaJ/SV1B
	ETi6ObagrqkKbh6z3mI0X4m1jdKhwREBYcY8LvxI8V9AmlW1VhnrbydebqlCrKObOERz41QQqox
	rBl5PFrfw==
X-Received: by 2002:a05:600c:6098:b0:48f:d1b8:9ab1 with SMTP id 5b1f17b1804b1-48fe60ecc51mr191555265e9.9.1779031967646;
        Sun, 17 May 2026 08:32:47 -0700 (PDT)
Received: from kestro-laptop-linux.kestro.home (94-224-231-213.access.telenet.be. [94.224.231.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab290e1sm95307395e9.2.2026.05.17.08.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 08:32:47 -0700 (PDT)
From: Jan Volckaert <janvolck@gmail.com>
To: bjorn@mork.no,
	johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan Volckaert <janvolck@gmail.com>
Subject: [PATCH v2 0/2] USB: add MeiG SRM813Q IDs in qmi_wwan and option
Date: Sun, 17 May 2026 17:32:35 +0200
Message-ID: <20260517153237.55995-1-janvolck@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <af3nDLa1A1JcTftq@hovoldconsulting.com>
References: <af3nDLa1A1JcTftq@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C3F5F561FD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37552-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janvolck@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add MeiG SRM813Q support by adding USB IDs to:
- qmi_wwan for the network interface
- option for serial interfaces

Split into two patches so each change goes through its respective
maintainer tree (net and usb-serial).

Jan Volckaert (2):
  NET: usb: qmi_wwan: add MeiG SRM813Q
  USB: serial: option: add MeiG SRM813Q

 drivers/net/usb/qmi_wwan.c  | 2 ++
 drivers/usb/serial/option.c | 6 ++++++
 2 files changed, 8 insertions(+)

---
v2:
- Thanks to Johan Hovold for the review and guidance.
- split original submission into two patches per maintainer request
- Link: https://lore.kernel.org/all/af3nDLa1A1JcTftq@hovoldconsulting.com/#r


base-commit: 917719c412c48687d4a176965d1fa35320ec457c
-- 
2.43.0


