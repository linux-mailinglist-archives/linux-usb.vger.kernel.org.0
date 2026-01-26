Return-Path: <linux-usb+bounces-32723-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBjyIZNqd2nCfQEAu9opvQ
	(envelope-from <linux-usb+bounces-32723-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:22:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E87FB88C47
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 14:22:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D4FA301BA6F
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 13:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 137C8338593;
	Mon, 26 Jan 2026 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJumv6v0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7203385BE
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433732; cv=none; b=oI9fMv2wsL/M0YfuGrS1GKtinA2KZno9HgzuRAmY/1k3aLxhS3KL+fMWLmeTUi79LKli5i+gfpm1pxg5XTAc96EbbOuR2cT9gGD0vov4HfFiZh5XCcJVi/BUIZaYDqRteeX46Udbtxe1YZiHA7YWRqnTQ9jDmjib2YRFObLwXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433732; c=relaxed/simple;
	bh=t3vbGuZOz8Y3xaCGdPdF+heeK9+ps92UkQe57RdbqNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=blPVlGItOmohq/EaJXFlhslvHOyvN4jnd2cTf/l7tFvR55yguyj4fHZ+qB9BHTQXo+fZVuqOkG4oxrK5wNHBuPH27t4Ak+lrczkmHjs1q6kyGMypde03cc1oBYtMIdicjIUrcBZ8pRU7dJNwQgqFFafsyzxK4aQH9W0yPnMQE+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJumv6v0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a1388cdac3so33915075ad.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 05:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769433730; x=1770038530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXhQ27ymTAnKQWjmR3yBMys+DOnk7gmy+F3C+Z18smE=;
        b=ZJumv6v0z8ni+hCSDHyCwpciOX4RO1emSxBY8Abr+Pl3mOaGTvSDAQyjKBriOXwiWP
         N0dbqKIFcw0VaA3jyxZGQ/OZ6RESAaO8w6BzraT4xZv/Or9ZPocw9a6NKt2kLOVth73C
         TjTTCcPRKchx6LbFJceysABsXTsQhKXcvQXGgJFYIFvRVFt1UAYJnQds31mEmAANEHVn
         lzHeejBbsL/XbXpdfAo0Gb3SspGUWYeRt0Md1L5Q8HXNjY2MfA7eE7aVJbBA+OHV8/3v
         MeBwnM2XI98Vuou8cWqm+FKyVTnHQQRuHTkU7vKMyUio7lBXjQ/KXV579tFoXDC5bSyg
         scIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769433730; x=1770038530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXhQ27ymTAnKQWjmR3yBMys+DOnk7gmy+F3C+Z18smE=;
        b=rNRxSHkfTOry92O0hqEFOQtPf734iDtSeIXn4q4EqkrcHS4Fe/mYtFAS16b8b0Emf8
         e7xi+aykCD2fuVWBIae0YJnK9UFAENAjtyRorDpeG4lZRZkA0KkURRIeyO2FyyKP2HS3
         SPhmQmGMeoOX3Es1bRaldLEC3EPpY9xMnO9Y519nhztdB68AKYo2B9MtqVr0GlCh1+0c
         zdi+C4NXBBdzbsFLhEZrS6ZWCr7oXYAyX659IelpBJY4hj+yuFwzO96UF69wYGtNdoG2
         s8VhlSjz65n+H6NOnel/DhEvjpxJS3pNjry4VVeEUHM07qsDXf3aGDadL2+8VOVdq7ON
         0IoQ==
X-Gm-Message-State: AOJu0YyBWx+++Sn5+9KsPi5JVEBykNcoKCqFzckGsnQxXQc71U/oM5zO
	G5GakEehoUtVP2yeWQ4znxJG/OCGVct73HrHknbc2uCw6m7TGWwuJFSdxrSDUg==
X-Gm-Gg: AZuq6aLolqr8rGczkeZnH1Tt1zkdkFMxDb0BrqYv/Y2b6RjOCp0bl3mHili4FIl7yJz
	YxQI1u0MoLyJByuT0ZgY2hTD/GIeE56lZZnvAe1aDBMEbTV90umKyIsrlDi0jANug50Xl3yZMnf
	SHslyAuWfFjGMegESOFURlhdulj/UkbvpfaCqq9zChwZte0Flm4Eyh1MR1lRHiKTKB2bBNTcM5T
	T9gy+IRrClfB66KTQ2uNbZieXKrNEVFls5/Ceai8HqohXcpKbmI3lSm/rYNRUNICXJ6OGLT6y/G
	OahZU/WyVCGsU8w47KACq5hDkkgX280FM1vkpU2JN09tNwrTT31N2nwg3uA6bZv31WJIvR1eOS9
	cz0IfnCS8q6eyA8KFF6ryc8rA6d1Wj0gT1Tl0UvCC5wRAgPEJZ7zgILFKjX+rYV60yLmspKn2nN
	82LiR1mWC54hdyxhFRgVpT50FnX23lzIHZlhzSq231tlPL
X-Received: by 2002:a17:902:dacc:b0:2a0:9e9d:e8cf with SMTP id d9443c01a7336-2a845332006mr40823815ad.57.1769433730471;
        Mon, 26 Jan 2026 05:22:10 -0800 (PST)
Received: from Black-Pearl.localdomain ([115.99.251.203])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a802daa65fsm90602575ad.12.2026.01.26.05.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:22:09 -0800 (PST)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH 0/2] dt-bindings: usb: Convert TI OMAP MUSB OTG controller
 and DWC3 USB Glue to DT schema
Date: Mon, 26 Jan 2026 13:22:03 +0000
Message-Id: <20260126-ti-usb-v1-0-2855c129eb6d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHtqd2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNL3ZJM3dLiJF3LlDQz42Tz1FRDUyMloOKCotS0zAqwQdGxtbUAf0N
 59FgAAAA=
X-Change-ID: 20260109-ti-usb-9df63c7ee152
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32723-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E87FB88C47
X-Rspamd-Action: no action

This series converts the old text-based DeviceTree bindings for TI OMAP
MUSB OTG controller and TI DWC3 USB glue to modern JSON-schema (YAML) format.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Charan Pedumuru (2):
      dt-bindings: usb: ti,omap4-musb: convert to DT schema
      dt-bindings: usb: ti,dwc3: convert to DT schema

 Documentation/devicetree/bindings/usb/omap-usb.txt |  80 -------------
 Documentation/devicetree/bindings/usb/ti,dwc3.yaml | 112 +++++++++++++++++
 .../devicetree/bindings/usb/ti,omap4-musb.yaml     | 133 +++++++++++++++++++++
 3 files changed, 245 insertions(+), 80 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260109-ti-usb-9df63c7ee152

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


