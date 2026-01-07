Return-Path: <linux-usb+bounces-32018-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6398ECFFD5E
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 20:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71AAC305223A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 19:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A152ECEBB;
	Wed,  7 Jan 2026 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrYMjEOh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F0D221FBD
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767812789; cv=none; b=Y0d9vl70nNSxj4SVKESqRkiLFiYCd9VbVwhJimNrkUWsLv+0T8cwCS+RgZwrO0r6kzNOHkEMEX8FnewfXIUsFLmqG0LEJthVr4UcxRsNS2/swJzM0RC/d2gGY4LDpzpUmxwTqsw4AwEWTysfg8e23FSeoZqCITvt1j38jdU5F1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767812789; c=relaxed/simple;
	bh=mo9f8JN8GAsJLjzlBTgtgtfEI/899McY8QQtapaY2bs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XAwGGXijh0B2gJhM+bUMIxJLGr1TY+v0rQLSeSGXpoHtglWaW65wXvbB/C6Ih3zhgeXkSkS59DK8deAQ7ptGeyMiAX0gezVRfkik1xjAdWgcsM6mtwA0dxhHrRlP2q02Mu4P9EN6cT2LzsjIQfhskKBWt/l+AtvcZso1cNymSC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrYMjEOh; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c6dbdaced8so1948331a34.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Jan 2026 11:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767812786; x=1768417586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T2pCwQ7xIIDyyL8BKt+UlW+6LMqGQZaMTa7KhQupEF4=;
        b=mrYMjEOhVqjZjLBoCWUvo33BajY+xPGz0qHIPAnkEt3YlJyH4lpJqgGQbJHnPOmlz4
         9mBrxwt96Re8chNMi2anlfXtAE8sbGYNWo9uJxcVUqspulBXiXcg5aLvIGo7ojjLqtoR
         pS4urnpt2PiIrL0uC0KVfN+fTVe/LTBTp1gA3hm1F+P/iEfzxNf4u1k9rQZdLtGEhKOn
         7O5quJ4indAZQ0hHUeAaOKboPT78IFjQ5fgrldiSlSMus4qWSSnMjluW/rvEFHpiQ/6Y
         ZBQNWRGfwZIo7MLF6pYoFckQ9OX1oY6HaZq9iYpZvEogW1L80c8s153C+q9cFdhgR+Iw
         R9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767812786; x=1768417586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2pCwQ7xIIDyyL8BKt+UlW+6LMqGQZaMTa7KhQupEF4=;
        b=fJbJUNFKtLNZQB7US3O/FZV5fOlVPMd6DsaFwwBEH6BQj/IY5g7TN1+CKzcehYZk8z
         bOmadnsgnfAeCoNXJ0A3CgM+37uNHF8GihhahIDIEEwsBVfjVE5Bs9hwE5cilP8VzNg1
         LBVDi2A7nqhays9htrAFGC9kq1skM8JCeEXaFu8cUax4313j/pM7L4RW0hoci53jfuPR
         QuZfuJJmSA+OI5/kTEs1FplFRCErYZa7f0EpYmARtnPOgrLIMmDBQtsSDy5+9e2w/7UT
         gVl9WYanCA120fcyvr7XIOwj/qI7+neyb14TtYg3xbpiKZkbR4TpLioGeaS+Vq6vMftE
         yQeg==
X-Forwarded-Encrypted: i=1; AJvYcCW4rsZDMGqqjnNQg4BxUbIuu55vI4RskPDyQoFXN5sTNG8wrSsWN6mbqyjXhQDfQvd+eWRnqqMusxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyekUsA5KQK6s7CJqCaIIl8295MGNyKDxpCGx6QZRE/ulDS7p88
	sPmuEceitWJq0e28zDHvMpR1s1A1u5nZZNVDMI8+86WYPqSOjikCFVSI
X-Gm-Gg: AY/fxX64250+KRJ+cRQHkyFKb3qe44jzNuO9S1WPIxmisVMwKRw+fBrApKesjlJ3vUp
	hNnIiA0LkgVIxgIsjH80WUR2yk57Ao+T2UpKu+GNnJVsM3Lld9Y3oWqgsozZLcIheoQgApVZcUr
	nNPqUtnU3hE/4KpnJob7t2CXdHcHGPM4Y6GoDIGz5CYccYX4bhQsOdLCHnm6soGeVx1SL3YWiBk
	MD1GvLVNV7yqlM8Cx7qOkWVTuMKSg1pAjI2ZMh79FjO48tDdzaX7oYmu0BRhlsklXQyQjsYaMEA
	7eEnC+2kVZ4TiYnLTKkeW8C8DKDIck8Tjgl1Hil7B7kpKOLXoiMCLKUVtkC31Wh+mpuqxcMCek7
	FCSlSyqzsjCWVSqWmqr6POpkEafKST0/NOzNClZ5Ah/mxBFveVWAfwE5l73pbLIMhtCW2RNyxBT
	PpG9fnUKd6C5FGHE0U3cEYiWaGIpJwzMThSXn+9f4c/4o=
X-Google-Smtp-Source: AGHT+IHPdrsMXLuo8RFcL3m7hcu7Ci26TgWVmCMCOgCc1zrCB24qO+Ip+H5K7gfnRLglFF6kk19onw==
X-Received: by 2002:a05:6830:25c3:b0:7c7:471:55ff with SMTP id 46e09a7af769-7ce508ddce9mr1836539a34.10.1767812785772;
        Wed, 07 Jan 2026 11:06:25 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce4781eecasm3796581a34.10.2026.01.07.11.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:06:25 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Chen Yufeng <chenyufeng@iie.ac.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: f_tcm: initialize data_len in UAS path for consistency
Date: Wed,  7 Jan 2026 19:06:22 +0000
Message-Id: <20260107190622.26070-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In usbg_submit_command(), which handles the UAS protocol, the 'data_len'
member of the 'usbg_cmd' structure was left uninitialized by the
logic, relying instead on the zeroing performed by usbg_get_cmd().

In contrast, the BOT path (bot_submit_command) explicitly initializes
this field from the Command Block Wrapper (CBW). This discrepancy is
evident in error handling paths where __target_init_cmd() is called
using cmd->data_len.

Explicitly initialize cmd->data_len to 0 in the UAS path and use this
variable when calling target_submit_cmd(). This ensures architectural
consistency between the UAS and BOT protocols within the driver and
avoids reliance on implicit memory state during error transitions.

Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/usb/gadget/function/f_tcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 6e8804f04baa..822cebc7b405 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1227,7 +1227,7 @@ static void usbg_submit_cmd(struct usbg_cmd *cmd)
 		goto out;
 
 	target_submit_cmd(se_cmd, tv_nexus->tvn_se_sess, cmd->cmd_buf,
-			  cmd->sense_iu.sense, cmd->unpacked_lun, 0,
+			  cmd->sense_iu.sense, cmd->unpacked_lun, cmd->data_len,
 			  cmd->prio_attr, dir, flags);
 
 	return;
@@ -1389,6 +1389,7 @@ static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 	cmd->tmr_func = 0;
 	cmd->tmr_rsp = RC_RESPONSE_UNKNOWN;
 	cmd->flags = 0;
+	cmd->data_len = 0;
 
 	cmd_iu = (struct command_iu *)iu;
 
-- 
2.25.1


