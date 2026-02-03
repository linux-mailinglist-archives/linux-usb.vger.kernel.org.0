Return-Path: <linux-usb+bounces-33045-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEunCiZ0gmnBUgMAu9opvQ
	(envelope-from <linux-usb+bounces-33045-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 23:18:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C38FBDF2B9
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 23:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D04AA304EA65
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 22:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DE736C5B9;
	Tue,  3 Feb 2026 22:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KL69z9vG"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADFC329378
	for <linux-usb@vger.kernel.org>; Tue,  3 Feb 2026 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770157021; cv=none; b=ZFdNuOKpkskPhhSPk9TIASb9KhfxM0LfmwQ+aa5krIWRVZf7aQ8cCiWLXe/K98fCsnoQUsOQ/91uzcdhKuxteP9B9PAqnUfQVOkrDvEXqIkCLAYk/YCSoEI8dnf0axdH5FzLMZens6CduGVgrzr26mU+saAFndxfJToSnpzTbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770157021; c=relaxed/simple;
	bh=EvKSfDeRKIlKGlfYxtZI0Fe61lEWLQWjjK915W0iGlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dF16g2SXXkVurHfCCa0HBMg6wWfdcHKiJpvV8LN4GTHKIMu19mZc+0K2E4sOdtCwiM5kRSMNldKt1akd+jvpD71+LLNIQDeJP0jb0+LSWxuVrXj/Nh3FjJXua0kgAYGayh1aYrjwjUUAcn9/PkWksblgAGblHwg+dYIxzwWrHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KL69z9vG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770157018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uxw3knIV9bsLdgX98rqyJuHX5Nh2CrQl+ot2QT4ez0c=;
	b=KL69z9vGuAEiv8s+7+3KnKPD97/CuUnRQEFgLpMs/M6Nc/4UEdJ3sXPskMafNpzaDD2tPA
	SwrxP03Qk8ujvnsZHxzIgAFVPAjwNjaK8vhEwlrI6y2mrL4ZVs0Js14RubNnk3DKiySdj3
	ehdE6LCdgT5/4Vk1MpR6ExH/8DR4+2s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-355-Nbx--GieP1-ZRr6CHKOeXA-1; Tue,
 03 Feb 2026 17:16:53 -0500
X-MC-Unique: Nbx--GieP1-ZRr6CHKOeXA-1
X-Mimecast-MFC-AGG-ID: Nbx--GieP1-ZRr6CHKOeXA_1770157012
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3662718007F6;
	Tue,  3 Feb 2026 22:16:51 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.51])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 287E8180009E;
	Tue,  3 Feb 2026 22:16:48 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: "Jiayi Li" <lijiayi@kylinos.cn>,
	"Mathias Nyman" <mathias.nyman@linux.intel.com>,
	"Oliver Neukum" <oneukum@suse.com>,
	"Miao Li" <limiao@kylinos.cn>,
	=?UTF-8?q?Johannes=20Br=C3=BCderl?= <johannes.bruederl@gmail.com>,
	"Lei Huang" <huanglei@kylinos.cn>,
	"Lyude Paul" <lyude@redhat.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [PATCH 0/1] usb: core: Add quirk for Gigabyte Aorus Waterforce X II AIO coolers
Date: Tue,  3 Feb 2026 17:10:26 -0500
Message-ID: <20260203221452.198682-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33045-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kylinos.cn,linux.intel.com,suse.com,gmail.com,redhat.com,linuxfoundation.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lyude@redhat.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C38FBDF2B9
X-Rspamd-Action: no action

This appears to be the final bug that I've discovered on my newly built
desktop - the liquid cooler I installed doesn't appear to reset properly
during resume, and causes the kernel to print some errors (see the
commit message for more info). As far as I can tell, it seems to just be
a simple case of not supporting resets.

It's worth mentioning what the USB topology for this device actually
looks like:

/:  Bus 007.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/12p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 010: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 05e3:0608 Genesys Logic, Inc. Hub
        |__ Port 004: Dev 015, If 0, Class=Human Interface Device, Driver=usbhid, 480M
            ID 0414:7a5e Giga-Byte Technology Co., Ltd

To be clear, I believe the second hub (Genesys Logic) is built into the
liquid cooler itself. Since there seem to be a number of known issues
with Genesys Logic hubs (at least according to our quirks file) I did
give a try at applying various quirks to it, but none of them seemed to
make any difference.

Of course, if anyone thinks there's more things I should try here feel
free to let me know :).

Lyude Paul (1):
  usb: core: Add quirk for Gigabyte Aorus Waterforce X II AIO coolers

 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)


base-commit: de0674d9bc69699c497477d45172493393ae9007
-- 
2.52.0


