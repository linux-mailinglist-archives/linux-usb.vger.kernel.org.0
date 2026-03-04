Return-Path: <linux-usb+bounces-33953-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPHWB3z3p2lpnAAAu9opvQ
	(envelope-from <linux-usb+bounces-33953-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:12:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B84291FD576
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E531D30A6DFC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 09:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181B83845D0;
	Wed,  4 Mar 2026 09:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cvs5XUBb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982F23914E2
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615080; cv=none; b=cO9sRnyGTb8s7qIVQF3U3z2ee0L0dw4R4iwcoeTeGPb2aZkoB/j54nTJ/v6FTWXMGKK4lsBd73eOMHBqNWVZ5SfB85n9j4d5qpv45A6p6qclkRGGKdLRZkxqpljclX8EqnadnvFz8l6fkt7AXpQlZFRG/WCNiwhQ119QDG4iCTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615080; c=relaxed/simple;
	bh=cjlqw66ZCYKJklPuy0cnk/Q74c0mTFKWUE3TU4Zpzxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SERr7rq3Jf8GjY0Z5SCgEl8cSi2dUmONxbqG+RqJCgOlI9Dj+Mv+i7BApgLz//9+gS8kioxVkR74ltX9EAn01mKvmguCFzsP7QBDFQDXcNjSs3L4KFLe5FirPCQu/nDAx8nvBIC7tXhAtNR2zDNbmJTgrIAHDHeHSlKsnbCIWdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cvs5XUBb; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-8274843810cso3809016b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 01:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772615079; x=1773219879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MA2Kae2LZw/5v8o3dz8POaX4QQD8BHSG9UQQmMGQYfs=;
        b=Cvs5XUBbk8VEfeA6wjdRnGsUUgDIOcrwbvoiXbTVh4gKe3z7CLnvdixdorOTv/3p4B
         ZG89H8sCA2DqN4KDBqupmpfY7WhUZmWhTmyrJiIFFNn5vwIRI7/iAivTgO+1f8v+R82G
         yOYJjU2iflXspq2P9YSsCFsYTpehBV315KN7w9dkmYyzolStSMO96QHDXKN0RQymsgKY
         H0rhzWvTKe2T2RzVD9jqUJ3eKg+S6S/5Eli+HWj+v6tQ4144rt9aqLPXW24jT53iJKa6
         yiCWo//awuZJXgD/1l2h6E5g9xBRLU+gTizKrjh4j5qp0MfpjSBJQxrvRtZDKSKp8zJJ
         pKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615079; x=1773219879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA2Kae2LZw/5v8o3dz8POaX4QQD8BHSG9UQQmMGQYfs=;
        b=BfmCVfTngwWcM37GEsPJXuiqaZIb+PF3UXwWMWMQCaC5u+TMUd1XPQxWC4RiWX9tXb
         DYz4DU8pXfaN6ZcOY8elZBy6/8Mlsjd+zrUphm0BPI7QahkecmG1XAith2m/ziS4Nqmt
         Lqz9XFshWSIlPlH4cke9tfD3bLwLwzz2yxKlO3bxpU7mjS/l04cyaMGa6RhLFxPPLgPn
         EjnbggV2bct4sTAntqXnMHNwCIs20bM514kT/LOjKZv2mjlCVm3yI9BNMzAEmkZiyANB
         CmdmltXVusSHdqzefR53FcfmX+d0g4fPmXU4E4ufq8D1MdZhzd7Zh9OiEmgkXFs8jpfM
         WKqg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Mm1Z2DUVQYA/GmSdQIBNCQN90kSYFrb4YjHXD4rtisQHYGM2Y3GhbffFK4bMVUbLJ6S7T5fDk6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhvxM2j7sLMaR7FT3wvRWF7SjSc9KONMhGMifyrh4dIJ69xC+d
	/EOVaNO8I5tO2f97M+FR6D7p30/0q67O0L6M1BHw5gj/JIuJp3mTfTmpUr8LtLPli7g=
X-Gm-Gg: ATEYQzxlxpcRpelB6ClIExRer3kcTxP4pynbdnrBLH2vmvsB0cTbsFgnZ/a5s/QqJYQ
	ly2V4Ovv6FXDUtoB0RS6KaNnCfx+18J3yIv7vLWxJ2udN90YrsEGMF2B21yj4RcyQH6xZP7WNuY
	co01hzUeztNaJjk/CYK+jhDL++Oaex7IlNBzw5GvV+/MhgEmRcKEyDHO06b+uxePCZ/H0VOM2US
	Ck5CEThKPqNy2svyaNvd8xvVIzakMbWsMpx2iXzcQWKvt8sxSFG2l5z+LeSGKeZspptBJv3ym1W
	F9HloxkJ68LW82LGys2U3vOLGXRaum/pJ1KzNfNRafHs6j9ESqPz/5V2xI3J2+BFVUPzdKqkGcV
	znu2aOws2l9pA8bPHlKq0WAwF45Y6tVo5ucNa2iU6gvTaW8IZC/Y6MK3BHY7wrTRZ65lFRja5bN
	+KqZyicjxmp1+KXC74Gerd+2fYzs5Q/lwfBchGReobX0LfwdFV50cW7imjt0br9iuUVNkL8Xzxk
	jbI4N4=
X-Received: by 2002:a05:6a00:1824:b0:7f6:4922:89c4 with SMTP id d2e1a72fcca58-82972cff3f2mr1143780b3a.55.1772615078885;
        Wed, 04 Mar 2026 01:04:38 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff372fsm18070598b3a.31.2026.03.04.01.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 01:04:38 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: smatch@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: Smatch: False positive in __dwc3_gadget_kick_transfer()
Date: Wed,  4 Mar 2026 14:04:08 +0500
Message-ID: <20260304090408.36774-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B84291FD576
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33953-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zeeshanahmad022019@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Dan,

I am performing a logic audit of the DWC3 driver and encountered a 
consistent Smatch warning in drivers/usb/dwc3/gadget.c that appears 
to be a false positive.

The warning:
drivers/usb/dwc3/gadget.c:1691 __dwc3_gadget_kick_transfer() warn: missing error code? 'ret'

The code:
1680:         ret = dwc3_prepare_trbs(dep);
1681:         if (ret < 0)
1682:                 return ret;
...
1690:         if (!ret && !starting)
1691:                 return ret;

In this context, ret = 0 is a valid success state. As noted in the 
comment at line 1676, it is normal to have no new TRBs prepared. 
The return at line 1691 signifies that no update to the transfer 
is required, which is a successful "no-op" rather than a failure.

It seems Smatch is flagging this because it expects a non-zero 
error code when the primary logic of a function is bypassed by 
a conditional check.

Best regards,
Zeeshan Ahmad

