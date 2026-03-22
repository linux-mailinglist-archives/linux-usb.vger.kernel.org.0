Return-Path: <linux-usb+bounces-35283-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JBtLBZlv2lJ4QMAu9opvQ
	(envelope-from <linux-usb+bounces-35283-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:42:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8152E8241
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 04:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBF68301ABB5
	for <lists+linux-usb@lfdr.de>; Sun, 22 Mar 2026 03:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBA6175A74;
	Sun, 22 Mar 2026 03:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="fOuBtUDS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2237FF58
	for <linux-usb@vger.kernel.org>; Sun, 22 Mar 2026 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774150900; cv=none; b=FPRX8z8Y/TfZz435CeceevW2lWsZbFn+RbXNi+ZYxuGj6wLIsUhrGntpGa7/SkymYEd/ZyitgpqAP0o7dJJNmbKAT+BZsUn1xBHiZ9Hv1YqPdzDWWFY5iB9FZsS6j9Hj2WYrl2B5PATLPnf86F19znN6O4j6J90juZ5WdRy5xx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774150900; c=relaxed/simple;
	bh=wehqK6rLH1PC9vgBn24Kw3MFbqIl5qgphsugM3D76v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/d9v3iVqwQsksRijOB3oELK1Q56U/+D+JGmhpZ79T2DFbabkFhqkBgnVP7nCzXrx4L8kRNSs2EA+Z7OmbVnioVeZGDMhS4jIiyhh9bivPqTtvgs2dE+a+umQ76lSCHJ1X1iluFUnAdUm5/Jdg68rUugq0GqMjptszSP9sXtkOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=fOuBtUDS; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c1092cc08cso4796535eec.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 20:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774150899; x=1774755699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+6TeIDvGKnGgJzVgLjcCJqKLNQPeYlw80XeDdHbaRI=;
        b=fOuBtUDSQzd+uzCsb/jaKXIwzevsLbeRne0MqOGM8reIwl7p2wxKDOATlxiuUBwKgw
         W3dEy8PjsmcwgiQbZnWu5ommgvDl6I1GF5WTxEEcGDA7kvegEXGqL3bf70WVNb7VlAXP
         9+s+4sRgcVFVJHhPOsNCQPROLH+2BFH3eGZhdkva/asI60I4y+7nNfJvIu7J0b5ntNUq
         8fn+gUL9J9atYoSWOcenQihk9jGKc4j8MGXl7ArtIvO6CPCUI0nPrhKXTtuldQw4HlgP
         lYgnFW83dyqNwNqMoicT8nxFQA4OiC5kR5LgssvnNc0nWuGHzfL2NTouOFBuP0GydlcJ
         ZZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774150899; x=1774755699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+6TeIDvGKnGgJzVgLjcCJqKLNQPeYlw80XeDdHbaRI=;
        b=tRukc66ToW3dJOIFb+zJX0rSB/nOJ5vSkpwtGI1mCCpKUK31tV6r72bONXMpG0J3AN
         OSOwn8NzjNznHdx1ulU7ILOVEbY8jISsQy9jKdSIP3rHz7NHOhyQLCQlsx32nI71vTeE
         gDqgqZTPAkp2nV//cXtfpObbFYyOsCk1x/C3UNTu5Garl5ta/9o12XYLOHWEA4HYqoi9
         3DkkewKFojVuFdRwt1rEgG426wkVpVJnU6clUPmAQQJmWjgSosIrpVv3MlO55W7vN6ek
         dQmH68BiSH/JtfflRThwYXRwcoBgMxeNKLmax6cAeoCvJRzEpGiAePnJsPr1iDa3A/JA
         IlJA==
X-Forwarded-Encrypted: i=1; AJvYcCVA4y/KZWM9K5O3mCN+4X383gYfoxRPqGAm99YybCvFLRO6We27/EeWHT9j7EDnvRmZPqtiXxfzbyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKAeBv7GAd7fMN0fdBDmPIdVfdjIxS3MxBngBdeFw7nndTRi7Y
	eFcrZQa9ToBLK4tXQsxemdSQJkTSZCEtLN4aZ6qfSp1ddIXodEEqjlXH/vzOss10wg==
X-Gm-Gg: ATEYQzy7GRC0HcmpA1mD3CTbM9uVaKA050TnXRQq16lRaG+gfztiN8lwd6fgnwB19ra
	nITIOh6ddS3c2ets8+i6qweDkLrelLYnsx5FUbfjehNdXlpX4ZlGQXkeTFotKXv/7q7MoND67EU
	G6JnrD1OzhBj46nxiE3xbv5StASmv+KDzNVadg+wG9VDbhgYeAIL3ezY8EuqpbZf4MOkoAdtgRw
	5JQAy6RXqGnuvWkk+UFr80DpM2xTnmkKvjHSDz5dQGQ76v9n8LO3W6XJhlKOjax51sJwZ8byq3j
	X82xkbPqm5ILuUw4EwZxQr0nY92CgZni+BGht5qZ+VON4AorjHZL8/9ReM5exAhl1y+pP4DBhlE
	x58eBDysqZyXOgOGxRwawkinfT97iSSXSWSO8vN7BB9iCxuvV3RyDO/7DT6QKi8EfSOOWoT/QvF
	+5WovYVxut
X-Received: by 2002:a05:7300:7c12:b0:2b8:6a22:6d52 with SMTP id 5a478bee46e88-2c1098157a7mr3843248eec.33.1774150898451;
        Sat, 21 Mar 2026 20:41:38 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1961a2sm8989451eec.12.2026.03.21.20.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 20:41:38 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 1/3] USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
Date: Sat, 21 Mar 2026 20:40:11 -0700
Message-ID: <20260322034015.3629056-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260322034015.3629056-1-jp@jphein.com>
References: <20260322034015.3629056-1-jp@jphein.com>
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
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35283-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C8152E8241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 UVC webcam whose firmware
does not handle USB Link Power Management transitions reliably. When LPM
is active, the device can enter a state where it fails to respond to
control transfers, producing EPIPE (-32) errors on UVC probe control
SET_CUR requests. In the worst case, the stalled endpoint triggers an
xHCI stop-endpoint command that times out, causing the host controller
to be declared dead and every USB device on the bus to be disconnected.

This has been reported as Ubuntu Launchpad Bug #2061177. The failure
mode is:

  1. UVC probe control SET_CUR returns -32 (EPIPE)
  2. xHCI host not responding to stop endpoint command
  3. xHCI host controller not responding, assume dead
  4. All USB devices on the affected xHCI controller disconnect

Disabling LPM prevents the firmware from entering the problematic low-
power states that precede the stall. This is the same approach used for
other webcams with similar firmware issues (e.g., Logitech HD Webcam C270).

Cc: stable@vger.kernel.org
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/usb/core/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -493,6 +493,8 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Razer - Razer Blade Keyboard */
 	{ USB_DEVICE(0x1532, 0x0116), .driver_info =
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
+	/* Razer - Razer Kiyo Pro Webcam */
+	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
 
 	/* Lenovo ThinkPad OneLink+ Dock twin hub controllers (VIA Labs VL812) */
 	{ USB_DEVICE(0x17ef, 0x1018), .driver_info = USB_QUIRK_RESET_RESUME },
--
2.43.0

