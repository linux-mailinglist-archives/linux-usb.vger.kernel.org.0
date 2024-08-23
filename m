Return-Path: <linux-usb+bounces-13967-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E5395CEFD
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 16:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2537A2878CB
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 14:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16ADD195B37;
	Fri, 23 Aug 2024 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uW0xJ+5v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAD218A6A3;
	Fri, 23 Aug 2024 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421807; cv=none; b=f/JYq0oVuBH3p0/0kYi2TVtFK8EyNQjOzqtL1dHuod2xWlatMlwgT8lDKYCeoQvIGPDu0CYYejqsxXZz6GENmyV0o7NBHEU7+K22r/DUxNCxWljdWepNcCvEn1fzJT/prWB2Zcc9RDBMTFivz5xBabcvbr+lUD9XCWwi8OyCeLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421807; c=relaxed/simple;
	bh=qJ762Uw+ii78oNsS5nEKNHQZVHwTP0SI+68hPCD2y+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmQsmIx4kd0gfGNpGNNaUFLjNKxYkZn1vmLKXQ1KjwANbnY9EQCK62KP+EWyclDZhDeRlK7H9wbYUpBWMGHeJ0fc3yg/tMI3nSLhUbJryC+M7slNNiLiP5b3a80TXBdsEgPNme3QLSmgv9CkPH43CpUao7EmIcH0r1Yu9yRrFjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uW0xJ+5v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4103C32786;
	Fri, 23 Aug 2024 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724421807;
	bh=qJ762Uw+ii78oNsS5nEKNHQZVHwTP0SI+68hPCD2y+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uW0xJ+5vJPzxvO7IhYn0Sz3F9m61pS6Ba5vL0CCb8cCBIs53HIDdYjMFHYQrPV+wY
	 PKfNqlhPW+O6mqoey1D7x+y1ouOCihFEDCO0f/ndhSn3IIfCZqsaJARLgxovYEv9mO
	 pjlCYbkZsVkQSJj52Hrr7YXtnZQUqT2lti4zNuBcHLbOKA0WCGtonHPjdjsU76e9vb
	 8akWBDjwwt934ZEgSrUmhKB1EgAjt1nhFk3aAUSRHsiU8LVCHUvfFch+3rNhyCOJav
	 ASlRXO/Af79qgRCLz1bh6PSrOBahb68epnc0VeQinqHBhlkMf3ASqTrSd9CrGzXcpk
	 Pr3TwiJJezUgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Foster Snowhill <forst@pen.gy>,
	"David S . Miller" <davem@davemloft.net>,
	Sasha Levin <sashal@kernel.org>,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	oneukum@suse.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 06/20] usbnet: ipheth: do not stop RX on failing RX callback
Date: Fri, 23 Aug 2024 10:02:20 -0400
Message-ID: <20240823140309.1974696-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240823140309.1974696-1-sashal@kernel.org>
References: <20240823140309.1974696-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.47
Content-Transfer-Encoding: 8bit

From: Foster Snowhill <forst@pen.gy>

[ Upstream commit 74efed51e0a4d62f998f806c307778b47fc73395 ]

RX callbacks can fail for multiple reasons:

* Payload too short
* Payload formatted incorrecly (e.g. bad NCM framing)
* Lack of memory

None of these should cause the driver to seize up.

Make such failures non-critical and continue processing further
incoming URBs.

Signed-off-by: Foster Snowhill <forst@pen.gy>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/ipheth.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index f04c7bf796654..cdc72559790a6 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -308,7 +308,6 @@ static void ipheth_rcvbulk_callback(struct urb *urb)
 	if (retval != 0) {
 		dev_err(&dev->intf->dev, "%s: callback retval: %d\n",
 			__func__, retval);
-		return;
 	}
 
 rx_submit:
-- 
2.43.0


