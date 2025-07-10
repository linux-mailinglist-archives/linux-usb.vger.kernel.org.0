Return-Path: <linux-usb+bounces-25663-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25EAFFE36
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 11:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AAAA18983D7
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 09:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC592D3ED1;
	Thu, 10 Jul 2025 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="BuEazNMl"
X-Original-To: linux-usb@vger.kernel.org
Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3F2877F6;
	Thu, 10 Jul 2025 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140049; cv=none; b=qL6N8If7kkmJ17QB2dQjyL5PLwVMIiidOEfj9jQwTwarTiqVp8OkGJAQu0ocaK8ztQa/FID3Co9eQ/FFtuxfbvtjtfO3XEWx3pTxFcZaKqLX4SqEtY264K/bfpmo2op8XonInFU4CYOD9fOyongwwm9ma7YzLTlyy+jM8GLrO1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140049; c=relaxed/simple;
	bh=J+A6BpIoUKLhKn7GVPgQzhh/QsUNodoeaEIikEKBLK0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=iapna4CuldIrTV5WbnbYaOk8v6u3zVjAcRvDb1mYQqqDWej1XkL3IDno0Kr4dTz9NnjuQ3gFcBy9R0nhHOYnmSqU72ebF+zy5ZRWiEARvThoKlzGkMgszWWHTD40PX9eFHCyuGUcA5wBqvHRhXUHmXaps+1QjmCllqTy/anuIFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=BuEazNMl; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1752140024; bh=rsossjrPJSJdyOjpPK7oGoX9JwtZ5P5O5KTAAOmtqY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BuEazNMlADGxOv5C0la9VCmMcUJ2v//R6xu3/FJw+u9xFagiPLm9bx55QaatJziuq
	 QOkMFtoZDHSJRw4wDU1/dEgOPuyGSwiljyOzsn8DuDaICb0Y1Ds58a4Ql4AnZoiESt
	 b3SxuVAJwyqwduVU8VnD4YCSt4s3jqkZXLpdTuMw=
Received: from VM-222-126-tencentos.localdomain ([14.116.239.34])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 86B04868; Thu, 10 Jul 2025 17:33:43 +0800
X-QQ-mid: xmsmtpt1752140023tjn5x7du1
Message-ID: <tencent_78BDDF3423A1D8A7C5E062DEE6F88F25E10A@qq.com>
X-QQ-XMAILINFO: NmRjDopJZVxOqsOuAU/qKZUnItD3QP2sQD/BPzIiEqAlocyBYFqh6kg7kBL21N
	 X1StZdO8zfRn9e009AFbpV2/RzkqTUQ14gDDZDloBkl3VrUmN9bnV0BLt48DhIXzdSZJn7xZsoSY
	 MVNluBaIQX11mec2hy9F28DcRNyc/6KMFW9tDutTNlRwuVbY9RhVd+Cf0gyrfBCODrRKaADdR3+q
	 54DQ0UN+yleT6xlKzjSpbxNhBrQaTdS8pFcZinR3BoPCGptlkIPQpNPejXKoBnu/DbmrLOSKE3B1
	 Y2493ZgsBafyLJfOHWZKWMfpPCBXs2ANcpFJ7pKdeQnItLjfU+SUoWMGHzheI67Za1Am6q+5bwC7
	 Hayag42g1N8hS62OijZUSKxiz4fV1Ii63mAijGk9grjwA2gejJJUsxVzTaFG3n77wriFV1jdmJdW
	 hkvFnall0/A+tGHuhZA63t+y1WyBR1Xow10xilpbZHRE+F4CtKGCcM8yNPCmW3zctoaXzUUG6CcM
	 bV7dAX7dI7YmeRKTlni7lbwGKZfn2oJiI0MczrM8vB3AWd2Qmsud7LV41ZaKZn1e2vlxTklo8fn7
	 UNRamsjMEuoKPJNrW8QG2/5HTUaChRcvjTb8jt7tCW+jidYqffn/xc/evCUlJ2GJDUMfjv97s4Cn
	 Aad1J8CBygoXjQBhBe9QCyJ9ZdkGK1ncHAcdDzV1S8fsUgHzNHTlHGokNwHOVTlgS9UYdxXaFQWD
	 ufpMD79KAKez0Tps4w+4yo6LwCEOI2fCB3cLLkC3448aQ8lOFFdAKOq9KwUuuGKWy70nNAHZcL5T
	 GG2sZP0aL+qGMhyhYXsitaEGvsbK3YJrqtyu9RhDVZT6iY1/hDLIjSnux0SBaQqlsw5mro9HPTtS
	 3tx/fdS0ed/MXvPujeGGIKEmID7VYKOpitWCnmmlYsbgz0K5prk8GwgkVRr/We5PX0JG6iZFff8O
	 n0Xbnmh3h4oJ6V37p/G0QqRAZ2c4qK/JNqZCfTkSjt9196gsgfj4hoRbdgnROZKNevvRhgyrW7+M
	 nKUebrf1sKWHSfCcUJlFIAjPIwFkNgYjIapMsbtw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: jackysliu <1972843537@qq.com>
To: gregkh@linuxfoundation.org
Cc: 1972843537@qq.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v2] usb: gadget: functioni: Fix a oob problem in rndis
Date: Thu, 10 Jul 2025 17:33:37 +0800
X-OQ-MSGID: <20250710093337.260296-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <2025071045-irritable-unsure-4543@gregkh>
References: <2025071045-irritable-unsure-4543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jul 10, 2025 at 11:16:41 +0200, greg k-h wrote

>Odd, this should be "BufLength + 8" as checkpatch says:
>
>CHECK: spaces preferred around that '+' (ctx:VxV)
>#121: FILE: drivers/usb/gadget/function/rndis.c:645:
>+		(BufOffset + BufLength+8 > RNDIS_MAX_TOTAL_SIZE))
Oh I don't know why this issue wasn't reported.I'll mind that in the
future.
Thank you for your patient review.

Siyang Liu


