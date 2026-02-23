Return-Path: <linux-usb+bounces-33596-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMioI/GznGnsJwQAu9opvQ
	(envelope-from <linux-usb+bounces-33596-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 21:09:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F287417CBFC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 21:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2249230C7ED2
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 20:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4BE376BEF;
	Mon, 23 Feb 2026 20:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2zh6D03"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D936D4F2;
	Mon, 23 Feb 2026 20:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771877138; cv=none; b=koOkN6RxuiqAWip8o8bNJdPmcntsO4WEtNyJVgGvWPFiVlos60OwosBACvLuySpQJraWK9z3HzNUynac1waXEBkLPlDq6sMikKBpvqnrK1V0oHK85dx2jbIAX24TrFfqxAx0RlyyF2bcs1kSYmu8d7vMVdiJHIc+GPRIKFxVRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771877138; c=relaxed/simple;
	bh=vGQeQO1YlbRwkKZNHV41+XdKwbW3ff4YznTfIuBhUik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QuBw7ddQV6SdY/JPTaxzPPsGoz80mqT8it+YRQrLzo2yCvyWTaBzIbohsQoH7fB9gaDkQSy0nmXU+krDz6ZdFtC4qkeR0a5PHhj2q8mxf6uIY8W+NoFrpRG4mFRC4HFWnnPA1ONw782SkiHAYFlUO/tRfpzPyDepXd+o65WTNYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2zh6D03; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD960C116C6;
	Mon, 23 Feb 2026 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771877137;
	bh=vGQeQO1YlbRwkKZNHV41+XdKwbW3ff4YznTfIuBhUik=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=N2zh6D038A77sf8dN/CkvyNvqyaYZ8hnx7OV9KAG8ZNV32J7CzG//BqUHN8lywjL9
	 FvrDxHkQYS9P09YQA8HIdEy6oW8PTQReYg08OeaxQ3P9uoTd+PYY4MzfELW2/+sd5t
	 uFqcojFkCkBfcHOckAduFFYGcFY2gv2P1Bp4xnGEWFvOrCC4Hp/593h8XeQeYExu63
	 c/xG36nhG6bxv4NBKgtNOgXwWhrHhhZ4yj1kKuTVKcSLF5lZYBifkntN/mgKvmsWp2
	 pQDohZjmZOJS8xQUiCYH0UGlwbjVYxhEpUwalGl8iBLH1oPbnJH46oA3WzYE9cueJ9
	 BJTKEshCv2t7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A467AEC112C;
	Mon, 23 Feb 2026 20:05:37 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Subject: [PATCH v2 0/2] Introduce Sink Cap Extended AMS
Date: Mon, 23 Feb 2026 20:05:36 +0000
Message-Id: <20260223-skedb-v2-0-60675765bc7e@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABCznGkC/zXMQQrDIBCF4auEWdeixgjtqvcoWUSdmKFtDFqkJ
 Xj3mNAu/8fjWyFhJExwbVaImClRmGvIUwN2GmaPjFxtkFxqLgVn6YHOsG5AYy5K2bYboX6XiCN
 9Dufe154ovUP8HmwW+/oXxE/IgnGmhW4VV1JbZ28+BP/Esw0v6EspG1Nk2v2bAAAA
X-Change-ID: 20260210-skedb-5aebb944c35f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Kyle Tso <kyletso@google.com>, 
 RD Babiera <rdbabiera@google.com>, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771877137; l=1270;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=vGQeQO1YlbRwkKZNHV41+XdKwbW3ff4YznTfIuBhUik=;
 b=1C1YC5X/kdyac3vFIj+CpmhCvqTVNRN1152BDMfpHEuAlsUgPiGcj0ZN0S01BC4wXS0Zw3QX0
 jwY9y97k/gNA+TVdIHe+QlT68vRzDpjjBVhevRPfq1FIgRHs8pzhemf
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33596-lists,linux-usb=lfdr.de,amitsd.google.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[amitsd@google.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F287417CBFC
X-Rspamd-Action: no action

This patchset adds support for Sink Cap Extended AMS. This is a
"required" AMS for PD 3.1 compliance for Sink or DRP ports and a
pre-requisite for Battery Caps and Battery Status AMSes.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
Changes in v2:
- Fixed comment for `struct sink_caps_ext_msg`, `struct pd_identifier` and
  `struct sink_caps_ext_data`. (Linux Test Robot)
- Added Reviewed-by tag for DT binding patch. (Rob Herring)
- Link to v1: https://lore.kernel.org/r/20260211-skedb-v1-0-616340426cdc@google.com

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
base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
change-id: 20260210-skedb-5aebb944c35f

Best regards,
-- 
Amit Sunil Dhamne <amitsd@google.com>



