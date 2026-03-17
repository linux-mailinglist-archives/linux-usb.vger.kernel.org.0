Return-Path: <linux-usb+bounces-34923-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOyeBPBBuWnq9wEAu9opvQ
	(envelope-from <linux-usb+bounces-34923-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:58:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0662A9639
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F37C309E7C8
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 11:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C86C3B2FE7;
	Tue, 17 Mar 2026 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWTM/WIw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A423B19C7;
	Tue, 17 Mar 2026 11:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748423; cv=none; b=Q2geSnrXAPEnZ3PVac6m2urKbhxZkZO35zu4JUJpqiC/E5TcDTHAOrFya+FKahw21C2T8RlvSqWuoCLrDeTr5rvVUYWWQ/lFLQEewTa6swFwvrve/pwu+ciuViCGnIYuZhMU5GrUSBLMwhUBgHwioR75/+rUU+f6NdRAIRAP1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748423; c=relaxed/simple;
	bh=FPNp7QabpdT+Z9HS3pynwWIO4HZC6hypayQTp1VHFNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ok4dEbzKujz388hMe10ul2AtpTPNfm1g+6u5/E/obni5nKqsPM0t1lECcKxSUtlvqHfoaQo+ENpJaXxLf4TFRgqOgL8oo261jCtu1RaR10Crw2S21/7HJpuWlIG6Zbs6sfw6CTQ4P3g4b3aKjW7XEGuPUAi4AhfSrzRXOcNir6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWTM/WIw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076E9C4CEF7;
	Tue, 17 Mar 2026 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748423;
	bh=FPNp7QabpdT+Z9HS3pynwWIO4HZC6hypayQTp1VHFNs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tWTM/WIwMphth/kUo3rOjdwHzAtuHP98iwVfUg4jnDSfHsggI3NrKYT3mEuk5Y6KE
	 zqhN5Wo9ueMWY7+SVhyQuB5zAOLLFwrG+xBqKzUXDy1YDJVrxj0EQV7Tb6Tj4Gzte3
	 c77k2GkJxcZrqARZxPul8FSt2S3WKjfqelspYxEA4yUXX+E5sgBNLhPrsEyOpaKkbe
	 O5ac+YLslotT+VZT9OH6ZflrthYxIBeDAJLoa8a4dFHSejBcCY8JfypmFZMklyz2nU
	 F9gF8cw9W90r8Cb6OGoiGyCgXZjqPTwF+1e3io/2glN3zMSKOyosA8HOZNUziFbtLI
	 OU7zk760xwnrg==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 11:53:02 +0000
Subject: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
In-Reply-To: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=dlan@kernel.org;
 h=from:subject:message-id; bh=FPNp7QabpdT+Z9HS3pynwWIO4HZC6hypayQTp1VHFNs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuUCzXMIuDFwRDPZrJgHXWP2XbVMZY8mDaC3xu
 FFXumtyQe6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCablAsxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2SNRAAhYgJ8Z+GvTYYu481TA4R6s2CmWfIE+ola2aIginwaoFtWwpQsVyWa
 WtmlL3rspUxX5xX31OmOc6fpG5QK/cXPcJvcQckXzX9xj9GfaZ3mtRZ4v1NlofHwZDr6tG3dQ/O
 mqHNRCXp5vUgNCyvWE8Q2mxuV+wFRztAOAcodkhlVOnHOpTQGY3rcrqpqOcZVM4d6po+RBEU1mj
 E5MHl7Y0cMRlZMNSMBA23KgEHTR7wk/y+5gFOycYv+0Y6sP0zNytFTNpVpegJp6K3h6IV46yPsd
 kqTtvekXuucOie8qUjIiODHra/++afjPY3YqmhLhdI0fXDIDLD+nI6B3kEpoxMQlBkGqmygHyje
 u9VBHh+aVT5WkdEFNZFl456y9sxaGuxES+LtbPXoL5mO51sABYTzHBw3jBIiJe95oTAaMmnMaOu
 2uVwcoDXwcfBjZt9CrQixNmhGOFfkhasROEQ1cx5lGXB41imYPORjDtT37/xYA720DQiZpGrz7v
 8FGhWQi0SqpgZeoS/2BDLi5sR83e9J3NCtPfuXjbrzAIZkl7HPHDwPfU6jg9BEFaE7CSZXdHYq2
 7W+urSQhL82oYE1cLb+HfjO4M8X7DyQXCK0AA+P4jJJCi0Y1QeKtWs8yfk0wNy4+zY8lo9l0mv/
 0b760YQEtq11p598Sb0W7cv7TPLWls=
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
	TAGGED_FROM(0.00)[bounces-34923-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Queue-Id: BC0662A9639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
USB2.0 functionality, and requires only one USB2.0 PHY connected.

Explicitly reduce number of phy property to minimal one.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
index 0f0b5e061ca1..cc27b363ca79 100644
--- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -27,7 +27,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-dwc3
+    enum:
+      - spacemit,k1-dwc3
+      - spacemit,k3-dwc3
 
   reg:
     maxItems: 1
@@ -42,11 +44,13 @@ properties:
     maxItems: 1
 
   phys:
+    minItems: 1
     items:
       - description: phandle to USB2/HS PHY
       - description: phandle to USB3/SS PHY
 
   phy-names:
+    minItems: 1
     items:
       - const: usb2-phy
       - const: usb3-phy

-- 
2.53.0


