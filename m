Return-Path: <linux-usb+bounces-33301-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIB0KRcQjWnoyQAAu9opvQ
	(envelope-from <linux-usb+bounces-33301-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 00:26:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6081284E0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 00:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE9A8302DF70
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 23:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D4F3590AE;
	Wed, 11 Feb 2026 23:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZN5Vk1B"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE96E34CFC6;
	Wed, 11 Feb 2026 23:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770852354; cv=none; b=iLeE3XcI78xgzcSkR0BFpSwFm1xY5DGYE6G61pf1KEImUMVug1VDmKseGhjTG8zuuxL2KMc74gAiXxMU8mui1ODOOgFBZTxNBXbTo3fQ5CUZeNzBTqdGFXERL7Qi1C4utgLADiE1WVmPt1+Gn9SLzWYrO0DffLtiNVQUwpyt0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770852354; c=relaxed/simple;
	bh=izf2zG/94tc+KXQg6oNDoNUfu9pNiByjq4kRidr7zVM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fXADRqn9pY8cOSUuMGusagnAo/wwQBZgU12RxzzVCOoG17gqPh6vDxn7+wQqKqyQDysuogh110tnii6a6h2+PDK7gR7YDZjlXptmag7HC+YerRiGUw51LW5M8P0qAD1IUhd4+t0BUh0AIG0xcn//mgYuL6Goy5pEooFnvLJpdjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZN5Vk1B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87EFEC4CEF7;
	Wed, 11 Feb 2026 23:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770852353;
	bh=izf2zG/94tc+KXQg6oNDoNUfu9pNiByjq4kRidr7zVM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WZN5Vk1BiDPWsTsTmF9I5f1A/ivD8B9LHBcPh51DZUdNSVlOSN6yCB5hP0OIty65M
	 vHcRbMxU4JQwWGq6ex7l9Cb0DO+5fvkSA22UH+VxTkCVb++jqUx523ovt1KIcrDPjB
	 XBj2xgUFVgEfeCzfs3cWHHztyCG4whgNns4rJcR/wRLjFD37EshY8bu3yLaRJhnCVQ
	 6E/A3DwUPhVnzXvyNsZh4KEdeTBA9YMeORMisFAxZ6cdKAQGikRA86gDkQUG3z1ORv
	 ZEsGrO4LqE42ff5rKqoXNNYYrZoAZ2DtPJ7rYHQZqHHQ9gcrjoSGkT/fi91+C/V8s8
	 ufYG0FQOx6KVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D5DECD6F5;
	Wed, 11 Feb 2026 23:25:53 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH 0/2] Introduce Sink Cap Extended AMS
Date: Wed, 11 Feb 2026 23:25:34 +0000
Message-Id: <20260211-skedb-v1-0-616340426cdc@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4PjWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0MD3eLs1JQkXdPE1KQkSxOTZGPTNCWg2oKi1LTMCrA50bG1tQCWUjG
 yVwAAAA==
X-Change-ID: 20260210-skedb-5aebb944c35f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Kyle Tso <kyletso@google.com>, 
 RD Babiera <rdbabiera@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770852352; l=974;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=izf2zG/94tc+KXQg6oNDoNUfu9pNiByjq4kRidr7zVM=;
 b=cRix6fAND3LqFyrOtrWPLIwMSOgmCQFRlycA6KzFaQG/mFd3ZQEaUt4FfZmV/Xzd2vZDbQhdm
 W3IOZ2Gg/xgCjFP2jU6jH2zXiZELyT2tcPBjDNRsrvh4w8U54UDlgdx
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33301-lists,linux-usb=lfdr.de,amitsd.google.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[amitsd@google.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F6081284E0
X-Rspamd-Action: no action

This patchset adds support for Sink Cap Extended AMS. This is a
"required" AMS for PD 3.1 compliance for Sink or DRP ports and a
pre-requisite for Battery Caps and Battery Status AMSes.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Amit Sunil Dhamne (2):
      dt-bindings: connector: Add sink properties to comply with PD 3.1 spec
      usb: typec: tcpm: add support for Sink Cap Extended msg response

 .../bindings/connector/usb-connector.yaml          |  34 +++
 .../devicetree/bindings/usb/maxim,max33359.yaml    |   4 +
 drivers/usb/typec/tcpm/tcpm.c                      | 253 ++++++++++++++++++++-
 include/dt-bindings/usb/pd.h                       |  18 ++
 include/linux/usb/pd.h                             |  82 ++++++-
 5 files changed, 388 insertions(+), 3 deletions(-)
---
base-commit: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
change-id: 20260210-skedb-5aebb944c35f

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



