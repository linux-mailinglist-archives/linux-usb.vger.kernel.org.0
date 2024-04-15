Return-Path: <linux-usb+bounces-9344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24478A4900
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 09:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C1BD285184
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 07:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4682128DDA;
	Mon, 15 Apr 2024 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eItaakLY"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D79C22EF4
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713166072; cv=none; b=T+Qrkuex7Zm78cLlATD63gRboRHzbeawilhnCU1cDuUeM5vWVc0gzXgEJNGghdjx9IAt39Y85MbSBaLM058Zr1dJb8/qPV6+QFSCP9LTjsGxpalUTNqp/+v67nGrocr8Re5P4x1BPUuJxPfSPUzYbKi3l2998p5MAYwAm37lOXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713166072; c=relaxed/simple;
	bh=aNQz4mCjHtrXUXO74xyfpEhYZO1GtYeXSNV3tBQzasU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tfSUhtSFsrlm9ZXLdazIZ2ozjquNt848OI+bn8SZDNVfgZPX6X+XjkqA7WPYMvwhZkTc8BEyM2jgOqzkZP3n2STGUfUR3hasK1Tb7/umh2N/BkA/ALeJxAiOocvgm8CgKo/svXg44nB2GGBVJKaAbcmoDGIqhqsIgvQT3OsddyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eItaakLY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713166070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATaTVK2Bc9kZGN8uLFOIs0vLM4TcjoyL+OI4o5U8z4w=;
	b=eItaakLYNvvfYoCICpRuRbaRH06KoOHVslvvg/Q+f0PkFbcaWlXP4TKX2y2zTZ471m+6JN
	bpHUUD/mnpvIcr2jlo8Km8JfmJT0tjDIe6DhFDJ4yTWTMPeMHkN+eeM4RiAjUBPgp9p3uW
	Uq0myC7RgvCZ49uU8Igu/XPof1QZtyY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-oLd4vwNWNdqW5PqaF6oagA-1; Mon, 15 Apr 2024 03:27:43 -0400
X-MC-Unique: oLd4vwNWNdqW5PqaF6oagA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 001A980B518;
	Mon, 15 Apr 2024 07:27:43 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 832742166B34;
	Mon, 15 Apr 2024 07:27:40 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: kuba@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	jarkko.palviainen@gmail.com,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] net: usb: ax88179_178a: avoid writing the mac address before first reading
Date: Mon, 15 Apr 2024 09:27:32 +0200
Message-ID: <20240415072735.6135-1-jtornosm@redhat.com>
In-Reply-To: <20240411195129.69ff2bac@kernel.org>
References: <20240411195129.69ff2bac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Hello Jakub,

I have been trying to use netif_device_detach() and netif_device_attach()
as conditions, but maybe I am misunderstanding you, becasue I think the
detected problem is not related to suspend/resume process.

Let me try to explain better (if considered, I can complete the patch
explanation later):

The issue happened at the initialization stage. At that moment, during
normal rtnl_setlink call, the mac address is set and written in the device
registers, but since the reset was not commanded previously, the mac
address is not read from the device and without that, it always has the
random address that is pre-generated just in case. 
After this, during open operation, the reset is commanded and the mac
address is read, but as the device registers were modified, it reads the
pregenerated random mac address and not the default mac address for the
device.

To fix,  I am trying to protect this situtation, not allowing to write if
the reset and the default mac address for the device is not previously
read. I think it is easier in the driver because of the device condition.

Thank you 

Best regards
José Ignacio


