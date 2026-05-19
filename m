Return-Path: <linux-usb+bounces-37727-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLjnM0mrDGrukgUAu9opvQ
	(envelope-from <linux-usb+bounces-37727-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:26:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BCA583A12
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 239FF3044239
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C8C367F22;
	Tue, 19 May 2026 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7KxWJhY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4C9367B92
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214678; cv=none; b=bhkdh+zQ8w0CTF19tSBZiUySgnARpqhPofUg7VqJj6cSFFjIZJPFfY5ResPDRAfI0MhP9fw27T5cvWo+kH4Vr0HnnDL155n/b7q+GSGNBfQs1pGC0o1G5L+fwsljWhw/s7b8+qaKSLukpUjeZLWLiPTYzf1/lAMzjKGBkgXbNtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214678; c=relaxed/simple;
	bh=Kz3uJJtUTEetC1ZMrXtrEI7xdsXbSfvP3XEAN/lSbik=;
	h=Message-ID:Date:From:To:Subject; b=brrYn1H8F4NUs+DBVq+qYU+GIgPZo6QQd2TFGXG6iOWl+L+Zkicbx7r0HNgmuBxzXJ6OdcyYJE4UDJ7ZYM9rO8ZdwLRjApJCa1TLZ4V3DuCnfeJfYVtrwmv52vMxKYKp4FFW/E0xGxqh6iaSQZhFqhq40PCMv9OEt2NWn6oZoBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7KxWJhY; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50d876329bbso39530021cf.2
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779214675; x=1779819475; darn=vger.kernel.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FQZMXk0QGzC5x1lUQza+wKZbRqB4DE7l/FajgbpmYI=;
        b=m7KxWJhYGBj+R9WaaIpBC7fNcUGfSEHy+BU6MthdUGREbUJhEZLFqjZ0qa0ECaZoSs
         lGzsLlXUXZ55UeCt/q8cpYpkhCVDqA+vCjY9nDXOFHY5aX2cYRDjmT5KAbahdwggN42R
         uJy6yu/zuMyI3bdsP7wbNMIv5uQUkYFzjsQOzxGDTtVuFNphRCDu4A6m1j36P5W9YIty
         l03CnywQGOILxeXFV844QR6rwmTVzu1GzlBLTllezmDKQKPXcOMTZHPbz0i2hjGRrQgd
         6cg2ezgHewrvh06L4wibmPG6DZhnv+3IUF11B7bJN8aeMEKPrJPguclFfyxAxaP0HRtd
         kIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214675; x=1779819475;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2FQZMXk0QGzC5x1lUQza+wKZbRqB4DE7l/FajgbpmYI=;
        b=CUat7DD+/JEM8FOQ8AX0VzJrgMN8loGH972xxFr8WjU/db5SZFhtlK7BubfAbTWLJG
         PMa1RSaWCWYLT3zafrpHnwyV/+tQg3Q1Y3Y6jD5NIcfZNQKzuyQS5KsyHEj/v7X4fpbE
         IbaUmMWCeLqz48rc4SHfuEjTO6GUJzmpdffTQ441VIQmF/ZOE/iTFZxcKpha0xSm8T1/
         nM8yUjdBvtjB6rFdF7vzkK1ESSQhrc4k+P5MG74YAs7cAQ7WOUzURsf9LXi+VBcji8cv
         G3YGit2o6nXhNcrqFB7zgSvv3JbfF3TVHziovfnCurP63BKtgbhPZv4f2/DwcuEkAo5y
         touw==
X-Gm-Message-State: AOJu0YwK9Kv9FmP9TZQxhicP938qFRDZneuYz6WA04OGpb+8lwGbuDhP
	KbOJK/vsnyY8n+kh4hXIa5prccf3z2a/sFjI0DFVNLT06F9yThUGM1dyJDSgthyh
X-Gm-Gg: Acq92OFFgAs9grRq8irenTL/tpAh3kE80SQPqNKTJOCdVloYwsepkHQ1+38Tm6BZlrb
	HInYvfNcqp68E9dBX/k2xyqpSdxk1KDhkcgTluHDycV568RkpyP6kBu93I06n+RKFi8nMq/UBmY
	4v8mvXrB1NrWTbC2J7Q6VdMC78YIBc6UUAyAkZ5BqQMB7he1rnSbAY/tq3V5+sRUdQOpdceDUuW
	lplcoc0pv+3ysm+1StlV/dqnIt/6kVj5cLQpqzIMh1bZtHpesqWs+WCp11TQriBAneHwyBSDlFm
	JWbvsn+Kjrny6f4ZN61Ls5ZTO9yRcfqmBMcqyvgZjsqsk8h4KAI46Slw4E4JiMqdU+lUJobqmU5
	6voh9QSr7drL3Y65yb5neTCrGLLKgI96q9x6tqtGOSUM3BpJ+vn9tiKzSW1aG2cz6dQXGlYZzjP
	w4fBJs4iXCbe0nlHkoc7jt7h5zo7O+7cX2XcUJrhumoXEgSdzPtguKTgICvACtJOm+rvk+kPZBk
	xQl9wapGhHhCl+B1NXKQiNfz29CVCM=
X-Received: by 2002:a05:622a:1ccb:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5165a0b5e80mr301237621cf.18.1779214675444;
        Tue, 19 May 2026 11:17:55 -0700 (PDT)
Received: from localhost (ec2-32-196-226-111.compute-1.amazonaws.com. [32.196.226.111])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-5164585affesm170126581cf.28.2026.05.19.11.17.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 11:17:55 -0700 (PDT)
Message-ID: <6a0ca953.212a1814.2ffb00.e2f4@mx.google.com>
Date: Tue, 19 May 2026 11:17:55 -0700 (PDT)
From: trishtaylor4521@gmail.com
X-Google-Original-From: PayPal
To: linux-usb@vger.kernel.org
Subject: Auto Receipt Generated | $646.74 | Ref: TXN-UWJZ-1MWD-28DP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [4.34 / 15.00];
	R_BAD_CTE_7BIT(3.50)[unknown];
	BROKEN_CONTENT_TYPE(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37727-lists,linux-usb=lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	GREYLIST(0.00)[pass,body];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trishtaylor4521@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mx.google.com:mid]
X-Rspamd-Queue-Id: 72BCA583A12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dear linux-usb,

We hope you're doing well.

Attached to this message, you’ll find the documents you recently requested. If anything is unclear or you need help understanding the content, please don’t hesitate to reach out to us at 810-884-5211.

In addition, we’re happy to share some good news:

You’ve reached your 1-year membership anniversary with us — thank you for being a valued part of our community. We’re also celebrating 20 years as a company, and as a gesture of appreciation, we’ve applied a special renewal offer to your account.

Renewal Details:
- Service: Identity Theft Protection
- Account: linux-usb (ID: UID294495)
- Term: 1 Year
- Renewal Rate: 646.74 USD

Your membership has been automatically renewed to ensure uninterrupted service and protection.

If you have any questions about the documents or the renewal, we're here to help. You can contact us at 810-884-5211 during regular business hours.

Thank you again for choosing PayPal. We appreciate your trust and support.

Warm regards,  
The PayPal Team  
3553 Londonderry Ln Roanoke Va 24018 USA

