Return-Path: <linux-usb+bounces-33617-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKgAN+JInWk7OQQAu9opvQ
	(envelope-from <linux-usb+bounces-33617-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 07:44:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 451D9182855
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 07:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1CDA3069AD5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 06:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E0C304BB8;
	Tue, 24 Feb 2026 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqPvVpfY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167AE303A32
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771915479; cv=none; b=dWboQ4d0M5rM9kZ0c3YUHgYVmPZuP5ctkBwyGl+vQHXFru8a8YvXZV808EKfRsy6Q/ZtYD4BbkaJtuJfX1Dt84a/HmlVYA1eM3HO/XjMHgo88j8Qf7OgrcS8f4SxF8fF2Spk4QEEgEvz6erseK3I5yCbsGXwdV65yf7l59PhSBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771915479; c=relaxed/simple;
	bh=/+UE2MdC/Z98Gw4ktgFVgpkHLwDCLqq9BwXUszP2DsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsU8qGQu2EkwlsXnrdQvdgJPH4nv7xtrtVIUi4BNawmGBSK3RrUO9vmlFimrzWWCJwx/LyM7v8/lLWhY5dI1I7mHYZaTJd1pMxFaR+NtGBpMrl+ZIJlyY879DH+aJOaypDZpSwylwLPJORjVXoCIsGoU4L4jyVeQhZF6p9OyN0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqPvVpfY; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a91215c158so34160275ad.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 22:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771915477; x=1772520277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AYD+S/OiWSSC/r1ggCFAOv+uWX9aAv5ZZhpGGUpWFM=;
        b=nqPvVpfYRReSwKXp41H9JiMM90wrHCUDRjp6fXkU7NQ+xZTc6xNwU+B1G2+jRCZRha
         4xMl1V2uFABkvMaldreY5CkwmFFrsSmvaLw5wWJ88PLIMEPI28EPUQiUZedyCY70SM4j
         hw1flZSYRgntbFQnS+v6xYbKkzJe527YzHhC13DeS385Sw66ULCLMZOzwYa0/oQN6qHV
         0MILk38UtC0yYKg4tlAV4nVayZHvZvMVtgrisdxAmlBlihV6KLWL3LFA3x2XtY0v7MoY
         qQiRVQEOUzHyI8JYqzNvvDi9PX9uI+Rr0tOdSChJuXJfAE4ujl2Ih2vFhCJUcWJcVHpv
         yAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771915477; x=1772520277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+AYD+S/OiWSSC/r1ggCFAOv+uWX9aAv5ZZhpGGUpWFM=;
        b=h+kJssZxqivSLdy1E+8xct+ApYnmLsZh342yyz0lk+qtVn4epcnErG6SddM/lgFebk
         kEOWZ0xJOn/Rsvjfuxvrjh6IZ1SJIbN7xjJjwQWASd+AOPn53usnRyqRCbONwL0qCZg1
         HuVmaqU9XaZlVI71njGaqiZDhQhKUjswSoQm6RgE7HBC+462jUpsfPUDewbKE4blsbR8
         tWixxaPxzppGgXlIQg8o2uIl+UMBKQArkbnNIoiNBBJhVwr7qWN7FHTKKECuzMju1yme
         fMP7K3iiyVS5HzNSyf2cqnvyU9OKO11W3/fw410V/yKlTEAib0a83aeSuXp7LEjg9nCX
         MjCA==
X-Forwarded-Encrypted: i=1; AJvYcCX/v7o6UX+jjl/upMsbOMLJwlsVq49ooVgDupj4sVWOqaEFqPNTlSs/YKijbZc+b/DsT7ZQI1wzKB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRr/TYRw/iGf2lOZkJUlvcUFaxEOnKXVQq87bcfFaGMiiN8qd
	FgMjfi2wWmAKw6XgWCR3fA6tW4e13O56eO2rUFEdUAMa72R1DZaQ0lDy
X-Gm-Gg: ATEYQzxU3ZnWgGjq9IjX+pvlWjWEJUCmtiM10KvUgzC/kAMfQFxLGb7IpWtY92A6eOu
	cvG0AAK/2a3mDfugDzDq/ji97pJMXY9P4I23MFEUC18jFwLyKa5pSUlv+fZ7Lq6R0+kEuTpY8mw
	UHFkds3vq2QmgoLXC7cWFFCvWo8G0PPYSEBF0TTkbE+6L9/bcsYdeMlo0g11gJ0WlNHgELruFKQ
	pk2QbkVSlVAqY7uCShOSerAsOquwFjJNbycguyCDlZWv+2dVFoSinhltPwaInH761CP+e1V0cFh
	4Pi3NYfMj3h3koKLdaE/85rGawQQsk3mboBoz0Wmub/HxTjyxWzWno/jN2qN1Gtn2RQ6gEIusOa
	1K9bsVGgdGBZM9HoqQqDrFi7iIXidzZYCT3h7jX4hV4vlshnSvqEtMKztUa5XZR5wOtsTph7/P6
	ZB6ZHFTOD569Ij6QBFYlWj/8qZWyrGiw6aFYPwJCx3dyMf5i5oH0Li2WLBY+a7zohW0Vgo
X-Received: by 2002:a17:902:f652:b0:2a9:5f11:3a34 with SMTP id d9443c01a7336-2ad7441c3c4mr82580705ad.13.1771915477360;
        Mon, 23 Feb 2026 22:44:37 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d8e3edcsm12402391a91.13.2026.02.23.22.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:44:36 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Tue, 24 Feb 2026 11:44:09 +0500
Message-ID: <20260224064409.3888-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224004126.ue3nfgzlf66rayfz@synopsys.com>
References: <20260224004126.ue3nfgzlf66rayfz@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33617-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zeeshanahmad022019@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 451D9182855
X-Rspamd-Action: no action

Hi Thinh,

Thank you for the suggestion. I have audited the modern 
drivers/usb/dwc3/dwc3-qcom.c driver on the latest usb-next branch 
and confirmed that it contains the same redundant IRQ error checks.

I will drop the previous patch for the legacy driver and submit a 
new patch targeting the main dwc3-qcom driver shortly.

Regards,
Zeeshan

