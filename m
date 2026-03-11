Return-Path: <linux-usb+bounces-34615-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DSsHdTTsWk2FgAAu9opvQ
	(envelope-from <linux-usb+bounces-34615-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 21:43:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E426A17A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 21:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECEAC301B87F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 20:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC7538E113;
	Wed, 11 Mar 2026 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HtMMcnNx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564FF383C63
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 20:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773261755; cv=none; b=QAxHzFCoVnws3SOpSJLuWXYgj6Jc4RyWulX4avVLPuxg6RsZk7RyNOIaWlPQ4s50cCp+r9N0O8hrgW09OELdJwMlbqXOFUoGOl1F5ExS3/1ZrF9DQDZK8/mHPbrjaY1V/ldz0AIq4BaV4E/Mf9/8HFzdkXyJth2ZCveXRcxgyJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773261755; c=relaxed/simple;
	bh=+tMjwVtoIwPnEEENKr/fbMqHX+fXhXF+EjhZ6XLdk2o=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=SiP55HfDSgWG1JtOmwyRlTExP4MZcqJgmpU/hpgVIXh7aUR3tkdeOGHKyCwctYYBno2WT3tBkHfmdttVJZgdbIob9MF22pYVhfIqMQ95/4ZrcNgID4IMhfYvv8ZrIlSZ5+hMv3EtQnZK6NGn6wc58MEKAzrVx74uhsHOtHevtKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HtMMcnNx; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso224223f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773261749; x=1773866549; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GUWYHfXVEdpadwblxnNUaZuExc2YFi2bDkvDupR/6U=;
        b=HtMMcnNxhCXaGFudSQT/KuKB/uoOcJIRNEFqeBqV8IF9RVQw02e711ano21lZUg1K8
         WcHD30YQ7nYlvrjGdd4Is25k67BUiPDaU5vi7YTrvolNWaf/chTnOZ3i7+ASx+1N7F3L
         UfAFpp58Bwp4miYohFE+ZvQGeDhELQIjwi1e8Mqz6dzclLG7p/MporBwMNcdZ0Ojdaub
         nTlxwHLTD/5pt0F7j/hX80phpSoHuDQJgk+ks0zuzhxXQOJKqOQcHyPDrCXDERzhD91g
         1dT7Tq0n0j4S9pR7xdxVFPWfY/exNMibJC3puvGSQLnnIAo7Dwugw53uVVFp6mTlspZF
         K4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773261749; x=1773866549;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5GUWYHfXVEdpadwblxnNUaZuExc2YFi2bDkvDupR/6U=;
        b=NUky5eEF9b52kaE5F1WApmCS33YjEgiCS7/Y6gn50MAmCZElpFQ7Un25g2rW5DvojR
         YNQy0C8r0Sa8s5sFo/MX1g6S273FFyzF/6lJfs4WwxaAMQuPJ9LrgnnREHzWssU5d26S
         J/zeYwDFhjnHSYnKMPSpN4DVC1V1pBFjjTa4/TdBlygWsnOKyRx1xm9BY0v3pqeN/UTY
         Lfl+1ojb8jzrHedXuBbubngjjwY0ECzr/0x1A6xMUIQZvnLHxjY/Hn/4h4middo8Cgx2
         FNowTXIVHs8ZFmY3F15LWrEVQJET9Mswt1d1voh307HWddBI9PAUtEf2VadDx4ywgT0p
         TYYQ==
X-Gm-Message-State: AOJu0Yyhfq2K85/zdDq9J06K3DhUXeh5b8L5qY/4V1Zchl+ZryhT2DuZ
	IoYV+NtPeZ7rfRVthhEUr0z/VgNrfFvBewHQadXcfHepOZAuIUQVONR8q+Nio4fP/RkkL7FqgKf
	1Cbrk
X-Gm-Gg: ATEYQzxmghbT+tlbVSkCJsWCn0bwixIt2FcVjSKz9Y8++YuDwxLk+nM/eItmc6FLCFM
	tf1zM47UwxMnpEE+3CutX/Im8PH8kjv9JBBYkMnsHtIT/ZjRZtUTl4N06cTs9XOcuxjfe6gZcmA
	MlbAwQOKGVJkG/U75FV2xq9wQ359WXBoA0mbjJNMGfKGENGvplzH35B/oSfFP7+PqMC6RdZoeeC
	3/dMKFJbFZ1s3UR+AkVV+E/6/3O1WV1lyZvl/4J9lrJV64g2afgeRzOILyA03nb7bXnCRAI/eNU
	YwvOiZrFlCSNxN3ioYEDxFsH5vwiLXC+wgxZcyPujJBAISWOACI+RIyS5KAjR0t4VhcrxqVTo2P
	FLGgcy5kddA2AClvWPHi/uIoIfQUZDiTtC3783XDbpWG3aakkieX4I9cH4kRKFAE7BNZddjJZq2
	TKwhIuPxPZHtnPfAZcatrd4a7Xl7na5YuMHQcKmvrF2bZnhX6XcqZ54L5o1kLpaZzVg6M=
X-Received: by 2002:a05:6000:4029:b0:439:af81:1b21 with SMTP id ffacd0b85a97d-439f8139dafmr6848767f8f.0.1773261749119;
        Wed, 11 Mar 2026 13:42:29 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a8:5d01:6093:5efc:b082:5860? ([2001:a61:13a8:5d01:6093:5efc:b082:5860])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fdf09abesm2029476f8f.0.2026.03.11.13.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 13:42:28 -0700 (PDT)
Message-ID: <615187c2-3c93-4de8-87c8-df840b6f451c@suse.com>
Date: Wed, 11 Mar 2026 21:42:22 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: USB list <linux-usb@vger.kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: Do we want to reset intfdata in the error case of probe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34615-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 7D9E426A17A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

usb_probe_interface() reset intfdate to NULL, if probe() fails.
Hence a question arises. Do we want to depend on it? That is,
should handling intfdata be removed from the error handling
of the probe methods of drivers?

	Regards
		Oliver


