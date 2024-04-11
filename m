Return-Path: <linux-usb+bounces-9257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1174E8A1503
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 14:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D331C21ACC
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 12:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF7514D299;
	Thu, 11 Apr 2024 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="IPwZ1nbo";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="jwfUHkxl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADDF145B1A
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712839650; cv=none; b=nnWrqRwKZ7l3+K6Z24+mlh5FTfz4DnJviLKPlpJBevxBLG+3YNuiYDq61N8pqXdGdsybYFzmSyDOHjLqnVkX+0GFXlsdsjdoRjgbaUIlK8sOoD/Jw8WX/TJz0F7LXrjONbp6xkUNn7EMY6xHCJRiBFqdBsA7jd+JmcBZ9N5oS58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712839650; c=relaxed/simple;
	bh=XmD5BOdXftnMBy09YO/4xKSGEOzOc9Hfd6Iw+vbFmhw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Mwl+5WIXkktakQ6Eg30bdyU4ce3QohSQ9zln06prypWr5CkQbuNoFXhrYEM+lRxTxpBI0Q9ZwqLeUDVYf/O1EJHJjuJHRNPDJPQUT2/ezeucM3P9yxChvLiEt2xKM66E5nT91iIAqw3oUuSDcyDZdW0pDGMb7LRxufMOAuQOm2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=IPwZ1nbo; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=jwfUHkxl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 634FF5C6C1
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XmD5BOdXftnMBy09YO/4xKSGEOzOc9Hfd6Iw+vbFmhw=;
	b=IPwZ1nboXygY0ECWvsf1WbiLxoJn1x1env0NAuy0KMNblgD/dDyA6d1x2Iir7imgsjaJ0B
	jihDnJPZOhakG972Ncq6kzhwgVt16kUVkDFoWRPU3VAH3bndMJB8t6/CL/rJTnE1Xi/hEs
	W46Fb4QfrnVlsCArjKn/NVmcseL38oU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=jwfUHkxl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1712839645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XmD5BOdXftnMBy09YO/4xKSGEOzOc9Hfd6Iw+vbFmhw=;
	b=jwfUHkxluHO3yhyQeVh9MUqU2/YpwrPoDV9xZiFUa7AAkEWWTdzaRJBruY3/G4z7wwOsyZ
	4xtlvvq7Z4qMiPrNfvPpsaSC0qDLyVmD9OaBqPbtXPBF94Opq0khjggKbFeOBxj7K2p1Wq
	89o2piSiuDuVJDwzD1Ks2h9lAIyCpow=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3695F13685
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qxalCt3bF2brIQAAD6G6ig
	(envelope-from <oneukum@suse.com>)
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 12:47:25 +0000
From: Oliver Neukum <oneukum@suse.com>
To: linux-usb@vger.kernel.org
Subject: Hardening the parser during enumerations
Date: Thu, 11 Apr 2024 14:42:58 +0200
Message-ID: <20240411124722.17343-1-oneukum@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.04 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.03)[57.05%];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-usb@vger.kernel.org];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 634FF5C6C1
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -1.04

The parser we use to enumerate a new device has no hardening
against nonsensical descriptors at all. This is a bit optimistic

