Return-Path: <linux-usb+bounces-35136-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HMiOEnqu2kKqQIAu9opvQ
	(envelope-from <linux-usb+bounces-35136-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:21:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964B2CB145
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8E2C300D4FF
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 12:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CF81C549F;
	Thu, 19 Mar 2026 12:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="AABLDnuk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42133CAE7C
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922886; cv=none; b=L/yzPTxvMPJuXB/ldEvazEg6o3au6czhs2or25DZWoU2JlgXcS3kt7rQvsJQHnxl5CjPvk27j5PVfrUrSimvd/vkfu+9VzJ9l2HF3uztZDy6AoIm7mpHqmptucbzI1iNyeF2djQ49LUD9+NIPbWGnbvYlxJuJSYR4NnfcKP6KeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922886; c=relaxed/simple;
	bh=Hd5HZ5IyADcUBEjeJl4VoXtmNg7RajzH2XDVybL5nIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NE3I/c9ZEDKYm9sEgtjRnP4+DxcmdiF1DHNqFr/ytnByJ7auxWPqHdN8Yik5/ul67OSMpwpoh0y1X3M2xlOjdqkdXqsXmz5f2kGjyuFJkztFWzQBLKptdxe69+RyldS0L25tFVCzvRZPF7DCcSpigZ+/1Xh1DjSCAsYk+im6pew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=AABLDnuk; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1773922854;
	bh=gk17TUScRFz7qUrIERIATmVcQudUKaJTv171VHnBL7s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AABLDnukjkZjVGav8Kjqn5tKuYX31PCTEd4dXbTmiar2laXWQRCJIHiMNr3Wu8an7
	 hjhbOM79kHiLTjEkEoSQBGe7ukAEHnF5PG3y2Tjd+946fYfBoO+2+SRJQmhixC+6d2
	 fPSg/fpGTcp1eH2W8q6ZlmCw4HsLZHkGsFzHoCKM=
X-QQ-mid: zesmtpip4t1773922850te50e144c
X-QQ-Originating-IP: CMyZW5oaX60SWT8fEcIPSqcNZrJHTyfeicxagCxebfI=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Mar 2026 20:20:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16711733787253797167
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: niklas.neronin@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	michal.pecio@gmail.com,
	raoxu@uniontech.com
Subject: Re: [RFC PATCH v2 9/9] usb: xhci: optimize resuming from S4 (suspend-to-disk)
Date: Thu, 19 Mar 2026 20:20:48 +0800
Message-ID: <17081A1362818035+20260319122048.2059838-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317145544.2076387-10-niklas.neronin@linux.intel.com>
References: <20260317145544.2076387-10-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NCOKwqY67afsCaYf/mxon2mRxCeedouCkGV+3EpoEO+yGqEB44qepGHk
	DWEWGwCt4fMaPS7yHMFSwhNz1kRlh0u0PF6xhQVgMDwg8aAZZUQr7qSvHg65SU/LJ5AFkiL
	4UcSyEpw3MTvvD+JZRRZZDFLu17CLhb/qyyeU6JjTr8GDjvGJ+Pfla23B5cuRQHQFoadOO9
	KGkPtJiEhicwNWyaabdIopovSI8YXqo/Kvs4eDEEejA424IhGGPuR0dB3VTajlZQp7wFW0x
	hgSZ4+vpANYh5g+N1HNSlkPc/b1cRvueRYT+kVqAhZfDYjgpKQYujV0sg6Y9gWRigqvmOdK
	93DO+fRlCB2rh9QatHZ4/6nK0eva9o6Zk1pFU6YeSY/PRlLF/+bPbUWoyW2SN0CUG8kbP80
	zScnHO5m25VQMDqgI7Eo1SZytl1DLUUxQz2Fq73N/zAXQ/yI3SABDo5M+0PQHeLe4cfQ+Sn
	u09wjDMyWUhPJnHiSPd0dl67RYb8t4SyBIilbIIemmzcFBRWYueqBHbOdz4GJjxA0QD+zQE
	yZkTaW9R9cBX/Z0ec90/eXnLYQnw4q11ivbRwjLcqyNQ57fjkS99qnicRJ61mWcH7XB3Q1n
	FO++94WF0NjhF/ezMsWK7WmxXvLpJ3rJJQDf4CewttSKrmFimjF+o/NrGCwuihy5ail7rg3
	uzAQOgFkxbyyrIwQsv5FeZG1XQkpE330tgUG0JAj6BT+gWGAI/Uf1JQ4HbCjRc2/RZ94+a/
	efU9crC/2relSbTtsoGQoI8tg11utCVcw44DGc5V56erNlFFMAGFswXt3Vx52fJEYq0eqvV
	4e8pZ/U5U+hcarMkQQntws95S2qurGpvUZa8FBiTYYPoLnSEqMPSOkCgINxeLpn7qMzVKFI
	7FGPnKR4SvjMD/zphbWyY0uc1e7N9Tw3WRcsn7Ilvv/IciGOrBzBnCge4OSHfibG9wlf/ti
	5tbjawq+wiFxOwKGFxYQYGsB6oMUkOg2fIqNejTMOJk9HvtWqSd6i3KzM41yNdwQ7nIxATr
	80F1zytA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,gmail.com,uniontech.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35136-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.959];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,uniontech.com:dkim,uniontech.com:mid]
X-Rspamd-Queue-Id: 5964B2CB145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-17 14:55 Niklas Neronin wrote:

> +		/* Clear data which is re-initilized during runtime */
> +		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
> +
> +		for (int i = xhci->max_ports; i > 0; i--)
> +			xhci_free_virt_devices_depth_first(xhci, i);

This patch looks good to me overall. I only noticed one possible typo here.

Should this be `xhci->max_slots` instead?

`xhci_free_virt_devices_depth_first()` takes a slot ID, and the previous
cleanup path in `xhci_mem_cleanup()` also iterated over `xhci->max_slots`
when freeing virt devices.

Thanks,

Xu Rao


