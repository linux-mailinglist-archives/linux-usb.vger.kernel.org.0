Return-Path: <linux-usb+bounces-26015-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB762B0BBF6
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 07:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ACC33B40C3
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 05:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA741C84D7;
	Mon, 21 Jul 2025 05:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fyh+tIHW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1CA2F2A
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 05:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753074240; cv=none; b=LIbIDz9wYkNiUXWg4w/hfSoUoaxQ0JbL4gHZT/i8YzA5loDN5PF7QICkV5rvjjndMBKc2piG7ijfBhEuEae27zhZBF6wTWbTlcyaLjygGIiKRjr5m4h/Jo59OL3FU7mYSAMVDx+agcmnEQ+qOjRWClgx7+anQB2zjVaA9clkIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753074240; c=relaxed/simple;
	bh=QliRhlbWad5xSchLlsNQszp9wkDX72fevccvlDEP/wI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ob9Yd50dWQLWqHfJdXKEqQLnut83ExeqAc1vJLe6HbZ2sK4ByZUI0DEGxkq8IV36PFVbIsiEN8UZLW6oFyNQVrsCmHPoDMgH7o4pXtHH+jlqM1z7QhthwDMLKajdQ1N1PYtxeIvWPM5hDyEDOf54gwsGsgHkAWTOrWvadBBreQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fyh+tIHW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F4CC4CEF1;
	Mon, 21 Jul 2025 05:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753074239;
	bh=QliRhlbWad5xSchLlsNQszp9wkDX72fevccvlDEP/wI=;
	h=From:To:Cc:Subject:Date:From;
	b=Fyh+tIHWGKdr3zmFACfZ7guP2DUIZnsshlKeYIhJ+WI2gx9zx0C1y0jvarW6TJDHy
	 2dqxtWnrzCzwxGqZDcVMbOOti+g6gK1uTHx+5zZ86Pqd3W5c+H6z66Hff7OOmtH9Mz
	 o/SyyalY+8cftCmPA2gQqrOidO5GyP55OInzBUYJ4kVomJzsCRo7EwJ4KkPNLkP6tb
	 xwmJ33JYQp3e67m9Qa3KPZPSfr6tU1F1AEwW67HwXfwZuwZ5FRquM+H6/hUl+WRrvj
	 1/3kgntU5DOjGQIg0GEAkuDF6/mOvohxlGOJhIybHCpiPdSuoyb38McN6kTpCYftjQ
	 08nmA9bA/Mi/w==
From: Eric Biggers <ebiggers@kernel.org>
To: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb@vger.kernel.org
Cc: Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] thunderbolt: Fix copy+paste error in match_service_id()
Date: Sun, 20 Jul 2025 22:01:36 -0700
Message-ID: <20250721050136.30004-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second instance of TBSVC_MATCH_PROTOCOL_VERSION seems to have been
intended to be TBSVC_MATCH_PROTOCOL_REVISION.

Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/thunderbolt/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index a3a7c8059eeeb..45239703745e5 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -34,11 +34,11 @@ static bool match_service_id(const struct tb_service_id *id,
 	if (id->match_flags & TBSVC_MATCH_PROTOCOL_VERSION) {
 		if (id->protocol_version != svc->prtcvers)
 			return false;
 	}
 
-	if (id->match_flags & TBSVC_MATCH_PROTOCOL_VERSION) {
+	if (id->match_flags & TBSVC_MATCH_PROTOCOL_REVISION) {
 		if (id->protocol_revision != svc->prtcrevs)
 			return false;
 	}
 
 	return true;

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
-- 
2.50.1


