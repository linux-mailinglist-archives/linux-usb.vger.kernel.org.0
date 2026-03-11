Return-Path: <linux-usb+bounces-34616-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP4+H4jjsWksGwAAu9opvQ
	(envelope-from <linux-usb+bounces-34616-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 22:50:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A02A226A90B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 22:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0965F301B66E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 21:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A41A33261E;
	Wed, 11 Mar 2026 21:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWxQqZ9x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E829B200
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265791; cv=none; b=laoVPm13W0GeSQE73nuZB602sjUi11zuoeu2meVu/3FEvE51mq7j9pGuY3AxQpWAOyy+bkykzK0pn3lPJEkEWHrtpMTGkMZ6BbOUqQSLPxN2Yubk7f6fViXsGcDvTJT7ieUcVTTIFhSEZLLs6WEOGqo22EU/LfWVFs1ABg+m5Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265791; c=relaxed/simple;
	bh=291oU36VktgDA4lcdjWsesdhLAVd3HI+Ywtw5dEDGFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAUjqvMNT+rSCLP+hx8cPd6nHRRyNKh+Sn6SoueyDaonMotR9ZZSZK8dtWIbIUSJ5WYksUuq3Dm+BJUQ8itdcrO9GTH8G3+bnr/FsoiLMRBr8ys8OJ/PfPWsRQLalcvZ2OB1uKRBYaPiCO+vzebJnlT1Wg3tX89f7mGa0SKOanI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWxQqZ9x; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd73c4a827so28095285a.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 14:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773265789; x=1773870589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe0o17KWryN2uQb+v83tzDMkUNJMgvdghMeQjdARKa8=;
        b=hWxQqZ9xXBeFJ2q2OT4znLPwMy1MuYgxZh9vs/hXYAlOLbI2KaUVLIcOVpKs3HUouv
         RooXPdvruXQRY2nTcVA2J9ykLd5QUR0p9mhgeWaPz1m5GroJdkviLGuRUXQYAG5bgpWs
         lrIm8bzATeFYM0D9U5H05fonSy2RE8YVLHxKlP0nJ7Y5U85thjntsJ/OF15IKxNDLriL
         unITmScK62+NA+LNf8rFTPQtdqghpfyYrrPhDQpB4p3IP/oOWKs1CzgkwWd7jp/55jC5
         g9ruiBDJNRcbm09Rq6taPOebVyPoG+vQoice+LmW5iv5GXaqTpRnA0Tj+W8hakLfiUiF
         lhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773265789; x=1773870589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qe0o17KWryN2uQb+v83tzDMkUNJMgvdghMeQjdARKa8=;
        b=etjZvuXr+UJ9RWf6o8gB/JN9LTCYjPiuqYcmP4cRPSJbelCDp/E6ymHp1d4iz0EbjT
         rkmPdv7nRA/mf2mODexWK25SpYyyX1AyJHMAYUSlfFaoiG1JefpKPLVBRjbOAWhH4a9v
         CsztK+0ci+Qh0Fg06GRv9bo8grfz9Eu4QsmNzmUVOAKE2RWf8BXvo7fgJsKbjZjCJ09l
         iABP9HOYpE9teTZyS7eD6u5Ry3KzPYJX2KlrwwNScp6YWsOfcdSWWVxghDbKlAKwf97Q
         cfnYRLt0igH/fTVYMFSu0yqxHV9Oih4gmscC5P2i8+azmFpKuVWy1L+YWykttdoseSlY
         IUfw==
X-Gm-Message-State: AOJu0YxoQcR2VPNxtzBm/+fF0AUGfFu0eaaJ6uyvqkO355uvAWj+hD4I
	Pc8FroYuFOUE+xJLlID36z9ZVocp3ZsrKkUm+6hBM6zgQxopdUZGGskZdXueq3Y+
X-Gm-Gg: ATEYQzxz4uwxeMqf6kqNv3IZodIZejegpNjXS5+xw6wkmHa1m0z+BWlQsH9nuHF6pYh
	nc8l+eujU1BNm9LI5FApniqQDIIm8v2ZwOqV56c8lxbUD+jngieM36p0E3sUS5KF77YaNkWOZXl
	XqXBgt23t9CqPqwpweOlMHjpE1smO22Dpo6LFunHKZozubPGRkJE6pb0qD8hmjcNWiUBpJN5X3h
	m6of48wf1fxn2z4iRKrSurpT+ZTwD7XSkygNU93C1o532tBWM4BLK16kpqytU12pylaH/Au2X8B
	YGNOyHQvXZ2LgsUN3TRVlItwj7pspTs2GrBW3G19eCAS4InpYEFgPoFy78xVGZOo82it0U/Ci8z
	/VGZyy6gj6rLBkv5mZOdWuEhqsVMbWRhy0toqTxslb0fti7J/fIicrLNw4NzsIK5ZgrhT6rn/p1
	6A3k+wT324DrtN8modbL8rZzNJFdOBHD9fea/Z3XIZMaAP4RpjQoMDx+92MTsOyDDOcSOCbhUIX
	4UUwrOsjkuMuW9hVtM3
X-Received: by 2002:a05:620a:288c:b0:8cd:8ea2:2db3 with SMTP id af79cd13be357-8cda1abaf14mr556177985a.62.1773265789381;
        Wed, 11 Mar 2026 14:49:49 -0700 (PDT)
Received: from localhost.localdomain ([129.170.197.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21346a0sm208191285a.34.2026.03.11.14.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:49:48 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	kyungtae.kim@dartmouth.edu,
	nathan.c.rebello@gmail.com
Subject: Re: [PATCH 1/2] usb: typec: ucsi: validate connector number in ucsi_connector_change()
Date: Wed, 11 Mar 2026 17:49:36 -0400
Message-ID: <20260311214936.1045-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <2026031109-scrunch-aviator-0e2b@gregkh>
References: <20260219164925.3249-2-nathan.c.rebello@gmail.com> <2026031109-scrunch-aviator-0e2b@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34616-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,dartmouth.edu,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A02A226A90B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 at 14:10:28 +0100, Greg KH wrote:
> Shouldn't this return an error and have the caller stop what it was
> attempted to do?  When this is called in ucsi_init(), the
> num_connectors is already parsed, so how can this be wrong?  Shouldn't
> these values all be verified in one single place and then if any of the
> descriptors are "incorrect", the device rejected at that point in time
> and not require "deep" changes in the logic here to try to find these
> types of errors?
>
> in short, let's validate the device once, and after that is done, we can
> "trust" that it is correct and not need to check this stuff all over the
> place.

The CCI connector number can't be validated at init because it's not a
static descriptor -- it arrives fresh with each runtime interrupt from
the CCI register. The device can correctly report num_connectors=2 at
init time, then later send an interrupt with connector_number=50 in the
CCI. This is the same class of issue already handled at line 1840 in
ucsi_init(), where buggy firmware sets a reserved bit in num_connectors
and a defensive check was added because it "happens in buggy FW."

Without a bounds check, an out-of-range connector number indexes past
the connector array into adjacent heap memory, and the resulting pointer
is passed to schedule_work() -- dereferencing whatever function pointer
happens to sit at that offset. A single buggy interrupt could crash the
kernel.

The closest single validation point is ucsi_notify_common(), the sole
entry point where the CCI is parsed before calling
ucsi_connector_change(). A one-line bounds check there would cover all
backends and all call sites.

Happy to send a v2 with that approach if acceptable.

Nathan Rebello

