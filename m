Return-Path: <linux-usb+bounces-35973-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC95MyER0WmHEgcAu9opvQ
	(envelope-from <linux-usb+bounces-35973-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 15:24:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639439B31D
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 15:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2174300E722
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 13:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296D6277C9E;
	Sat,  4 Apr 2026 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9rZOFnM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C061F4634
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 13:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775309086; cv=none; b=S+94w9MbCs42ZAhWkGidkrQjE+D4Nwo/+kavhHuvJZaft5upj0rdPXQhnbo1xbdus8SGNs9ESXI4sxXlwgpV/ZcmPq8am66IxjtoLgEt+yybNPs7sFhrDxrxgX5e60QOBG48DZtkkuQ5i9MqKaMINXeEcbWVoTBzaFWjcReJmj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775309086; c=relaxed/simple;
	bh=KahUGdf3dzqLUmUTsgQmeHXL40j31ZGwp3Z0RMA6W5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0Yvse6qLVwQCp1kmxpG1a0yNG5YXHQseTpZD57mmSff+lD+YTqCb+Wrlbz6lUZ9ycRlPRGmePw9Ym+O0gJfjdMiIVhXI9fBu94iNBggjIIUWJXlGPBqtK+QxgceGS2ntWOISwPeNTqyzxQD8TKpmjlFTfAplhszekzmRjZaSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9rZOFnM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so23335845e9.0
        for <linux-usb@vger.kernel.org>; Sat, 04 Apr 2026 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775309084; x=1775913884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rR3DzoeE+H0pOkwHHiV3jTOep1oQVXdyX4WtdrBtl+E=;
        b=c9rZOFnMaFw6/gOqvolxjXaookNbxop+9hYvVxeNIt2QbnhzyMuddZfkqkXPsKE+xS
         IHJQSqt5iTXymWBD5rvz5kRVcTgQL3lloiyeHYbX5jUBLW1A8z6hrVkEqegU8lgcWBRb
         lonmishWzK7pNXTIjAEMtySq3zWNHFBLQ+tuilQD52xo4sowB0+H8DGGRVS0vk+l9BLp
         1Xj5vG0dX38S8PiHEKNyOqqQ/0FPl2mKQLu+V/Xv8jVDJUe2j4c6bmLmv8UMnu1Ul6f9
         KJzn6KC4UV6aOjOBtPmuOeC6JdmtI+fXw77RWSO8gHxo1no7yyCjliQHLmXllRwtwphQ
         g8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775309084; x=1775913884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rR3DzoeE+H0pOkwHHiV3jTOep1oQVXdyX4WtdrBtl+E=;
        b=gM5DjPjgk0SgX574iWCWMSutH6/8j1RHHxv8wc2QXmGI3zVRQ8DK+x/RX4AfJFHWGL
         w0Od5Q1IBuWJdllGP2ljuAIgLefr9wFnNax6Nh9xqFmjHvQUP/xAC0nP7FnnS76dHb3H
         2fiAG5gRkqHrm+JxMzKpVD7lIcOSaOPWWP3PtsMpN8alCL0ShIL3b6pZKEBvogamhDhs
         arx1sYJjbDJlX1nkgv7mZc8ytX7gD7eAp+nHxWzM1E/Nv+GcWDX5ULCKl2Crc5WrQp1p
         v3mZQfF5Ml2CIS2boAch38Mfjff+FF9wXh4q9CJh+SCX67t9dmkF7QOM89WfME6YvrEk
         7auQ==
X-Gm-Message-State: AOJu0YyoZyJCXl79lkeKtjhyhX62xfPtxOVgivnLlk3gZUEULzaGciBS
	EgL66fSDBknEANjY8QyCuteCzFzzTUV+TGktRJXBSvYALOZP7XUXKMyo
X-Gm-Gg: AeBDievzYOQLqX9+DILXoZwG48HToymCSIObR3Qar+ilnPNmaTMwYQsCpdYK6rynX2r
	0mg43KtW8a1DobKrdHwuBUvs2Y4dm0tMQUolS+Zo7/KD9KUzccqg26Ck6Vbtzui4dptddsxR/ID
	4Bh7Pma8XSOX4kJbEXixVL1h6Rx0GbW5huNXU7TLw47mNNgJQNZDUW3Mb1dO/JW8QFdu+HAvcIe
	mdONxG9MUxOqg/TZYxb7oGggccxOktABN3vIYwP23fHESLwwpPjlK7JjVp2LZQzq+27iLmx4zDi
	DWAu8DPgFoBIcw6JtNpetcxosHzPUb6J/Fk1xcgCuacxdULnb2Onn/Mg7z/GaPzTx7tUn5UBdqH
	7s8eImB2/BseZ2jE8UC1Ia6W4wWHtjDtsUPNjBsrRVWBTPLUPdjIa2yJVY0DO1B7kteLxI9Ahq+
	x52qBop/yOYv+MsyrRRv1j0pEGyEKinTa/
X-Received: by 2002:a05:600c:3acf:b0:486:fc4a:2951 with SMTP id 5b1f17b1804b1-488997d51bfmr92727175e9.28.1775309083396;
        Sat, 04 Apr 2026 06:24:43 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm17311875e9.10.2026.04.04.06.24.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 04 Apr 2026 06:24:42 -0700 (PDT)
Date: Sat, 4 Apr 2026 15:24:38 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Martin Alderson <martinalderson@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
 dies on resume from suspend
Message-ID: <20260404152438.582f0451.michal.pecio@gmail.com>
In-Reply-To: <CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
	<20260330020749.18fbe433.michal.pecio@gmail.com>
	<CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35973-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5639439B31D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 4 Apr 2026 13:04:02 +0100, Martin Alderson wrote:
> Just for clarity this never happened to me with the 6.19 kernel I was
> on before (suspend/resumed many times on that kernel with no issues).
> It's happened twice now (once with rc5, now with rc6) in a short space
> of time.

So apparently about once per week. That's not very easy to debug.
One trick I have seen people use to accelerate such tests is running
"rtcwake -s 5 -m freeze" in a loop. This puts the system in s2idle and
resumes automatically after 5 seconds.

Do you have more complete dmesg from those failures with timestamps?
=46rom suspend up to until everything has calmed down after resume, or
also including whatever you have done later to restore operation.

> Previously I was on the Fedora 43 default kernel series, now I
> switched to the COPR for 7.x (to try and fix something else).

Not sure what COPR is, but I gather it went like this:
1. Fedora 6.19 kernel was OK for a long time
2. Some other kernel, possibly other config, 7.0-rc4 still worked, but
   only used for a short time. What about 7.0-rc1 to -rc3?=20
3. After updating to -rc5 it's definitely broken.

> Thanks for the bugzilla, I'll look at some of those workarounds.

Particularly, collecting dynamic debug and debugfs could tell if it's
the same problem with missing IRQ after resume or something else.

Regards,
Michal

