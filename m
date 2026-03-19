Return-Path: <linux-usb+bounces-35099-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOEVDhOru2ngmQIAu9opvQ
	(envelope-from <linux-usb+bounces-35099-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:51:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5CC2C7812
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22E07305A6C8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 07:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5EE3A544E;
	Thu, 19 Mar 2026 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvJMQjdv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD8D3A4F2E;
	Thu, 19 Mar 2026 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906685; cv=none; b=YpajUNh6W4X2JAE4MH4+2CVqaIpJ1L1UO32qDQyDhCqucXsu8aXHjLZlAt0Ujo5ABqI3MfpKksdmeMEhkF3CqZm2UKewu2RvwdzFTl8ZRdl3l2jAnqCLjc+8CHkv7R/OAt4hMAnwkTrEEB25vunU45IRZnAEnYWwz5wivldzR7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906685; c=relaxed/simple;
	bh=i1jMaR7Of+P2VM0u1uTYga1uly9QzP3vQQpTIT7NgaA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uS3GgyvX1POAUxnNcGHSxeU4OUF6kF1BzkcfPJsQLR/370LVIelpWV8rk8krs70vntQ/q7SCFWp2GNL9jBf1FrDoAjtmgmkBwv91a4jCnA8Ms9wWF4GZbvQ/t2awevZt8EYCZrT97HAO4IZvT0Wf8tI8GvWwmpGthSPYP5GSXL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvJMQjdv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C74BC19424;
	Thu, 19 Mar 2026 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773906684;
	bh=i1jMaR7Of+P2VM0u1uTYga1uly9QzP3vQQpTIT7NgaA=;
	h=From:Subject:Date:To:Cc:From;
	b=uvJMQjdvIqKcJBM+oKLcnoS1HISYnv+tsFGZXhfWwwORjxOoIOapQT85B8s0t7ygQ
	 F/WW6GxkHikvcvogK/1IbtJVZdWD+1eBURSOeITCAfAVMI2WykDqulpgmIOVwl7TD6
	 YEM5QkPOkwdv72M4z8c6c2Gvx8Jg7K11FQ+znSyxWaJS2TQsFSCSP5h37zPsydqU9Z
	 UlH9bTykDHDQ/7pNNKPqed82X3NUUxpx3k6/Yj01s8gPKRF3U6bf6rPUH555/Wej87
	 5ReqOSuKEA3A/Cux5/sLtUBexCbh5djlo1tbO5rfCeGWysT7f1u5h+oNqCYYzoW299
	 LNYQsqWP+Z7qw==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/2] usb: misc: Add Terminus FE1.1 USB2.0 Hub support
Date: Thu, 19 Mar 2026 07:51:02 +0000
Message-Id: <20260319-03-usb-hub-fe1-v2-0-e4e26809dd7d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaqu2kC/3XMSw7CIBSF4a00d+w1PKS0jtyH6QDqpSUaMGAbT
 cPexc4d/ic53waZkqcM52aDRKvPPoYa4tDAOJswEfpbbRBMtExyjUziki3Oi0VHHKVqDZmT7oy
 yUE/PRM6/d/A61J59fsX02f2V/9a/1MqRoeY0yr7rnbJ0uVMK9DjGNMFQSvkC/JZM9K0AAAA=
X-Change-ID: 20260317-03-usb-hub-fe1-356aea478a5b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278; i=dlan@kernel.org;
 h=from:subject:message-id; bh=i1jMaR7Of+P2VM0u1uTYga1uly9QzP3vQQpTIT7NgaA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpu6ruNkgp8o4z9dTuxMbkk/cRz4Pz3WTVcdyv6
 xH3uI9M6vKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabuq7hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2OgBAAjVjPxs+TeMSm2eKu0ytTWbx7GrC96OsPGNhKcAR+VZVYcy7uCwB6w
 QcoVddOOU4F7HZ/MB2yU6+DmbFVr+Dw06y33psFK42Y/d7ntUN8Dh/8JfvpM9JYOkLIvNPx9si9
 2s0JrHKv78uYaa9NPKJUqYyTrQwgLSGxTMt6KqxlXte57KbPuiuvWDBfKtYy6oBuJbA7okylqWC
 UxvZbwMSliGJrk7KKtPxDjgt9SR1FrE2W4oB+88Vz7S2HIyvkG7Z7O5AIjcncOxWVDPGksT0eb2
 J74EclC0CPS/GDsAISRLkYqLcoEpr4tNyuprP5remjZkcMOiPa/FDP5oJf4JZhf0wIQX3Dg7KJZ
 7XDKnINo4Gn7HitYT4VEPXxWXTslzYojHPkwbrVcUuB01TWi2/W82W9B+laG2YyXcAgrSJbs0vn
 zD6jIUXXiXkmcCtANuIfwbRiaKHJmhEH7RKxJeusLEV+AmUzCDShJXFdCzmogS0GpFWfigsOdSH
 bEBhnOkZCiwK5WjhMbBftYMaPAzwuaLA4tWhJurxs7zf7iAsmjqbRB1ERgmTkyA+3q//Y10kkyM
 HehYiAoPt0e0aNmQ+qWVTFx0clfy/xpnhoIYY3/CuZpFgA0WsL3p4OTxFIRv8OFbK0bbeb33IWm
 83OABDOPfuAcj0Wme0i+wStAPIJpWM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35099-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	HAS_WP_URI(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CD5CC2C7812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series try to add support for Terminus FE1.1 USB2.0 Hub.

The FE1.1 Hub provide interesting choice of selecting power supply from
either 3.3V or 5V, if need to use integrated 5V to 3.3v regulator, the 5V
supply should be used. Otherwise, 5V pin can be set to NO-Connection,
and use the 3.3v external supply source.

Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- drop patch 1, not add Terminus vendor prefix
- reuse compatible data, no introduce new one
- fix binding
- Link to v1: https://lore.kernel.org/r/20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org

---
Yixun Lan (2):
      dt-bindings: usb: Add support for Terminus FE1.1s USB2.0 Hub controller
      usb: misc: onboard_usb_dev: Add Terminus FE1.1s USB2.0 Hub (1a40:0101)

 .../devicetree/bindings/usb/terminus,fe11.yaml     | 62 ++++++++++++++++++++++
 drivers/usb/misc/onboard_usb_dev.c                 |  2 +
 drivers/usb/misc/onboard_usb_dev.h                 |  1 +
 3 files changed, 65 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260317-03-usb-hub-fe1-356aea478a5b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


