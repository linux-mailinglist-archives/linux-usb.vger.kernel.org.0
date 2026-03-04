Return-Path: <linux-usb+bounces-33993-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMP7LFphqGmduAAAu9opvQ
	(envelope-from <linux-usb+bounces-33993-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:44:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69C204846
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 17:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 724CE3047BE6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 16:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2714B3491D0;
	Wed,  4 Mar 2026 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iE4C/YVr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC634B40E
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772642420; cv=none; b=hdWM437APo9ejbiA8mE5uoIdtP+iDMtGtM1ewZeWlsDtGDl27SwyTPZWJQqYRVBTH/YfgLokZ+HkIEw3yNEOoGeqopNx8T1riYtRoOwOVniRCGAI+hZXtdZM/ZoHTUbmZgPF3YDgFY2t7/M2+ZdadRwKdHORIGMYsfmIA/a4Z08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772642420; c=relaxed/simple;
	bh=FsT+3FFScmB8SlYxcMmKlpTKNdaoaGpGpeXp+dHupc4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYITw9OS6HMR1TX739JTphjabJhPXYQMIeceY/SXy12XB35LWURlV6xXDUwBTdLWbqUtVN8F6F2T48jcw4/Dum7bdOYyhOB5L+B0kAuz/C6vik9OoSL7C5NijS2xGfHy6VvrvLeowDFW2N/j5y9d6994rgyJ7qBiKjNocQHcl2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iE4C/YVr; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b935a74b7c2so958988966b.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 08:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772642418; x=1773247218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFp7+8u1mcsIBQLp5yuMxG9gRreMy+i2vT2Slu4M/9A=;
        b=iE4C/YVrchy5UDBMEwPZVqCPqozqdkwBBB+WnU3BaU7C5nKOEsVdmOzHTWOdimG2X8
         1zCwxKvfAb37pozJTy4khDHHPu/lOMSbC7Bs7FrEyrVVkyo7Kf1iqWjVmd/cV8/zYEli
         cwmzpD1UtGzj7+vnYHxU7UNWn+Mg5UTkfV2l8yPBLW8S3bP7ho4j8I1RDbikpadtHVxQ
         23i8qCbZH0iVoCvVAuLKYMXES2G20ObLS177Z5/PKmLdEPVZvY8zF7Snw1Yf68w++J7O
         0OK8TWXGLPWy6X3pTncq1CbPEf7BzFdZ8GQhzgMupujvGs90B1D+VDPLWDEvIxVrA9Go
         I6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642418; x=1773247218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vFp7+8u1mcsIBQLp5yuMxG9gRreMy+i2vT2Slu4M/9A=;
        b=qv8zbIJsIHjn2Xb40m9Oas6qk4qenHRPE6rUGiSsP71BTVz3QHEdG0dzS0Xd57uAME
         ASyI5o0K/RwhvmGOY8Rs+TSTRpkkdqE2Gf+XeCiS6VaRWUKvEa6KmjC4+PZEp2PQFxLt
         p39nIIxKE3yI0IPJ2GcE4jAfWCTPYdBd77vS5P5OV/5XX3EzpF/6WstXWyhVL66lLGRV
         Tfo2XZH2oFlygYdQHlzDZivadEECtwnMNyyK7xq0dK4UmXEfeRDbb9r/Hb8rou1ohPOY
         2a1g+GZEJitNBdkzQWf1dkyXZrVwcYOvYMa4mpcJjhYu1H/IKQ3xXspLZMDCXn8IXnqt
         0aMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFFrTqUX555R70YUE+/WxPOm16WKWYPJJG6ut3B23Knw4bnLNctuiERA0pS8YjfKKiNBFJp5GPvH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXzuF965BMSeCDuqnhXXdBHVGyvhKkVRvVmn/REbm/UroS4uR2
	kd+U4isqC3uQGLzB6VIccS7KnYxYx1KdUE1nDdOBu8fwQbYTmNHQmxngIbSqpw==
X-Gm-Gg: ATEYQzxUI84Nn8/SVEk/PtKQRK/bAg6XbSr7EtgjfkYq7uiARi/4y7lfyJ5KGTh5k3A
	ePJTTrabYcfMF1giVXBCWvwuVe+J9wLV6tSpj/glg0Mis/nWraeATe21f2HOgEuaPxXJ6WBNwtb
	1Y3JCMDNnuRdv2ouS4+eTTUQa0QfqMUZNEKFloK8bvRIoaH6dvmlMCgfR325MGUe8YQgKxpkmAm
	o1sPDHlvbpUEFzEWMn6APpEEOcLpeq7kav9ZJVHLgea4bdUWzhKOr1FuVGEJRdVCu7fOOykWZZw
	/wtRmCt/8P0ufq2YyRZA+CMgbOrZaeDPFVOSgzhyhNGaDWZTgzzBL9yjts6RN0gAoasrDpqJDDM
	1dQ/PA5HjNIJlHIOjmOULz9tqdK+zjdwn3a4d1P+zRjirGzFCpozDl8HZQDT/aUwR02TK5DssOr
	HHjpxTQqjy89gPRhdBDZRR6Nls7iUwy8R5
X-Received: by 2002:a17:907:e8e:b0:b93:80f3:b36b with SMTP id a640c23a62f3a-b93f11ec4d2mr169610866b.7.1772642417606;
        Wed, 04 Mar 2026 08:40:17 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee519asm769668066b.64.2026.03.04.08.40.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Mar 2026 08:40:17 -0800 (PST)
Date: Wed, 4 Mar 2026 17:40:13 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Rai Amardeep
 <amardeep.rai@intel.com>
Subject: Re: [PATCH 23/23] usb: xhci: Add debugfs support for xHCI Port Link
 Info (PORTLI) register.
Message-ID: <20260304174013.16c2adc1.michal.pecio@gmail.com>
In-Reply-To: <d26eb83b-e67c-4319-82fb-9aba76bb2b76@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
	<20251119142417.2820519-24-mathias.nyman@linux.intel.com>
	<20260304103856.48b785fd.michal.pecio@gmail.com>
	<d26eb83b-e67c-4319-82fb-9aba76bb2b76@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1B69C204846
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33993-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 16:25:45 +0200, Mathias Nyman wrote:
> I was able to fake a similar scenario by leaving out a port in
> xhci_add_in_port(). It triggered the same oops.
> 
> The null pointer check you suggested below fixes it for me. Does it
> work for you?

It should, it's practically identical to my own.

I added "unused" to the printf.

