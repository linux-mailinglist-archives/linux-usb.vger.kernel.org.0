Return-Path: <linux-usb+bounces-37722-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPufEF2RDGp1jAUAu9opvQ
	(envelope-from <linux-usb+bounces-37722-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:35:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99303582797
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEEA6337B0C3
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 16:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C882407CC1;
	Tue, 19 May 2026 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="e5fLmGgU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A25403EB1
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207191; cv=none; b=ug23kkIw5U+ejy9qsiTPWxAJkW3x6ByoBxQNseZMv9mKQ1WzQ4ZST3M8zgPp8H2+Fs4X8dOz02UBHdCeXVV5qJgIMdONtyXOI4gFJtj08u+EzQgIFatdKAfUMUSuwhPg5UnUCC1nrTM7oUha7q7slAC58sb7xU13aCfw2bmK5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207191; c=relaxed/simple;
	bh=Tsu5cKPksAu4kUFh/jfhEBoMEX2CMmo6MJSwHBEeyl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MRXJZEKcgweb0CDMqcN5ERijz8eUAfzAiJMXoQ0unSJfEcFD/bNMKpqreps2Y18RmVg5E+iit7/ayQp8DxiJUrFLLLcrAH8U2DZcZ47Q1Tq++tGHLPQx9bX3pyX1FHPRD018p/8y9x480vsFy3odSQzLKlVj+2BNXyIaRphrYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=e5fLmGgU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so45082515e9.2
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 09:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779207186; x=1779811986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1+0LhtkVZ2YlUVIyFVTEQ/H862T2lawBohbTrKQTc4=;
        b=e5fLmGgU4mwwHacVX8p8DIVBpa6c5afiEBTp3I1QbjVvbsEAupcXz6NtlGyiLJ/EhB
         ieNCaVpPvb5PRVmHBBHxoJlqzPBfgwagHDYFzDHSnNehev+EieijVdBPc5Wdjqn/Pyzs
         WYMzCDsNE8x8FX9V0BF8u4AuiKV8wlTj5iUuMEg8s/Zphmnypp/WWDcINHx4Q/B5WcwR
         +bTEcrmLQM0vlXeDTMyJ1Uj61HaExdYC7t9rawASscmb3sAZFdKl341mnOj9J4MphVTb
         CBihULQpBA3KJnj8g5VlkDNnXkvwjz2Z/3JN7AuY/7xSuIk/KFzMDRoYEfxJS/y8Q7uy
         whFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207186; x=1779811986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1+0LhtkVZ2YlUVIyFVTEQ/H862T2lawBohbTrKQTc4=;
        b=o2uZ0ywFQBiHk55aq4vHtukYxLo8zbZWHJ5edtZMDxOLF3id7auHDrCe6uranUxoJ7
         fV4npZ2EdazjyK3plII54BD8xnwJaP03/LTINOKjJpKTgk/GTVraGmMjc0drf1tANTiy
         LRsNhpDXf1PgSQsTlXjRvexMF2FHt/ATzOquDfEL+5U+fYjlj97OvQQA5ErlHQyAt9M8
         MToMbvu2Muw49b7PtXJ+SgFvWXkycfVyrLak/QwXDxco2kcC/JpkqWjdZmj1j4M1Ih5t
         Nh+DrTFV25mvSkl9ODlq9fuWNqnfadMtgKchvkf4ebu4erPU8TcOgwyT2Y1oQNaSPiCx
         AXAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ODgV4lmpAyj85kx1ozNSbw9LlBx3HNmPdAdgJBn8ADw4Qm1qy8r/ukt5hGJmwR2/axnfzEH36crc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HOBi064Rk7SaupyHnwEtTcDhjtANu1YPcw5h9NuJFZ2TTQ5W
	e1pp93ektG/Wh8NKTwPqR9jZMyFfZslm4ZyXIZKG/mHSJfnoOkxY0aY72bTLKQztCuU=
X-Gm-Gg: Acq92OG7FDLLNEfiqUkRHRRVH2ufGV0cTZlddhio9/esd7+P+UXFP13Mchj++V53uUj
	0beyRH4hx0orDi5OSeWmWV7si+uukzNvx9jDvZ6NLkWODe70qShizk3m4F8kd++S/ua7L182Uol
	8zhW0sTzcbOOilE8F0I0FjicXihgrIiGkX1gGugi41h66ADaShImiS2ZONzF5yJXurqWO2x3HDG
	GRtIrAg469V970xt0HJvCMit+YakgE27IqaR7dWJz8QTZNXlAGykLigi1CGwEmuVx6clkEwRNYH
	iqK7rDP5g8FHHJBkanEZuQrZse8H+WJtnYHS1jVwpQYdoOh+uYX0Z9Ze/ug2DnxAArnNU1oPYp7
	FpriVFVSfY7RA3MlpfnmbKEBJO+RrfasWU4aCpZsSKH8YcqL66tbfHlWsP+vK0xVWuTVS6sjAO6
	gzXFTJVd6VQqz/ROD31P+kkF+uaD0lJ9o6gUNkUHIeVNVUV6ihmBafGib3adBa3MtDQjX4Qw/HD
	jdpuKB7Y7ybkUk=
X-Received: by 2002:a05:6000:1ac7:b0:43b:498f:dceb with SMTP id ffacd0b85a97d-45e5c35e285mr33169620f8f.9.1779207186315;
        Tue, 19 May 2026 09:13:06 -0700 (PDT)
Received: from localhost (p200300f65f47db048a8dfcf61053817f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8a8d:fcf6:1053:817f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0a19c2dsm47725552f8f.21.2026.05.19.09.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:13:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Johan Hovold <johan@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] usb: phy: isp1301: Use named initializers for struct i2c_device_id
Date: Tue, 19 May 2026 18:13:00 +0200
Message-ID: <20260519161300.1598095-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Tsu5cKPksAu4kUFh/jfhEBoMEX2CMmo6MJSwHBEeyl8=; b=owGbwMvMwMXY3/A7olbonx/jabUkhiyeHh7mUq2jN3Wag/yFpkSJ+Dr+Z9WTUI7+uSf6UmC/i qEKw6xORmMWBkYuBlkxRRb7xjWZVlVykZ1r/12GGcTKBDKFgYtTACbSHMj+31NM+kHQ7I4Tl+Oe zj/22ax8os3iOd17NXdxPlw/5eL2wzmvZ3B/M41TjdbfXlQiXFVVJ7XmdbH6bxmnLr8b8s/LLt6 3LGzw1ChcLHHo0I9O/9ltXI6Ch2SYVzs6LfATZpI5bj9Bfx//+4THvkU2lr8bOHT36IimJ1hf2X 5T9BazWu0Jg+jgNW+vMWj4Pd+5rov32QPfqTM9Y9fvVWs4FrNQQKLjS4zOvsJit313Zn0SvCWZK i587JBDSkCG3KnUmfOtZ0oLrJBM+rVtwVb+2V/EWHeu32bqZRn81195Zfnu6PT0D5Fp6cX/+TMd E0wPBh36//Ls3sBq9sqIL0eWWQTfWBnlanzJ4pFAXqIFAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-37722-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: 99303582797
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch is part of a bigger quest to use named initializers for
mainly struct i2c_device_id::driver_data to be able to modify
i2c_device_id. See e.g.
https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
for the details.

This patch here isn't critical for this quest, as this driver doesn't
make use of .driver_data, so apart from the better readability this is
only about consistency with other subsystems.

This is the only i2c driver under drivers/usb/phy, so this is the only
patch needed to adapt the whole subsystem to the new style for
initializing i2c_device_id arrays.

Best regards
Uwe

 drivers/usb/phy/phy-isp1301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-isp1301.c b/drivers/usb/phy/phy-isp1301.c
index 2940f0c84e1b..73cc70e958de 100644
--- a/drivers/usb/phy/phy-isp1301.c
+++ b/drivers/usb/phy/phy-isp1301.c
@@ -25,7 +25,7 @@ struct isp1301 {
 #define phy_to_isp(p)		(container_of((p), struct isp1301, phy))
 
 static const struct i2c_device_id isp1301_id[] = {
-	{ "isp1301" },
+	{ .name = "isp1301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isp1301_id);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


