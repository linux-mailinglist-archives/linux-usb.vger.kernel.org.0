Return-Path: <linux-usb+bounces-33795-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IilOo3noWlRxAQAu9opvQ
	(envelope-from <linux-usb+bounces-33795-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:50:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8D41BC2E7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CEAC83054DF5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 18:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46B53A7F4D;
	Fri, 27 Feb 2026 18:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpA8m9TN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5793A63E2
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 18:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218234; cv=none; b=gWxsRK7PqTzj2YgNy2ev9my1hnEM5JLypq4le8AEX78kX3ap3Q91+x+pRq7J/ze5RmMIU2bBLZGLoRIEVfB1UgEUZFEPkb+JZtbBSh7dBdI+FWVpu54ul0b4lu4WDSWB7a1QbilT0iErWZRss7guH1pBOlJLei3tOD9mQca7LcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218234; c=relaxed/simple;
	bh=l5F3e0YPzrTIIwQbcsoOk+4QMaUJcF5q/SEmSsYPKNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9a1Pdeji4zxZH2DR9ERK4QRZUFHfRpW3hKLKVf5Gya5uf/B8GRZOr9GHpMxf8hOQvIWwis6E6W3Q1HKWbw7YphqjCr3R97W6DQfand0ULu3YoTvvUT2kTzFxZQXGslCYpmhF+iY06+mOD9KSADhJIyKYJ/W1reHHP8XAM9uJAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpA8m9TN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35928defcd0so1428701a91.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 10:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772218233; x=1772823033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zSA6ggEX7RI5uK0hoklNltffsPuuX0XWMQrcz7Ii24=;
        b=RpA8m9TNF5sem+IKIe8Dd/EpdkZ/bSGoq9sYbPUPx1VXidTHlfmdANUekquEktL5sL
         pGDX1avB8YfOqAZQL1P0GjqccDI182Gic6lnkDyTlDwLs1S3xKKMa64p8dc/7UtiJMeG
         IGUEziI8pCAy3cgP2k4zFdIqOFXhz2fPKyxVuf5Sn++r9VgiP8VdQMAsWEMm1eq9/v4u
         7VIkYwPckC4HYkXFSENnsCkfh2mB7dkQZ1ILA4WIp1v89Owu1HdsHGtbsTRoyftnHmK9
         KL8RYxsCToYSWKkna7e0FkNHjk/vyh1aLbAAi0ZiZCaIwZDHCE/XwwHEeCqP3+NxLGiv
         dEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218233; x=1772823033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2zSA6ggEX7RI5uK0hoklNltffsPuuX0XWMQrcz7Ii24=;
        b=dLFe3+V35MQ6pPGRFp784hPeGyvydky1CIY8ZKGysewkKrrnnx/XZjXgs8BmdRQEGL
         J1H6d0r0FZiHgUtawsP7aWvFxagwksypBt0wlxaigCnnsCrqXv9pgblNHFEHn2JpPcKG
         Z915MrujQoD6UyuNjftKSanF+yssz2G2Mno1cVqH0tlBNKmxvqmXza9uC/k9ftJWdqM+
         I/qI/ce9nQ/2Xmn/k9XMU5pTdDtrFa0++hGVH521LOpkNVSd2WDAfClP4mvCopxWoIgE
         F+vTkqsFBWoaTW4ZFa+McziTtyCDRJXuaapUr5ue0rz2z2PR8NeMnlZ8pVi2hy1Pb8Ls
         q2GQ==
X-Gm-Message-State: AOJu0YyotHCHIuD2PG4NHI+NCZuqIwJhmCxotj9dkX7KgVlK6PrCWfoz
	/lo4ZYQ7XO2TlRLPMJoea3osy8VaYD8sOwAUrv6Jc5FGkmT63jQ7KMfp
X-Gm-Gg: ATEYQzwI0dfmKGPL577lyX5zuFrc3HQ+SEdvyEtKtwYe19+mY3YnrWp2Kr4DN3xx9FD
	XaPtRMhSWhirABIj1dj/H4nGQYv5UAMckULIEZvnnGGHZp8N2lODlqkVbjz8lnxrbhSRM/sBaAu
	lvPoAbTZo4e+D2jN6rE8FmIQtuFsy/u5/1dS50T8ws6uPJ2U/gUglJFtRWVBmOGPEMBAnV+cDCR
	2FOkxWpTVZvyqIPFU8PFbmUTtYBm5nuk/yCDzv4R6ozR7fCC4XligqGFm1hiUkEDG/yAIagJUCV
	nSDyFsdngw4VGtHxQa1BvwiJmugHXQkviVnuikCafqoEFCUcyTcCdtYFnXyjUBgdl+d6AYRcU8A
	pddNsPvpmm811dqOYa4lGt5bWmt/kvoODWNIV7RbXzkvZBAvhHrNhPl3oJZ8QPSRVfBeimM2U8e
	nek/1hNHsyVHtKCg8eaDfNRwQuHu58t/Ib2yIDFQVKK5R4VCQ7ijBz4lqHclGFgRXa7mELE2E=
X-Received: by 2002:a17:90b:5590:b0:356:1edc:b71 with SMTP id 98e67ed59e1d1-35965c228a8mr2943696a91.1.1772218232652;
        Fri, 27 Feb 2026 10:50:32 -0800 (PST)
Received: from HRD-WDG8GDY3.roa.hexagonmetrology.com ([49.43.203.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm5559002a91.1.2026.02.27.10.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:50:32 -0800 (PST)
From: Venkata Swamy Kassa <venkatswamy7@gmail.com>
X-Google-Original-From: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 1/2] kcsan: test: Adjust "expect" allocation type for kmalloc_obj
Date: Fri, 27 Feb 2026 18:50:20 +0000
Message-ID: <20260227185021.767948-2-venkata.swamy.kassa@hexagon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227185021.767948-1-venkata.swamy.kassa@hexagon.com>
References: <20260227185021.767948-1-venkata.swamy.kassa@hexagon.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33795-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkatswamy7@gmail.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hexagon.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E8D41BC2E7
X-Rspamd-Action: no action

From: Kees Cook <kees@kernel.org>

The call to kmalloc_obj(observed.lines) returns "char (*)[3][512]",
a pointer to the whole 2D array. But "expect" wants to be "char (*)[512]",
the decayed pointer type, as if it were observed.lines itself (though
without the "3" bounds). This produces the following build error:

../kernel/kcsan/kcsan_test.c: In function '__report_matches':
../kernel/kcsan/kcsan_test.c:171:16: error: assignment to 'char (*)[512]' from incompatible pointer type 'char (*)[3][512]'
[-Wincompatible-pointer-types]
  171 |         expect = kmalloc_obj(observed.lines);
      |                ^

Instead of changing the "expect" type to "char (*)[3][512]" and
requiring a dereference at each use (e.g. "(expect*)[0]"), just
explicitly cast the return to the desired type.

Note that I'm intentionally not switching back to byte-based "kmalloc"
here because I cannot find a way for the Coccinelle script (which will
be used going forward to catch future conversions) to exclude this case.

Tested with:

$ ./tools/testing/kunit/kunit.py run \
	--kconfig_add CONFIG_DEBUG_KERNEL=y \
	--kconfig_add CONFIG_KCSAN=y \
	--kconfig_add CONFIG_KCSAN_KUNIT_TEST=y \
	--arch=x86_64 --qemu_args '-smp 2' kcsan

Reported-by: Nathan Chancellor <nathan@kernel.org>
Fixes: 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
Signed-off-by: Kees Cook <kees@kernel.org>
---
 kernel/kcsan/kcsan_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index 79e655ea4ca1..ae758150ccb9 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -168,7 +168,7 @@ static bool __report_matches(const struct expect_report *r)
 	if (!report_available())
 		return false;
 
-	expect = kmalloc_obj(observed.lines);
+	expect = (typeof(expect))kmalloc_obj(observed.lines);
 	if (WARN_ON(!expect))
 		return false;
 
-- 
2.43.0


