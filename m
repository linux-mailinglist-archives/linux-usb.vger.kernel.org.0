Return-Path: <linux-usb+bounces-33493-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCItM28AmGmV/AIAu9opvQ
	(envelope-from <linux-usb+bounces-33493-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:34:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 79737164FAB
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E7123008C01
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 06:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29DE2C0F84;
	Fri, 20 Feb 2026 06:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUBeki/W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227BB284662
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 06:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771569260; cv=none; b=gMpfOJgizL0DgMBgVb9oiINQAhkiF76CrqRdTc/ZN3TKWBtjhEZhO3glGoaMXAbj5NzoPGYiMABpjwJ9gDejtM7FgsQxhbXM5LI9QctTrZaKjzlDAkR/2CwJNrcMfjTFUnhcxNKU8Xnn/OY2ye/250D+MyHTzLpQk0/Qcevx0vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771569260; c=relaxed/simple;
	bh=/CGnULoLTVolF4ea9xG5EQ2U7EIlL1Vd8pZ6C7NybLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tALw8wZJ8uoKr2q5w/z8g8Q1ia0ryN10eLOkbKxSlROz5iysChzLvjlEtnAk8+YX3uamabSPujHcVF0NTiOlopRUOGCdyjn4rROYM6RKrt9kGe8KriI42l7bobf6HRyrxPlK/AkykwogwevuOh9FqXqM91OkJ+AE7CaVZkTXP24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUBeki/W; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb5c9ba82bso270663785a.2
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 22:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771569258; x=1772174058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CGnULoLTVolF4ea9xG5EQ2U7EIlL1Vd8pZ6C7NybLc=;
        b=TUBeki/WjnsDsHyooYTfe1b5ti+31ynbP0lXQVze2KQnI/7HjlatkIlb72J99YJ9xr
         Q8iPcVyOeuNm79r/js4XqTiJ24yieOu2cijuNKpYtbFWM0Tqtbv7GodLPdRLXl9dWC2o
         x4KBqR3fmbTcsb2O8jAR0p6QnhXO1ZpUWrw46KVE+X1faJJ2XAkFvFMv+8th1c4sAJUI
         7O8VZGHcXdGIRJbHjAiR0eWw05ZgqokjAfM030xTUaAct3SqCxBeCUA+o4EF1ArT+Kex
         piCooBHVdzXdO+8QFd5lqrpWXa2uxhV4QBLLh6LAOUKwRo3addT/AqpLhBc2RkqpCaQk
         SZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771569258; x=1772174058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CGnULoLTVolF4ea9xG5EQ2U7EIlL1Vd8pZ6C7NybLc=;
        b=b4SW7ZrBpDikE5L6ngf1ve4jOyMDfe/DxPBh2mN0QPKGrqHF6vMCtktDXjQR7sPspp
         8EbStBFVPkA4XkFv0cUqNUwPrp/Bdc1nVI0c6sc+7MjdMG0Zl0Sh+ijcYEjB44erAvWB
         gAWiziBcFiRbzOmawrbX4gZyMWWywUvYXBcizD5wtKtsib00wgnAfyPHtGRxU3OKeinO
         3aQS28tDNBxq7494kvwdHQRk1Zi5/GbMSaUIgYGJK6IwMBHbfnTPOAGfRDSsRn5jhkAC
         amn4s+tEw0OUOuFZkf7K6GpfSIo0glV+2FQfOjUGWUf9mAH9GdBIDPrLa9Z+X3uA5F30
         uACg==
X-Gm-Message-State: AOJu0Ywu+4rfotZDUeCbaLfJMqNgHWhi2Ta0mTY77d4UeUyE7rmr08Bl
	LRjL1THqQHK4LHGSUA6iy+yUiylW0Jvgiim+JjwI56FTF1PzW9Y3pdPtniob1A==
X-Gm-Gg: AZuq6aJ37JUgV5Cnjk0PgN97jBF62KhBHiTfTyGI412LjcGqT426HV8YQxfjuVib3Qb
	9eGWlP6qrpT/knpT+BElhTga8aMdv0eihJkwJ4u3imeKvW+sw8DIjoxIzWqJhvEWGmwba+Em9gf
	abJBPQK7lC1nN5eTkSs1H0phgVQDmC52MrDyNrk50Zt0/t1xHj6ueQFdxEAkvk6LBUgd6P/0Q0B
	5uPIKpx/7EuBNCwlQq4U1wPcGp96pHCMBn5YuMInnalt61JxOH998lJLob2eu2yeIUmt3hKPnYd
	ii1woW4pGdcVdcaf+8JaBYxD6Tn+bl8k14c/TULHDTYNFvDcq9X5BEGy+suIuTBNcUnDjv1pQJ2
	IM/G5LKQoD+49mcI+tIUNYOat5mYK5OAfghi3Y1Az1Fqkbsp0rbEtrEMocJ4pp+mXRwDiE9c5py
	lC4oKrvW2mkf/r68a7hVjYF+XiRNfo1ZRzC9ToPi2YkVLYjQe8HfDCwkHryH0LcDc0Np/SITvi8
	AU8Sc46TfufM6BXnLU=
X-Received: by 2002:a05:620a:2985:b0:8c8:8126:7770 with SMTP id af79cd13be357-8cb4c025c26mr2650115985a.67.1771569257796;
        Thu, 19 Feb 2026 22:34:17 -0800 (PST)
Received: from localhost.localdomain ([129.170.197.81])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb48171ca9sm1716683685a.24.2026.02.19.22.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 22:34:16 -0800 (PST)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: validate connector number in ucsi_connector_change()
Date: Fri, 20 Feb 2026 01:34:04 -0500
Message-ID: <20260220063405.3623-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260219164925.3249-2-nathan.c.rebello@gmail.com>
References: <20260219164925.3249-2-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-33493-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 79737164FAB
X-Rspamd-Action: no action

After. ucsi_connector_change() is only called via ucsi_notify_common(),
which processes CCI interrupts from a bound device. The connector number
comes from the CCI register (UCSI_CCI_CONNECTOR), a 7-bit field that
can return 1-127, while the connector array is allocated based on
num_connectors (typically 2-4). The same register is already validated
for other fields in ucsi_init() (line 1840: "This is out of spec but
happens in buggy FW").

Nathan

