Return-Path: <linux-usb+bounces-30893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D956DC84324
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 10:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980E13A7A7C
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 09:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9D526A0DB;
	Tue, 25 Nov 2025 09:21:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4503626056C;
	Tue, 25 Nov 2025 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764062509; cv=none; b=i6AEWDtxyEOJFwEMtJ20+XSD88aDGzHrGIBiT4RdJzIxmr4lm32u04huTa5EtqoY0zymplecB+pV2pH2LPXqN/xYPtc8Mq7wuV7TWxxnYeziqd+X/o6pMNqwYQjdJYYVi6oY1jlXn36r/iwBEtuzTdc7jSVdn7V9P6GPkjn61GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764062509; c=relaxed/simple;
	bh=w8g4FLy7ogrzRUDH+GV7ujp472YDrFv5ldU4yC8HlnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnJ7fhskealfGjcJetv7Suazq/V6U8KHGLMolJEGwLwkF4Y12tlObJqWkJlL4t2xawqFPK5Ta1zGd9ee4Rx887knMGTsc0fPexWDDqFcPPs1+Q6wQKu9VOZHWjmeO+djXmhGqAiNMQPRD4VuzpUjFvWtE3CB7RVLYf4golIlUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowABX4dMhdSVp5OQAAg--.2584S2;
	Tue, 25 Nov 2025 17:21:38 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] usb: typec: ucsi: Treat alt mode and status failures as non-fatal
Date: Tue, 25 Nov 2025 17:20:39 +0800
Message-ID: <20251125092039.524-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20251124122030.1759-1-vulab@iscas.ac.cn>
References: <20251124122030.1759-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABX4dMhdSVp5OQAAg--.2584S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1rAr1rXFy5Jw13AF1UKFg_yoW8Xr4kp3
	4qg3ySyryUtrWagF4DJFs5uF4a9FZ7tay7tr42g34UKFs8G34qyFW8ta4YgFyrW3yrGFs0
	qa1DtF4DWayjkr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JUwvtZUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ8RA2klO9PfOgAAsV

The ucsi_register_altmodes() and ucsi_get_connector_status() can fail
for reasons that should not prevent the port from being registered.
These failures should be logged but should not cause the entire port
registration to fail.

Set ret to 0 in these error paths to allow registration to continue.

Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partner tasks like alt mode checking")
Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
Changes in v2:
- Instead of unregistering the port on alt mode/status failures,
  treat these errors as non-fatal by setting ret = 0
- Changed Fixes tag to b9aa02ca39a4.
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39..77b05cd3917e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1656,6 +1656,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	if (ret) {
 		dev_err(ucsi->dev, "con%d: failed to register alt modes\n",
 			con->num);
+		ret = 0;
 		goto out;
 	}
 
@@ -1663,6 +1664,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	ret = ucsi_get_connector_status(con, false);
 	if (ret) {
 		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
+		ret = 0;
 		goto out;
 	}
 
-- 
2.25.1


