Return-Path: <linux-usb+bounces-37746-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOv8MaMXDWoctQUAu9opvQ
	(envelope-from <linux-usb+bounces-37746-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 04:08:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C3586B55
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 04:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 712373031330
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 02:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896752FA0C4;
	Wed, 20 May 2026 02:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FXfo6EBU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD02C08D0
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 02:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779242890; cv=none; b=LN9UWykTVAowLJIh8c/2t+aDaDpU92A55JxWclt0R9dE2/SrliJ5k5isIxGtZOoR1tQuj60h/3hRTaYxfADCPD1ZNjoZCJp+YVHNQYpQRuJI0T+aiqmTQZX4YPkSyWN9fQOAEYgy4r0zgLo8f+QEq+g552Z18wJicMI+3v+X7z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779242890; c=relaxed/simple;
	bh=8umbNa/oNZ++AzAtTC5WhKBF5LmrgEbGcY9cU4TSOSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlzyHKLs0K9lyBBlQjor23YfYQoeAgzDVv8nsVNcoxnfurNpYBYvOBA3fBTuMeatzc0n8Vj1B/8Ua9slHF3i1Oe4dBi71HQm60lCGmZjQpDL9Y9F5CGs6J4Uf0CIceF4DDYdlJSOv/gi7Dwz00bBUsVPExWk7tePiIcTQBmhDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FXfo6EBU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2baef9f5ecdso34173795ad.1
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 19:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779242887; x=1779847687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dxUpMHgnn0+fNnh0tHA+O5hKu+5k+ENLyMKcPMHbeeY=;
        b=FXfo6EBUKhnrU3H8RRXPnzigxQTdT2lLw6E23mGpivWjUFHoM4snQjntIFlRn4q5gj
         roZoGdm1vvFHmzjsTeCyqbdYtLYO7uurnaDn+3SYT8eXqTplB5Mdx90bOhlAdLk7D+/o
         4OutnaV/yCb+48Legj5lvX8DAtQLXtZKlGtTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779242887; x=1779847687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxUpMHgnn0+fNnh0tHA+O5hKu+5k+ENLyMKcPMHbeeY=;
        b=ifSaWkix3iUGyYuLW2fW7yFBkJA9oKGal2rKGM4H6CfkDd/dQaG/hUe7ZLRpJa+b4e
         HONLi+GkkC9l8kGAXKbCf9kwaFj+7l4sFBi0Fg6Mtbc6j7Th/jhwdKF/j5JjiM192pht
         mbN5Dokbpa4Jm/W1fOVYRKFSiR2KwMX2DAPNT86dji4id6l9/j6XJpdQWohxSH499ygk
         6MMuDIqo7fUJTd47xVEqNqYM3VvZgS+dN3tk0/o5/sWUDMDll/MNWViEMMqdC5rQ9gXf
         9f3Lk4fe4R80wcPgMiEoMYbtiU/x4TOapgPfXdum8cGOfdcUcp+tTPnnmnCzH761Qd8e
         PYWg==
X-Forwarded-Encrypted: i=1; AFNElJ9IRWRvrubye1hP3vfp5T1Nxt9VmQLjr3oowEuWN+3sdPbRAFBR00snYgj63CkoiNTt6kSVjzV3bzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy908I9loyMUieD4yefJ3tkmzSl+m/4qqS5h3/FN/edpxbRZ+Zb
	+qrxyeQxs/h93D5v+JTizpu3W0q4JGhyyWdj2o5qHA5Ji4GzAf4SLjCxhxjVehaa7g==
X-Gm-Gg: Acq92OHeh9rg9wmnUazwDH4FO7A1jQPnDLa1ff8voC1L96cKtoa9nl5WwrtykoeE3Cb
	XnXmLGHAaOc0/njogffaTfLfEcTK+XZTA9+ExoUJsHvRWmm7iqBFlWoWwEMbwKOdbDLs/mHYqvT
	8j4cxxroFEvOUgPKF8K/mO6ICf1joRJhzgnDuWk0I2WbQCSIXVB1JRiblQ4Wtd0f7cNIes6SoY9
	Z04fsb4w+OUsKAMcCcyD20KTlRc67bLW4hIc1n9/z4MU/NBAnKgtnwLxH2l3M7gwhR+CA73PoGz
	jznSvB7JK3pf4pX3tzWTVKBas74QdFD1dfRwAD+h3OoU6YHk1r/llp0ZOSRxprBzcBJvRaoYXNk
	iBD1ECW2zZHi5ItlZIZ2TspXkGpqhTY2IbM8vo5Wu3av1kMbaMLI2w7pQQMsZIn7sVCFEwEj1yS
	3YuUQxGFt+AoGVe0dHT56sviPh2/k9ESWwyBzBqErl6eOCQ7mokB/WzuvujhSpDA==
X-Received: by 2002:a17:902:d4c2:b0:2bd:b6f6:3446 with SMTP id d9443c01a7336-2bdb6f634ecmr164651715ad.3.1779242886805;
        Tue, 19 May 2026 19:08:06 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1f47:18e:5352:a11e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5ef1bsm251902675ad.4.2026.05.19.19.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 19:08:06 -0700 (PDT)
Date: Wed, 20 May 2026 11:08:02 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	stable@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [stable 6.6.y] commit e613904fa419 causes suspend regression
Message-ID: <ag0WeuD0iXY9hoJ9@google.com>
References: <agvqqMt9x0df-WXS@google.com>
 <1d13382f-9b0c-47bb-8939-36f0b03c4dca@qtmlabs.xyz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d13382f-9b0c-47bb-8939-36f0b03c4dca@qtmlabs.xyz>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37746-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,chromium.org:dkim]
X-Rspamd-Queue-Id: 3F2C3586B55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Myrrh,

On (26/05/19 19:01), Myrrh Periwinkle wrote:
> (re-sending as text/plain as the previous one got rejected by the mailing
> list)
> 
> Hello,
> 
> On 5/19/26 11:51 AM, Sergey Senozhatsky wrote:
> > Hi,
> > 
> > We've identified 6.6.y stable commit e613904fa419 (usb: typec: ucsi:
> > Update power_supply on power role change) (commit 7616f006db07017 upstream)
> > as a root-cause of suspend failures on some of our laptops.  It seems
> > that ucsi_port_psy_changed() causes:
> > 
> > [  309.858915] PM: last active wakeup source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> > [  309.858917] PM: PM: Last active Wakeup Source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> > 
> > which prevent laptop from entering suspend.  Reverting the commit in
> > question fixes the issue.
> 
> Can you check if this patch series fixes your issue? https://lore.kernel.org/all/20260519-ucsi-fix-2-v1-0-6f1239535187@qtmlabs.xyz/

Sure, thanks a ton for the patches!  I backported them to 6.6.y

---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 2eeace0f2450f..27d92eff84b89 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1224,12 +1224,14 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
 						  work);
 	struct ucsi *ucsi = con->ucsi;
-	enum typec_role role;
+	enum typec_role role, prev_role;
 	u64 command;
 	int ret;
 
 	mutex_lock(&con->lock);
 
+	prev_role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
+
 	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
 
 	ret = ucsi_send_command_common(ucsi, command, &con->status,
@@ -1248,7 +1250,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
 
-	if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
+	if ((con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) && role != prev_role) {
 		typec_set_pwr_role(con->port, role);
 		ucsi_port_psy_changed(con);
 
-- 
2.54.0.631.ge1b05301d1-goog


and

---
 drivers/usb/typec/ucsi/ucsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 27d92eff84b89..a2d2098925a7f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1252,7 +1252,12 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	if ((con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) && role != prev_role) {
 		typec_set_pwr_role(con->port, role);
-		ucsi_port_psy_changed(con);
+
+		/* Some power_supply properties vary depending on the power direction when
+		 * connected
+		 */
+		if (con->status.flags & UCSI_CONSTAT_CONNECTED)
+			ucsi_port_psy_changed(con);
 
 		/* Complete pending power role swap */
 		if (!completion_done(&con->complete))
-- 
2.54.0.631.ge1b05301d1-goog


I started the tests, need prob around a day or so to verify.

