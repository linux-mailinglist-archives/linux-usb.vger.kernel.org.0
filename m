Return-Path: <linux-usb+bounces-33494-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BiwK6gAmGmV/AIAu9opvQ
	(envelope-from <linux-usb+bounces-33494-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:35:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10478164FD2
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 994543026C36
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 06:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37EB2D8DA6;
	Fri, 20 Feb 2026 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddH8H9iX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C0129BDB1
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 06:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771569310; cv=none; b=FzUuGnvF+29rzkPyB2uyisXhfoe/thzmjcSOvfk9VFcGelRtCQ4K+K6XQoW9gkOMpdITfAhlQQuAEThfJsDUslx4FURxRPmcNFqgbaNlOWDXITIz41/RqTbhU6LoedTFCzxYaH2TqX65yfDraS2WokfdG4NY1xOAGt6GVmnvmKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771569310; c=relaxed/simple;
	bh=Nq40B4GPQRK9L7GGKbBEWWobb3qD2wWSviajMqkpPR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFjyz3NolI/qHbhMsm/PuxG0a/JUvUnP/D8llX4oyyGLg0kcqlmbUpcBDdnh6o7EeDRJeAc9lxnMC+xAN6iXKuBtPiqTY0uIkQ82JpTp0/qidnfD4UVbDcegl244XZtavhUoWx3QWyes1ulTHMsz3IbjpxCl87GWuoOn5D9xGAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddH8H9iX; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8954c9daaeaso21764926d6.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 22:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771569308; x=1772174108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nq40B4GPQRK9L7GGKbBEWWobb3qD2wWSviajMqkpPR8=;
        b=ddH8H9iXvYXikBOGjTnu5Cd2ByaNS79cNvlnLELWXhZ6OvmyPc4cXtlKXCsZzOA3CJ
         w+VYTCPnGKuvkabkCopFztD4AFS1K61hK3dHKGlPuN4TyDYxLG4LFutgWsfisHd2a7cl
         uxAk/y9EJeeNUhWBnzZAYk8eFfJJA0K8Y+YXr9syhz52eE5CsBSEhps4pZDF2rJ25Pe0
         fWI0FDT17vCg25I5mvytP2IBKh+gB7F/fE6NhNjpdYHHpn9x1LSFCtDNAsAD21u4rSX5
         0XhRQVPoB4ZWk50QqxWiwMUGwgyGimqkao+NV7zojBEunOq9PZHLGqPzR/mD8rlQ729A
         GW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771569308; x=1772174108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nq40B4GPQRK9L7GGKbBEWWobb3qD2wWSviajMqkpPR8=;
        b=cgHwl6If7/0OAYNAtbsDEK+M8SdST2zrS6Op+PNLDWIosBfPfdMenh+YqC+E8utriq
         IgzIHgyfU+hroOA7TR5oIpnG+3D8feXovQVkOu7zZxp36VO+Eb3Fb9emy+ZW/G8LVAuu
         1+savoNcb09lCBHn9HYH1KdBRakXG2Bnhl2WH8N9O/YOsLzPcclEWLdjSw/Bid+Jwz4D
         rg3O6KJyGTLUqqJX5D5Qf41lZBopcf5km+7/+TyuDOL39W93NdVUBJvcnPCuLF7MvUGi
         +0Iek7NDhq70o8ppPCg3yZZaRJA0v09iEcOSLWOSwyXkVKsQrG5zLogoLaGp8HnJO/Au
         o9Iw==
X-Gm-Message-State: AOJu0YwxSo9/g984hPWa+6SlDbHNYcLrD3le9WxbwOQhPAsbEOH2DnT7
	imEhl456JMyl9oyl/lG5PlYxtW8Rg18ETD+fxTrJ4YyozgdUyX/0iS8O
X-Gm-Gg: AZuq6aKKYmXkY/jYi9ZU9zvY/CYS5EDM28zE5DyJ4ZArI4f3NPDEzxTmYtXCMGv2EOW
	/OYOEXo5U8tcxjv+AZ5Q/F4E7bnvgwHm8OaPgR01rc8rPYNxqmHukjCZg60d7m1a2nUS6ae0R75
	dI+XMtq/rh9Bn5wB0DWZ5kaMpu80zmRruEDn8188NPR6gZSsDdfjFwflYKgvm1VLTD4/Ra7rKXz
	jhLx1Wn5M571dGWazg3VFh6iiLPAtc7hSaiU2a7OTTetRwmvQ393peMqfSbGth6akjRB4YT3+V2
	8XDf0GePwvQM2DgK6/asJCXzHnmVJguZSCJpBsJ0XBeJqkEVP9BP9NlSDxdLrtXjpaBGhavyApn
	o9UcDKPBcctAiqrJkCJrqUGjTB+KgjTDCcKQSQoS1iXZHlBR0r0RiYybdKS/BSTvZLBBb9OcSUj
	lpFv27PubA/aEWG6C0yhSaHxWqdYRP/dH3y1zJqZHruqg2EqggNEclbNbHdpNb0v+TSUW9rPB+r
	UyenB3oBneHkiBjfVQ=
X-Received: by 2002:a05:6214:1bc7:b0:807:8020:1055 with SMTP id 6a1803df08f44-89971a5a25cmr7767956d6.37.1771569308191;
        Thu, 19 Feb 2026 22:35:08 -0800 (PST)
Received: from localhost.localdomain ([129.170.197.81])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc823a4sm223420606d6.8.2026.02.19.22.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 22:35:07 -0800 (PST)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: mitltlatltl@gmail.com
Cc: linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: add bounds check in gaokun_ucsi_handle_no_usb_event()
Date: Fri, 20 Feb 2026 01:34:57 -0500
Message-ID: <20260220063457.3672-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20260219190251.3422-1-nathan.c.rebello@gmail.com>
References: <20260219190251.3422-1-nathan.c.rebello@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33494-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 10478164FD2
X-Rspamd-Action: no action

Agreed that UCSI_CCI_CONNECTOR(cci) will be > 0 when a connector change
occurs, so idx >= 0. However, the check also guards against
idx >= num_ports. UCSI_CCI_CONNECTOR() returns a 7-bit value (up to 127)
while num_ports is typically 2-4. Other functions in the same driver
already validate this -- gaokun_ucsi_connector_status() checks
con->num > uec->num_ports at line 188, and gaokun_ucsi_handle_altmode()
checks idx >= num_connectors at line 295. This function was the only one
missing the upper bound check.

Nathan

