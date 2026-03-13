Return-Path: <linux-usb+bounces-34738-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHODOU31s2nYdgAAu9opvQ
	(envelope-from <linux-usb+bounces-34738-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:30:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 667B22823E7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2105A30734D1
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 11:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D77B382F0F;
	Fri, 13 Mar 2026 11:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCp4F1LS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF25131E85D
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773401411; cv=pass; b=d+TF2nXeVyTI5oe74teXb3cNdlpZY4z2th0nJab3ZYGXewUb5QxX5byWMoAf+N2ZpHQPtLugBHFqw9cZDvsbcXTZN3duIjbINw0r/pXFGkCfWzA9SF+T0I2KMCg1vw05/sw3fuArwEwqGVSMFfkn2dSODaPw4q8RmKcI6asa+58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773401411; c=relaxed/simple;
	bh=GMI1oAF3CS6gf3VOX+enFsu3uz+Fi7O7Wn1pUH8gGTc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lgaVj8abdq7vwKJw18jo6aqoKjEmTK82GiWdP7ianFqcxHIAvBHm7E/JBEhoyzZHQrJNerqebLD3iA8QKR8XZ7VpWfSy7uxzNLeMaLP5bfpqeoNrYlEZOBGl7RSFonEsLkRroivQCCWVtuu7357Ox3wm8PTVSRDHqoUi8xDneq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCp4F1LS; arc=pass smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-67bb19ac35aso1714531eaf.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 04:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773401408; cv=none;
        d=google.com; s=arc-20240605;
        b=jULncNPMBklWDvolDjkZJa2XcZTEIseY4Zoc3rCkGCKVGw2DX4fsUvRP5qBdBxouSk
         Ly6eOkNzT1T8iKYlqsR9vpNu+gtdr4lwK80PEmg0QcSKbijjK9JW+anfczC8yluk5Mmc
         +UqAteuxv39FXsqOgiC39rLCetKfqmWUN2TOIQ649ebDDt40fEVWvGdMWMSZp15A/brS
         2JepDWcFfhlnHlWcIeSxMGxE+eLYi3ZR63U6/JwahYj+PLk8DJoidrQGetzeAeJXpMH0
         K1UdIh4OjUG9+ejGQU3kBjyHhedLUfm92LyFWPh91JUalpEryOld/7A0VZGkOpncCYZV
         eWJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/cN4DzlncMMapwc4FVZ2D9aYTtKBlvAAh1xdsNqgIaU=;
        fh=hNQ6fdDUCMJqXvPWEyN8HMRDMwg76/LnkBrPgOb3dmM=;
        b=AFgLzPcliIvdQz9ERPaWdC2EjHVND3A8sdQguCvxHxq7yRnhbqHIB7qZcmbi83dy51
         5Ie1AJWTqnZ8fTniWzNBqOh9RzCvxJTuONdzvEbnINTXxnG0HGJdSuU0pp3FXuuUrNLj
         tMPw5GZ8W10SYTAIEPMNJizuEA5lTlmreLb4pkBSWYXj0YeUE3ipeZFO8OgYx/dcpT1C
         06dDq/wITyYBeQ5rmKtOCQtLa+JtITGaL2xkL3Jp+rMcdhSemB29mrd47mLEyv8MBcmQ
         JyA8yXzIkhZBjLVI6eWQwyFfmsIIwSyCYUYLVI8SRAp9qVr+d3rGazkNcu6plGwCm/Es
         1K5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773401408; x=1774006208; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/cN4DzlncMMapwc4FVZ2D9aYTtKBlvAAh1xdsNqgIaU=;
        b=kCp4F1LS7/u5IhbZkP0RJpQgnMHq+UgFPBfrcNISCW1nYjcW+7POseQQdzbZd5/zTH
         qQ2hJTRpLmfLb+WUG/+l68GyYTlmNZMeM0UCVTVKix6td5IiVVNeZYrsweJ04Ry/gu0X
         jE9tdaQL47Ypm34K3KPZJBje+kV4bvWdZr2COyqYpWmh7laXCW5dwgYXIPv1rYzvKc87
         yadnBo09umzhd/xsSwcisyhlaV1bDTUi3CosdUW5iAoozrk1R82MQZRBnNh22cudumNe
         8IQkC2uQUarJ8m+Ehh2EMKFBo53qe5PuZQKIsFACisbjuK+wyOUMLA0yvg++2tetYs0W
         ljpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773401408; x=1774006208;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cN4DzlncMMapwc4FVZ2D9aYTtKBlvAAh1xdsNqgIaU=;
        b=O2ibl93KHYrAle90iuA5wd3jEl0gws8Ozkcw+VnB30ximjZxCeuElx73nSLFQRtcFv
         GPsuIIIRZMftW5fdjdFWmEM/wXWTeu74mOqf+8+estvNZJCgAk8aNf+zyaZEUWcMEsI1
         8N8QhY/ragA7vKDn95ZqELL6b6TeCzjdhKnl8DaQyHCcVxLB3LwDjT+GT8YAqQrKEyT2
         hphItP6zZfiNNdt2SfZSaG8uB64NOocpmHi5451rt0WYUE5Pu1fqHIsBO+NPCjKkvU8J
         k7pPQghcRzK0HEWr0Mza199BHFhAaEPWqaHzA2IxwTVXs+EXJl4O9O9UY5bEZF924Q0y
         4Y9w==
X-Gm-Message-State: AOJu0YyL/Ri16LVBZqovjrzGQMYZD/+NBJt5UT7H5CecOLTNftflKy/d
	LMN7BR1eNcPaGt0iedXKfeYAqlMTQ192BvRXvSGT9Y++KUm7VoW08VwWwrV+xHVRWXkMqNP23Dm
	NI7u1i2VBEHtNwLtBYpEWkUaveat4U0XIWpoL5Do=
X-Gm-Gg: ATEYQzynl45ip1wa74uFsuzY/Fb6DmbzMR7PzyPqpm6igzwiso9C2vlB47kcREgxTC2
	ChY0X8dKgvuj2XLqUqgFTLRKbgcPmlcNFZ4sxKlbxj/EttM10Ovr46YKvgZudgkfqoyM/NRIzyi
	G2l2k0YU0oyQLlskVIzbkUiHdsCVV8NIP8LKiK5wISz3AulVa2mnr4xn0T5QZVQdzhTq/azXmlN
	Wf63b3IiC7GjkACcxP7VpfCw+UEG00cWhm4peYeGy8BxHkI2YgRfTuWmFPpBCYYtKjJvHxuW4/v
	LxI3ZdjpF6EFt6fyljrB+7wuTK4UNlLyUA4Bv3/eD6NZGwO/qzO3KFXiNcGTWGRbWz0Tcg==
X-Received: by 2002:a05:6820:450f:b0:67b:e28c:d74b with SMTP id
 006d021491bc7-67be28cdd5bmr218195eaf.25.1773401407857; Fri, 13 Mar 2026
 04:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kit Dallege <xaum.io@gmail.com>
Date: Fri, 13 Mar 2026 12:29:56 +0100
X-Gm-Features: AaiRm531ZLlFl6V1F_9Ss9rGeSeRxXlezZkSRY1lbQNvHU0H7Fra3jVa_5ZRhlk
Message-ID: <CAAZVx99U8a4w7cZihEyysaKD4R=pgXs4fKEegmvHv0Q3avJg7w@mail.gmail.com>
Subject: [PATCH v2] usb: typec: add kernel-doc for priority and mode_selection members
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34738-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xaumio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 667B22823E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the priority and mode_selection members of struct
typec_altmode that were added without kernel-doc descriptions.

This fixes the following warnings when building with W=1:

  include/linux/usb/typec_altmode.h: struct member 'priority' not
described in 'typec_altmode'
  include/linux/usb/typec_altmode.h: struct member 'mode_selection'
not described in 'typec_altmode'

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
v2: resend so From matches Signed-off-by (Greg KH)

 include/linux/usb/typec_altmode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/usb/typec_altmode.h
b/include/linux/usb/typec_altmode.h
index 0513d333b797..c7cfc4629484 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -26,6 +26,8 @@ struct typec_altmode_ops;
  * @mode: Index of the Mode
  * @vdo: VDO returned by Discover Modes USB PD command
  * @active: Tells has the mode been entered or not
+ * @priority: Numeric priority for alternate mode selection ordering
+ * @mode_selection: Indicates support for the mode selection feature
  * @desc: Optional human readable description of the mode
  * @ops: Operations vector from the driver
  * @cable_ops: Cable operations vector from the driver.
--
2.53.0

