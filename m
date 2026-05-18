Return-Path: <linux-usb+bounces-37624-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBLeIpw+C2pQFAUAu9opvQ
	(envelope-from <linux-usb+bounces-37624-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:30:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BF2570EE3
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 18:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94BE030A104D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FC13F88B8;
	Mon, 18 May 2026 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVWLvW7B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE12745E
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 16:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121224; cv=none; b=pe6W50hua25M5k29ho1peK+cb2ObGZeBeYALkL/6/lcJwp3VxQEtXOgh0b22M1n1alrM3ymo5tZg2FkkYLeP5mNsDuzV/mTRg3uoawuAcrtAnTZyaCKHEEMoJ/cXsjEsh5mk9RfHZ7d/1CcirlRGWgsThuBeBvQXprh9B1czgy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121224; c=relaxed/simple;
	bh=szwVb7ha6bAIomsunYV5j5o9HMUkT6Mku/1VrKH1sas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CJSqtjZq8nLLf+sgcF0FO8dEQ0aBq2YkanKSUYJ75JKb91j0CXDTUT6ng+Q4+AnN4jh4V3d5YBchMwx4Jyq0PBTPR3Nh8X6ZouzfCF0i/oS62YJ5RxIEZBKI7f3exUA9H2GvdsQVyL+UJRSRFD9W0u443otWLBe/U+eEEOFdAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVWLvW7B; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7bdc947aa88so16325187b3.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779121216; x=1779726016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Urn1ATBBB6xhhKW9jeomFsTgrcuoAc20SB+ogv/eOw=;
        b=GVWLvW7BCeg7eTLRlKpWq+4UBVGXVwf22K4mpRz/WQvHpF+92ob05Eqev4p6UlXnIq
         ubX9Hc+eHSOC1zqXLnEn8PNJX1ew5xHVDKzK/z3ZxUHSec+8yo577vZWVgsCEa7oRDZg
         jb+YzzPhX5VXUac8l0JlzY3psarXh4qZVOm9+Ffcp3P71hM7D0plp8T5ritm7TCtwRI8
         +NSOcZZ+SNu88fj1vIa6lxvDkTCS2XZGFFw84ZhXjIaD8QygxbBumsMtq0TSaFJTgPN9
         H/ukRWfqTYg5MLbGC/I6f9xz4gGokeCEezL8WKBDMUjZ9R4FD9WMWmdlaoqoVueS+4At
         ppJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779121216; x=1779726016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Urn1ATBBB6xhhKW9jeomFsTgrcuoAc20SB+ogv/eOw=;
        b=ZFsdqcrdwqgq4EenPuvxBNu43TgfKgdFvz9k7WFmMu4W8m4Dhlr0BM9XG2BjgmVCxW
         GN9T5dqP7fkcQq5Mezcju4ZTxl4PCz0lXh1iixwkwjockHw336kxMrylcD0EqssshSpl
         xDF54uZVmZly9WqknOqOSUAejMOPGbYAPDPIDDRWX5yjUdHsBSgCczCI2L204ozPEKlh
         imp4Lr0iMyTvssdBTqpgsFRFbEk6GUtKd0xnEyBppxYw4sWXj0ig5bIBKMIUlVLOEGoH
         YSYvHYtPfKY5xeno+lMiwQbZkGMDSl+bBdDWvcD3Lso8wYPEpKvifIro40z+6JkWl1LM
         zcqw==
X-Forwarded-Encrypted: i=1; AFNElJ83O1gaykK1pkSzoFemNSx6NeeAock1WMMAURT6CcZJjIYTKepnHZbfsA0ue+y69JEgYxn4JssYvQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn5cWXR5n5sGAHeGwnzT9aJJSopAe/3ASQNIhqYBIZBh60pk/l
	iufz8hjY70zluuTNgbtPKATuke3tinLkptvalUFj/OLzP1Pcl2jXY8t5
X-Gm-Gg: Acq92OFBMa22egZiGAmbH5kEUYzLi/zhVkbacYKwf54PqH/mwQmNxk7RSSfN5UahUGh
	+tY1Z3ukJuVAAOFFBViBafRb9qzNmnOmHJApvL06AvkgCHMRCd4VnaRm4dH9T0sBZAQwrk1WzAZ
	Sx3+UVOavMrNf1+JeJlbUr1OESCePtPF0ODzEH2nCsGAEvLS2a+VG5eeRxshb3YkwS/cYZ0OeEW
	sJXhAGccDV4JlPa1cPLZDkq2HqPZLU9Wrj99OlBpHBNZNWD5/+ui75rmoaNMbQLISF2qv0MrkDp
	GHI30k1jJhjEytUDklTcq6qKN1TPFpIiVkAsI9Aj18JJR6AxR5W5kwuSbQDk4re9w8FDjKtk91Q
	7+AFFFmMLfVd6lNitkswSl5dbeHxqr66hQ48sOjQbVeznVRrSZ/1B+s3tekgfZsCEO833Do6/cU
	kGGMxAFzUMiLRQNnV54f0yvYjjmFBS4GhndzIIHhJw5w==
X-Received: by 2002:a05:690e:1589:20b0:64a:ce9a:ace2 with SMTP id 956f58d0204a3-65e228a2c9amr13014197d50.56.1779121215879;
        Mon, 18 May 2026 09:20:15 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65e0db60379sm6596021d50.14.2026.05.18.09.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:20:15 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: usb: richtek,rt1711h: remove .txt binding and fix schema
Date: Mon, 18 May 2026 11:20:12 -0500
Message-ID: <20260518162014.18251-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37624-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email,4e:email]
X-Rspamd-Queue-Id: 18BF2570EE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The richtek,rt1711h binding has a legacy plain-text file that was
superseded by the YAML schema. Remove it.

The YAML schema also declares 'additionalProperties: false' but
omits the top-level 'port' property used by hi3660-hikey960.dts
to describe the role-switch graph endpoint, causing dtbs_check
to emit:

  hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h): 'port' does
  not match any of the regexes: '^pinctrl-[0-9]+$'

Add the missing property referencing /schemas/graph.yaml.

A separate dtbs_check warning on the same node is out of scope
for this series:

  hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h):
  connector:ports: 'port@0' is a required property

That one is in the connector subnode and is governed by
usb-connector.yaml, not this binding.

---
Changes in v2:
- Patch 1: No changes.
- Patch 2: Fix port node indentation in example; port is now correctly
  placed as a sibling of connector under rt1711h@4e.

v1: https://lore.kernel.org/all/20260518142901.1747-1-akash.sukhavasi@gmail.com/
 
Akash Sukhavasi (2):
  dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
  dt-bindings: usb: richtek,rt1711h: add missing 'port' property

 .../bindings/usb/richtek,rt1711h.txt          | 44 -------------------
 .../bindings/usb/richtek,rt1711h.yaml         | 13 ++++++
 2 files changed, 13 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt

-- 
2.54.0


