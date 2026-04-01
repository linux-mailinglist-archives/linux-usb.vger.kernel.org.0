Return-Path: <linux-usb+bounces-35778-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN/JDjUEzWnhZQYAu9opvQ
	(envelope-from <linux-usb+bounces-35778-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 13:40:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB68B379A06
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 13:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D61763030D70
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 11:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B332E2DB785;
	Wed,  1 Apr 2026 11:34:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A162135AD;
	Wed,  1 Apr 2026 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043256; cv=none; b=GfaQSQNPxD6/Qtd0TExsXWkV/RXOIpoeLjKc3IaB49OnyzJHrs5SgXsDVxdFSkTxKdBQOeF5fP2gHPm0zVHN8NKsynRyGtjxHTN+KgtosFAZMn6pSCizftXoKzKQDQkZXYHKM/Bs+79GaCiO8H1iyUPU9h+Tps8SoeXbejtRDlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043256; c=relaxed/simple;
	bh=ovjN69LONW6J5W3hqMRqSYEXDRrsdTu7g5acrd1hp2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQa7HH5WjeQNRD2umIG5uYm4UbuzqFSB3bvFK7MQq4RO03LRoik/ZgLgIb7e60KIEppG+hiMlYqJgqtsWeObpLTCSWre6BwPwg0R/jXr0EQR1T7nuzvfb4sbBVBZb4/9dbf72rmj+aWSu7gDqqlUcxlfz8bb2/AwPnhkg9G/Ko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowAD3n2uyAs1pZRHcCw--.8595S2;
	Wed, 01 Apr 2026 19:34:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	pengpeng@iscas.ac.cn
Subject: Re: [PATCH v2] usb: gadget: rndis: validate query and set message buffers
Date: Wed,  1 Apr 2026 19:34:10 +0800
Message-ID: <20260401113410.66427-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260323080845.40045-1-pengpeng@iscas.ac.cn>
References: <20260323080845.40045-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD3n2uyAs1pZRHcCw--.8595S2
X-Coremail-Antispam: 1UD129KBjvdXoWrurW8Kw13KFyUuw18AF4UXFb_yoWfWrb_C3
	4vyayDGan2ka18CF4fCFZFvr97XrWUCry8ArWUJF17W34qyFn8WF4kCry5Cr18Ga98tr9a
	k3sYqa10v3ya9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYNVyDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35778-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-usb@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AB68B379A06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

I have not tested this against an actual RNDIS host/device setup yet.

For clarity, v2 did not change the code from v1; it only expanded the
commit message.

What I was trying to fix here is limited to two current-tree checks that
are missing today:

1. rndis_msg_parser() reads MsgLength from the request body but does not
   verify that it fits within the actual EP0 request buffer length.

2. rndis_set_response() validates the host-controlled
   InformationBufferOffset/InformationBufferLength pair before using it,
   but rndis_query_response() still passes the same fields directly into
   gen_ndis_query_resp() without corresponding bounds validation.

I do not mean this patch to claim that these are the only issues in the
RNDIS parser.

If you want runtime testing before considering this further, I can stop
here until I can test it properly.

Thanks,
Pengpeng


