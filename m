Return-Path: <linux-usb+bounces-37658-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPHvIVnsC2prRAUAu9opvQ
	(envelope-from <linux-usb+bounces-37658-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 06:51:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7A577475
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 06:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89CC13049665
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 04:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC3A30648C;
	Tue, 19 May 2026 04:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qkf9q3Kj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3AA2F0C62
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779166288; cv=none; b=izCZn8QFH3aRZPSjzMhbocI4TMkMIXWUGXMjz+5FEF93VJXDQavFhHTGn0TkCO0f+hs8TZ17Ag4uuQ4/n500TygI3enndKuV4hVkr/Cjhu4FJViq/1XZBVdhlCCS4f6KzsR/GESD/e6x7GAd9a3joJLQctb/M+G1ApORIDyQsXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779166288; c=relaxed/simple;
	bh=vl6OcGcIR/dCd7Da9O14tCEMolLBByTvMkuSmE25wQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h2wLyfRAF98vBfP2ZxOm3XiEqodoZO5kNQAyhm7ZyBXhfh8Nw+AZ0NwqckSsmU50gitbl57jdFdr0uqyx3/GX8nPG6ePLCQ/OfxM/q3G90LmfqfkspL1ZimmcaSqFvV2moBqBykFMww50/MOmoQVJfmYDDX9spz5FwWJa7ifTxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qkf9q3Kj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso2124811a91.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 21:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779166287; x=1779771087; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXU6DiuUIj8+jBSL54XELS9+e4St23qQU2KmGdZGluY=;
        b=Qkf9q3KjEOhEyl5xOHRtcZN/p66/ER/04qtwRe4qCnbeK51pswaezRwcN+fyeTWDP1
         8ymj8FcQasXgguWPOowMDkkgt3ieoQXjHnEOiLj1v2pd+VI5ips6cXLTn2icLoN9LC1V
         aSwBMj44WXnTNBqi9o1xdlTDP6hC8oByAO4Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779166287; x=1779771087;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXU6DiuUIj8+jBSL54XELS9+e4St23qQU2KmGdZGluY=;
        b=SsUM2U8GaGiVApOd6L7FK7kLVikIL+sNURU2BRKonI4YbVKwMwIUvk/lgr49lchapj
         x9+flRu/fMLy1aVd0YwmybloZjpjR65DA0uG7ZAOyWCmwWTZ4fD0CrdPuCdq3N762lf3
         QMHiWBbHdOI8rH4t9AcEDDDZFOh9vRiToEyagAZTpHRu/ztSdq1A9iihn62wiBy2W9Ao
         UtuNKG89EwJyr7q3DSfbeSQFN5H7qcDOWu4XDrt77k/3DOdSfPo4WZZQP/Q8hCqKMlPv
         DPd9XX4Qt1hVtjNyM/WL8kGIYgP8kozGTP+huHE318EaVunvjQyxBu+ivKoVAMJrabpC
         tOcA==
X-Forwarded-Encrypted: i=1; AFNElJ84jmgySgW24XPoIWLHpEaikOyjzzlliEg5U77m5gO6okTZnec4OP0SrUMmkTR45VJuc+WjO2L2WDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwzaCIf7W1Rp25LAi1/THG/wQw+IIXKCnqnlhMiZDcUvq+wHDK
	A8QbHfRnOAy+mx5PX4iJNiFBtxNrVNwWLIHuYa2MY0WreTnLdmk3Oe59fczmvnAkVQ==
X-Gm-Gg: Acq92OFkICIEs2FJKGtLUJ1C7OsK0U8r0CTnTO1qghV2FksoC/6w/gtT3BLiLo8ZPt4
	d0XRlFSQIMgic6tsiuOXmUsdAi186s/+TkuOfhEo3LC4MQhrFU3Nn3Ar15RMwHLWWAmvUZpXsdd
	hmCzKMkx1bJ4DNN6F6UlfNC6sNHclOPnpTKmP9Sib2mnMe/4LxVUJ6QhpC/QfFKgFAiadOonH4y
	uZEsQlWJmwu7AQjBj9dRUF8H5DYlrA/kpsi6RCHmStE0JYqzQeB17v7HJFKIbOHtIIohUUB6JM4
	MUqeVfPWdQLUzevfP68hCdWmWn1XsHQl0r67aNz5XGLjMMOOVr73lv7AhSknroACJK5sWdLK9HQ
	mz07p9659C9yvZIQQqC5a1eJTxpuIZbHVza7mJApPWGEh/hLBR8GufMaYXg9Vt3a2AI0ZkpMk6+
	VJcmQGTogvSeBdG/y1ebc2qAwH+Yp2zIlPNr22pd3XTzyJdcCcFUBLHD73Ubl0ER6Y4Ukif4mI
X-Received: by 2002:a17:90b:5708:b0:365:8fd4:925c with SMTP id 98e67ed59e1d1-3695149986amr12846915a91.8.1779166286830;
        Mon, 18 May 2026 21:51:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1f47:18e:5352:a11e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951437316sm12821578a91.11.2026.05.18.21.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 21:51:26 -0700 (PDT)
Date: Tue, 19 May 2026 13:51:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [stable 6.6.y] commit e613904fa419 causes suspend regression
Message-ID: <agvqqMt9x0df-WXS@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37658-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EBF7A577475
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

We've identified 6.6.y stable commit e613904fa419 (usb: typec: ucsi:
Update power_supply on power role change) (commit 7616f006db07017 upstream)
as a root-cause of suspend failures on some of our laptops.  It seems
that ucsi_port_psy_changed() causes:

[  309.858915] PM: last active wakeup source: ucsi-source-psy-cros_ec_ucsi.3.auto2
[  309.858917] PM: PM: Last active Wakeup Source: ucsi-source-psy-cros_ec_ucsi.3.auto2

which prevent laptop from entering suspend.  Reverting the commit in
question fixes the issue.

