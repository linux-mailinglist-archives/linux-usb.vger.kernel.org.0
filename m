Return-Path: <linux-usb+bounces-7823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D48781E4
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 15:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDFC21F22E24
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 14:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7A940850;
	Mon, 11 Mar 2024 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZH9tGnJf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493B13FBBE
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710168326; cv=none; b=rpt0K/ZkucnVmdyaEmtH/0oAOjTcJHC5XnYJm9xFHhVxLuqUy6vlTlof1Ry4+DmXEoJ5dSjV630alGWuogCNzeMHFGdnlmIQJ+yDZNpEXDzkFaCMXxZ0JjP9b7yxMWZkDfvAWTAJXCffcLq+IGiZNYwjIfZK4kGObqfWwjQ2lhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710168326; c=relaxed/simple;
	bh=i6ug7ibJ0/Kb9CafhzbFo1ueKa9zp2O6WyiYRxRdtrY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lID24NRWgpvTY/kd7CEBqKgXYUFptfWsFeF2tKc+yNkoqo16QUZhfKh61HVsDn0cCydnppbMpn90HwaWW5Tp9qbf2Yiw7+60/McBrXESlhro/nfnSbfxgGCj44hFSUw1t5V3QDSLhuVC5XMXdpfCj2k6KHw+8WgwfNbLdZLAZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZH9tGnJf; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcbfe1a42a4so7961770276.2
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710168324; x=1710773124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dS0RD4NP4nYM0xX9pXu7CBpa5Z7kk4eKmZrP0C7k8oY=;
        b=ZH9tGnJfUNwiRlzJIKwSIhhnHAcY4Cc5ADBwGH3hKkJlmXODXcILbIEwJ6TGokIAfT
         Z40R8n1jI35Yu8o2MMea8JiYH4jXW0rBMq22TPb62oZjwUQ/AWXKBLC/MK4hZ7rm6VZe
         JG6hO3Ltfa0/iRfNjkTsZaWd3+nmIwEEPBknZY9EVXmwHrtuIgKy4aXPA0jrCXCw5xed
         KTP6jvEkAyWgu0G8DDlQauRV/PxZJNInsxNaYfCr6W8/0pj1tqjyit6sVc6i1YM3FLUI
         liQ+U7sKXOTH3s9QfqM7/Y2DuZlW//ada4Fp9igEZM+ckAAxi4YbyvHs0fWP5do0w20E
         jzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710168324; x=1710773124;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dS0RD4NP4nYM0xX9pXu7CBpa5Z7kk4eKmZrP0C7k8oY=;
        b=E2e7+cXaxUiPLG2Vf0jjISbY0wxeonRCmZ4SB2ccYzufaX9o/Ii+cnPQlSSjH1Ko75
         qsGtwJl8nL5o9V3TJDdfWjQlQVaCdOEdy8XAhnqSoij2J51pJR3nH+8Jg8QC9rgjDg/i
         EyReps/5/Q9RccNBozoOadChx9lK38r2OF1NofuhMgZd/32qH0WkdxwFCpUnxf2DJxLb
         K+Adgtw5KtQ+DKM6OzxSS2Cz6d9k099seEytbWBlLuOpwsqFk+PfqCezsi2r8PpMOh5b
         EBQ7J284qt0ejajudaxb3+/l6aHYdEEy3aHrNyLNcXXR4lBM7zf2iHldzqk/Bq3WT0T4
         BgsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+IKQ9z90zALHZ/6IztTnAFDnAqvflpiz4VQU1IFAM12lcH1tUR7mc20sugoae9wvlX7tUy9EgBDQgcmRjZwp7KW2ipe28/TQm
X-Gm-Message-State: AOJu0YzlKhqDhs0ylgsV+8rnGjz1l3x3OOsPTZAoG5WitQOcDL4NWODQ
	SLobVlRLcgr4F2FUF+dEkXY6hFlmRfSQZNen2d5WhiAM8GOb95JZb2zUmMsyTUnAz9/dBt0KIMN
	fiT7AYg==
X-Google-Smtp-Source: AGHT+IHdZiZaHMJe56VAsU48z7RxtFDHe9tn3wMla7NpWgQzixeZhSJxWsqVVEukii4H1npzGFX76HZGQpiw
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:a76e:a92b:1d72:6e4b])
 (user=kyletso job=sendgmr) by 2002:a05:6902:124c:b0:dc6:d678:371d with SMTP
 id t12-20020a056902124c00b00dc6d678371dmr1856163ybu.3.1710168324317; Mon, 11
 Mar 2024 07:45:24 -0700 (PDT)
Date: Mon, 11 Mar 2024 22:45:00 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240311144500.3694849-1-kyletso@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Correct port source pdo array in pd_set callback
From: Kyle Tso <kyletso@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In tcpm_pd_set, the array of port source capabilities is port->src_pdo,
not port->snk_pdo.

Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3d505614bff1..9485f6373de4 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6858,7 +6858,7 @@ static int tcpm_pd_set(struct typec_port *p, struct usb_power_delivery *pd)
 
 	if (data->source_desc.pdo[0]) {
 		for (i = 0; i < PDO_MAX_OBJECTS && data->source_desc.pdo[i]; i++)
-			port->snk_pdo[i] = data->source_desc.pdo[i];
+			port->src_pdo[i] = data->source_desc.pdo[i];
 		port->nr_src_pdo = i + 1;
 	}
 
-- 
2.44.0.278.ge034bb2e1d-goog


