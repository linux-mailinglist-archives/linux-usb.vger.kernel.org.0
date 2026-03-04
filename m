Return-Path: <linux-usb+bounces-33989-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK5bOjVYqGk5tgAAu9opvQ
	(envelope-from <linux-usb+bounces-33989-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:05:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55751203AAC
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E65463024B16
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 15:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87253359A91;
	Wed,  4 Mar 2026 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlLIigVp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C4D23D7E6
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772639888; cv=none; b=OWVge2ak5Uip0TR/o1cFju0NSG7GYGXHGou3cD9UkKhMJoL1N3TPeih+qkHFkTMckEqqE7qRT/6afAHDz4yxhKLpjcz6oThYoySDP43eJhIReHQlbt2BEVPC+ASszL6zZcud2O8w+Udw+OrLCns3yxaPZYbD4yArm1EI59RN+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772639888; c=relaxed/simple;
	bh=mPXwZWa4eHz0YL3YTSq6W6+iPPLg7SeIK3t2yr84HCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zrf2VyFyrksDtz4nciVu86XCNNBW5JXx0VNcFub2MAy4auKOooN4YVWG36bufWksOEWEh0OzPgpMIs0zTOa944Dpp/ur7h9r25qf1KZJGUdPDxDgMktF9ij3gIE/a+gIaB+BYR5HYOKvTRhKpS6iGvdBbh+cnzbfEZD1GF5IiWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlLIigVp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439baf33150so2580503f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 07:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772639884; x=1773244684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+/LHtNh7an4h28r1sY/9YG7bYLPolTGox4UZl5BWIM=;
        b=PlLIigVpWDllFdvaVf4UYeD1oAu8eFR3DGBgb28h9rLwEOnkaaJiScO/BJ/L3ibjWB
         W9MoWXxe6uzf+TM4MfBLwuPhan0jK3/gH2885fctsAjvWqxzDYIJr+9NwFKZwKKUGDPW
         O1PRU/KugGG//QPeHgFFEsQN+6h/vwEW3+HetKLPk+GiFIJRoJNT7rz7zbO5fepBCjwo
         oVtGy+CQvQ5zJaetmoYCpxsJJcwXs/HtBou8e8FRTJ0YOYBQElW8y2iWLiB3pHGiVXhF
         p5NbqS3vT1WJy56gbQm63t1oZI0w0avFcGWlb+a/lOz/5orVW899hL7UwOm9nxxkMeZF
         DG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772639884; x=1773244684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+/LHtNh7an4h28r1sY/9YG7bYLPolTGox4UZl5BWIM=;
        b=g9rgK/3Usos2mGj0ywERb7JDdRF7dFYAbNV9NOLbTrC/m4mmgKtMw0VFJVTltT8C5w
         u8lUYk1BxZZvucGj42fyKusuEgeSpgk4vgcaan+2+CV5d7hnLG7Boo2hXCXW8sjaAOsZ
         E64AHoWwaaVjeRPfwogB4u8KRFSm51nkqPgMQIQzTFShymyDgTCcttZzgC+GmmQmNvrg
         Q8A7Bz3N2yY3QaZ+6artdTvzDfKKr1FAGgFr06CCuHVm4mS5EJMs735NvvLdEeGkfKTD
         JEU0roPf/Li3N15DvCXOY4pXeRS5bZ7YLztictbVt4cwk0es6FZaeTEGc0Y+xEbCWkzV
         bC5w==
X-Gm-Message-State: AOJu0YyqCPj59DljNSJcc4/6GhpYUj6ry/9eKDdntJoHabaVDGjuH8H2
	z5oFxbsbClt3eLlFNFGlRBwykOffs7QdaSOdnVGFEkQQ10mLuJaf54i4
X-Gm-Gg: ATEYQzyjoudjojdzaonYUNbCmbO8TUacTgcjvFiEyYtywKOvuaCSsRJoUZ477ggPZcP
	OktpVl5C/Qg+Bo7yM7bGZn8Vk254mK4ohC0moYVLCIzlB1+LYw03pUVQiwJMbon/DX7aoRadtFg
	lN2IgfI8WzuWrZ+nV0asWDny4L6PG/JW96qfQXPHFc6dXZrQH7zrZWWt1zZ5kqIn9l0HI3snNzA
	r9HzKiS8BGF8856o8kpETqRmJb0F9MIv/tlPbRqWt6fhixdOWpbbjxyWAsj86wqRr3Qv+Ak/IOj
	DHMibHbGc8oPKRjjYxeZ5mtQIQyhrJ3wAjbX39WjlnTaKt5kONbyiuJc89W8TaR7IZktczAKpu8
	xQuRpYsowRq8TG60PM8fRyOeykhZbmJSPaEOwifn0xARFaMJk2Z8s+4kb+/a8r5oUbJ2KwULI8q
	7sEfMcKRMoAZzPcVOluPZTcHfH8/KRIA9m5w==
X-Received: by 2002:a05:6000:2302:b0:439:bb42:dbde with SMTP id ffacd0b85a97d-439c8ad48dfmr4505539f8f.23.1772639884340;
        Wed, 04 Mar 2026 07:58:04 -0800 (PST)
Received: from fedora-dev ([2a01:5a8:304:153c:d983:1bac:a686:ee59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm33027380f8f.5.2026.03.04.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:58:03 -0800 (PST)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	enelsonmoore@gmail.com,
	kees@kernel.org,
	oneukum@suse.com,
	n.zhandarovich@fintech.ru
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	syzbot+48dc1e8dfc92faf1124c@syzkaller.appspotmail.com
Subject: [PATCH net] net: usb: aqc111: Do not perform PM inside runtime suspend callback
Date: Wed,  4 Mar 2026 17:57:34 +0200
Message-ID: <20260304155734.110734-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 55751203AAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33989-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,suse.com,fintech.ru];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zlatistiv@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,netdev,48dc1e8dfc92faf1124c];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,syzkaller.appspot.com:url,appspotmail.com:email]
X-Rspamd-Action: no action

syzbot reports "task hung in rpm_resume"

This is caused by aqc111_suspend calling
the PM variant of its write_cmd routine.

The simplified call trace looks like this:

rpm_suspend()
  usb_suspend_both() - here udev->dev.power.runtime_status == RPM_SUSPENDING
    aqc111_suspend() - called for the usb device interface
      aqc111_write32_cmd()
        usb_autopm_get_interface()
          pm_runtime_resume_and_get()
            rpm_resume() - here we call rpm_resume() on our parent
              rpm_resume() - Here we wait for a status change that will never happen.

At this point we block another task which holds
rtnl_lock and locks up the whole networking stack.

Fix this by replacing the write_cmd calls with their _nopm variants
in the case where we are inside a runtime suspend call.

Reported-by: syzbot+48dc1e8dfc92faf1124c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=48dc1e8dfc92faf1124c
Fixes: e58ba4544c77 ("net: usb: aqc111: Add support for wake on LAN by MAGIC packet")
Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
This patch is untested!
I do not have access to a real device to test it,
testing on real hardware would be appreciated,
if anyone has a device laying around.

I have found no reason for the PM variants to be
used in the ->suspend callback when it comes
to the device driver.

The PM docs suggest that PM should not be done
during runtime suspend, but I cannot find a
definitive answer for system suspend, hence the
conditional if(PMSG_IS_AUTO(message))

 drivers/net/usb/aqc111.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/aqc111.c b/drivers/net/usb/aqc111.c
index cbffa9ae1bb6..2f0d66c7ade0 100644
--- a/drivers/net/usb/aqc111.c
+++ b/drivers/net/usb/aqc111.c
@@ -1395,14 +1395,27 @@ static int aqc111_suspend(struct usb_interface *intf, pm_message_t message)
 		aqc111_write16_cmd_nopm(dev, AQ_ACCESS_MAC,
 					SFR_MEDIUM_STATUS_MODE, 2, &reg16);
 
-		aqc111_write_cmd(dev, AQ_WOL_CFG, 0, 0,
-				 WOL_CFG_SIZE, &wol_cfg);
-		aqc111_write32_cmd(dev, AQ_PHY_OPS, 0, 0,
-				   &aqc111_data->phy_cfg);
+		if (PMSG_IS_AUTO(message)) {
+			aqc111_write_cmd_nopm(dev, AQ_WOL_CFG, 0, 0,
+					      WOL_CFG_SIZE, &wol_cfg);
+			aqc111_write32_cmd_nopm(dev, AQ_PHY_OPS, 0, 0,
+						&aqc111_data->phy_cfg);
+		} else {
+			aqc111_write_cmd(dev, AQ_WOL_CFG, 0, 0,
+					 WOL_CFG_SIZE, &wol_cfg);
+			aqc111_write32_cmd(dev, AQ_PHY_OPS, 0, 0,
+					   &aqc111_data->phy_cfg);
+		}
 	} else {
 		aqc111_data->phy_cfg |= AQ_LOW_POWER;
-		aqc111_write32_cmd(dev, AQ_PHY_OPS, 0, 0,
-				   &aqc111_data->phy_cfg);
+
+		if (PMSG_IS_AUTO(message)) {
+			aqc111_write32_cmd_nopm(dev, AQ_PHY_OPS, 0, 0,
+						&aqc111_data->phy_cfg);
+		} else {
+			aqc111_write32_cmd(dev, AQ_PHY_OPS, 0, 0,
+					   &aqc111_data->phy_cfg);
+		}
 
 		/* Disable RX path */
 		aqc111_read16_cmd_nopm(dev, AQ_ACCESS_MAC,
-- 
2.53.0


