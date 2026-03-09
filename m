Return-Path: <linux-usb+bounces-34273-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJLuCSearmmqGgIAu9opvQ
	(envelope-from <linux-usb+bounces-34273-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:00:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5B8236AB0
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 59020300BE11
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70251387372;
	Mon,  9 Mar 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bCq0ukIR"
X-Original-To: linux-usb@vger.kernel.org
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338E2EBBA4;
	Mon,  9 Mar 2026 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050235; cv=none; b=RmgK+G6RdxCx+2CXl5ljQzaDuk1d+I1T5tDuoRoFyGp5KqSzXfTxCjnlk+t/wKrWjRgbaaRV83Fa0H2VyKo5kk6kB2ayUkeqVxiyIjzH0U9UtunfHvRmnVJXYndtPYAvtcMMxXl3fj3xf5p5FCJbd8RF7WUjf4kDF7rJV7kQ4y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050235; c=relaxed/simple;
	bh=nilGiojBhkkXdxQZ8C26ern1sePJDJzOgiB3jddkbY8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=JNBa7QFMPHRzhGhPBhLRkM/c3v2qbErtedyzv4Ol75eWGFjMPJk+3PLe2VE44Xvqb7fZCZqLPugWjbf2QE/qg3Oo1++6Jgt50UFMhts11j23meVU5+PdZW6KCabHo120WWEFgXGMPw1TlAFiYP7KAclYg7cPWtSx8ZmQDnqubCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bCq0ukIR; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773050226; bh=xbBsGMnzY1+YP8Pc5d3LS1Kx+Nv7ccQ2pvVnZWDMoJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bCq0ukIRCqT5UuqatO6McUJWuRRk8Aaw9WJe8uLFex1opIvsx1xw5MWj86JX79zjj
	 KCvJsb+bra/8vfum8Gy3FYkKe9bKu+bbyU0gY5JkwqLHwwvnkk6z7qvMZqjh6aR/MO
	 ybB8iG3Ll+BOZFIXDcmdZVmBZHtfKZK1BDFUa9MU=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id E4314CC3; Mon, 09 Mar 2026 17:57:03 +0800
X-QQ-mid: xmsmtpt1773050223twllwpqa0
Message-ID: <tencent_986ED56EFECC99E7EF86D412F6064FC99906@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XsF6vvQCk04sddRl4ZO54ea49qQyCZrGe9fEfoz0VBA1PApPMkG
	 +s3TpWCQLJtwoX887jBKlc7tfN4dGCxUNQY06eUaDyNQVhSMTdPLJxQECRYUvI7jLRd2hbd29QvZ
	 wuMUwK+H+Z79KeRnkSgQA7Oki42460WZsiteYcmsZK2sGjfTo5tun3BudhrsyLaH8/8kS60xi3Zi
	 W5SuOyZW1K+YN68RlbCOA8PFOCsmiP/TQzeUo6c6I73O7GbppmCxqeTUjaOpThO8dG1jNjAad8RA
	 v1+ZTAzpH5awqMiwphskYbEoERMvhlYaqS63xzm2JevKi94jMLmiXY/s65mRW9fYI0TsJXtIeNQa
	 LelTE5fXrjAqNvRse3vumXU8HeGU5Y9eVqUGyAeOai9yKPdfg1WN/SkBP4lrtu5EHSMkHNjE2e26
	 E36GbQORu8sAd4dll6kAa2i3V2hdi1UPpuCrl8H2ZU+WGZcLGsEHe0ggxyhyp9dJ77CqroYm8I8Z
	 SJiRADBY5wcungSvr0D01/2tpiVzpH4xdPLGreRX9aEbeRgGCN3yqxnuXCO5QzO0ObCC5b+LqilH
	 kY/+xTkO3oam+Ic/LhLYcqYWFWBnxDaXfuXjTK3x51Z9M5Fd8G49I3vI55F8CUHKLHG7BHaZggMA
	 zQy9KWpSFCAZdnJ/Sn2FDah8JMfEAzM3zZSqDe6H/DKPYEg71VsORh9xLXItK7P1NGeVMcwOTms5
	 a40KCNLyHpYkPWp1Mmu9WH72fIUPfZekwnBBnowh/lxjWflZU8lqPvQFkWV0RJE89gFeMRXbWVwa
	 XxjF4Xzgh3TxxymVU1x8IWgrfnSsaXqFOydvR9d2fl8/AdE5ZatTr+SsFhKYBOJnyEnsj/kzHR0o
	 /unMKj9RVbHO4KyXbCYxcS3ahfGzX+kFHe4iWJvbTQIiTzeHPLQ5CPXnOOUvmepakiGTTsaI81XA
	 zZ6xLYsTJs9VpMwQBWn3pbzO2YO9aIJZ7nTb0AqWLaB0qhRGd1d+59BTHnbnG+MoeDc7WnPBfvzD
	 un1vbqI2gLjDisJVXQwa8hsYfSEJo=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Edward Adam Davis <eadavis@qq.com>
To: tiwai@suse.de
Cc: eadavis@qq.com,
	g@b4.vu,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: [PATCH v2] ALSA: scarlett2: Add the number of endpoints checked was 0
Date: Mon,  9 Mar 2026 17:57:03 +0800
X-OQ-MSGID: <20260309095702.545842-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87y0k1toaz.wl-tiwai@suse.de>
References: <87y0k1toaz.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5A5B8236AB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34273-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[qq.com,b4.vu,vger.kernel.org,perex.cz,syzkaller.appspotmail.com,googlegroups.com,suse.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[eadavis@qq.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	DKIM_TRACE(0.00)[qq.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[qq.com];
	TAGGED_RCPT(0.00)[linux-usb,ae893a8901067fde2741];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,appspotmail.com:email,syzkaller.appspot.com:url,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Action: no action

The user constructed a corrupted USB device, causing the USB device
enumeration phase to fail to resolve any endpoints. This resulted in
a null pointer dereference reported in [1] when the USB sound card
driver executed probe to initialize the mixer. 

To avoid the problem reported in [1], a check was added to ensure that
the number of endpoints contained in the interface was 0 when creating
mixer controls for the Focusrite Scarlett 2nd/3rd Gen USB sound card.

[1]
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
RIP: 0010:usb_endpoint_num include/uapi/linux/usb/ch9.h:479 [inline]
RIP: 0010:scarlett2_find_fc_interface sound/usb/mixer_scarlett2.c:8261 [inline]
RIP: 0010:scarlett2_init_private sound/usb/mixer_scarlett2.c:8295 [inline]
RIP: 0010:snd_scarlett2_controls_create sound/usb/mixer_scarlett2.c:8684 [inline]
RIP: 0010:snd_scarlett2_init.cold+0xbad/0x6c79 sound/usb/mixer_scarlett2.c:9407
Call Trace:
 snd_usb_mixer_apply_create_quirk+0x1c21/0x2b80 sound/usb/mixer_quirks.c:4446
 snd_usb_create_mixer+0x7a2/0x1910 sound/usb/mixer.c:3641
 usb_audio_probe+0xf6d/0x3a90 sound/usb/card.c:1033

Reported-by: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae893a8901067fde2741 
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
v1 -> v2: move the check to scarlett2

 sound/usb/mixer_scarlett2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index ef3150581eab..4b300226f16c 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -9393,6 +9393,15 @@ int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 		return 0;
 	}
 
+	if (get_iface_desc(mixer->hostif)->bNumEndpoints == 0) {
+		usb_audio_err(chip,
+			"%s: There are no endpoints for %04x:%04x\n",
+			__func__,
+			USB_ID_VENDOR(chip->usb_id),
+			USB_ID_PRODUCT(chip->usb_id));
+		return 0;
+	}
+
 	usb_audio_info(chip,
 		"Focusrite %s Mixer Driver enabled (pid=0x%04x); "
 		"report any issues to "
-- 
2.43.0


