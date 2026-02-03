Return-Path: <linux-usb+bounces-33039-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEiWM3LJgWl1JwMAu9opvQ
	(envelope-from <linux-usb+bounces-33039-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 11:09:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DDD7572
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 11:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F4A93029603
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 10:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8D439C63A;
	Tue,  3 Feb 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdX1N6rO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE28F392C2D
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113386; cv=none; b=Op5mWIWECvNMaThGBxSk8qEWm1gRPHi5lbNxj+c4gv90D0ZNEZ6uIOplWjexsYK3iq7Ih+v3uyM8TZh9ktqcbDcvrVtTEJ3DQP0X00VFSsaLD6HKjIct9UlgPbyiUTJk+kEeyc5JRymPdPPNnfSHCf/DmHmLxMZaHXtZEj+sgkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113386; c=relaxed/simple;
	bh=Avkd5uawzD+P96BD8QVvLdDr1iaqtLTQy1JmyFPxlmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZh6EU38nsLCpHH3//oglvDDuETJx+Upog/qaFf6O/v/udCzfOlDMdg+B4ukVAaPM3p8gvt3QzhGATvea7muc4iaL5FO76fXd1EkhXGMC7cKCCuFdZGNEGASoNy8j7rPqZEV5uxLo6gxJ8wNcmwhy4oHveXnPxehyqVLlV426+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdX1N6rO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a09d981507so4938625ad.1
        for <linux-usb@vger.kernel.org>; Tue, 03 Feb 2026 02:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770113384; x=1770718184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttX84+X9hteT0QV4zhWLgsisrXh5PIQqyosrzt2r48I=;
        b=PdX1N6rOo0B8hmsKeoA49+GrPkL/MZTUODgbTLK8imXPgROwMxu8sRpR58J/NcLjAB
         MOZPYNUKsVDdkV5rReP9MqSQhVXqN1rpfNjzE/BiRAtqg/jCph3kacHba+NRC9toBxWL
         x+eJxRwOBuJaT1YnlEW5p3+woLBlxvVlv7ZmW45jvD92RG32CpxDJf/r/H5vnPtxx+1Z
         sFxhWPvkmeneIsJ9Ub92Nkpl2xQWfSOfjLaE2uS4aU6lTmCek2LIUas1lvEhQJht3YeU
         LrsRzH73X5YkQPiqvSawMlXm5w1jq/bHXMEraJNl+2Xl4ZSSr/1QZNU5/SOLxhMzEZSM
         kcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113384; x=1770718184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttX84+X9hteT0QV4zhWLgsisrXh5PIQqyosrzt2r48I=;
        b=hMdUywl+DKTNCRF3BtsMiNqs3oLbE+uLrdWZ7vQ1vm9+NwJBZ9KsUCRrcpG4Yqx607
         BYZ8vNBJMrxkYH3OMoUTsYxoY8iMfCYX1WM75uxZq/PNfbi3kAR+2RESMWXLgQcBX0oz
         UtlTzKJPmuNn5AEBmUQhe0ktMV0ibJTqsU7II3GpbOZdrNzf/QrfqUcuqpG8KKTP2R2D
         7+OnkoNXq+mtQOJB4F6S3x25lxIiVhgEMS1pg5CPkcWFLPN0f3kPVIMr3F2ZKgdiBZJF
         v42Co3u+Tjl953AxcE+rnszI/sXbMtzCIXjUoo03/4xxVCbuNn+/8XuzQKiXumBQxlZn
         wTSA==
X-Forwarded-Encrypted: i=1; AJvYcCVse+79zUrkrjRMJU+uNt/NxDVbJfJSvgy1MHFoJibXZqFWEbwEo15O+dC6g0r/fNU4tF32TIsIHmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUp/MW6Bq9+zqeR1x3miwSTdynqFdkU/Mnqg7UK+Nku14R2C3A
	2AdihJFGRN7RvEdf10msdWuhG07U8+4Q4LrionnbvdqXC/WICqYJ4JQQ
X-Gm-Gg: AZuq6aL7jQy/x3zv1SoTgWDhnGy0Wv/y8WF2evkOK/JNDCMEbfG/csszvz9sCEGjIOD
	WNL4nQEtBlRvCzEFyJ4VomdRXJ6Q8Pih3H5u8aXMc1MlhjJDOjPFbYphoATT7BGqexDaDuvpNky
	ve4y8+1tNYYoUdaN+ArOWngL8zX6LHCyXHVM/vMR33Kp18Pa63sdwOH2zc8SaqoRJg0BxpLq+g4
	i65EvNV4fdIswJJgcsjcjHbAhlYTQNcB+B8N5wGILCAdXn7E3KrRAc0CkPqK9OYZkaLxBCdsMhj
	3ceAuKZNj0eEIpqbpW3q2xj8OCeoCF04A3BMGyTHp60ratj4z14RVc4qonxp3TL3SkiM7kf4iPn
	1aIHTicooEoAiUjl/zmAizhKRFYgvQgAl3iQS/qRdJynMaIe3cDc80m7P44iL0Po7hfOz4hMNOA
	weUqW3v0vvxOjR6sApib4MynXXHQ==
X-Received: by 2002:a17:902:e851:b0:298:639b:a64f with SMTP id d9443c01a7336-2a924595003mr27390035ad.6.1770113384045;
        Tue, 03 Feb 2026 02:09:44 -0800 (PST)
Received: from chandna.localdomain ([106.222.233.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4173a2sm176663725ad.30.2026.02.03.02.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:09:43 -0800 (PST)
Date: Tue, 3 Feb 2026 15:39:20 +0530
From: Sahil Chandna <chandna.sahil@gmail.com>
To: syzbot <syzbot+13f8286fa2de04a7cd48@syzkaller.appspotmail.com>
Cc: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [input?] [usb?] WARNING in asus_remove
Message-ID: <aYHJUJzHlkBD_Nza@chandna.localdomain>
References: <697baa8f.a70a0220.9914.001f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <697baa8f.a70a0220.9914.001f.GAE@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33039-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chandna.localdomain:mid];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chandnasahil@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,13f8286fa2de04a7cd48];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 4C9DDD7572
X-Rspamd-Action: no action

#syz test
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -147,6 +147,7 @@ struct asus_drvdata {
  	unsigned long battery_next_query;
  	struct work_struct fn_lock_sync_work;
  	bool fn_lock;
+	struct mutex lock;
  };
  
  static int asus_report_battery(struct asus_drvdata *, u8 *, int);
@@ -960,8 +961,10 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
  	}
  
  	if (drvdata->quirks & QUIRK_HID_FN_LOCK) {
-		drvdata->fn_lock = true;
+		mutex_lock(&drvdata->lock);
  		INIT_WORK(&drvdata->fn_lock_sync_work, asus_sync_fn_lock);
+		drvdata->fn_lock = true;
+		mutex_unlock(&drvdata->lock);
  		asus_kbd_set_fn_lock(hdev, true);
  	}
  
@@ -1258,6 +1261,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
  		hdev->quirks |= HID_QUIRK_NO_INIT_REPORTS;
  
  	drvdata->hdev = hdev;
+	mutex_init(&drvdata->lock);
  
  	if (drvdata->quirks & (QUIRK_T100CHI | QUIRK_T90CHI)) {
  		ret = asus_battery_probe(hdev);
@@ -1343,8 +1347,10 @@ static void asus_remove(struct hid_device *hdev)
  		cancel_work_sync(&drvdata->kbd_backlight->work);
  	}
  
-	if (drvdata->quirks & QUIRK_HID_FN_LOCK)
+	mutex_lock(&drvdata->lock);
+	if ((drvdata->quirks & QUIRK_HID_FN_LOCK) && drvdata->fn_lock)
  		cancel_work_sync(&drvdata->fn_lock_sync_work);
+	mutex_unlock(&drvdata->lock);
  
  	hid_hw_stop(hdev);
  }
-- 

