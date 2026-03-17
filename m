Return-Path: <linux-usb+bounces-34913-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKLdABQXuWmOpgEAu9opvQ
	(envelope-from <linux-usb+bounces-34913-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:55:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C91C2A608C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 835C83057C5E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 08:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D05A39E19A;
	Tue, 17 Mar 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gd+vQV7y"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735430AAB3;
	Tue, 17 Mar 2026 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737735; cv=none; b=VB2LnrnQKXB7uTL+R2Stja/gwI5nG0TFH45W3RzgwZ1Xo2F2DOZfd9oupRp8uh5EYvQaw32voCcY3Qo1XOe9Dh4k3aS3etWrvem5TZNBTW2DbD2KyzLgcBICTYygrnZh8SkKvhPXwlw/4i8q6hmuNWtuLh4omtBklxzHftvLLhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737735; c=relaxed/simple;
	bh=iBde1DipNEppQjMORt9AH9hRdkx20rTamKFIdz9TCr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eVcwpWB8ROtZNTTb5g0uyBaopS/qcVUOf9ySQYWpl7G1p6xaXeWJQpCGoLZ3kNcnbpB844aCIM3wZCsbOsSSC7CDct7SDrFRGOBLLKL9PMUtRPflo7M6WC8Y0iXuWyTL6RLWqAxDL6169c8qg/tigsb7wnf34NDD6YQZoMc9kKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gd+vQV7y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87FDC19425;
	Tue, 17 Mar 2026 08:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737735;
	bh=iBde1DipNEppQjMORt9AH9hRdkx20rTamKFIdz9TCr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gd+vQV7yzKEGZDFKikv5Ku1biaBtDk9EVfWUAOd9psC5pK3c26BZWz4lmOCZMev5u
	 qqeVSxWu8H3WRBguZ5R8cDY6/mGrtAOQB4tEd5YqKE+q7ZetwiMBY3uhuUCt3AjXxH
	 rd9kiQ0zfc/wsBkKC8PNOGUFS3vp/US9zK39gMPJkf71o8FXUHCyn5pqlTE8KLu5ZS
	 54liix0frShtB6P9E2EUR3MxFlSotlasz3K/+vOfitlV6wWzoG5RszDBWN+FPcU/In
	 VWFm0wTnSN9BzaJ5flE6O+GciYtRGFfDWgTIPvXdYpcZTxjPxBNOq6o9V6ecuIiSIq
	 YK0s6SOxwM8Yw==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 08:55:02 +0000
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Terminus
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-03-usb-hub-fe1-v1-1-71ec3989f5be@kernel.org>
References: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
In-Reply-To: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=dlan@kernel.org;
 h=from:subject:message-id; bh=iBde1DipNEppQjMORt9AH9hRdkx20rTamKFIdz9TCr8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuRb45HcFC2eBJuolAQJLKWKkvs81xD/i1Sh2e
 PhROd6EmlyJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabkW+BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2jOhAAkxYB45mEOpHGzpcrlYE8plgFQcczyjnGLw+vx5xlPpalqctaf/toT
 lZ9Qv/GOB0SNpUd6rPk1QwpxCMb+OODjJn0HnbuaNLF5qTfGrRRZG1UpHgalm3hjmpaKRflFbji
 yR2maJXfj7yduJ4GVDqpZm8s3K4wDWJRbF5zFYBJ6MmiP30eOyYSWuwDlTcqrsj/i4z2Ww8TNge
 c8YqsSqW453EAtIer3PxX4rs+J4tODAdyu5kwsJ+b3dkunHrrQ/0gv2bCzR20Y9LY/8Fm+t5Gum
 VfVKZxg7lZrTgqESiCFnCHoWzFtpZ40og+oGSpivQbszEoCoickBWDxbfIaFUzFZmqIuPfRu00m
 Dtt+BvZlMAzHY924F9BDq30JUX1WnZgCLvfzyLwcJjbQMG/D3LDQUgbJPUPUj05iXOvazbaFg+W
 SzuIfbpzoXeSNKdr1SJ4X2Rtu0FYzxmN67SMSosI2NxzK6xZVgkc2XuyBhjTgonRZajzND//sZC
 dViOT41glYp7Fg/XcCQdXjws+45EZiAZ8F14kEUyft0DVzuNKF1fHoEb96c3WTBdFClIrsDa2em
 kTX9Nj8tLSYqa9uwNJAnQ3t4EIecgftoZWdWA2UidR0rwCP8lbpp6kBd11BXh+jZSnKxVyfl2FS
 rzlFybZb2rnB4TA1XCHW1dVBBJocFU=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34913-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C91C2A608C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Terminus is a Taiwanese fabless chip company specialized in high-speed
serial-bus based, IC products for PC peripheral, consumer electronics.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..cd2df06cdc1f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1648,6 +1648,8 @@ patternProperties:
     description: Tenstorrent AI ULC
   "^terasic,.*":
     description: Terasic Inc.
+  "^terminus,.*":
+    description: Terminus Technology Inc.
   "^tesla,.*":
     description: Tesla, Inc.
   "^test,.*":

-- 
2.53.0


