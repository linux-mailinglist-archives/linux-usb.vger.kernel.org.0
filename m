Return-Path: <linux-usb+bounces-8129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 726EB8855E4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Mar 2024 09:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3548E282267
	for <lists+linux-usb@lfdr.de>; Thu, 21 Mar 2024 08:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AB61864A;
	Thu, 21 Mar 2024 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3OZmXHa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A77C8FF
	for <linux-usb@vger.kernel.org>; Thu, 21 Mar 2024 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.85.128.169
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711010486; cv=fail; b=Xm1QkxuAal4SoZjezqfbx0PMGwrZYyndeBRlKHmBRvO5YsvoGzOqNVQL3bOZseQm3OGXFN/PLR+C3vxgQVnglLPw3mqmu04OpkwaFXRqpWpHe7IH6kMrXKRgwv3bnLBjlmygcTuG/NbUFEoxvuGSgVab+dJQggqqDZe2IeNbA9Y=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711010486; c=relaxed/simple;
	bh=HjZ6DTTFckPQMqiYHpgCAvYOUnUnPN6rebRmm1d1J9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDvYVsYEXISgVar2Rs4nKJSJGq4HV1SuBn3Jj4+gJlf6rXX3L/at2gvY5aZKRXjRmH5IaU9mrbF8P6RNV/IRlIVS9Hx6UwV4hPEK4nmne0/dsdAJVyp/HIXjkWbJbaWoz4yqGHfg89WtGTxMtaGAHTqm8RmGhqEVXqYFx8tlrVc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3OZmXHa; arc=fail smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-60a15449303so7462007b3.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Mar 2024 01:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711010484; x=1711615284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-forwarded-for:x-forwarded-to:resent-to
         :resent-message-id:resent-date:resent-from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p3vo1wc6J3C2AA1kLchReOFQ9IMrR/d6PBa4DE7a/Vs=;
        b=Ppq6FJvc8WL1hGysKLlNKFHWVSNx+wev0pJS8QFwwGZqzI5i/lUQbZJbRTuYyLihv4
         cQ240DRP0RnsR34HlH0VeawD+vGjqs6tXuaZcVRYbVMENCaW1HKVcXdHQ25nVUHPjlkk
         ywHJ0+ZP3oWGbzyAoRzMCuT/9X4hkH7pf9gLZECFmWjvhTc2XXJLpTFhjpmRqZULftwS
         wgjeU8/9w8YwRou/YnsZfybnbHu/tWsmYETgNdt6WexXuNJbuEKvFrehdjZDGW+jnlU8
         3PeOYbZwk5Q3KRwv53mg1Slp8TahpCmMt48dkBcRw/euM+UkqaC4TvjmFuuk2/0vQnGe
         dS4w==
X-Gm-Message-State: AOJu0YzdODPG3kdCc+yTKYt/jajuFk7UvbDz6sLZ9LGshCOK6OJQON9m
	9X7F//yKwTuA56XwxaZTBKlw0g2QURcdJ1HtjMQh4I3TkxGhDMp1+IGWYgsI
X-Google-Smtp-Source: AGHT+IEs2BZnG9n8DJIVAaVjiMTX8ncyqbrznoAUkUk40jzsqcNqee8MfckGKrWhMFgChGHKSUBJHw==
X-Received: by 2002:a81:d354:0:b0:60c:c4fd:7649 with SMTP id d20-20020a81d354000000b0060cc4fd7649mr1252481ywl.16.1711010483469;
        Thu, 21 Mar 2024 01:41:23 -0700 (PDT)
Received: from vps.qemfd.net (vps.qemfd.net. [173.230.130.29])
        by smtp.gmail.com with ESMTPSA id t8-20020a818308000000b006079e8f3572sm3214121ywf.85.2024.03.21.01.41.22
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 01:41:23 -0700 (PDT)
Received: from schwarzgerat.orthanc (schwarzgerat.danknet [192.168.128.2])
	by vps.qemfd.net (Postfix) with ESMTP id C02112B624
	for <linux-usb@vger.kernel.org>; Thu, 21 Mar 2024 04:41:22 -0400 (EDT)
Received: by schwarzgerat.orthanc (Postfix, from userid 1000)
	id 89669600199; Thu, 21 Mar 2024 04:37:11 -0400 (EDT)
Resent-From: nick black <dankamongmen@gmail.com>
Resent-Date: Thu, 21 Mar 2024 04:37:11 -0400
Resent-Message-ID: <20240321083711.GA1787714@schwarzgerat.orthanc>
Resent-To: linux-usb@vger.kernel.org
X-Spam-Level: 
X-Original-To: dank@localhost
Received: from schwarzgerat.orthanc (localhost [IPv6:::1])
	by schwarzgerat.orthanc (Postfix) with ESMTP id 7D5F3601E1A
	for <dank@localhost>; Mon, 18 Mar 2024 01:26:10 -0400 (EDT)
X-Original-To: dank@qemfd.net
Received: from 192.168.128.1 [192.168.128.1]
	by schwarzgerat.orthanc with IMAP (fetchmail-6.4.38)
	for <dank@localhost> (single-drop); Mon, 18 Mar 2024 01:26:10 -0400 (EDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	by vps.qemfd.net (Postfix) with ESMTPS id E53A12B35B
	for <dank@qemfd.net>; Mon, 18 Mar 2024 01:26:09 -0400 (EDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56a2bb7d944so523138a12.3
        for <dank@qemfd.net>; Sun, 17 Mar 2024 22:26:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1710739568; cv=pass;
        d=google.com; s=arc-20160816;
        b=THBCIeRDRipQg58zyWyKcrfZMCmXIG3nZObo7Ri1FOoj5nr5lofQ7MmpOz0iRD27zR
         Q9kIPeqsRrh1mSqQC7QKEMj12oL7CjJMrJqz+r39XqssQzq2g/mYzWsVofllzDUBikfc
         nJalnbk9cEdOc7vbq0ae48gkOM2NS/bNIZsv/pD/6/WerxT0TPBkmWXEQQJquW4aVoeW
         //mGtn4KDJuRXusMOs5qKor6Wt2OD38RWCU4GYOjs/Tiy/PAbCzvsMD7zwi0gsrWPV0P
         QLxIhWe3dPY7cJbei4RbwkE9UVXsFw6wnef7F3Yx0pqWQQrxl1lhd2ZHV3P8kLCpmH2x
         3Sdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:delivered-to;
        bh=p3vo1wc6J3C2AA1kLchReOFQ9IMrR/d6PBa4DE7a/Vs=;
        fh=v04QiUVcuwj4hU78H6bavRzVPq5VuA7HFyH/DPabRGs=;
        b=yYiU77qas1WEOl5ku9j7yL6c5YHXKwOuR7WUZTGLuDnNG9iasVoAVob1DDktJTDcyq
         xah0OH77R+DnqHsIQWUkMY1FUJeWE9utXLqkqb+lEpbq1i/XAZP0OFowBjmN8s3dLBnv
         Kz1dB8GShmeKnlVQAaTR5ZpxmuGsuY1HaNr6UvKy+xdaEdNMtKF0nhTnYTACPUaTOQn8
         /KD1PWsv5Dgv1b+xWxQw+mQ10e78PZohvS6CaIXNEpEX5+lTsyEc3wZrWT7783qeURG0
         Sklrkbb8mxZvEdfwJcMDQZFa6j0AQPMJ38KoPD3diqTVg5Oc1IRIIuuQf0upjtpSwrpI
         rDqw==;
        darn=qemfd.net
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3OZmXHa;
       spf=pass (google.com: domain of dankamongmen@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dankamongmen@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
X-Forwarded-Encrypted: i=2; AJvYcCVgFU6Mms69sz5685lHavyp5V4zSxAzfrzPB3PMB+Fg57STG/qgtDsawx3zicm4C0tr7U5IDnR2DyIqzkYVrA==
X-Received: by 2002:a17:907:209c:b0:a46:c24f:ddf8 with SMTP id pv28-20020a170907209c00b00a46c24fddf8mr583315ejb.34.1710739568677;
        Sun, 17 Mar 2024 22:26:08 -0700 (PDT)
X-Forwarded-To: dank@qemfd.net
X-Forwarded-For: dankamongmen@gmail.com dank@qemfd.net
Received: by 2002:a17:906:c8d5:b0:a46:a9c5:d38d with SMTP id gc21csp921850ejb;
        Sun, 17 Mar 2024 22:26:07 -0700 (PDT)
X-Received: by 2002:a25:3357:0:b0:dd0:bb34:1e77 with SMTP id z84-20020a253357000000b00dd0bb341e77mr6758682ybz.53.1710739567380;
        Sun, 17 Mar 2024 22:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710739567; cv=none;
        d=google.com; s=arc-20160816;
        b=TmZQu1qPKJ6PsQncIqG+pu+ZNyGQ1nBe1wCcUwTzXj4T1AVMn8KDiYpVR/ygrsT5KP
         ko/XD+rzuSahYktnsz9ZyQTL7qah5EGtaDFgC3c5Y4LnS/rYL+Fx+qXB9vDq3r3G5lhq
         +JbP3xMvDChaI10nrt6YQbOH/j3KFe6KV99h/7f22/FcVHrd/dEvan2ZwLTwh8JaIbzu
         rlpsWUw5iMUU/CHZykZD6KOdECKR+jHi/aFkatH0ydhPDtmQRYMDaWlAgoF3odhhi4tU
         +bfi7BSQXpE4MWHzPJP3UWEXB3fBwFWada2Rlyxu+j6IjNSTtFKdTtZjlIn24NAx08uL
         GKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=p3vo1wc6J3C2AA1kLchReOFQ9IMrR/d6PBa4DE7a/Vs=;
        fh=1z2MSwc646+KKXK4Cwhx+L5urR8S2Cq86EFYdYEWC5Q=;
        b=g1VLT7QUinwLtO4y6/vLbYxtmxyygm/lUkB4wtyBQi8yGkJ8vYorONqzN7gFsvGV9M
         Zc/zyXGbg2CTCN+Cx6SC8Ny0aYjnBwp5hRc7phW4VfQ03KU6bj4CTZJpejx4wFCHfn/I
         GTdX3gOaeFwjKk1au02BAHEBjp4oPoWUKFcvDwwMY2RgltumXuKJLP5eG++O/S6oTWyF
         fnwnrz493v0wVylUskFG+3u4hbyK5VZwaXVZEacEfrlGBcqRYCSkKMMnxvubIEwtbYfc
         kD0FtCd4+CpHzQ8aL0wbVAQYcMciMP++k+K2AHmv62HuM6F4oS8Wn5TEYRcxgDxJQM7Q
         vPWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3OZmXHa;
       spf=pass (google.com: domain of dankamongmen@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=dankamongmen@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u6-20020a25ab06000000b00dc7012d99fbsor3212819ybi.4.2024.03.17.22.26.07
        for <dankamongmen@gmail.com>
        (Google Transport Security);
        Sun, 17 Mar 2024 22:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of dankamongmen@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710739566; x=1711344366; dara=google.com;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3vo1wc6J3C2AA1kLchReOFQ9IMrR/d6PBa4DE7a/Vs=;
        b=b3OZmXHaj0ZOXNqg/E4DBSn2S1/vAxB32kXhPD7PrG8JJiCoRRXdn3AvM7ks9t67er
         wNtIkMxZ6amTqL/2fmj/ZAv6AiZnwc49yp7nMW0DCo2LXg2nAJM10atDi6mRk0KcKmp0
         ktPbQVuUE13SuDCvNowKDqdoswezZ5/zqg55bSJ0jx732YRdHKyd7dM04H1wGDjMTInK
         scqFENDCsHaIEITkjZG4UnNW5OBOJIRzpGnzgW2gPF26Fb7u0/rZhKGKs3nWIUTFH6Vr
         yoCz8OAaf0cOdPGwPsH6H0Se2w3/PntwJZtr87tvJUIuy+YBnqAiJgLYI8RusgSsuTh4
         OOEA==
X-Received: by 2002:a5b:9d0:0:b0:dcc:1a56:597a with SMTP id y16-20020a5b09d0000000b00dcc1a56597amr7740065ybq.36.1710739565943;
        Sun, 17 Mar 2024 22:26:05 -0700 (PDT)
Received: from vps.qemfd.net (vps.qemfd.net. [173.230.130.29])
        by smtp.gmail.com with ESMTPSA id d6-20020a259706000000b00dcc234241c4sm1600217ybo.55.2024.03.17.22.26.04
        for <dankamongmen@gmail.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 22:26:05 -0700 (PDT)
Received: from schwarzgerat.orthanc (schwarzgerat.danknet [192.168.128.2])
	by vps.qemfd.net (Postfix) with ESMTP id AB67B2B354;
	Mon, 18 Mar 2024 01:26:04 -0400 (EDT)
Received: by schwarzgerat.orthanc (Postfix, from userid 1000)
	id 9C25E601E3A; Mon, 18 Mar 2024 01:26:04 -0400 (EDT)
From: nick black <dankamongmen@gmail.com>
To: linux-usb@vger.kernel.org
Cc: nick black <dankamongmen@gmail.com>
Subject: [PATCH] usb: always print reset/new device message
Date: Mon, 18 Mar 2024 01:25:23 -0400
Message-ID: <20240318052600.671908-1-dankamongmen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since usb_speed_string() always returns a valid string
(invalid speeds turn into "UNKNOWN"), go ahead and
always print this diagnostic, rather than checking the
speed here (which wasn't up to date for SPEED_SUPER_PLUS,
and looks like it had an off-by-one error anyway).

Signed-off-by: nick black <dankamongmen@gmail.com>
---
 drivers/usb/core/hub.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index e38a4124f610..7325e5420900 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4909,11 +4909,10 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 	else
 		driver_name = udev->bus->sysdev->driver->name;
 
-	if (udev->speed < USB_SPEED_SUPER)
-		dev_info(&udev->dev,
-				"%s %s USB device number %d using %s\n",
-				(initial ? "new" : "reset"), speed,
-				devnum, driver_name);
+	dev_info(&udev->dev,
+			"%s %s USB device number %d using %s\n",
+			(initial ? "new" : "reset"), speed,
+			devnum, driver_name);
 
 	if (initial) {
 		/* Set up TT records, if needed  */
-- 
2.43.0

