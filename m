Return-Path: <linux-usb+bounces-23205-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AECA9201B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 16:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C77B13BC60E
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 14:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96AA2528E4;
	Thu, 17 Apr 2025 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hDWtmkdR";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hDWtmkdR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197124E4B3
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901246; cv=none; b=AER4wIlY4FKoCCnYC5Ev74MgU6SBMiiKvCj4ovdpb71vO5nEmpLlaiDQgu7QDnYwg1N1oWussPKlDMs3g8g+3hNLNZlKrpZ34t/t1S+rYfeYQWtenptg9cChBT2/UuFEO2haKQR5UZU0Kw6U7/MKvcmsGwKa2MAonoindruw1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901246; c=relaxed/simple;
	bh=i0EfO0iWMQ4+C4UIO7AgCj7fNFyn9GQ6FuNQuO7DJv8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=u0utCti9kkPSYv+5INZA9M6QGPyoSpQmMKieZ4CwuFp+fFx2Xc7qcMeS0CDuMQacCpPQntcr4w10idaIvNPiKmBGXR+sW2RytsV6sg706qb+48dbuxUY3ftGL9QZUS+75rxGHHOWq1W/yywgewFg+ZMEUF1DepGkX1Efj9zznn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=hDWtmkdR; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=hDWtmkdR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 59B2A1F457;
	Thu, 17 Apr 2025 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744901242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BFq+EHg7i7I2O5w2gzjhP+ZSUUnL6KrRQOQmqXhFvgg=;
	b=hDWtmkdRujW966egjc13GBtxE5SSZubnj8aiexVajP++Yq53+or0f8j0E3QTaNV8IlvWmJ
	f5n5mKlLshxIxdjnr5fnNpNg7MTaXqJjpUz80MHjRBqJ69Z/vSE0O+xdm9i9R6iSDS6HNM
	ClOi1pw44fmm0M9TmVZ3KLtXeWv1JcM=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1744901242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BFq+EHg7i7I2O5w2gzjhP+ZSUUnL6KrRQOQmqXhFvgg=;
	b=hDWtmkdRujW966egjc13GBtxE5SSZubnj8aiexVajP++Yq53+or0f8j0E3QTaNV8IlvWmJ
	f5n5mKlLshxIxdjnr5fnNpNg7MTaXqJjpUz80MHjRBqJ69Z/vSE0O+xdm9i9R6iSDS6HNM
	ClOi1pw44fmm0M9TmVZ3KLtXeWv1JcM=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2DAF4137CF;
	Thu, 17 Apr 2025 14:47:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Z5cBCnoUAWidWQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 17 Apr 2025 14:47:22 +0000
From: Oliver Neukum <oneukum@suse.com>
To: keithp@keithp.com,
	linux-usb@vger.kernel.org
Subject: [RFC] adding support for nonblocking reads to chaoskey
Date: Thu, 17 Apr 2025 16:45:26 +0200
Message-ID: <20250417144719.182160-1-oneukum@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.60
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-2.80)[99.14%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

In general drivers should support nonblocking IO.
This is intended to add it to the chaoskey driver
In-Reply-To: 


