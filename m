Return-Path: <linux-usb+bounces-34487-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCaEItBPsGnFhgIAu9opvQ
	(envelope-from <linux-usb+bounces-34487-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 18:07:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A92553DE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 18:07:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4E313197323
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 17:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BDC3BF69F;
	Tue, 10 Mar 2026 17:05:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from zg8tmja5ljk3lje4mi4ymjia.icoremail.net (zg8tmja5ljk3lje4mi4ymjia.icoremail.net [209.97.182.222])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25933D0924;
	Tue, 10 Mar 2026 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.97.182.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773162340; cv=none; b=o4Fp7jJ1NmXNT18yd1xHGG4TvScCZqwXFpIDfDPGj/aJw1I6A1KcJRUH745H7cth4sKqQVym5QcFpDfz3U3dwrudARUxFlxNcQcz7SFnJ74o2xCck7ENipTqcuttbHmRrwxz6/nItjMZZOlxMA2rGNaY+xPG7bH27zLtCNDdI6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773162340; c=relaxed/simple;
	bh=zoLYaN/qdnReMLP8BmR++i4YAYIRxysZZRHkz7LKVFw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gTYW/HwTLvQOnZ0rmMIXLPShKqeJdkenWahzeoSbi1YHtiuN+Eyv3fN91SAK18bykBUGDT5nlV/U+SjX7+L3CbLBJA3jOjYfm4wEM644hiSJNTehALojjeZyoilODvDcMhjSTYhbHkvQaiTfXPODP7voqGrB+d0IhJ/OeqahBlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=209.97.182.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wAnpoRUT7BpuoUqAQ--.4495S3;
	Wed, 11 Mar 2026 01:05:25 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app3 (Coremail) with SMTP id zS_KCgAnKGtRT7Bp4+mbBg--.13190S2;
	Wed, 11 Mar 2026 01:05:24 +0800 (CST)
From: Fan Wu <fanwu01@zju.edu.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: Re: [PATCH] USB: serial: opticon: fix UAF in write callback during port removal
Date: Tue, 10 Mar 2026 17:04:24 +0000
Message-Id: <20260310170424.19817-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aa_c0B9E7MPm_yqL@hovoldconsulting.com>
References: <aa_c0B9E7MPm_yqL@hovoldconsulting.com>
 <20260309142757.589802-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:zS_KCgAnKGtRT7Bp4+mbBg--.13190S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?B7jqowXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnTqSmKH0LqHUXXTLjNnjGwEwjA7P0UCowrhus0RajvFhf1AkuuN/qN0dlI7N8F9ueFhy
	ymtMlJTcmRgOd7Bip5jN5RPxYw6l01w8CbPzC/8w
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF48ZF45Ar4Uuw47tw4rtFc_yoWfJrg_Wa
	ykGr18X3yFqFs5uw1Yka4Yvr9aq3ykKry7Ww18ZrsrJ3s5Xa4UCrZakr98Wr1rG3yqyFs0
	krn8Za9xCw1SgosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb-AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r1j6r4UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
	YxBIdaVFxhVjvjDU0xZFpf9x07jnKsUUUUUU=
X-Rspamd-Queue-Id: D83A92553DE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[zju.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34487-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-usb@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 09:56:48 +0100, Johan Hovold wrote:=0D
> How was this potential issue found? Are you using some kind of LLM or=0D
> other tool?=0D
=0D
Hi Johan,=0D
=0D
Thanks for the explanation. You're right =E2=80=94 I missed the lifecycle g=
uarantees=0D
provided by usb_serial_disconnect(), and since opticon_close() already hand=
les=0D
the URB cleanup, this report is a false positive.=0D
=0D
I'm currently researching static analysis techniques (CodeQL combined with =
LLM=0D
assistance) for detecting UAF bugs, particularly around cross-entry lifetim=
es.=0D
In this case, the analysis missed the subsystem-level guarantee that close =
runs=0D
before remove.=0D
=0D
Thanks for pointing out commit fdb838efa31e and the relevant mechanism =E2=
=80=94 this=0D
is very helpful feedback for my research.=0D
=0D
Please disregard this patch, and apologies for the noise.=0D
=0D
Best regards,=0D
Fan Wu=0D


