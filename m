Return-Path: <linux-usb+bounces-10257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C18C4C85
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 09:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C282B1C209FD
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 07:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17312F9D4;
	Tue, 14 May 2024 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C2wkoWF5"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC27E541
	for <linux-usb@vger.kernel.org>; Tue, 14 May 2024 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715670044; cv=none; b=D1TN4lagAJrwgcjvqKSCUpYfcT6AZPnVFtK70VyfVU/a0F1G+sxe1AZCzNqWHtP8DrSJqlpXcmx2uaEOd6YoDUIzWL597k2wKEmdLvyvpQB/11/h0dTP9Cfn2ieDibxTbcGYEIURsCTocO0eEhNtGpt3OQRKfgoaFUjBDrzFAOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715670044; c=relaxed/simple;
	bh=/sGwybPQwY/yOOcIbLPLu9i4V+Uh09IXDoQAEtRlkA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hFU9O+Q/czIdYpb2bYODQMq9m5doHfB9CSyV5Q0NQaQxfqY8dGQziOcpd+opthEBcvFoegll3Th2QkJERH2BGWQpedaKfaOfXdu+DVuLVTDLii86HMRk1wuOLGvjvHM17BGTG9CvNu+gzXJCt0K63GF0Fdq8mRbmG64uO6zZlmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C2wkoWF5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715670042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sGwybPQwY/yOOcIbLPLu9i4V+Uh09IXDoQAEtRlkA4=;
	b=C2wkoWF5BQuuutd5zCtZUMCkWh/sVfCYnkszH+YwVYEerpTzQt+y+IgGMZNEwKoU12CaEX
	nRxEa8Lc1OEgsPTvkmwjCAHejA0DX7waqNZbotaMmS8o6+qddLsyztGNl3f7u5/guVvwaY
	rweZVPXpnrr7jZVdnk0P5x1+ApVgua4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168-rl7Ye17INCCff6bEcvpkrw-1; Tue,
 14 May 2024 03:00:40 -0400
X-MC-Unique: rl7Ye17INCCff6bEcvpkrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3D773C00085;
	Tue, 14 May 2024 07:00:38 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D60301251C7B;
	Tue, 14 May 2024 07:00:34 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: yongqin.liu@linaro.org
Cc: amit.pundir@linaro.org,
	davem@davemloft.net,
	edumazet@google.com,
	inventor500@vivaldi.net,
	jarkko.palviainen@gmail.com,
	jstultz@google.com,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	sumit.semwal@linaro.org,
	vadim.fedorenko@linux.dev,
	vmartensson@google.com
Subject: Re: [PATCH v2] net: usb: ax88179_178a: avoid writing the mac address before first reading
Date: Tue, 14 May 2024 09:00:32 +0200
Message-ID: <20240514070033.5795-1-jtornosm@redhat.com>
In-Reply-To: <CAMSo37XWZ118=R9tFHZqw+wc7Sy_QNHHLdkQhaxjhCeuQQhDJw@mail.gmail.com>
References: <CAMSo37XWZ118=R9tFHZqw+wc7Sy_QNHHLdkQhaxjhCeuQQhDJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hello Yongqin,

I could not get a lot of information from the logs, but at least I
identified the device.
Anyway, I found the issue and the solution is being applied:
https://lore.kernel.org/netdev/171564122955.1634.5508968909715338167.git-patchwork-notify@kernel.org/

Best regards
José Ignacio


