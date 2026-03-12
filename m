Return-Path: <linux-usb+bounces-34713-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IhWBGEts2ksSwAAu9opvQ
	(envelope-from <linux-usb+bounces-34713-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 22:17:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ECB279DEC
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 22:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABF2230F1BC6
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 21:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1985038B131;
	Thu, 12 Mar 2026 21:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOOEWv6w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C3D3B47EA
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773350096; cv=none; b=G/58RNwXy8M/oDfjtFRoTHqyu812A3h9npkO1gjh8tZ0GywAZ/4/KuwPNJftZ9U9R6eQ5T02vRhKdEBrUwgM/uoylIXpFt5dL/O7DVXPMshS7NIoh72pTDjsYmtPJdyXuLONJYP6fx0lY9nFy8fx5q1Olp1Zw9ZdMIGcXkmwx48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773350096; c=relaxed/simple;
	bh=X3MdWL87ZzxZkXkkruu29q57p5D+vJjyl1/uv2cRCpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+BSMsCg39IGWi1Q6clvH7CIMXgt01eGBiRJ/AeOhshjNI7REgUvA5hA0CUYtnHATM403biLD9j1Ozh9HOWkgazP20tSWeiA9vhtG7/SIR5cKlfsdOdvY3mWW4l62SEexIUhP8kwjzVmGZl0yqOiT7IaA6qoWTnAmocGY4C4VYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOOEWv6w; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cbb6d5f780so136074985a.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773350093; x=1773954893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKhF79fkv9q8iYiNyqivBtEgraUUrd0jdUKOsg5fKR8=;
        b=DOOEWv6wgtOPa3X8woPqxL6tIO6P87dOgn7mUpdD0im7Cyp5i9oL5zAuQQZgk4u1Pu
         m8JB+5N622MMLhn1h5nG+ro5/Vc6SAhALkrdF01NbQ+5UXKXIS9gRLtu9IV5gGmRmpgy
         A9Uu//FhGdq4jh0i80xftEBtLqHGWCxCp0ttXdaYCHzRCLh49O1vIUAkmaQZH/tjd5pE
         SZna2wBvyP8c0rvlxK4hfBc3PF76PrDvVexg6NekeCmhf7b0JZJeWiehVj6/3VnNPN/z
         TBG56JmEm5mohAgXr8bGN49/TB5nszRd+8iuxy6RIxeremT9Raufb5mQzBJ/s0Ukibzg
         LN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773350093; x=1773954893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QKhF79fkv9q8iYiNyqivBtEgraUUrd0jdUKOsg5fKR8=;
        b=X/m2rtgWKim9kZrdI+pmODCEPQ1Hk0KOlHOJmNsYSq+Ph6y3p3zqCyztqZqNui5cDu
         WWSsVzQbM2V/dNF0xvTiUKFP89WWrQNT2JjQH0jXfITJrpxaq0/ItV9jIQs0g5hiQ7tK
         LqmQ+DIaiSjbyDZnK12xlPyiZWsjLnjR/sJWmg/R7+i52zowyvVRUj6KY2Cg116SmIgn
         fimYLu6Me+0EU9uBswy1G/1tCt26QNFp7mQ5R9xeFObG0LOc7NonPSVCVTM9KTzHEbOa
         38pHwNeDkDoHbxKk8vx+YddRzX1ckB+u11xf9UVGFwSkmsjuEHH/hFqNFLlZvvKxF5QC
         3teg==
X-Forwarded-Encrypted: i=1; AJvYcCVMJhRBZRyWp5P3pPBYYTHf4dkXSMD9ZGINFnT9pzdSn66Dc5QxI92tJCZQv19vBoKP5vta9lEYOzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOV/yA1QEGBYqMvd9m/ucJFQ5f0YcGxdR7vMlYGAluuRj+L9nS
	HSRR92mnKYI0q7nw05QE/+nSYFs9fEB7UxrnFJ5pypglYX7Q3DTl5C7F
X-Gm-Gg: ATEYQzwA++n/rbsCEfJOzJCHbsjqI7e8VUgxdILpiRtyEj00SgvfTLHnQMSepx+FVpn
	KsV+DrU52/P7cKWvfIH5YR/Bk8bK/pYhvD4+vhB3GbBwHL/MStYNSIQ7hOAbG0WeW5wyJo7QRW3
	GJDQGCrspWJoDmiKuT1Dr0FFzCpKsQaC7kRR29GTPeGyIFEGX1Q6YjoHl7xSlee8lrB6tOkA2mI
	jr8SS6FvEmuLMp4AGD4/1Vpppb+PDtrw67/kYOGd1CJRJZb46/BlMSDfqGAWnGnaT42eIW1m+D4
	4ugSfYSTfDfocMM0Ir9ZczLafYKHGj/ULLpMCnR2m6sgrEVNfiqWNhKC1IzkOkW6bOjmMeTQQcQ
	deA8ry30gp08LCjjwPBXdhhotuqtKyPP0DG7046O8yTkCtIb4IHtWr8yHe0zNf+epzeGYP/iWOB
	WpQbC/WQ8NapVK8aWX7RqTaI2lkzy8k8EmG+thNb+zkS+eFwBG4jJ4uen8gRvcpB6gRbHWPwRlM
	jmZFU9LW25wZPF2xOjC
X-Received: by 2002:a05:620a:45a5:b0:8cd:7d57:d613 with SMTP id af79cd13be357-8cdb5b8d73emr185570585a.55.1773350093009;
        Thu, 12 Mar 2026 14:14:53 -0700 (PDT)
Received: from localhost.localdomain ([129.170.197.126])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda2151db2sm401089985a.44.2026.03.12.14.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:14:52 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Nathan Rebello <nathan.c.rebello@gmail.com>,
	linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	kyungtae.kim@dartmouth.edu,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: typec: ucsi: validate connector number in ucsi_connector_change()
Date: Thu, 12 Mar 2026 17:14:36 -0400
Message-ID: <20260312211437.433-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <2026031238-richly-tattle-eab8@gregkh>
References: <20260312060815.55-1-nathan.c.rebello@gmail.com> <2026031238-richly-tattle-eab8@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linux.intel.com,dartmouth.edu];
	TAGGED_FROM(0.00)[bounces-34713-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 79ECB279DEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 07:25:54 +0100, Greg KH wrote:
> Shouldn't we "fail" something here?  If this device is sending broken
> data, we don't want the caller to just assume this succeeded, right?
>
> Shouldn't stuff like this be checked in a single call after read_cci()
> is called?  The other calls to ucsi_connector_change() are not operating
> on a "new" descriptor value from what I can tell, but I might have
> missed a code path somewhere.

Agreed. v4 moves the check into ucsi_notify_common(), which is the
single point where CCI is parsed after it arrives from hardware.  If the
connector number is out of range, we log dev_err and never call
ucsi_connector_change() -- the bogus data does not propagate.

ucsi_notify_common() returns void since it is an interrupt notification
path with no caller to propagate an error to, so rejecting the event
with dev_err is the failure mode here.

The other two call sites are not a concern as you noted:
ucsi_register() could be routed through ucsi_notify_common() in a
follow-up if desired, and ucsi_yoga_c630 hardcodes connector 1.

Nathan Rebello

