Return-Path: <linux-usb+bounces-12564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EAC93F001
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 10:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32C21B21DC4
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 08:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75F7B13D258;
	Mon, 29 Jul 2024 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jRCCFarN"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EA51EEE4
	for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722242276; cv=none; b=VBPfHHXcg8UMiRKHE5H4K4eRaS25lzkBfGLHQq2vMDayBaRct/jPuvM61rEOtlwtzZ01NzFb1uF1oesfhmPA7H6xM5HkPguuVBzbcluZ0UFUJPd3l4UdrWISzV6tNmHhrfyZYaLBLs/gMRDWYDXhh9tAqBpE6szdyvmGnaMHXqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722242276; c=relaxed/simple;
	bh=GI3xTCo0pG2dP3L5UUNP9YcWsnxFUDpXFdZJ95t0k38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qm88dOD6ZUbvIkYKy11Rk5dO8GiptFZpsKRHW4saVyiW5zQ3Muh0u114CX59NRpw6PvZ+YBarLmm6eifmn0NFJxMv0F6y439UBACWGiEPlmpmVGgqBSXIKMtaE+mrmgumaiLG+lvg2Z/fW6nZ9e3EbpJO30qObJBQloNtCy7Ilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jRCCFarN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722242273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EG8W45Ypb7DOiKwZMCGHslPdEIU08Mt9VFtOVJoxdWk=;
	b=jRCCFarNqQaN8YL+YuUKaYqxC4DO/7W+4MaMFwNcC4fByTQLLOy1z//T0h5fCK5TzkggHO
	fBa+w0Rs1RQaQedwXc/8g1N/Snfa0uXGEebsbxzM4EK/QsgC6uwkcXXw+9ppTT5y0nMBNH
	LB2U0ti9fC7t0XHR/ZzPLEQJmxJpEb0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-PCCetDi_NwygAmM2KFHI6g-1; Mon,
 29 Jul 2024 04:37:48 -0400
X-MC-Unique: PCCetDi_NwygAmM2KFHI6g-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF9FA19560A2;
	Mon, 29 Jul 2024 08:37:46 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.136])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 63C241955D42;
	Mon, 29 Jul 2024 08:37:41 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: andrew@lunn.ch
Cc: UNGLinuxDriver@microchip.com,
	davem@davemloft.net,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	lucas.demarchi@intel.com,
	mcgrof@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy module
Date: Mon, 29 Jul 2024 10:37:38 +0200
Message-ID: <20240729083739.11360-1-jtornosm@redhat.com>
In-Reply-To: <fc40244c-b26f-421e-8387-98c7f9f0c8ca@lunn.ch>
References: <fc40244c-b26f-421e-8387-98c7f9f0c8ca@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hello Andrew,

I like the idea from Jakub, reading the associated phy from the hardware
in some way, although reading your last comments I don't know if it could
be possible for all the cases.
Let me ask you about this to understand better, if present,
always reading /sys/bus/mdio_bus/devices/*/phy_id,
could it be enough to get the possible related phy? 
And after this get the related phy module?

Thanks

Best regards
José Ignacio


