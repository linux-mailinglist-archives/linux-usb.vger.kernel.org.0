Return-Path: <linux-usb+bounces-37187-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGatOFJ7/2nu6wAAu9opvQ
	(envelope-from <linux-usb+bounces-37187-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 20:22:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F4500F6E
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 20:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B26663003D34
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 18:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59F03BD659;
	Sat,  9 May 2026 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJPeNJ63"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79576397682
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778350928; cv=none; b=sdUvGH93nl0dTByIwpKzVXbk8OVeZwe873JjrR4/MavTpJP5E9B1y/AxczChQVvOAJT0eaAf6pPnYBpAqQcbckTtzHDuVI/+7sOKbtIB4oBErjI+2Aynk3wTge7+WGFZVO49M1qOLMJAZGR5POiL52RoeONgYugaIdK/sS5MejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778350928; c=relaxed/simple;
	bh=hcd1IK3pGlHUmDWH+Rqd5doqTRuaX0rbsTijnuNPBOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CwYLNNTXz6E6c6UXIrOyG0OJ2yoJObeKUeMHy9K22At+7o6mdhoHEckExEVjC2TATLR5SB7mKeCEdqGe9viYr0aUjxnZLcJ/MopRwKwZ1eMgZzu4smzHlJnPmvgRFkvw5eOsWdVrLhB7cq7EuPBPRcS+8ROFvOJ1Ab+IhJ/qRKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJPeNJ63; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so3497905e9.1
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2026 11:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778350924; x=1778955724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xm4Jqgv9FkjocRmCS06tXViVUiGl5UoWhrVE3LZ463I=;
        b=AJPeNJ63LglTpU+R+PH2jVjqFJcMkWAgV6vo0mZLL/JcCeUAKTdKv5xGJBCrLZOGE4
         78AvX7YthGzXfX4DxShQA2TyALnerlpBwdlUJuaJxsTA+tH7wAcHU93Pca3jjF8dKJVZ
         FHTv8u5NOLJy/KHQTFxhWxu2mKK9RygTqaLKVsr1BgHdU0+DNtkdI5n5+ICWYoIRb/Qw
         1RsfnOoNcZ9kI9ruq1meaoGlwebuhSi8rEN2lsMxZLtvaSKcKbDNhnjC1SmycwMMeC3Q
         tZa/48WtDufZy4Ea1IDu6/a0XMPayyyNjmCpq+w90cgWKl6ZYGq88Y/TmvCYP0UV0MnI
         K9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778350924; x=1778955724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm4Jqgv9FkjocRmCS06tXViVUiGl5UoWhrVE3LZ463I=;
        b=TJn06Mjwal38eGpzpbhmrCgyxOZ6c5yfgPrrtov2muWGlYrGWbpJN0bnF648xG7JAn
         i0fuplG89juXBctaiZRpBP3NG0v5lYJChe/xbhU7qYjDwgCX5pskOZm7jgKQfv29vwMA
         75SZci1Ocv/AX3nKWRu2TDg3zOaKt+h2c/fLr9n9MWAYAk3aX9eQDRHgj261vA9HfH8v
         BoNdux318yeC5kcATiWG1Ih4ed7UcWfRzSsKIf5S2PjwA24exPoI1R6O2MnJbyaM6eVw
         CiWbTQPO00OCYLR6QrLxsm5EOuaak9U6tlV9uREbj5rwaX5Q7TffNMIPH6hyZw09n5lb
         46Dw==
X-Forwarded-Encrypted: i=1; AFNElJ+XeVeWcYjrwD62qU9L2zFznFZAO2CLvVt2Yh5lzMVLdesIjYa53obNNb43iVIHLQ5UrRvn4hD0z5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qlpGk+j3sCyhadllvLb3xyExK5Zkss1wVVSiIRO9lsBEPA9w
	vxsuiVZIS9su/iD827IMoxvIkFDVP0XMDLdq5t87PJbczW3QGe8Ny8KeNW4ss4otoya0VA==
X-Gm-Gg: Acq92OEdcybCtJEmARrrDFjqOJs2IsK1Xb6yU+OI/2o41HkpnFtYkh83TwzJleEx0hQ
	jIaWuS8CVDefJ8BOy88gVeT8PF9WWC/f+/FUIJOpigSpjMbQ3y5NI3muIN9HSlGD0h2gCJZRuGC
	osyrS5MhcyR2ZSN9ZbzXlaXxx+Yn0XoHhniNDndt5P3CFgeYx9ia8VuHWwG7fiqaY94qrgn5J3E
	ze48/Ar7tzT8m8UMLwDu7KDXtd0oMgxBCyN8RLhwQA2P5H5+ZmFJRE3ps5R/QgGyTiSTS3J7va/
	cs7Q5JYq8chqW+YOOQ9Uvei8KOJYwfvPZ4rWhJfMUZrLfT4KKS94LZvoiIQlyMv+9qgXYKFHBCt
	8pZVcjXVcR7MJeV2E1dN3FE94OuooB24vX6FWfY3DrDm9ly45S/d0L2uDmz9FETwdGjutaMTJry
	sIaWdVH+PwSlVgL+mjktjOvCyLLTG+zcZnu7vZpcouC/tw6GbS+LtS1yAQ99kVXjnS0w==
X-Received: by 2002:a05:600c:4ecb:b0:485:3bc7:a224 with SMTP id 5b1f17b1804b1-48e530fc6c6mr118896275e9.6.1778350923677;
        Sat, 09 May 2026 11:22:03 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6d8946a5sm45598035e9.0.2026.05.09.11.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 11:22:03 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hcazarim@yahoo.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] usb: gadget: goku_udc: avoid NULL deref of dev->driver in INT_USBRESET log
Date: Sat,  9 May 2026 16:06:36 +0500
Message-Id: <20260509110636.19762-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D22F4500F6E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[yahoo.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37187-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

goku_irq() handles a number of bus events under a single ep0 path.
It already guards the gadget driver suspend/resume callbacks against a
NULL ->driver:

	if (dev->gadget.speed != USB_SPEED_UNKNOWN
			&& dev->driver
			&& dev->driver->resume) {
		spin_unlock(&dev->lock);
		dev->driver->resume(&dev->gadget);
		...
	}

but the very next branch unconditionally dereferences dev->driver
when an INT_USBRESET arrives:

	if (stat & INT_USBRESET) {
		ACK(INT_USBRESET);
		INFO(dev, "USB reset done, gadget %s\n",
			dev->driver->driver.name);
	}

If the controller raises INT_USBRESET before any gadget driver has
been bound (or after one has been unbound), dev->driver is NULL and
the printk dereferences NULL.

smatch flags the inconsistency:

  drivers/usb/gadget/udc/goku_udc.c:1618 goku_irq() error:
  we previously assumed 'dev->driver' could be null (see line 1607)

Fall back to a placeholder when the gadget driver is not bound.

No functional change while a gadget driver is bound.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/usb/gadget/udc/goku_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/goku_udc.c b/drivers/usb/gadget/udc/goku_udc.c
index db42a5e3e..ac2a984c2 100644
--- a/drivers/usb/gadget/udc/goku_udc.c
+++ b/drivers/usb/gadget/udc/goku_udc.c
@@ -1616,7 +1616,8 @@ static irqreturn_t goku_irq(int irq, void *_dev)
 		if (stat & INT_USBRESET) {		/* hub reset done */
 			ACK(INT_USBRESET);
 			INFO(dev, "USB reset done, gadget %s\n",
-				dev->driver->driver.name);
+				dev->driver ? dev->driver->driver.name :
+					      "<not bound>");
 		}
 		// and INT_ERR on some endpoint's crc/bitstuff/... problem
 	}
-- 
2.43.0


