Return-Path: <linux-usb+bounces-33949-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLJBGSHxp2mGmgAAu9opvQ
	(envelope-from <linux-usb+bounces-33949-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:45:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0311FCCE3
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 09:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4BC1302BDFC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 08:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CA1392C28;
	Wed,  4 Mar 2026 08:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8D8M/+d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E837F017
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613703; cv=pass; b=EhxakRfO1qLirhfs7fJGMeQGeusonSEBnORdqCcEk6V9iAR/1O+xdiviDUP02tjByACkH8GH047XiAYD8ZJMpoCKNyJx7ZHlNnhjCJ8jNM/u2wlptSMj+zoy3aK6g2OfeWWIguRQ7WTjAxjfbTNSfAHyB5f45ndINiqdEMU474A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613703; c=relaxed/simple;
	bh=PbpMTPaUER9q9SFoLMTcbK6+ErIT2Bgwx73cRJd99uI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gdEcbIrpEBKoQv0Hi9Ro+H8n7RTKGwdMsIdof8pi3otxfJlS0MthR8i3bpk64ujb1URe7T1NX+sroXOLEqh4SQmKQoFm4QGUO3rWArnh6ASTsAUW0BxRdqdfAK23XoBBTfq4TKo5GdIl3mZYsEiXRSMdaCD5HraBQonuNbyxams=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8D8M/+d; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40f387a688dso1347681fac.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 00:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772613701; cv=none;
        d=google.com; s=arc-20240605;
        b=ZLzNbNtgoNB2iGOhyd5zxinrBJHp/4J/+YpMExJxjVV+c/RZp7M3GccVI0qvLvBSfE
         OOllvgrd+14pLjJNAAYurwxBXRGXbM/jZzjCM1HQjz39K+ndLIqmql63wu04blTom8Eq
         xccGBY27LS8NCCWDGN9K1MG5hshX8TsGCS0AZpGC2Q6oIgaEsZVTk58BTTDk3z+aD7Uj
         PJXCeYDgXdZEM5ggZjUdn/r08eiKJpu+8nZmPsCJmNhc3sJJP6fBHdmOCPaoEvdKrd3u
         VqGSo8JGnKoLFrJQxo5FLkdFUo1hTzY19j6odskIjnW1OxJ0hrRF8izbak3to1Iphgn/
         xIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PbpMTPaUER9q9SFoLMTcbK6+ErIT2Bgwx73cRJd99uI=;
        fh=bktxDYR+Atc92qTkq9jvF87Sfy6fIMswbmUHIuWbU9k=;
        b=N5egoSeZIjlUhdY/vS7FQtwUQnknBgdZ9i3DextE6jmzaoZ+wweprddWqKlRfOPIlT
         0ljBDgtQIn3E+OAIkqqAsAIzF+U2BaDt8Y8fkchb2VVmHOZUD/xUliLJIkhJO77aHKbn
         CZzESJ6ZW3kt+b1OyWeZ+iCMRzhlN+4XNoCuPGqYaZwbFVxGrCgNViHt7Aji21+gk78W
         1QoKxRXVwUwyR8kHBg/82pRRmr8GL80YgUH9sA6keTuAPGER2DkBUrjUXS+vA6jFRqt3
         AlVvJgZ6ceTpXa4kA7Ph2hYbh8b1bHGX4AftRg+nLzG4GOXHoe96+2BXS6c+SuQWyT6k
         gTtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613701; x=1773218501; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PbpMTPaUER9q9SFoLMTcbK6+ErIT2Bgwx73cRJd99uI=;
        b=l8D8M/+dsOdaWXt/piFodTf6Fhzyduy025Tn0PWJs6Jdr2z7NR4SZKgcatgT0IkucW
         pDOpI08Y/hq6cRI0hmiAk2pU1tXzLL/Bdfn8puVrij5Ox9W5b2Sx9kGihBnVKD8p1VVV
         uocGBnEruOFtJ760sitHcWTm8xLalmh/M8IHVJTGZIf0cAxFsUhwH9j+QPdYD97e0S6A
         Zcbn5FmegYCvZR1OE7pAsEgcXi6snBqyIyBFNlgyxQNeLf/UuxMJF/aSb356gZFSyTvF
         uhUoMk1RCT0gQYZVpxlKzyTHPj3Eb8ngXCEQsxkLn6geUwlpZ/NEDHxasIL1De5CrDPv
         q2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613701; x=1773218501;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbpMTPaUER9q9SFoLMTcbK6+ErIT2Bgwx73cRJd99uI=;
        b=ZR8wQa1YxqU2/mxYwiaEr8AQ+mN1tXJBHC9Q/VCRvEiCwKT9t9toDpkxiAxqzDzPyW
         gL1QXN7IswgIInexSg+crlGFFMNdOfA9w25XGpdyGD2wc1EtguE6Hlw/QOXPhzXif30X
         PkLKjo0Ep14vMPRlUUdq6mrfkvnKQFTG8bYCbEmDVoRomOik1KUMG4Puvi+5OSB3b/3P
         kZYAT/TSK/XPu3720giQ5gIi7hdJVyb33OuOIu/+AR7/NO70MeI4DPXfyrxyHI5V/BT6
         cZkgaaKEsiMQ3xtJMQCk24urces5uXoe6A/qpEJ6G7fPKZKJyRoBGfBmdqmsTQ9Tl8T8
         98eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIY+ikeGP/6R9grEPlOyDVdjf+yeNwwFKKnT4hwA1V1NivlJUOXgDfjFi93EAWiFC0eGX38npySLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjBXdqPGQ+wLcmOUhpKG4P3SpFaeLRsomPnq/ec0VYn00Zv/F7
	sFHd6uCnQjGvf9XnA2ZGZ+xPl0FI5v9T+wRuLrGHX453J9z+tDbyToMMUI895pnkQKl7Y9w5WQW
	q5bZ5UpbaTPsWvhsUjHlvTyNKdBAs8e0=
X-Gm-Gg: ATEYQzz7zpPliQ+ytBlr7ZZvQNGic+4DakOsvdl886eYlh1FbojULt7eeqimloIJWz+
	AzubzptshYx40/ZKYQdAYPd+L8ypDQpWLv6xtJo0LaqBoeCnwlggzUqcV9c7cx/pm98P9l8TRN/
	SGV+zv7YeWY/2k+emv0wbk/h5x9aM+n4R9xMAfycM0BU5aOVFYA3TzYvYO9sqq32Jx8psziXS9l
	RbTonfBC7nYlxziR7elF06jcFxrBtzOtENqDIXnAvGsUSVrIAO+fFTilIInGSnUoC8Cn6Tdxxm4
	w4wdeBRUILJBUnszkMtBpRjsqyutbh26bycC/G0ijQy0rsVhnZAdjvNrWOQYoMdisrCsLmh9P5o
	bdSbg21XF
X-Received: by 2002:a05:6870:e993:b0:416:44d6:fa0 with SMTP id
 586e51a60fabf-416ab50c975mr669633fac.11.1772613700827; Wed, 04 Mar 2026
 00:41:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 4 Mar 2026 16:41:32 +0800
X-Gm-Features: AaiRm50hlwzO_Ujq5gFY5xKB7yvqwaffMeMhSpvgnz11mKKf0rJEyR6RItfFOAI
Message-ID: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
Subject: [BUG] usb: cdc-wdm: Missing barriers in ad-hoc lockless buffer
To: Greg KH <gregkh@linuxfoundation.org>, oneukum@suse.com
Cc: robert.hodaszi@digi.com, kees@kernel.org, linux-usb@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: BA0311FCCE3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33949-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[digi.com,kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:url,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hello maintainers,

I would like to report a potential concurrency bug in
drivers/usb/class/cdc-wdm.c.

The driver implements an ad-hoc lockless buffer using desc->ubuf and
desc->length. In wdm_read(), the read side checks
READ_ONCE(desc->length) outside the spinlock. However, the write side
in wdm_in_callback() updates the buffer and length without WRITE_ONCE
and any memory barriers.

Due to compiler optimization or CPU out-of-order execution, the
desc->length update can be reordered before the memmove. If this
happens, wdm_read() can see the new length and call copy_to_user() on
uninitialized memory. This also violates LKMM data race rules [1].

Additionally, the driver relies heavily on set_bit() and test_bit() on
desc->flags for synchronization. These bit operations do not provide
implicit barriers, which might lead to similar ordering issues.

Proposed solutions:
1. Short-term: Add WRITE_ONCE() and smp_wmb() on the write side, and
smp_rmb() on the read side.
2. Long-term: Replace the ad-hoc buffer with kfifo. This is a classic
single-reader (holding desc->rlock) and single-writer (holding
desc->iuspin) scenario, making it a perfect fit for kfifo.

I discovered this issue while studying the driver's code. The presence
of a READ_ONCE() on the read side without a matching WRITE_ONCE() on
the write side caught my attention as a potential data race under the
LKMM. In my opinion, implementing ad-hoc lockless algorithms directly
within individual drivers is highly error-prone. To avoid these subtle
memory ordering and barrier bugs, drivers should rely on established,
well-tested kernel libraries like kfifo to handle this type of
concurrency.

I am currently trying to reproduce the issue via stress testing on
ARM64, though the race window is tight. I will also attempt a kfifo
refactoring. However, since I am not familiar with this specific
driver, I welcome anyone else to take over the kfifo conversion to
eliminate these potential bugs and simplify the code.

Thank you for your attention to this matter.

Thanks.

[1] https://elixir.bootlin.com/linux/v6.19-rc5/source/tools/memory-model/Documentation/explanation.txt#L2231

