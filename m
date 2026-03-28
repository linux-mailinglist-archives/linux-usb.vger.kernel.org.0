Return-Path: <linux-usb+bounces-35617-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zH83JNkQyGnDggUAu9opvQ
	(envelope-from <linux-usb+bounces-35617-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 18:33:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981434F61C
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 18:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF64B301D97D
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 17:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C93396598;
	Sat, 28 Mar 2026 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lO/7eQ4Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287A3314C4
	for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 17:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774719187; cv=none; b=StUqh39d44JJHQkdes1ym1nqv140RuH+//tVoFEQ9K+Ro9CGi+jvHpqwo12MJNPerDIcuMBmunvhuq666F9rrmv168cZZfVW7i8+zTCowt3tCqQ7XIX8UP2ihmspq+Ptdl3Gg6dWrKETz7B2O6TFJQzettGYVxw38hHLjyn95G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774719187; c=relaxed/simple;
	bh=lEwGRQ/INn1o0oezBCZsILziDQurLp0Vg7dDoL9HIH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZag2Lg6fRq5pf/7ge16UGzbxGXX8LEya9b7lGOaTAz/cjPu5vL/f34AwUFAjdPGb3MZOiwQqxgeWiu01QJg6lthMiPRJ1Aimyrg82Nii35pr3LlZupGUQjz7+bg5ogr9OtPthV1HUIWy6Mu1s4nSgJCGrHV/OC9Jo+3KuW8aPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lO/7eQ4Y; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48704db565eso42776475e9.1
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 10:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719184; x=1775323984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d93cTq5QiIvneBfBankgaImdXDC9+22sYcuw2plg3Os=;
        b=lO/7eQ4YrU63mxAUuyC32yciNy3OBT+bwIzC4z5KmNnSZTLy2vPYKYAY3vspkIaTmq
         BYzSzZOnj+z2++qayLVQariSn4sLo6eECl4O+HY9Z7GS9uDwlex9LqSksxQ0W3uT9SC7
         rVJPhVu6v34JpR5l4H6pIQ6KqzPSNE5EZORMJRj4ik0M2LLwpPsypJhqpHrUNMZ0GHXF
         E6BwccPnnb2Nj9n99Gty3uuyod24w+X8YCcHqgIODIvKIphbJvFIP610QoHk/1IvhP9m
         0254q3dHMNA8ulddPlH+9sQw1YMsfXyIqJ2IrNcDHSFtCHptFoUUsm4Xb6w3vcH/bwDX
         ziVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719184; x=1775323984;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d93cTq5QiIvneBfBankgaImdXDC9+22sYcuw2plg3Os=;
        b=NkyDXM0P1c4FZ4CDBnZuicV3xtgDyx5+X1oZOklQA9sCyaUXv1DCD669Xt9wJY6LF2
         /pbUS8WKEvvph2wI0xPssMdiMpx44KNKsxZZDQ+hO5SeAeOATeZK/8A7ygFvHgK6Pb16
         89qc428nrdzXhGOxrlIuEHFG3oVsmv4BU6gD3lMe1PdAMyqyxEXux/BKs2muJ0YB2gUL
         tJRHtxPbSngHqc4BFsGHV4hwmGQ0ve6IZp0ssCYRAXNbYE2FGji9g0tNxg8Dsrd01Mk+
         rb7HemVrDxuy4ADujSU9EFQ6j3HbMpDQGANo7rPYIduO/HDVyR5w1GsE+R7Uc8leGSbR
         69vw==
X-Forwarded-Encrypted: i=1; AJvYcCVFxJtgCLoV9WlAf7UVMUr4w8+3gpQLhCY7QoF01UA7FrDz/g3Nkp6xexyZlNpjoiTYc6VyMQYYtcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgcWtr9Hn1dWA3swZMDYsuT72B/tHd7FY4efIR5vO8WqLLRjjn
	kgBK9MzUWjMD5LPSUwXiHLtdLQKmEMOeJpg/Fw4hFox+MO8x5KB9AHNY93s8zduM0ww=
X-Gm-Gg: ATEYQzwm7TTlNrFnh9f9Xgs2lNSemsfInur7JznnzdFcP7JVjEeTMNBJTkGPPWgixII
	0I+2RiggVOodjXq+7vKeQEUesGacu5uwrNa+RO7qjmTNj7xAfa6pF+BMtnUSa1TKmQZU7SyVUv9
	vgcBNNWNcl/kcv5ZoouxAtR73zyY/36JSQJedCvblnVuV8nD0mcZJjyIyquAkoprFp0r0QVEgzf
	st/RLSOyGIit8gngG0XNToauqEwBCLu9cWVqz+ER4ntSOxW9dKMYV6t66VZSQL2lU4vWJUHVQoX
	U5DNFes0QGDrMINOrVca3HUU/WUe3uMRLfM6iNgasUy2chNGiTOezi9w5Z2zv/s0pOhbcgqPQyM
	scNomsmzf4V0Hb5b3bpc/TWnzd8zM4KHaOeoPHVIPuXM42Otl9dzVlhHm0UsnYAtkhE2OnTbof+
	GcYYRl9Ys6SVwaUAnz0EuTicqNfz2KlHKD9UalrLVzXHebfuWQULOjU4VuGu2lluXTfd98o/3Sa
	rDWHHPxzaAqbUj6RYSH4TFSt27lrvNTdXMwM8m4EZHvi4AGqI12mYLuEU/IlOUeWV/DJxeWDmLw
	vKDA0hnf
X-Received: by 2002:a05:600c:1d1f:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-48727eb81bbmr122822165e9.17.1774719184216;
        Sat, 28 Mar 2026 10:33:04 -0700 (PDT)
Received: from stanislaw-QEMU-Virtual-Machine (host86-163-160-172.range86-163.btcentralplus.com. [86.163.160.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48730688605sm96375825e9.10.2026.03.28.10.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:33:03 -0700 (PDT)
Date: Sat, 28 Mar 2026 17:33:03 +0000
From: =?utf-8?Q?Stanis=C5=82aw?= Maciej Molsa <stanislawmolsa@gmail.com>
To: peter.chen@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: common: fix all alignment warnings in usb-otg-fsm.c
Message-ID: <acgQzzfSTX-5foU-@stanislaw-QEMU-Virtual-Machine>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35617-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stanislawmolsa@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 0981434F61C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Peter,

This is my first small contribution to the USB subsystem.

Fixed all "Alignment should match open parenthesis" warnings in
usb-otg-fsm.c, as
reported by checkpatch.pl

Signed-off-by: Stanisław Maciej Molsa <stanislawmolsa@gmail.com>
---
 drivers/usb/common/usb-otg-fsm.c | 42 ++++++++++++++++----------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
index e11803225775..5dcaa6c2057f 100644
--- a/drivers/usb/common/usb-otg-fsm.c
+++ b/drivers/usb/common/usb-otg-fsm.c
@@ -32,7 +32,7 @@ static int otg_set_protocol(struct otg_fsm *fsm, int protocol)
 
 	if (fsm->protocol != protocol) {
 		VDBG("Changing role fsm->protocol= %d; new protocol= %d\n",
-			fsm->protocol, protocol);
+		     fsm->protocol, protocol);
 		/* stop old protocol */
 		if (fsm->protocol == PROTO_HOST)
 			ret = otg_start_host(fsm, 0);
@@ -139,14 +139,14 @@ static void otg_hnp_polling_work(struct work_struct *work)
 	*fsm->host_req_flag = 0;
 	/* Get host request flag from connected USB device */
 	retval = usb_control_msg(udev,
-				usb_rcvctrlpipe(udev, 0),
-				USB_REQ_GET_STATUS,
-				USB_DIR_IN | USB_RECIP_DEVICE,
-				0,
-				OTG_STS_SELECTOR,
-				fsm->host_req_flag,
-				1,
-				USB_CTRL_GET_TIMEOUT);
+				 usb_rcvctrlpipe(udev, 0),
+				 USB_REQ_GET_STATUS,
+				 USB_DIR_IN | USB_RECIP_DEVICE,
+				 0,
+				 OTG_STS_SELECTOR,
+				 fsm->host_req_flag,
+				 1,
+				 USB_CTRL_GET_TIMEOUT);
 	if (retval != 1) {
 		dev_err(&udev->dev, "Get one byte OTG status failed\n");
 		return;
@@ -156,7 +156,7 @@ static void otg_hnp_polling_work(struct work_struct *work)
 	if (flag == 0) {
 		/* Continue HNP polling */
 		schedule_delayed_work(&fsm->hnp_polling_work,
-					msecs_to_jiffies(T_HOST_REQ_POLL));
+				      msecs_to_jiffies(T_HOST_REQ_POLL));
 		return;
 	} else if (flag != HOST_REQUEST_FLAG) {
 		dev_err(&udev->dev, "host request flag %d is invalid\n", flag);
@@ -168,11 +168,11 @@ static void otg_hnp_polling_work(struct work_struct *work)
 		/* Set b_hnp_enable */
 		if (!fsm->otg->host->b_hnp_enable) {
 			retval = usb_control_msg(udev,
-					usb_sndctrlpipe(udev, 0),
-					USB_REQ_SET_FEATURE, 0,
-					USB_DEVICE_B_HNP_ENABLE,
-					0, NULL, 0,
-					USB_CTRL_SET_TIMEOUT);
+						 usb_sndctrlpipe(udev, 0),
+						 USB_REQ_SET_FEATURE, 0,
+						 USB_DEVICE_B_HNP_ENABLE,
+						 0, NULL, 0,
+						 USB_CTRL_SET_TIMEOUT);
 			if (retval >= 0)
 				fsm->otg->host->b_hnp_enable = 1;
 		}
@@ -199,7 +199,7 @@ static void otg_start_hnp_polling(struct otg_fsm *fsm)
 	}
 
 	schedule_delayed_work(&fsm->hnp_polling_work,
-					msecs_to_jiffies(T_HOST_REQ_POLL));
+			      msecs_to_jiffies(T_HOST_REQ_POLL));
 }
 
 /* Called when entering a state */
@@ -249,7 +249,7 @@ static int otg_set_state(struct otg_fsm *fsm, enum usb_otg_state new_state)
 		otg_loc_sof(fsm, 1);
 		otg_set_protocol(fsm, PROTO_HOST);
 		usb_bus_start_enum(fsm->otg->host,
-				fsm->otg->host->otg_port);
+				   fsm->otg->host->otg_port);
 		otg_start_hnp_polling(fsm);
 		break;
 	case OTG_STATE_A_IDLE:
@@ -349,7 +349,7 @@ int otg_statemachine(struct otg_fsm *fsm)
 		else if (fsm->b_sess_vld && fsm->otg->gadget)
 			otg_set_state(fsm, OTG_STATE_B_PERIPHERAL);
 		else if ((fsm->b_bus_req || fsm->adp_change || fsm->power_up) &&
-				fsm->b_ssend_srp && fsm->b_se0_srp)
+			 fsm->b_ssend_srp && fsm->b_se0_srp)
 			otg_set_state(fsm, OTG_STATE_B_SRP_INIT);
 		break;
 	case OTG_STATE_B_SRP_INIT:
@@ -383,14 +383,14 @@ int otg_statemachine(struct otg_fsm *fsm)
 		if (fsm->id)
 			otg_set_state(fsm, OTG_STATE_B_IDLE);
 		else if (!fsm->a_bus_drop && (fsm->a_bus_req ||
-			  fsm->a_srp_det || fsm->adp_change || fsm->power_up))
+					      fsm->a_srp_det || fsm->adp_change || fsm->power_up))
 			otg_set_state(fsm, OTG_STATE_A_WAIT_VRISE);
 		break;
 	case OTG_STATE_A_WAIT_VRISE:
 		if (fsm->a_vbus_vld)
 			otg_set_state(fsm, OTG_STATE_A_WAIT_BCON);
 		else if (fsm->id || fsm->a_bus_drop ||
-				fsm->a_wait_vrise_tmout)
+			 fsm->a_wait_vrise_tmout)
 			otg_set_state(fsm, OTG_STATE_A_WAIT_VFALL);
 		break;
 	case OTG_STATE_A_WAIT_BCON:
@@ -405,7 +405,7 @@ int otg_statemachine(struct otg_fsm *fsm)
 		if (fsm->id || fsm->a_bus_drop)
 			otg_set_state(fsm, OTG_STATE_A_WAIT_VFALL);
 		else if ((!fsm->a_bus_req || fsm->a_suspend_req_inf) &&
-				fsm->otg->host->b_hnp_enable)
+			 fsm->otg->host->b_hnp_enable)
 			otg_set_state(fsm, OTG_STATE_A_SUSPEND);
 		else if (!fsm->b_conn)
 			otg_set_state(fsm, OTG_STATE_A_WAIT_BCON);
-- 
2.51.0


