Return-Path: <linux-usb+bounces-8068-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319587F88F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 08:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 452D21C21A83
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 07:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169F6537FA;
	Tue, 19 Mar 2024 07:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ninuFKo+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1F250A97
	for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 07:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710834232; cv=none; b=egn8XNKiYDgiSRQQwCVOTNLVTdY4hW1qIuCLQpQcqhtohpwwpj4AAcHUJErS2LpCBBJAscfrIZm02/gLEF4M/G7Sh2kqV11z5Rg38/UZEvMDNmxMYQlV81U7mtyGJk8VZgD84BE9amTWmz0ABu6DQd1Cvjzqw2O2yd/NPh8Arm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710834232; c=relaxed/simple;
	bh=ApTDmdxNjCY2t5sAyX6qT0+1HzvroOVF89Qtq6GJnvU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fVsHRCHvOSg0fW/dJ0sv3dLtYXmTPCSDADW0VjSUxqabMOqu/Rh5emzhHAqjFGKJvaPVizxbbGG8rDHPaVOXvOGrv6B5eR2iy04V1CthMx9Y7lGf7KCSM/Ho4i+5wFELbf38Uon434bJvJ622q8Qmp4SHXjiupHefRLOt9Smf60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ninuFKo+; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcd94cc48a1so7586260276.3
        for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 00:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710834230; x=1711439030; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lyVllugR5IqRbqncN1tVXbwrn/I/Myl7P+DNgUkJQao=;
        b=ninuFKo+GaLFTYzWHlcnCueCOXggw0F+Pc6plm/gYjFvdL+ZWGDQy/TvLD5siDrIa6
         aoi5zTvVvFug7BVAvLgfDb/f9W0nDFblIXS7IfxKam2dJDHTRGiQvVUE6WmhpP+vsQDl
         EUWuj4r7oCTg/7GZYdcJpm+Ggw2F9JHYI3/wilLnj7QsxpFk2TVpIIQyh/YgFHOdav1K
         NGLq0wasWznSAUucOTR087IUZURXgAoA2+ipJXigdKWNzkAFqgAMdn9FABbOruqUFSwI
         Ewyjh+xG3RGs8XXjt6Z/VigYEUnezF1IuW/fgfI4Myx39gSc65pFbGTgmIVRjT8IYyNa
         UgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710834230; x=1711439030;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lyVllugR5IqRbqncN1tVXbwrn/I/Myl7P+DNgUkJQao=;
        b=gTbSi0U9dTaITCedeXytUM2C8B/+0iuxgk19WaG1NwDqBkDSsrNO6kqC/PL+WxWlMU
         MT/W02xe5w5NqE/GbaQL3XGg1PmkXOpjzprboga1Ge0HNk0HBAkWBjTayHmLJ5xckZNf
         sRn4Pp7igNaPJOXfBejx13tNTU0gyrdUQUYgX0OVfP0/h3zEz260iSDclPv2/XdPg6Ca
         8Aug3pnfK1rD72gS0+p/hY6e639mP7/c9UoKru7fE0cTO1DWUcCLc3WnmCw0bCElnKir
         T6gDD1hiEvxFCphY6Seh6iDnHLQi7oe4eKTjH1e3WocdDhJU2YccPppe1JPGHklMHzsP
         zOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiCYBQ6vctde8Lbs7VV9GgkkokNLmeEdbtpdVisXj0m1LSak0sP/AD8I2yOOQx4ultOgdUdLApZR3ZIBgwQt6lPkPDfTKYAMIQ
X-Gm-Message-State: AOJu0YzXAVSkxo8s/3KbGdakRi16GJjjlEt19c6qf6UWfRYMd7Z0862I
	q5Oa/eP90kIAGbqG7eeyg7kR+X4fZtAAIt5wziUlWyVqHfhjTv0MSxuSnvwcgkrQAIMwJj/ceZv
	GCV0kJw==
X-Google-Smtp-Source: AGHT+IECrYSanaCM/eJMHcpwnnLjH7+A/JTbe9uQMg4keXB7FUSMz7wYWYlHT+xWhDeI5pUxpdtJR9xZ93Tq
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:2f6c:fc01:709:12f4])
 (user=kyletso job=sendgmr) by 2002:a05:6902:2084:b0:dc6:e8a7:fdba with SMTP
 id di4-20020a056902208400b00dc6e8a7fdbamr398999ybb.4.1710834230386; Tue, 19
 Mar 2024 00:43:50 -0700 (PDT)
Date: Tue, 19 Mar 2024 15:43:37 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240319074337.3307292-1-kyletso@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Correct the PDO counting in pd_set
From: Kyle Tso <kyletso@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The index in the loop has already been added one and is equal to the
number of PDOs to be updated when leaving the loop.

Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3d505614bff1..566dad0cb9d3 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6852,14 +6852,14 @@ static int tcpm_pd_set(struct typec_port *p, struct usb_power_delivery *pd)
 	if (data->sink_desc.pdo[0]) {
 		for (i = 0; i < PDO_MAX_OBJECTS && data->sink_desc.pdo[i]; i++)
 			port->snk_pdo[i] = data->sink_desc.pdo[i];
-		port->nr_snk_pdo = i + 1;
+		port->nr_snk_pdo = i;
 		port->operating_snk_mw = data->operating_snk_mw;
 	}
 
 	if (data->source_desc.pdo[0]) {
 		for (i = 0; i < PDO_MAX_OBJECTS && data->source_desc.pdo[i]; i++)
 			port->snk_pdo[i] = data->source_desc.pdo[i];
-		port->nr_src_pdo = i + 1;
+		port->nr_src_pdo = i;
 	}
 
 	switch (port->state) {
-- 
2.44.0.291.gc1ea87d7ee-goog


