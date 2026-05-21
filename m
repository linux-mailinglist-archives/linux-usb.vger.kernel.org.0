Return-Path: <linux-usb+bounces-37815-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BJ0aG8qRDmq8AAYAu9opvQ
	(envelope-from <linux-usb+bounces-37815-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 07:02:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B1959EEB8
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 07:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9AED0302A2D5
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 05:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D7A30BF5C;
	Thu, 21 May 2026 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h415nsT0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ADF2882B4
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 05:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779339718; cv=none; b=GhBsCGEZ/rZhwvBNVH5yNoC1BEGgEHVFA0tvWC74zgwNknK88mHmWrIQG60hZz/aXn2KcDSiFSoW8pCVMHOpUG4OVeGqFyvz+kwD5Z7JELtsMwEI27nWiugcTg1qKeMSOA7oBrebO8sEZX9stOdhK8gg3xpVez2u4vPc93A5ZUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779339718; c=relaxed/simple;
	bh=4AmoVcAxGgYuhcAEjmUp366n/PgeGXRmOdDpg2vN9l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bX2seDIpZWjUg+edPpKPAcrukM5swLPdB+1nVFwLN2QAIQ2ypIZlNiI6N9JIjN1I6ti3sMO3NkrOGJs/Y1fyqvYbQjN+yZIXSDmBkWx0x8qBGnr0+HFE+84Hq8Z9p5WAxI+9+KjXU7prmf701T5xAR+M8EH9SOlBBuHjd6g2wTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h415nsT0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8173b2af32so4464859a12.0
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779339716; x=1779944516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wnZVoUCCljfOdLQTbvx1Anl1wMMD9vwz2i/wxMjUBV4=;
        b=h415nsT0F+8DJChMbpmGsnqHiPjb5JUMUpWyyDDujK5RNm3pdMNwAortLIgSgXrx9q
         0QRBx6i6wVGFvdCpV0ao6LjnQiDhRD5S7FEhGkMQhn08VuOOM7hmu2bNcV/vFzGrzkYx
         YhHttqwjEJpS2aW7Ibt8YSWPPrHPPk1/CqZzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779339716; x=1779944516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnZVoUCCljfOdLQTbvx1Anl1wMMD9vwz2i/wxMjUBV4=;
        b=i254sLW+Wp4vn7GRLawFe7wUVuxP3FprWjaJGFfdMzRrVSxWtIVz+8ATJ6mBHVWpxT
         cSDh7/oGkMTTL+Qaze1MUeJnWfrPkKIfN9uvt31fdRS92uyi6hm/EpzQBGQYKAX2d371
         qA2cLtIDdo0r4oew3vxqrKwaUT+c+89ij+5Ys7LVWc0kLimFnoYXa6+hZT6vKM1TQJm4
         XObd0ROcPTISCRzQluCkkzbNOSN/1SFS7DW0QBF93KgC0cdsXn30e36Jr0+MUog/+FS6
         YVRC5quI5OLQbmKjPkc4a2BfW7/RBmQgfpIC70CXpNBtn8CMupaujbuKNO9RZJGpI4Y3
         xQHg==
X-Forwarded-Encrypted: i=1; AFNElJ/QmSd+HT96h5bNwdWDLxplYT/IDrRdvjRm9Vx/yxcYbnPtnjHx2A1U00OoUCFSjOzHZ7Fhq/9bSoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMsbtTtBI1s2zcoviFGKPswSsOSfgJwD8X8aLuKn5fNNDWFkZR
	RpymjvFch8wlo0JKfnIj+Wx0Tl1cJZlxxt7wa0ifcxX+4L6gghQk9/wvsWH0/LLg5w==
X-Gm-Gg: Acq92OGPGCVo5VtOtOFGa22uYkDQqfTF87aU6KRi086/MQtELkjBZtMZ+ly3QKIgYES
	dT9DgK4B9tLl1q1isPbezxy86cG+cwQTaV5FB42+UdpDUhQYhsH8RZuftQ25Bs3hs8BPm01Wlb5
	HbNfiHeMIIw+Phd1HbBXRK5R3C4quVHcq0uSRA/YGTanwg39Cx4qxwexjw+lVBuEKXxNq168zR+
	bsPg4fNfM4LXw6y9r7aeBEGvd8m0a+SFyRk9Pj88/yNA3FhizdSLPOigWAXtGj8AnmNdDyigN4e
	xyTw7+IUrFmHPkvHL7UNEsD0PdavYX/AJEqGlozTgDm7luWMfK3iyj9S54zDc/f0UI8H2w3XQ5T
	VoDV5bAfLsDLd9lZqh5nM3idZfF4au8lFDGI0v5zuXuShPNbU0BngMJz+RFCgZ6vi4K6WtlbLMW
	T2KRVAOztEAUhjY3n0Yw3DMGQtdThuveAlZV7eRqbvsvjeHZ5PdI0mt36Dm/4biDEKseqG3k/E5
	Q==
X-Received: by 2002:a05:6a00:b48f:b0:82f:623f:e5b3 with SMTP id d2e1a72fcca58-8414ae6ed5emr1322644b3a.34.1779339711331;
        Wed, 20 May 2026 22:01:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:9e89:7571:583c:e885])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2875f0fbsm21984174b3a.57.2026.05.20.22.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:01:50 -0700 (PDT)
Date: Thu, 21 May 2026 14:01:48 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: Don't update power_supply on power
 role change if not connected
Message-ID: <ag6Rqi_W63sP7gU_@google.com>
References: <20260519-ucsi-fix-2-v1-0-6f1239535187@qtmlabs.xyz>
 <20260519-ucsi-fix-2-v1-2-6f1239535187@qtmlabs.xyz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-ucsi-fix-2-v1-2-6f1239535187@qtmlabs.xyz>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37815-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qtmlabs.xyz:email]
X-Rspamd-Queue-Id: 04B1959EEB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On (26/05/19 18:41), Myrrh Periwinkle wrote:
> We only need to update the power_supply on power role change if the port
> is connected, because otherwise the online status should be the same for
> both cases.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7616f006db07 ("usb: typec: ucsi: Update power_supply on power role change")
> Signed-off-by: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>

Reported-and-tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>

