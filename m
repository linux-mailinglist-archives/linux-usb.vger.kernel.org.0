Return-Path: <linux-usb+bounces-34744-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yATKLD4FtGnjfQAAu9opvQ
	(envelope-from <linux-usb+bounces-34744-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:38:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DECF28324A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 13:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B03430A41DF
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37307394780;
	Fri, 13 Mar 2026 12:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEFE5Fcb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74A638737B
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405415; cv=none; b=OO+/gwfa7F0uAqtBCVoI8HGgbcFznxixD0JKMObyv28xyCaV5Mhak83DNrMxkF0Gg4zy6GLlhrhLy2UJHjFyMnG69p+WJ+66QKjC7JQjAHbwj4qeE2t+hCNWu1nohVRXTvvraKzqMgrIn/AKBXKdD+S9NE+YcTdUI9TE/Mxkar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405415; c=relaxed/simple;
	bh=kNzr66s0zU+N+3TvhT8n4XqjpKORTUl1PLOpJ4EnVB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ypb38HQ7k3+Kkh7eULvfzLgwlypu7LoSGmya7tqOt1DRiBwc6ITQKYgddfCYR0K6v8dSff/JC02s3blNf3bTLI3KPqSXkxVDG8vY5t9Kg9XU+6KPvudSiv09wEFi0iGWhFrQx7IsDLg76IiUe/jta63YS/1KjUdN0KShubDuMmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEFE5Fcb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1443780c4so3490383e87.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 05:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773405411; x=1774010211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZ+5ll8SQAFvyOuAG/uLnFNLTiNy5RMpK533+Lfxzkk=;
        b=jEFE5FcbaOeDPiTY8AzMo7Fhv29cnfSVmDoywuqTvpTkuheScE4dng7qxEERBb+kp/
         KloSRlpB3zKK//2ckOWcURorCbxpQ8VYDTfY7lgsaBzJ0e8mbN09yM/ge6753V7cFzdr
         8WIIydH5QjRGiyr2jXNCbZkx/XpNBkzsArAHwxkuJzUBt4PIKbxhdiMg9hC1GSJJSlpZ
         UYPHteGPfk6pmhVIZ1uMF6S/siVw26O9S7gPlBW/Fddy1Ia6lvnrnMNx/Ge0P6/K18CS
         5xVRGBOWhZz3rHqEergFZs0O4L/xLHOVTyMMMej7QVRL79BooEmjxmjOH+5SpuPYaVuh
         PcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405411; x=1774010211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZ+5ll8SQAFvyOuAG/uLnFNLTiNy5RMpK533+Lfxzkk=;
        b=ZE8oTS7RJEG762hwHsg8UnuMRBCjESRTofC3Qepamr2pxID3pFIsWOvBDHet6kuM0q
         HjVrfvrxhTcaS7uhe39clY/rMbSfrBDViuNPN6hckMD+AgOot+5QJTV4L1cjbhLQH+lC
         T+fCOZ8PZS+0bYDjb24EC8bTJW0Yn4cz504uwaSdiiKV9S6y6/HLWKF+CifhUwwuEeUS
         QVxnvy7cLS7wMZ0pENYZJqxJWtSw//T9Gl0XflR7S3cYrw8YX4rpc9yU1wEEBfCwR3Jq
         yTHCBkhSuJT/CHyvTC4Gfj1u4LGmn5SlyiRdu5UYXkjz6ayr1SLGGs/vqZZXHmeXJmHV
         oizA==
X-Gm-Message-State: AOJu0Yx0mOnkx5BfTFRl85dtGEWFmQh63Cy2x0bzhDB5tttzCbDdPl8d
	qrwTqyjsyefhX5wLcTrXrSrDJXvI7UeP3rV58W3tuiVzKkw4e5XGSo6z
X-Gm-Gg: ATEYQzxqb6qVSjK8Npy/ICQjHMYQ6/ez81K5sxYGXFrJ8YuSdHl74m0M0RWBQRGN9Wa
	D08QbPAdD1Fq+ar3PwT0bJ28/z916R4KL7l5XWy33VuG65Kse7HD26nkTdp9j4a0Xjz1Z+vcDzx
	CP4PBCCAj1bJOqmxoFOwGqd/sXTpS8GKSrgFo4bh8GrOSO7uo8grrFGELTknU5qmCV8DMY0l7RY
	WKeD+xdmQEtb82N9XGUXWj2us5gO/GiOQ2QxUmyqrpFIKG7cV3qgShG6SizrD9v1AhwgNOXvXHY
	Kssy6CGTXoJQPi817BdenJtS6GwuAkRTb0Z5tq045sm6mowCmy/DrOEn+maD1fC1HbykFJUYkoZ
	nwN+VSjyGo3G1CE8uJBe/ym5p5RN23VaRHvmgif6s2CrqjbL7ZU0O2a9RX/+Ani0ZaL9wYqupiw
	s3IeyDq/qPEFT14rKvB8c8NlxHHA==
X-Received: by 2002:a05:6512:61a:b0:5a1:1941:18ad with SMTP id 2adb3069b0e04-5a159f4bba7mr1916613e87.0.1773405410320;
        Fri, 13 Mar 2026 05:36:50 -0700 (PDT)
Received: from catato-pc ([212.192.203.108])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162baesm1574136e87.42.2026.03.13.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:36:49 -0700 (PDT)
From: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	vahnenko2003@gmail.com
Subject: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
Date: Fri, 13 Mar 2026 15:36:38 +0300
Message-ID: <20260313123638.20481-1-vahnenko2003@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026031332-askew-policy-c4ec@gregkh>
References: <2026031332-askew-policy-c4ec@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34744-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[vahnenko2003@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DECF28324A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add USB_QUIRK_NO_BOS for ezcap401 capture card, without it dmesg will show
"unable to get BOS descriptor or descriptor too short"
and "unable to read config index 0 descriptor/start: -71" errors
and device will not able to work at full speed at 10gbs

Signed-off-by: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 9e7e49712..0010f41a3 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -574,6 +574,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Alcor Link AK9563 SC Reader used in 2022 Lenovo ThinkPads */
 	{ USB_DEVICE(0x2ce3, 0x9563), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* ezcap401 - BOS descriptor fetch hangs at SuperSpeed Plus */
+	{ USB_DEVICE(0x32ed, 0x0401), .driver_info = USB_QUIRK_NO_BOS },
+
 	/* DELL USB GEN2 */
 	{ USB_DEVICE(0x413c, 0xb062), .driver_info = USB_QUIRK_NO_LPM | USB_QUIRK_RESET_RESUME },
 
-- 
2.53.0

Thanks Greg for your patience, I'm not familiar with email stuff let alone kernel maintenance :)

Vyacheslav

