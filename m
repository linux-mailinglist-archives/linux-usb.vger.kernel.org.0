Return-Path: <linux-usb+bounces-36788-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEMdL8SG82kY4wEAu9opvQ
	(envelope-from <linux-usb+bounces-36788-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:43:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 106554A5E8A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 18:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E881A3038BB2
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 16:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C350D47798C;
	Thu, 30 Apr 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TCAFEOLo"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65171340281;
	Thu, 30 Apr 2026 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567228; cv=none; b=pSVAFpBzHAJSCBDJqIe6fHCehQbHUqguUk5eMm74L8Jbp9Vf05PN46XkiJGhikNuoQI2HdC2UuGl5TbvTsuxVvIyPOtk2cDB4Vpoiqn9sxKCNbh3VCRHK+89FdmhH4iabAk2mqi0JgTRmmQpc5Caw2V07bAMOcY6JFpmmsA8UKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567228; c=relaxed/simple;
	bh=JTnzdK5G65pkRq/y78INNPq4ag6DFHyic5F4xsSNXLU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aOnTU2XaszzcBF5Cu5mkawsF6jd6C9Hax+5BzfzbGE5g4Khn4jDB6IG6DxZpN6ms/2jMCLlxK7hRx/PqTdj/wTPnD3KIeu7xgUy7zcQyHBiolfqpHQdHEvnDKsAI7RRbudP3GHHOM+Oo7FaHdrN/CfkjEd5py6RcqTnGMY3MP7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TCAFEOLo; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Pd
	m0Q5wvmCn6GgEqOUMjbFnoJ2kFK5BaF9LzslBFdQE=; b=TCAFEOLoYE9t+l126j
	uiN+UYc+AS0VC7guWxrC55BnHg12MgNlGinScfkU2dxPFg6kHgRKAXeAYuQ7YXvF
	ObdfoQ+Mlq7+Dmnwf6K9pbFDRuz4m4LvxVzz04WxWWZQvr8RZz3JM8HnkBJza/nD
	j85BWvzv1qRavZaFLvDOfS7y0=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnUmm+hfNptZrZCg--.19910S2;
	Fri, 01 May 2026 00:39:27 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	mathias.nyman@intel.com,
	chunfeng.yun@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	badhri@google.com,
	heikki.krogerus@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/6] usb: Use FIELD_MODIFY() for bitfield operations
Date: Fri,  1 May 2026 00:39:13 +0800
Message-Id: <20260430163919.47372-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnUmm+hfNptZrZCg--.19910S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryfZFyfCF45tw1UWF4rXwb_yoWftrb_AF
	ykuF4ftw1DWFWakFyUC3savrZ8urWkZrnYvF1vq3W3K3srKr1rXr1vyrW8J3W3ZFW8uF1v
	qF4DWryS9FZ7AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKFALPUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7B-ni2nzhb-ZWQAA3-
X-Rspamd-Queue-Id: 106554A5E8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[synopsys.com,linuxfoundation.org,linaro.org,intel.com,mediatek.com,gmail.com,collabora.com,google.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_FROM(0.00)[bounces-36788-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,163.com];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.983];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
macro across multiple USB drivers (dwc3, xhci, typec). This improves
readability and adds compile-time checking without functional changes.

---
Hi, If the Maintainers think it's not necessary, please ignore it.
---

Hans Zhang (6):
  usb: dwc3: Use FIELD_MODIFY()
  usb: dwc3: google: Use FIELD_MODIFY()
  usb: dwc3: dwc3-octeon: Use FIELD_MODIFY()
  usb: xhci: Use FIELD_MODIFY()
  usb: xhci-mtk: Use FIELD_MODIFY()
  usb: typec: Use FIELD_MODIFY()

 drivers/usb/dwc3/core.c        | 12 ++++--------
 drivers/usb/dwc3/dwc3-google.c |  5 ++---
 drivers/usb/dwc3/dwc3-octeon.c | 11 ++++-------
 drivers/usb/host/xhci-hub.c    |  5 ++---
 drivers/usb/host/xhci-mtk.c    |  6 +++---
 drivers/usb/typec/tcpm/tcpci.c | 11 ++++-------
 6 files changed, 19 insertions(+), 31 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.34.1


