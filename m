Return-Path: <linux-usb+bounces-1544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6E7C797F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 00:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 456E61C2110B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 22:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4925C405EF;
	Thu, 12 Oct 2023 22:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BbJ3txwM"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC0405C2
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 22:30:57 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF651DA
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 15:30:55 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d815354ea7fso1960201276.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 15:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697149855; x=1697754655; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rizs44+83M1Yv3Y7Tz35EZFb6rX3ufgnc6hvuYWPAQA=;
        b=BbJ3txwMvDd7M4UKTgvyRCRHEBi90MSZAP14YjDXT+vjcrBKHDLRmhOcIfMGEfsTMA
         ZpcqG2M9PWNXdAf+sKsebnrIpKgpSJI2WS8EvdKG1jp+HHseXOlH5y3gux5budT7wuSF
         a3ryjUu3kSoYUkz66BK5VxsS+QM8R+GYLi9IRtIXuMzz4FO51T48+sxgVSAd/kUSxLs6
         XCNkNbAefeYVD4Pzel/GkitZM6d+3w24TIXH0lmUtnvtapwAcDB7VoiiYpMKbhnjRax/
         G1xizao6qaheTEEiTOyzyvIO/SiHeWsxYRQ4llawVjaGqwtczbKW/p7vmujybI1qBykm
         JoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697149855; x=1697754655;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rizs44+83M1Yv3Y7Tz35EZFb6rX3ufgnc6hvuYWPAQA=;
        b=njD6VBdHslDwTHmd9P8N4kXUv+5WOC+Xy+rZt5eyM02hhQKUAMYX8P81pQkC2XmK12
         kBHcxt8p6Tsvi2QucUReS2KJQ2pTIH8sVFgMOrGnMi5bvYsh6oQgV7MFGQopiCZ+N0uG
         AriV4zwzE5NfToGBdF5+MSx9Bw44CAQMK5SxtM+JN2SAsGb9EX+nDl7w5jv+yfhA2uGV
         nQDSYswxPb9tRxWCs1pZHNy5PMyIiBFkmgS1rxq35Rd25tt/2vGD60TJt3axokjZbgrM
         lcSI0Q6qH9AddBg9CEaO1X828oURZqyJaLNJaJJALJteAUuFKncdZV+5HPne8zqTZuvx
         7Qdw==
X-Gm-Message-State: AOJu0YwK6pIdcClNs7VyNwWHGXAq0xfB6bNUEnrRb6i3hIifoiTNVTCn
	Ym0ADm50KTiod89hUZ088pIDExCb0wGgI0slsw==
X-Google-Smtp-Source: AGHT+IEyJi+6aR4m8VCk9B1FVnsRZVbIeTZO5xWLf+zSzEab3f9/rvhauXqUE1a1ekH3cBluonY+I8G/UdZO0ZIl3A==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:ef4c:0:b0:d9a:6633:a799 with SMTP
 id w12-20020a25ef4c000000b00d9a6633a799mr181229ybm.13.1697149854993; Thu, 12
 Oct 2023 15:30:54 -0700 (PDT)
Date: Thu, 12 Oct 2023 22:30:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ1zKGUC/x3NTQqDQAxA4atI1g3MT6G2VyldTMeMBiSVRGWKe
 PcOXX6b9w4wUiaDR3eA0s7GH2nwlw7ylGQk5KEZggvROx/QVpW8fHFQ3kkNhVbc7I1zkltfK2Y s/n6NkcgVl6B1FqXC9f94vs7zB+QO05VzAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697149854; l=1788;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=Q/1jnaD/aLB5yEOg0SnHWnlmWben+eHo3uTy3iuBQAU=; b=ddxVrViH6Mz9J+19fMq1qOkfWAGORwS3qksqgHG/khfZO5dItcJoGVoGPXwxYvfTsC69cmRPu
 fxom8MzxhspBbWX2KdeKk0vDJwAJA773DmNslhYSz0ZYxxrjAnEt60Q
X-Mailer: b4 0.12.3
Message-ID: <20231012-strncpy-drivers-net-usb-lan78xx-c-v1-1-99d513061dfc@google.com>
Subject: [PATCH] lan78xx: replace deprecated strncpy with strscpy
From: Justin Stitt <justinstitt@google.com>
To: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

Other implementations of .*get_drvinfo use strscpy so this patch brings
lan78xx_get_drvinfo() in line as well:

igb/igb_ethtool.c +851
static void igb_get_drvinfo(struct net_device *netdev,

igbvf/ethtool.c
167:static void igbvf_get_drvinfo(struct net_device *netdev,

i40e/i40e_ethtool.c
1999:static void i40e_get_drvinfo(struct net_device *netdev,

e1000/e1000_ethtool.c
529:static void e1000_get_drvinfo(struct net_device *netdev,

ixgbevf/ethtool.c
211:static void ixgbevf_get_drvinfo(struct net_device *netdev,

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/net/usb/lan78xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 59cde06aa7f6..5add4145d9fc 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1758,7 +1758,7 @@ static void lan78xx_get_drvinfo(struct net_device *net,
 {
 	struct lan78xx_net *dev = netdev_priv(net);
 
-	strncpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
 	usb_make_path(dev->udev, info->bus_info, sizeof(info->bus_info));
 }
 

---
base-commit: cbf3a2cb156a2c911d8f38d8247814b4c07f49a2
change-id: 20231012-strncpy-drivers-net-usb-lan78xx-c-f19433ee0f0a

Best regards,
--
Justin Stitt <justinstitt@google.com>


