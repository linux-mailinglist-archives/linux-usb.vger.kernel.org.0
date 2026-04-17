Return-Path: <linux-usb+bounces-36298-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XHgDFBWr4mlk8wAAu9opvQ
	(envelope-from <linux-usb+bounces-36298-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 23:50:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4A41EC3E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 23:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A9EE3056155
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2026 21:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D9A36AB46;
	Fri, 17 Apr 2026 21:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhjJ2hxp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADC833D51A
	for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 21:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776462538; cv=none; b=QmpEKUuX7f2vh73/bWxlR1fSIKHfl/dFT+7n6Ej4zulBvvV4yxw5YoTIJaWptMN2A82IKlCWNLJReg285UsIZsA44Vhl0z5KrPJG5MTmTFB3oUJ0dZGXH0USUHDj5jBWw573L2+IQVW8Mxqndrt96D+N07j7zISyxcMxicRfrUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776462538; c=relaxed/simple;
	bh=2z4Tft8CsIhs2gItlcE98Ljn5UyuCu6zy6ns/8fGoVs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIL8FvJOIjSgsb+ellkvXW/i9JgbMz3/dYO5Ez2LlpnqmVcJuZnmwPIWnykeYXr2U7ajmB9SiG4bSrNegC+s3uq+xcN223x1QV93ff9vxLRLJ6+yAmgwTr8plPJ6b8XnEfmYFL6a9OzhU3hyNX1Y2e29/gL1wdo0+YnNTko6BMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhjJ2hxp; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a413f83226so1767770e87.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2026 14:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776462535; x=1777067335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3nXeSYcIGleoob8/DCIXu7Y4rEO2zp9+YsUhzFG5/s=;
        b=MhjJ2hxpDC0g/U0iHnbf9kb46paGKVbXC9rx8+HEZ3zWZozw95OoddpHCqk8HZhmNZ
         TLk2aqy24R/eg2u/Orq8tKflnJSurokXLwDZyk8WkNeyNURnc9RZIqTzVaaIttcBbQIB
         BolSwl8fGf4t4MIQrknlMxQFlHqbLoQBFpoSaRgBORGFm5ufa0fKTGPVNRHtMtqWQcps
         6Yx68T+4ZuJLFfzDRayJneEFIN4MCRuNNtDezyM3jYVabfspZKGaVskos4j2VK4CL9I5
         p6J+fYuBHCmScboepnio0yOy+1lk985JUeSn8BIc5CX49oMdDwqHE14row3Q+1l5HFxR
         3trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776462535; x=1777067335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3nXeSYcIGleoob8/DCIXu7Y4rEO2zp9+YsUhzFG5/s=;
        b=cMnYpfSAszvTTO3Sz7KJXXEyWHRlCEHz3SinUiTNmrGhSKOvbyr5YDu+qfdd5i0EUv
         uFilTFk+mo9jRMDAaT+d3j36M4bRRWmLUOyRzsTgIFCJDwq9NqRQTYENBOhpjtBxo7BM
         dgXZ5fNjoBTMjXEL/gs33JC7JJJA67mLHdhpjlCnKOblaz/4YL+fZDFMNQhWbsUTzzs4
         mheWFBvfAKhicOdsVBO/W5mDlbwEJKs+C2lSmt5nJVHN2Y3gugEx9sBX0UgQTxWjuTNV
         XDXH+wxKqAFHjWLVM4Zvaix8RrA+DbGh2UHdLZvYqcVl+DD+bgWOj68TYWmvfNngwuDa
         LUUg==
X-Forwarded-Encrypted: i=1; AFNElJ8OAU2WY3F7uu6itbz3WR4MflS63b7R9jOoYzJgzKtSgCluRAKy6Zq9SntdgJxkT59wPdWfFqACC4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYXX9GBTQCOCVHYFfJuNEpMKepvdqCW+mO2meMO9boTR79xBvC
	lv4nP7hlBftvDEiK8j5lWDyLkbpSib4OFemOrwWZlHPpcGpLNGCtm4fW
X-Gm-Gg: AeBDietlL5icRFgSzqv41OHBFtUmMLShIrdo5vyXLYvvuMl8GzrqdKbPw2r41hjAZuD
	7+ddlEs07WtW2oAEeqTFGe1+/Z3pOgtFEicQBRp1HGscPAbg6THFqvZSOgTAnas4AW1otq9clZf
	qvRVrEsHAKdALJEmCOikqxyc/5uwbG3fkssWPEMwj1n8Ri3JYh6MvvOuy6aeumb5eQU23chma5b
	iMTNaHbD1zJzK19ojJqtXuZWXLO3FscyQ3uA/L6AhobxljKz3ueO2D4JejmnFfYPC1iL+FLtcuT
	L/t6sd7VcSTJCiJ+bACLLXiPdI/uDCQ5vqn1hJUWaWMUDtH18O0vDbdjZvIyPid1MckpkNm/CLd
	aEGdLcJzCMhHmR7HIYxXz0/8pPLZVJ38N4ZvF1LOw7oAm+SmQLIm6v54F2w3qNZnbZoLw/ekhxy
	X+WZfHCYreq2TO07YUF8qxPRNnbP7S6rLg5hNVI3Bj1w5Sdu9y7xQbauGy
X-Received: by 2002:a05:6512:318f:b0:5a4:4f9:be5 with SMTP id 2adb3069b0e04-5a41716e54emr1368726e87.5.1776462534702;
        Fri, 17 Apr 2026 14:48:54 -0700 (PDT)
Received: from foxbook (bfi125.neoplus.adsl.tpnet.pl. [83.28.46.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebf9bsm742296e87.81.2026.04.17.14.48.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 17 Apr 2026 14:48:53 -0700 (PDT)
Date: Fri, 17 Apr 2026 23:48:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <20260417234846.41a24089.michal.pecio@gmail.com>
In-Reply-To: <4a484a89-f52a-48c2-af43-c0029878ddaf@rowland.harvard.edu>
References: <20260404011530.aukxllvizvmc3f3x@synopsys.com>
	<616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
	<20260404204133.3mcizeeokw3ln5r4@synopsys.com>
	<243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
	<20260404221533.woepax7jxwefy3fq@synopsys.com>
	<20260404222818.t5y52gnd2gvalvp5@synopsys.com>
	<b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
	<20260405030954.32jbg3fphi5xdla3@synopsys.com>
	<74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
	<65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
	<4a484a89-f52a-48c2-af43-c0029878ddaf@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36298-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 9EB4A41EC3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 17 Apr 2026 13:38:46 -0400, Alan Stern wrote:
> The behavior for control endpoints isn't clear.  When a transaction 
> error occurs in a control transfer, does xHCI stop the endpoint
> queue? Presumably usb_clear_halt() isn't needed, but what about 
> usb_reset_endpoint()?
> 
> I will assume that all stalls for control endpoints are protocol
> stalls and therefore do not need to be cleared (the device will
> automatically clear the halt condition when it receives the next
> SETUP packet for the endpoint).  But does xhci-hcd still require a
> usb_reset_endpoint() after a control stall?

Nope.

The host endpoint halts on every STALL handshake or non-isoc protocol
error, but the driver immediately resets every halted endpoint because
it's a precondition to even remove the failed URB from the HW queue
before giving it back, which looks like a prudent thing to do.

Currently, by the time the URB is given back, its endpoint is already
in a "stopped but runnable" state and its sequence state is zeroed.
And it may have already been restarted if there are more pending URBs.

This seems to need no change for control endpoints?

For bulk/interrupt it also means that if we delay the restart until
endpoint_reset() then endpoint_reset() has nothing to do besides
restarting the endpoint, which is a good thing because this method
under normal conditions requires no URBs to be present.

> Recovery from a transaction error on a bulk or interrupt endpoint 
> involves sending a Clear-Halt request to the device.  But if the
> error was caused by some sort of transient interference that hasn't
> ended yet, the Clear-Halt might itself fail with the same error. To
> handle this, we should retry the Clear-Halt at increasing time
> intervals.  At what point should the core give up?

Good question, I don't know. One thing I noticed is that Windows does
tend to lose patience with completely unresponsive devices and kicks
them out, but I don't know the exact criteria.

And if core is to clear halt autonomously, things may get interesting
if a driver tries to do the same, or something else like removing the
endpoint with usb_set_interface().

A related issue is clearing TT buffers. AFAIK this has no retries, it
fails silently and leaves the endpoint potentially broken, and it is
waited for to complete in case of usb_set_interface().

Regards,
Michal

