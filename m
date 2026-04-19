Return-Path: <linux-usb+bounces-36320-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFuDC80e5WmkeQEAu9opvQ
	(envelope-from <linux-usb+bounces-36320-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 20:28:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3ED425140
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 20:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD674300F5F2
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 18:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3CE2E7623;
	Sun, 19 Apr 2026 18:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="adXGN5VU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2097D1A9F9B
	for <linux-usb@vger.kernel.org>; Sun, 19 Apr 2026 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776623136; cv=none; b=AInALGtxrmc8oIofaYcFPcBp9kW13De35tiz0BwX3bFtTD9RdT1wg5ybfSX1d11YZG1XvveMfdHN0q5dFFhKUzYy131FcJXeMpVNxfcJr/JcuNbWaTjfII+zsP92CkolFiw8edvL4Bl+fLwu4fwIDwC8hIaFGMrXkA8A/57spPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776623136; c=relaxed/simple;
	bh=N4EDej4qSuztuncnNEintIXs6Kmf4PCZf7If4QpiTRM=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=BepmHftFG7a5f0yRzZjLR5BNua9AxWYeFjYqkwL9kmi+XU16PsE5qkltyuOZOkoiUR5Cd9MQcHVZNzg2vW23kLMvpuP+CZTq8hB4GaqCfAQgwEtUTyfrsuShUereHRyHtZDRETKYPsD2VkO25mt6FoLCXKJXSI+2zu2fDIrUjqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=adXGN5VU; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8a3970f1a0eso29406766d6.2
        for <linux-usb@vger.kernel.org>; Sun, 19 Apr 2026 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1776623133; x=1777227933; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N4EDej4qSuztuncnNEintIXs6Kmf4PCZf7If4QpiTRM=;
        b=adXGN5VUq1G2dJPy1cD+vb5eT5g3UWfpejRa6ZaoEHf1/8QjcqUu7g+nzm65XnGs/b
         5f/hWDYBsPRJLYvBYODbqZk9x2nsi3CTR+X4tXT5R8uxU+lXWEXtwvHo3Zb1MZbc1z3I
         4Ry1ZKfZQ89yQ1qBtOsg1KsRxoaATyMLKZ4rE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776623133; x=1777227933;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N4EDej4qSuztuncnNEintIXs6Kmf4PCZf7If4QpiTRM=;
        b=Z704Qfu2wlzXGXoZxNjHGikFzA7ttfzQbLPpixziVGyGvSz2t1QrjIo+8T7LdUDceg
         OrsU/EAdGzWb8CkbxcINPdwY+tF2lp4I30aME0Q+Wkn0TelFlkdt0tLGYuCpfs2PU2hR
         Gft3pCs1yw5dUK459iRxFoKlG3copJax0NlmHNM2+OVwZ9c2tR32ih7LwFYemH7cUSFX
         WnKavNl9PR0kkkCt3lybNQslKL/RB2eDqFNdoXRWQsgqJ0UyGGWaS5MWrHhOeeXt8ylJ
         XshbQ1twao8g95x3epbNCYW2qAawdKu7/bHM7T0MuyPpipUgoNR99bTTZ2/jAd2Q7KvS
         oHmA==
X-Gm-Message-State: AOJu0YwgPn3iWFTPq7fMQsuMVcbSbEsgYhGMP0FYgMm98cawbD0uaXoC
	l6ZLxg3IoY+x0/xlRq6Y6sdcJqN/xOGm7oji8JT8wzdsAPoNAoGNkIDi77mLJvi/G1kxcVhg5sQ
	SPQYQWdMI20HdaU4j6ltIXI/53gPVCMFasTSwgdEN6iBtB1+tuzrMtQ89fUs0vEwhP5MMSgfzCt
	60rn0eT+a2FAWWzPMiKqIelwBqdFGe9YeLmRnRKgY=
X-Gm-Gg: AeBDiesnCxPJVPu2EmzwdiW4ELaUhqHwXxRMzyrl8P+JJHXNdohkACeLmWqLKhAD7fV
	APzwQXlh30PZRCNWJQvV6+bLUDLddYPNfozuTRBFEQVSKXnYCoQiA1F6nEzPK7mTlZc3I41CODg
	xONddNoCb7H1exUTj7qDzYTV9bcKxIrxXyvUrJqpQXZl7Nu/rFEt3Fnb2H0+tL/OtMk+qG8ureX
	ah62I8fJ3F3TLklIiOf7qpyrueIDSi/87JjmjrX6cczqvp1MYAMJnpVFE5nav1hxqcYn4e1gqh4
	zNkHfuyBi23QDOdsNcfooNm5/bLPccIPZFUmDOJ2hKQjdKVrztKfu6KcAEm3GF/VGpSb/QN2J0x
	5Lp4oEOwM3rLLx6jZJQhLpoNal7d6+sSEew3TtrI/5asXPbFG0EMJuD8jfLkZq2TYusrcinU14U
	wVylH0TzOYkQ3fSzN75GlMzKveSdlaS85fNg==
X-Received: by 2002:ad4:5de5:0:b0:8ac:a553:529d with SMTP id 6a1803df08f44-8b0280d201cmr179615676d6.23.1776623132696;
        Sun, 19 Apr 2026 11:25:32 -0700 (PDT)
Received: from [192.168.153.215] ([73.29.38.247])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae97347sm58920246d6.41.2026.04.19.11.25.32
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:25:32 -0700 (PDT)
Message-ID: <935d4557704d963475364ed1fb033c20e8bb7cbb.camel@ieee.org>
Subject: vhci_hcd: bulk streams
From: Cristian Cocos <cristi@ieee.org>
To: linux-usb@vger.kernel.org
Date: Sun, 19 Apr 2026 14:25:32 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36320-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristi@ieee.org,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C3ED425140
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As of this writing, vhci_hcd does not support bulk streams. Are there
any plans to enhance vhci_hcd so as to support bulk streams?

