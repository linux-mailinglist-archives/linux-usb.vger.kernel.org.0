Return-Path: <linux-usb+bounces-36433-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNzuIJjj6WlQmgIAu9opvQ
	(envelope-from <linux-usb+bounces-36433-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 11:17:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D844F272
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 11:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91277306669D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 09:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E08C3E1D15;
	Thu, 23 Apr 2026 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb+kjSBq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485513C9ED8
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935406; cv=none; b=bh2jT7zZZYY5kgTfhv38nDczZR4nh2SgZGeRRyVSHgr+eI41lapbLUj0SD/A3vxcKukN1Pa/Xnbrmd8md2EYKmTB5mKX4oCYPnPH9QgBg76v4OTL90Rwuq+6e7TRnfmhT/FcJLiNwbhhcIoOiWcrwJetJ3TzYptFxnA05VTOe1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935406; c=relaxed/simple;
	bh=vwEKsA+nbFYpTCh5gVuvr4S/uIi6G5nwFRfHmkEiQRo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I1BEE/+j9NGVJ5ReBvTZXNP1hC6TyrSMsnvSzfAcugvZ+eWjPOD1P5Ac7xnltd4bYrhtArVboq46Fja/DXd/TD5WGWL0ge8OnfrLVlKCkJskWoVkvKOqPlU5hBeSb1KE2/oXA+ttPCTg69uee8pvCHQCRQ1I79VKLkGtFSw+W+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eb+kjSBq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so8810702e87.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776935403; x=1777540203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GW2PNNDkAuBpg1bMRvNWzBprqg1m58YQcX7A6vaBfA=;
        b=Eb+kjSBq9RLx+Uj5JEgUd50LWroueLfjZt5RgcPaMI416zosW9b+bjC0vllzYoopZK
         uuUUeEwY01JoYY3Q7G13OJVkxd/p8S4d52kZTnOItLUb6wyjqzFpe2vFMnb0MPpDtbFd
         rTxH+HmOd3pSvuRLkGnOUZOdkCFQUwhHEk24MONdqMS4G1VKa424GYbkl6v7zY366E8k
         gRUfUBulOutaJ3CguoYrEr25o0pS+6bKLs06ZQn2+uyE1ZOjBRz9ufhdqfq1IpB8PQoG
         ThIZsxi16Zq92XXQ/1+7lhJbWZ68l17WLwBCRHg8JqWY9YUAOD2Zm0Scw3FKOOfNf8Ci
         gDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935403; x=1777540203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8GW2PNNDkAuBpg1bMRvNWzBprqg1m58YQcX7A6vaBfA=;
        b=cli4ggMP7cFan1f0paXcTKpRp0IYSHB4A1M9JFw7NC7Jc4iarNwBy9Sa/+QydUlLhZ
         cxwYmacyOTBoOw/8M8hyyIIuSOswLreMqBeBvM6AWgLXafkPph9LnyoZF1XcVp3SBMVA
         bIM9P3D/WCPnMDMmo6D9VeQuuoMuac3rNfKdji+ue0TRO6qVPd9Y+twiMyOrZPka4+UU
         ECmF0rpK0pvEYsWeCOI4iThltmT6PM29fcoja4dKu1Aj7KoyUOHn1G+62UrVVCMJTA5C
         4LEsrgZJ1Llp7pj3n7XDDeyq2u4k7JpnB5VISUHtbhVmxcf5lKhFiPgLjlQZqG7cGCSb
         rZYA==
X-Forwarded-Encrypted: i=1; AFNElJ84zrlH+pNatbKrl7/q8mEuTXA26Ebvs2VGcnW3blLJex+sEdmjK5aOzVfaWGZHCuOmthxq5+oZmro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoiSBYhXMfEFYMoMmoRYT8coOQFLl38I6vI82E7XLujXX2+roe
	zAZfLP+8EyeYT62Z28ibu3Tn3t/IhW/S1E+bMc0AvDW6pkSbC2kSCF8C
X-Gm-Gg: AeBDies33sAC1hwZZ3eaEcc9BjZdGaFLsKo3Pz+7iMSMgkALWs0me1mwaIRbGY3Mvi6
	FGDhjmODyPB9Tl+9TyRH+cvfM+birXlhCGhPw5zU+ZK6CL5KAZhVwN+Cgdfbp2BURKgCl5xFJAo
	wGHiF/N0ddnzzrmEo/wjJo/v8i4wp1Qa7CpUicVx11t4psZxRuNoSRtw+oheFyabRpLd7Q28pv0
	msVsNGnjbS+A6nKdA4VKoeZmu0i2jR7t9uCBZ9D6CK9XyTPF7cM7UoCHoRAxKUgRWueHqv98k6v
	iSjAQIV+6IP+gJZ943SxrCKFPMpaUaqn2nbT6ikWFNGSKgm8B/hHsEdogg0JeobKCKhnJt5pFlr
	eBjtfaIDo0FcwzcMugMZWOzCmhOez6BqoMa3q3c67dEb8w3U2f0VA3ZvRNi3RCJ0oAr8Mk8F5o2
	/Lw4AhfoZN7/2zsOw52cDFdBEl6T3A21UBufYHBZUxeic=
X-Received: by 2002:a05:6512:3193:b0:5a3:ed0a:efb4 with SMTP id 2adb3069b0e04-5a417303404mr8846063e87.38.1776935403246;
        Thu, 23 Apr 2026 02:10:03 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7ca0sm4992067e87.65.2026.04.23.02.10.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 23 Apr 2026 02:10:02 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:09:59 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Xuetao (kirin)" <xuetao09@huawei.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <caiyadong@huawei.com>, <stable@kernel.org>
Subject: [PATCH 2/2] usb: core: Fix up Interrupt IN endpoints with bogus
 wBytesPerInterval
Message-ID: <20260423110959.0e2f1a4e.michal.pecio@gmail.com>
In-Reply-To: <20260423110648.158ec861.michal.pecio@gmail.com>
References: <20260402021400.28853-1-xuetao09@huawei.com>
	<2026040241-purveyor-bakery-a9f1@gregkh>
	<c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
	<74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
	<2026040221-reclusive-garland-6281@gregkh>
	<c2d89ac0-1d5c-45b8-ab68-53214546a7ae@huawei.com>
	<00ad170a-2546-4d7a-8f8b-af6d46e09a73@huawei.com>
	<20260423110517.664745da.michal.pecio@gmail.com>
	<20260423110648.158ec861.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36433-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C55D844F272
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tao Xue found that some common devices violate USB3 section 9.6.7
by reporting wBytesPerInterval lower than the size of packets they
actually send. I confirmed that AX88179 may set it to 0 and RTL8153
CDC configuration sets it to 8 but sends both 8 and 16 byte packets:

S Ii:11:007:3 -115:128 16 <
C Ii:11:007:3 0:128 8 = a1000000 01000000
S Ii:11:007:3 -115:128 16 <
C Ii:11:007:3 0:128 16 = a12a0000 01000800 00000000 00000000

Most xHCI host controllers neglect interrupt bandwidth reservations
and let such devices exceed theirs, some fail the URB with EOVERFLOW.

Assume that wBytesPerInterval lower than wMaxPacketSize is bogus and
increase it to the worst case maximum on interrupt IN endpoints. This
solves xHCI problems and appears to have no other effect. Interrupt
transfers are not limited to one interval and drivers submit URBs of
class defined size without looking at wBytesPerInterval. Any multi-
interval transfer is considered terminated by a packet shorter than
wMaxPacketSize regardless of wBytesPerInterval - see USB3 8.10.3.

Stay in spec on OUT endpoints and isochronous. No buggy devices are
known and we don't want to risk sending more data than the device
is prepared to handle or confusing isoc drivers regarding altsetting
capacities guaranteed by the device itself. And don't complain when
wMaxPacketSize <= wBytesPerInterval < wMaxPacketSize * (bMaxBurst+1)
because enabling this seems to be the exact goal of the spec.

Reported-by: Tao Xue <xuetao09@huawei.com>
Closes: https://lore.kernel.org/linux-usb/20260402021400.28853-1-xuetao09@huawei.com/
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

Note:
Compared to original suggestion, this is a conservative patch which
only addresses known broken devices and tries to minimize disruption
for spec compliant ones.

 drivers/usb/core/config.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 6a1fd967e0a6..bdd912627bac 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -191,7 +191,14 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 			(desc->bMaxBurst + 1);
 	else
 		max_tx = 999999;
-	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx) {
+	/*
+	 * wBytesPerInterval > max_tx is bogus, but USB3 spec doesn't forbid the opposite.
+	 * Experience shows that wBytesPerInterval < wMaxPacketSize on common interrupt IN
+	 * endpoints is usually bogus too, and recent HCs enforce interrupt BW limits.
+	 */
+	if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
+	    (le16_to_cpu(desc->wBytesPerInterval) < usb_endpoint_maxp(&ep->desc) &&
+	     usb_endpoint_xfer_int(&ep->desc) && usb_endpoint_dir_in(&ep->desc))) {
 		dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
 				"config %d interface %d altsetting %d ep %d: "
 				"setting to %d\n",
-- 
2.48.1

