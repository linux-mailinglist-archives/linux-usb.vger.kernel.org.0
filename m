Return-Path: <linux-usb+bounces-34261-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPE8HEF4rmlwFAIAu9opvQ
	(envelope-from <linux-usb+bounces-34261-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:35:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA209234D7C
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B3863055976
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 07:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFEA367F42;
	Mon,  9 Mar 2026 07:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ReIk3GZM"
X-Original-To: linux-usb@vger.kernel.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0B368953;
	Mon,  9 Mar 2026 07:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041565; cv=none; b=j9ZVrZaFYOUKRNsDxmCY2WExTwhGWz5TS3Kg5wXXSR/a1Cl/HUMIFn/itvEOKmMPVP7Bgj9g7YG3I8cvSq4Le93BUNAyfsQ++IF+g+bYvxClWt2mx/THdRLCxOuNxYv/ceRE9QtQZaM8GLUutrICXrGhQmTsvgCANfzcq4WA8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041565; c=relaxed/simple;
	bh=AWFU9eSZdANBFGv2dNLetCdbSQN+C5pPC0+pMVGgRqE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=DmQTam+7LvpC2Jc3GjDFbX6osp67wIu8JLXsEMgVCGU8iwXIrUljQKyLHwmdUaJTtLif9pKTEF/7jIgkgJD+KuCzqaekQ4pbv0DFZ5q4o2krdQHRFfdVDEHWsinghqQN79d7g6kYvYdn+rMzTnbw9rEaA9vL8brkCEUa+6NSNvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ReIk3GZM; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773041551; bh=Mb3mrLLhazoKaVlGHpGuWLgJFSK9E6hT7xlTEjAaAWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ReIk3GZMBzQevffP+PSh8vXLYqikFywjnoi+VHNgjwGUqZQZ+ZQNYGmBza6lfto0y
	 J61YD2Grn6Hma1j96X70/NUnrMV51dOVRS0T2w99VVD7gxWJtVwy0zW7QVMZXErTPv
	 WsW1yXkArrkaDk+0RfBE7dTgFilTY5Q3EGsTBcZ8=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 81C2AC9F; Mon, 09 Mar 2026 15:32:28 +0800
X-QQ-mid: xmsmtpt1773041548t58i0fpci
Message-ID: <tencent_251BAA25F2BA69BB9533A19E651B204B3208@qq.com>
X-QQ-XMAILINFO: MMhobhVxpxw2M+h4Pou3ogAm24ZYV3r5PM6E+OocHbkcziIfuoflNX9oMP9BeY
	 gMxiIw3E7NhJrD4JW4xXB+0vrAqYZNhtQHXyU1eHXccLdi4qMKq9XJIQAHObl+74DWhl/AIA6C37
	 I6g60SsjxSdU8YWuDn+tb7J2RI+avdVXHE59SRt28azzKVKnDqhbego3MWxJHcv+TM8hry83AkYZ
	 OByOyvhMyWudeFXXHlJmpLZLRmi14/1L/c16p1S/W+8Ncadgpefr+fawM4le6RVnrpVefW4OkBQ0
	 UuFUXqi5CySuCJkYx4cZEop7FSs1KqnsZqHCsWtrlL9+I2GVY/20wg4JVM0vc0vgHzplM+e0m8yx
	 mKKSqfvI1LXNifxU3Ky8WHvf7nNxxP2gjWM1QtLDJhRNgyC8WBMuenoDHn4azIzpVKXLFr7w9UoW
	 7O9cBCsvzdn4sYV12pTXFu8OQi+1yG9+7KJS+T+BZzSqDvpCQVm+zUjZ/hleoTsgflhaikYr6z6E
	 QEVXokTNmTSrN80/0JwKIt//OFuX0huC66VIp1VXtn7bsYvoXlWU4guucjgMHqtPVz9uV4FczExF
	 oAb2LQLh0uM5OYJMp+HotCx5wcG/EjflSeuUUILHybb8RJt/YJs6TPD35PYaI3fLHqv5hXqBV2Hg
	 tZXofiPehMLMWYiJnwO3TxDvPFmlyDJVm3rS+4Z1jSD5Ug5GuVMuNExxZLLxT4ARAsHyach63+1Q
	 bOZXKSuD9MmII+ZZF3g65G3zA6p09na+Y8b3mC6GQeTbtxGhn3zMQ/rMfsrcg/CjZ69BfnWgI9Re
	 7x3bDgjocTcesrCbxTF4d98J04epTdXIqPhmXjBQYc0y27hDMq9+DPeUVYgZKgjNl0jxSFj4XdL/
	 mlcUkjO82aWeoHzWST4ZMZPvLDG6fanDnEJMccRK/WfPYUkLHvHvzdv3cmGeYtzJLzHQ8Li8OoVM
	 mBec+6ToeOPtCJT+YXun/3Fg13KOKe3Po0ks1XHeeTM3zP4gNOdiZPp11AME84NqsumuJOxttu44
	 lTawsUqB+JRV5NfCIo5CBLQNbpgxGm6vaf1RtlVpYwcYYtB7OE
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com
Cc: g@b4.vu,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: Add the number of endpoints checked was 0
Date: Mon,  9 Mar 2026 15:32:29 +0800
X-OQ-MSGID: <20260309073228.539672-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <69acf72a.050a0220.310d8.0004.GAE@google.com>
References: <69acf72a.050a0220.310d8.0004.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CA209234D7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34261-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[eadavis@qq.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	DKIM_TRACE(0.00)[qq.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[qq.com];
	TAGGED_RCPT(0.00)[linux-usb,ae893a8901067fde2741];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,syzkaller.appspot.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Action: no action

The user constructed a corrupted USB device, causing the USB device
enumeration phase to fail to resolve any endpoints. This resulted in
a null pointer dereference reported in [1] when the USB sound card
driver executed probe to initialize the mixer. 

To avoid the problem reported in [1], a check was added to ensure that
the number of endpoints contained in the interface was 0 when checking
the mixer status.

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
Tested-by: syzbot+ae893a8901067fde2741@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 sound/usb/mixer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ac8c71ba9483..bd28caec3004 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -3563,8 +3563,12 @@ static int snd_usb_mixer_status_create(struct usb_mixer_interface *mixer)
 	int buffer_length;
 	unsigned int epnum;
 
+	epnum = get_iface_desc(mixer->hostif)->bNumEndpoints;
+	if (epnum == 0)
+		return -EINVAL;
+
 	/* we need one interrupt input endpoint */
-	if (get_iface_desc(mixer->hostif)->bNumEndpoints < 1)
+	if (epnum < 1)
 		return 0;
 	ep = get_endpoint(mixer->hostif, 0);
 	if (!usb_endpoint_dir_in(ep) || !usb_endpoint_xfer_int(ep))
-- 
2.43.0


