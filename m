Return-Path: <linux-usb+bounces-35224-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDhFLDT0vGms4wIAu9opvQ
	(envelope-from <linux-usb+bounces-35224-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 08:16:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E62D67AF
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 08:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C3E53010917
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 07:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D2E2C08D4;
	Fri, 20 Mar 2026 07:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdG1rvtC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF91DDE5;
	Fri, 20 Mar 2026 07:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990958; cv=none; b=ivfBOuc1U9gTTwkrVp4gheYM5w9NHiy8dad9LmAanqzrhFEHUr58SPbdfeJLQmECpBTyh6Doy1vcEpWiDF7Q05mUstuJJ2G/m6kzGAu1fiH6/1S9nbEa9e6XSe/a8Bwx1j6iBv4xiq8yAZWsM9jDUqZVhxWvB7Cd+Mays99JfBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990958; c=relaxed/simple;
	bh=zTJ7d5VKVBxYx9G690v21pJXq9vZUEBvG2Pesuk1GXs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HARTcOjzF+tDm7nkIaRzBp9mwFK55A+WtDooTXD29C53EJ90kuaV3x8e7E0TPJqoIuevV5OTx8OGx8olDssP8kpp5Qs5bmirHhHprlLHppl9qD0RnHVECVhYQrE0detOh1mnXPLW/Sox9V38DMrgba6lTzm1uIeiqgCxxyLRLhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdG1rvtC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DEC9C4CEF7;
	Fri, 20 Mar 2026 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773990958;
	bh=zTJ7d5VKVBxYx9G690v21pJXq9vZUEBvG2Pesuk1GXs=;
	h=From:Subject:Date:To:Cc:From;
	b=RdG1rvtCuMkHgoidJUY9NR1ArsoOYkW0gbTXHlENyloo3JbjAiuX0MLW7tGNGtQa9
	 6mkYEVpZaV+zCHp8ylcOqyQdVRdA6fMYZGAShAW9NubKfCmzzTG++xUFHVolevxmm4
	 ZnSjXg+3W8pYH+rkTDg2GLQw8/3VrQ9n8q587DMKof5Bq65gkGW+HguTY0r8Ecjy75
	 VgOgCxZrdT+9+KhCEzX77W0WwMz3cUGHwBhJ8AtvrgIbLrOe+37DoT900XsNvhQX7e
	 fiUsSSvCYsJ9zR6pSn9U9Nvw4KBCo/6qrrJHr/EUNl6NrmQmsHaVMDrRHMvuvb0Gmk
	 AHnh+GnGnU+kA==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/2] usb: spacemit: k3: Add USB2.0 support
Date: Fri, 20 Mar 2026 07:15:36 +0000
Message-Id: <20260320-02-k3-usb20-support-v2-0-308ea0e44038@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABj0vGkC/22NQQ6CMBBFr0Jm7Zh2EKSuvIdhgXaABkPJFIiG9
 O5WEncu30v++xsEFscBLtkGwqsLzo8J6JDBo2/GjtHZxECKSpVrQkU45LiEOykMyzR5mdE0ujJ
 5WRRsLKTlJNy611691Yl7F2Yv7/1k1V/7653/9laNCm1l2sKokhp7ug4sIz+PXjqoY4wf7XOid
 LcAAAA=
X-Change-ID: 20260312-02-k3-usb20-support-9a1893655e9d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1690; i=dlan@kernel.org;
 h=from:subject:message-id; bh=zTJ7d5VKVBxYx9G690v21pJXq9vZUEBvG2Pesuk1GXs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpvPQgdaNu3Wa3jbP9tc8E4mFIqS1Z9+wxy0fb+
 pfbXdHleMqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabz0IBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+22zA/8Du+QshMhDvSF73PJ2xQzzcYyWaDWdOsRNSOBQQT0+XOff2NAyKsgm
 WZiXcs+DVp6R2/IX10Zp+agZvjKL2CLI1nvPf5moSAo3XreicjYxU0E5TbSg6qp2hXXc9dukh2U
 Nz82/6/iuFBA1ZOA1ADHgDYLXmq5U7VwarPp5vlLKCmvrHMTAKxHHevaJcsViLvZITnkOP6RzJo
 t51ZmY0jBv93PUy0wg8Ikz1pKSs2HyR+immJAsw9zT5yJTCY9W+XbFmgns/gDyLlUcDkNbYdalF
 EVPjcD35qtsS2t8R2yYKm6U6kgoApmEiMXoXqXJ0/kRn9pbBwbsckfiFqxdGLl612RYPstqUguK
 59QwSud86A3GzG/RlSGlKq9lH4SADz6885Lij1fWQ/l7YsIDKSN9GYfGSGs3bwnuPvdS7JLIni+
 MwNhv+Qjy0YNQhFXXVoQalRZvbPtVPvNYGE6HF2bb1Cf2uP3aKwUFe3909YA4EU8AcR3l+2SwYS
 LQry7auFnvJApWr60hST/D4O/C2AVoZrclIWPSpjT+MDeodinyXMQRxAzHRQbNWUafuG6g2HDgn
 rLwmRspLQFTAI8j0HH7A9iKjSBPCGHJ46qqvTO35S/2l5cese5giYKFnByUXCcwLiJ5Z+oq0PwU
 /aao8112dM0NPxo18jb4m0d9Tn8mJc=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[esmil.dk,spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,lists.infradead.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-35224-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BA2E62D67AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is one USB2.0 host in K3 SoC which actually use DWC3 IP but only 
provide USB2.0 functionality, and with only one USB2 PHY connected.

This series try to add USB2.0 support for SpacemiT K3 SoC, and will
enable it for Pico-ITX board in a separate patch. There is a run-time
dependency on USB phy[1], Hub[2] and reset[3] patches, but each series
should be quite independent, so I intend to not add prerequisite id
for the dependency here.

For people who interested, I've collected all patches and put a complete
branch here[4].

Link: https://lore.kernel.org/r/20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org [1]
Link: https://lore.kernel.org/r/20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org [2]
Link: https://lore.kernel.org/r/20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org [3]
Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [4]

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- separate DT patch out, will send in another series
- document for K1 about why also work with one PHY
- collect tags
- Link to v1: https://lore.kernel.org/r/20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org

---
Yixun Lan (2):
      dt-bindings: usb: dwc3: spacemit: add support for K3 SoC
      usb: dwc3: dwc3-generic-plat: spacemit: add support for K3 SoC

 Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
 drivers/usb/dwc3/dwc3-generic-plat.c                        | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: c4c6e209dcf903ada6ddb4a0baca01ce8459a379
change-id: 20260312-02-k3-usb20-support-9a1893655e9d

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


