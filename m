Return-Path: <linux-usb+bounces-7507-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B710087140D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 04:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBC171C2190D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 03:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C1C38FA8;
	Tue,  5 Mar 2024 02:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3wOF5rGe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BD918046
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 02:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709607586; cv=none; b=tlmATqxzPdPBEzTnv6iqDRvRt97b33+5qeZvdTj5I7pHb/Osx0/1zHm9SwrnvSONV0XhFlUSgwj4OSrxCqw5grBsRhXyskWCO3lRhFjfmZRquepichegiTK5I9U7UQfhuRwsIEnQwa5vw4aqgli4KD0nEfTdHtJQqfAmCT2SWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709607586; c=relaxed/simple;
	bh=j6Y/Hhr5CqAHm0xm2dsE/+btVkhvBXh3wX7UzKjPM8o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ku0QUTo1OzKiCvacshnJr5MQEuJBAAIyhGVQWGe7FKv0iGIxU0Vo/hjZGoe7xB7MuTM98n13No+TAoS02pcNWUlSHmEQKwIvobIkUfM3Jq+vdnRJQjD21P+7Yiil9ctWRwMk1S3ZZEdM+u2JChyFBw/Iq+wPf3HlKpQVCrEdmiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3wOF5rGe; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6096c745c33so96959247b3.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Mar 2024 18:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709607583; x=1710212383; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hlOxNUN/T2i2wNDICKtujJTrAn1oMh3X1Wqzwd1LXbs=;
        b=3wOF5rGe+AOyIuk7ojlcKkKs2UtRr1XzJbxzPVXmThhVWYaKvCCBwV1cA0XouzX7Up
         LM7zw1M2CKNTIYK11BLfdsydsd0/Dhb2mruNBCu5tVKZR9b7fUDKjfaWGgLvjspcsiys
         491feMcdIRWE1OgxewO09T2G5FxDuGdaPsHy3dvtvNQHn6E8UYZsjYeWORa+cH5ZzhaB
         JQQu1js+MhPt/xon525saEfOjy97Wy13GsopEjB6GU+7gOQVcrbfTxgp2zN8uo+O1tsd
         yE3ahnPUEnr72ND/BNb961g48ZxanVIv4t9rZJLkImeMyZ4GuHPjnnu+7nLHoKslHqOB
         0c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709607583; x=1710212383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hlOxNUN/T2i2wNDICKtujJTrAn1oMh3X1Wqzwd1LXbs=;
        b=jFJYwPHDWHY8qPoA7IxRlIJNPWKadsr+TrByzChMj7RVIuEZurBpxCGJffVxYgoj4F
         kx2X2KT+b/bRvqmv5Spdqn5OoRxlKvTERMjH9HQbwsZkXiWSMWajEeBX2EBwRonmjNYa
         EHA/W81kUsnw+x5wKxAkb7htu4eazdtVrhMtX2A+8HYTPUmc334LnZIoptBz9QKw8X32
         y4q2jPVvi2QEMaFv1Wvu35f3rrk9qSdWOb/TjtTTqXOFyTEzh4+xY+TDi4+jaQihNGF1
         HGWc3LZ90hJvvxAZNLghHVJCzOiv4rz+7Y29y9VOXX+5isuy1PlL1UBjbg3LQkjSBaFG
         wOHw==
X-Forwarded-Encrypted: i=1; AJvYcCXhlvcmtnG+u2W0Qxhj9JOq84ElkonCgniaPcMh5uB7+lDuX31g/u0SGPBAxJkCtxT6xLXzB+ixdwXbJA0wRm+aC3S3SXsQrAl4
X-Gm-Message-State: AOJu0YxpBN41ltSWGTxLGeWxBd+YeZIhMhkD+gVPImZMCyaSASqAeptc
	FcHccfrJMtAkKP2Di0VzAJzwZ2C1vYkG1HAhTI7g1K4pm2yYpHlbGRL/zn08VkUtECQmF3+Yf8c
	KLA==
X-Google-Smtp-Source: AGHT+IFJPMzA4BMB63dEX0agbVq4KRaIYmaCyPEEtzAnMUP+Exq0++9DbY4jZrTp105nw+RV2ccLnCVd1W8=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:e18:b0:609:247a:bdc5 with SMTP id
 cp24-20020a05690c0e1800b00609247abdc5mr3070988ywb.4.1709607583714; Mon, 04
 Mar 2024 18:59:43 -0800 (PST)
Date: Tue,  5 Mar 2024 02:58:04 +0000
In-Reply-To: <20240305025804.1290919-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240305025804.1290919-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240305025804.1290919-5-jthies@google.com>
Subject: [PATCH v4 4/4] usb: typec: ucsi: Register SOP' alternate modes with
 cable plug
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Register SOP' alternate modes with a Type-C Connector Class cable plug.
Alternate modes are queried from the PPM using the GET_ALTERNATE_MODES
command with recipient set to SOP'.

Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Jameson Thies <jthies@google.com>
---
SOP' GET_ALTERNATE_MODE responses from the PPM are correctly registered
to the cable plug.
nospike-rev4 /sys/class/typec # ls port0-cable/port0-plug0/
device  port0-plug0.0  port0-plug0.1  power  subsystem  uevent

Changes in v4:
- None.

Changes in v3:
- None.

Changes in v2:
- Shortened lines to within 80 characters.
- Tested on usb-testing branch merged with chromeOS 6.8-rc2 kernel.

 drivers/usb/typec/ucsi/ucsi.c | 60 +++++++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3b64a0f51041c..cf52cb34d2859 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -399,6 +399,27 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 
 		con->partner_altmode[i] = alt;
 		break;
+	case UCSI_RECIPIENT_SOP_P:
+		i = ucsi_next_altmode(con->plug_altmode);
+		if (i < 0) {
+			ret = i;
+			goto err;
+		}
+
+		ret = ucsi_altmode_next_mode(con->plug_altmode, desc->svid);
+		if (ret < 0)
+			return ret;
+
+		desc->mode = ret;
+
+		alt = typec_plug_register_altmode(con->plug, desc);
+		if (IS_ERR(alt)) {
+			ret = PTR_ERR(alt);
+			goto err;
+		}
+
+		con->plug_altmode[i] = alt;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -566,6 +587,9 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	case UCSI_RECIPIENT_SOP:
 		adev = con->partner_altmode;
 		break;
+	case UCSI_RECIPIENT_SOP_P:
+		adev = con->plug_altmode;
+		break;
 	default:
 		return;
 	}
@@ -836,6 +860,33 @@ static void ucsi_unregister_partner_pdos(struct ucsi_connector *con)
 	con->partner_pd = NULL;
 }
 
+static int ucsi_register_plug(struct ucsi_connector *con)
+{
+	struct typec_plug *plug;
+	struct typec_plug_desc desc = {.index = TYPEC_PLUG_SOP_P};
+
+	plug = typec_register_plug(con->cable, &desc);
+	if (IS_ERR(plug)) {
+		dev_err(con->ucsi->dev,
+			"con%d: failed to register plug (%ld)\n", con->num,
+			PTR_ERR(plug));
+		return PTR_ERR(plug);
+	}
+
+	con->plug = plug;
+	return 0;
+}
+
+static void ucsi_unregister_plug(struct ucsi_connector *con)
+{
+	if (!con->plug)
+		return;
+
+	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_SOP_P);
+	typec_unregister_plug(con->plug);
+	con->plug = NULL;
+}
+
 static int ucsi_register_cable(struct ucsi_connector *con)
 {
 	struct typec_cable *cable;
@@ -879,6 +930,7 @@ static void ucsi_unregister_cable(struct ucsi_connector *con)
 	if (!con->cable)
 		return;
 
+	ucsi_unregister_plug(con);
 	typec_unregister_cable(con->cable);
 	memset(&con->cable_identity, 0, sizeof(con->cable_identity));
 	con->cable = NULL;
@@ -1085,6 +1137,14 @@ static int ucsi_check_cable(struct ucsi_connector *con)
 	if (ret < 0)
 		return ret;
 
+	ret = ucsi_register_plug(con);
+	if (ret < 0)
+		return ret;
+
+	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP_P);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index b89fae82e8ce7..32daf5f586505 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -429,9 +429,11 @@ struct ucsi_connector {
 	struct typec_port *port;
 	struct typec_partner *partner;
 	struct typec_cable *cable;
+	struct typec_plug *plug;
 
 	struct typec_altmode *port_altmode[UCSI_MAX_ALTMODES];
 	struct typec_altmode *partner_altmode[UCSI_MAX_ALTMODES];
+	struct typec_altmode *plug_altmode[UCSI_MAX_ALTMODES];
 
 	struct typec_capability typec_cap;
 
-- 
2.44.0.rc1.240.g4c46232300-goog


