Return-Path: <linux-usb+bounces-34093-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MMqIpSHqWki+gAAu9opvQ
	(envelope-from <linux-usb+bounces-34093-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:39:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC2212A8E
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 193BD302486D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 13:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0963A4F36;
	Thu,  5 Mar 2026 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWuzWEjx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1411E227B8E;
	Thu,  5 Mar 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717961; cv=none; b=pUFza/JqaeY08nP3epuFE8MKEocGpXU5Zm2TmygSOa5TqWkRu+xkeOXA6Ym0ZrH9vuAYKDzovtWo3Oqe76RoEEHOJ/U9lxZI8wtCsK016a8FmLigQ23JIfJQK/Rws/06254O5beaYwMmyI6MPfSMgfBIvUR7TuMso1DjbQU66dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717961; c=relaxed/simple;
	bh=wKmaOcpbZKABxsDW2oisUAj5dZhNuu4mWbIioyRCYUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKkADmG9mAi9T1KJg7FfzjnBZf5piUGAXLfW3KN9z8mAsTeP9nhLhemlfGeJD7ug8mshdbXjD6bqifzq/ksB6zkjA0ua44SlW0+XA6UFODIi+VBWHUh8zUpd71V08lYNB0+tHbIp3Xrw8Lm5KM5YTqZq7aXNJ8Ef+hflwLVRKcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWuzWEjx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC14C116C6;
	Thu,  5 Mar 2026 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772717960;
	bh=wKmaOcpbZKABxsDW2oisUAj5dZhNuu4mWbIioyRCYUk=;
	h=From:To:Cc:Subject:Date:From;
	b=DWuzWEjxxyLCCpokXa/LrYbnyIWiHnC9oLnkbiXvlg3n+q4QnX7Qnp/5Ezvyq1LN6
	 TPvV+FIz9xPTML824xUEcm7yYceNCt7Mw+e0VGJppJWyU6FU4VwjWL+7JE+36cNaqd
	 4e7M/nZWAtsCLSvDQ4xYvdUcymgS30ALzN1wXLcnUIygADAfGRuTHVyfoBUx0C/2hA
	 1losxmp3jj2XM3meOSTbYAp8ijXCwXVCIsaMs225DoA9lA84NTXN/VCPPcMVf19FSS
	 MzBwj1LP9FxW7IHSJ/dytTRbXOqs0dWeqzA28O7Ml3zC5//1MZH+EOsID0tZC3/v6Q
	 2WjCsHs+4DVqw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy8v8-000000000mD-1vOf;
	Thu, 05 Mar 2026 14:39:18 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bastien Nocera <hadess@hadess.net>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] USB: drop further redundant device references
Date: Thu,  5 Mar 2026 14:38:49 +0100
Message-ID: <20260305133851.2952-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DCFC2212A8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[hadess.net,gmail.com,kernel.org,zenithal.me,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34093-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

We have a couple of drivers binding to USB devices that also take an
unnecessary extra reference to their devices.

Johan


Johan Hovold (2):
  USB: apple-mfi-fastcharge: drop redundant device reference
  USB: usbip: drop redundant device reference

 drivers/usb/misc/apple-mfi-fastcharge.c | 3 +--
 drivers/usb/usbip/stub_dev.c            | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.52.0


