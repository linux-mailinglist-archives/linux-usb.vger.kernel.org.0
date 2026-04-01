Return-Path: <linux-usb+bounces-35792-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEJrA3ouzWn7aQYAu9opvQ
	(envelope-from <linux-usb+bounces-35792-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 16:40:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F42237C4F2
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 16:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C53FF30DBF64
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 14:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1F446AF1E;
	Wed,  1 Apr 2026 14:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gq1b0CvX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9676466B5B
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 14:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775053573; cv=none; b=F15JUU5pgoMLTZcu1lFHEuWtkdFIu5RBs4bF/+IMJP29Y7C7orTRw9E9Ml5yYpf5ROPEPHclXxRaTz88NZeBYpaMnrKJNns3cmC2d1RgCOnkodRYm+E8reQFzqMu1jxXs5hAZIt6uOHHI6LI9s7QZHWn2bgODrMdsEU/SYpclVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775053573; c=relaxed/simple;
	bh=ITic5mu+GoI587U3EtX2iADmbMq3h3/7vmM+a4EMPN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXKSD9ZVtKOGt7k+GEEIdGWlcpb7tN460BCU39HIrzbPOljQkQXQL4l4uCkptA8kqBMHqZ1Q4I9Y4DHikTndDPveYwb8m6pvFErW/10lkQQ1OgeZ+QEgNR1JAOqCgAcWFGk6cPFANbNTTwq0YVGsW5syv0+X+f+KopFf4XtZqXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gq1b0CvX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b2494440f3so15210615ad.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775053572; x=1775658372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hhqa35fXh8wwIiHwhMfdisdO3+HC9veB1HGkN/+YkLk=;
        b=Gq1b0CvX1FNgNe2zzBYi2nyovSFIefFvGt835nvuW2fLychXXUqSLBQVraNtBWVHdY
         vQ5nol8ihqqIT4evoEW9SzUL4dgGj5YTcfzSsGPpQ0LOcNm5mLl1K1VufEgrwWbfoHFW
         8uB10/E0q8Uw/vBeLd+M6Oz2DvIWRtf82bUjw/9e9mekudvII4TkkuC5HBvBwlXYSwcI
         un9xVAGIGWatkM2L7NhOzv7usBGgMxG0DXbrfx/YPecuVV3EVmONnt1bYe0fx0UIikmw
         12NZqockCXojfNWmJOt6WNqEHXZiwl5SujFe9jd5/A0wbj0QrKP0JhFq7nXAp+w1fqHJ
         dyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775053572; x=1775658372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hhqa35fXh8wwIiHwhMfdisdO3+HC9veB1HGkN/+YkLk=;
        b=gDLdK2+s+L85CpTEL/6IvQij31kv/kI3lAvp3qOI1k5Ae8sMn6IK3M+dqZa+hNNvWA
         gys+CTZGhuCKYYPRprqRGEBpFm+kSREm8SST0sF5MyPHjUaEx6Htlzdj9T/Rb7IHWrj7
         +wZddsw8lQIT6ie1gTm9yoWnGNgYicphATrhaqxo0Fjeo/82FE7E96/CV6HpjLO0uBsl
         7Eel+PpsEKAT5lMDV87pOspok9KKvO4PBD8VudMVEbHdDDNTlY9QpQGx0EL37+cpTJSM
         WZyl6seSXcsIjGOiLFcds3HzIe+R3DNHbxqR85H4ob6oteOfgR4OKt0+iaYPqzMdzEGE
         9q5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn0LAE/cBGkTLak33U0uIVAVCbbVd+XhrG8f/X1fJNFH8rN9lzCNs9zxC6uDX2SHZpZ4s3BEAXypw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdJp0h7w8Z1ZQwMvjXnv0N9KhDmG2r3ZNWJ+9O5XSuROYHzp3z
	cvQLvpcXS6gkrvITD9ZJd1s5qGEwvAGWycVOO52dqAYgpU8olgcHzX4jkYvar0BQHz0=
X-Gm-Gg: ATEYQzzz5JksUB439kMvWO0CV5Q6Nr+zk2Ztr0Dt2WTZ1b4vlEYJso8VI02I0e+U3lD
	VDhO0Ed5zhZuUBNgCVox39viPcwGBxSnRIkF/B/eGiHTXYOcyXO37Fueio7n3a/5cV3UrN/GlbE
	/9v8Blf1yUGt2XBpy3G6BhhoawwFCaX02IDhAZ2H4+Z63gItCMTuwdqyBpVDeorBrmRqUBvM01l
	tZ4LhjE3bnyqmJp802E3+ZFrEDlxj6uDD9Gj/sl3cmOTgL//t7iEOcMJOWruKkx8aTFxofvyw3l
	D9LxhaxyrdwEFvrGnGIA5IC84hHhas94zzjBH3a9p3e0GPBgwA5fauGI0RQXC2AFkrlX9C33PBy
	QZP1xYttir8/cBkuR5892gxJcf8w6kaxWxWvGCjyB086GKb/ntZlHnakGX1Q9uquyKJB3TYd4iN
	YGtZ0U
X-Received: by 2002:a17:903:2c47:b0:2b0:6945:7dab with SMTP id d9443c01a7336-2b269cb8312mr37894575ad.46.1775053571808;
        Wed, 01 Apr 2026 07:26:11 -0700 (PDT)
Received: from hkbin-u25 ([2406:280:1003:25b6::6da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242680132sm158467045ad.32.2026.04.01.07.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:26:11 -0700 (PDT)
From: hkbinbin <hkbinbinbin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hkbinbinbin@gmail.com,
	i@zenithal.me,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	shuah@kernel.org,
	stable@vger.kernel.org,
	valentina.manea.m@gmail.com
Subject: Re: [PATCH] usbip: vhci: validate ret_submit number_of_packets
Date: Wed,  1 Apr 2026 14:26:06 +0000
Message-ID: <20260401142606.1861126-1-hkbinbinbin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2026040100-brewing-ethics-990c@gregkh>
References: <2026040100-brewing-ethics-990c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35792-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,zenithal.me,vger.kernel.org,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hkbinbinbin@gmail.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F42237C4F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your time and for pointing these out. 
I sincerely apologize for the oversight.

I cloned the repository a few days ago and discovered the bugs, 
but I must admit that I used AI tools to figure out how to patch, 
and generate the patch and description. 

I was not aware of the earlier submission
https://lore.kernel.org/r/20260329125437.517980-2-sebasjosue84@gmail.com.
Since this issue has been correctly fixed by the other author,
please ignore my submission.
I have realized my mistake, and i will correct it.
I sincerely apologize again. Really sorry for the trouble.

thanks,

ZhiTao Ou

