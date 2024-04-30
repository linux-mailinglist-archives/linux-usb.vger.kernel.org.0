Return-Path: <linux-usb+bounces-9943-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B5C8B7C6B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 18:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F871C2289E
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 16:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C21175549;
	Tue, 30 Apr 2024 16:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MNBPjjjC"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1432172BCC
	for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2024 16:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714492868; cv=none; b=ODainRjTILkSZyKFp7g0I69vP68psKejLX1Z0Lgz1n1VIeU0+TiWr16mLlX6+Gtxl35wypzoezx1dVuyQuA4jvSHr9YEX/Q4dUJEHgyKNbMH6QYxUkUwFz2tNzOjnJymdm13hNT8xrgpSivpsYZG6OGtjyOOGZ//VnuHkaGfdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714492868; c=relaxed/simple;
	bh=uaQtm99TTwvcVB6dE70G+TricRvh3YWN7Mj9VbhFVoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M+ZAqD1yBqQf0t6526FLsNClPQQKPCH+8wjQo+T7hjkQQIhQxbwnKMe1a02Dc/KjNxw37L+A/k+Wan2HX0UWVMXFMmZGUXKkWdfdYxPpt4tV5W/4tNQnorExxb1l1uC7kghMInIeVn1DRZn4dIaL5kgN5pZojmLfPiAwxtQK9ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MNBPjjjC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714492866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uaQtm99TTwvcVB6dE70G+TricRvh3YWN7Mj9VbhFVoM=;
	b=MNBPjjjCURNmbcVqrobS4wSKwj29nv/WM/CuMqz7iM+pY9h/eWgldpcTDHo9DSdJ/zL74w
	mDui6PXeynds3oNFvZRc53eTPt6nXP+NSjy0hZFXAiPyIVDRuoofp1sym6TtERVyPiOa+u
	L0ESnB8/ZqtXQDy0VzKjZu2lwOCdJ5o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-yGeb0ux_NhCEedhVE30P2A-1; Tue, 30 Apr 2024 12:01:04 -0400
X-MC-Unique: yGeb0ux_NhCEedhVE30P2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25EC480E95D;
	Tue, 30 Apr 2024 16:01:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 119B620128EF;
	Tue, 30 Apr 2024 16:00:58 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	inventor500@vivaldi.net,
	jarkko.palviainen@gmail.com,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH v2] net: usb: ax88179_178a: avoid writing the mac address before first reading
Date: Tue, 30 Apr 2024 18:00:56 +0200
Message-ID: <20240430160057.557295-1-jtornosm@redhat.com>
In-Reply-To: <20240430082717.65f26140@kernel.org>
References: <20240430082717.65f26140@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

> v6.8.8 has 56f78615b already. We need another patch, Jose?

Hello Jakub,

I will try to analyze it during the next week (I will be out until then).

In the meantime, in order to get more information about the possible
regression:

Isaac,
Which version was it working in?
Do you know if it was working before d2689b6a86b9 ("net: usb: ax88179_178a:
avoid two consecutive device resets")?


Best regards
José Ignacio


