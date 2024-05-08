Return-Path: <linux-usb+bounces-10126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EB08BF7D1
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 09:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA40285F78
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 07:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EB43E47F;
	Wed,  8 May 2024 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LLxMd+1J"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7373A28E
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715155031; cv=none; b=eBtLKQSY0sXXSXYx5r8B4m9L0FKHJQXTKnGbn3QPgNLG8xA4B4P0US5ZoJEapzQpbUXvRIeNrdnBQd/MN8DM5Jac891qZyrpOYAkJZMnq8XNVmG8vSZRa818mgsT28eoJ3xs69B16GQlZSAw1cYt30593wE0CLOOWk3qrX9TfzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715155031; c=relaxed/simple;
	bh=V/YjDIQfRp2l7miiRrx3Z5IZQokNP9VXtuvlvHRlYG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzixUvF9mnVLs2f+gPWrtg2AFpzItgvFdGxMUVs+WHh4LeYGgfY2U+cVs9vJ10FCnLsoE8gYzCai4KCxu1jt0lzbdJapHnjcjdhuSS5mr/DbOu+l6wAEh6+O95n2UK+yQ2WiRGkGI+WETqGkeAv8eS1Gct3TjA+dgxAOykRqZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LLxMd+1J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715155029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/YjDIQfRp2l7miiRrx3Z5IZQokNP9VXtuvlvHRlYG4=;
	b=LLxMd+1JEukky3S/a6cu8fzPbkLhoIioaqwjIXVPd0XhyKTkqUSzoXFvQ5a0EpTcGarsnP
	yX9C8sv1RdqM++GFZ4GNJ483/5pzpo3HxTVauL+9jlx4kzQvOn2fvIuhXh+aObRMnsIfxD
	asx8zxWGZphWBuh4ZWTCHNvy5NMicBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-9zIbIx_RPi2zsftI5GvHzw-1; Wed, 08 May 2024 03:57:04 -0400
X-MC-Unique: 9zIbIx_RPi2zsftI5GvHzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DAAA800262;
	Wed,  8 May 2024 07:57:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6CE57414;
	Wed,  8 May 2024 07:56:59 +0000 (UTC)
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
Date: Wed,  8 May 2024 09:56:54 +0200
Message-ID: <20240508075658.7164-1-jtornosm@redhat.com>
In-Reply-To: <CAMSo37UN11V8UeDM4cyD+iXyRR1Us53a00e34wTy+zP6vx935A@mail.gmail.com>
References: <CAMSo37UN11V8UeDM4cyD+iXyRR1Us53a00e34wTy+zP6vx935A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hello Yongqin,

Sorry for the inconveniences.

I don't have the db845c, could you provide information about the type of
device and protocol used?
Related driver logs would be very helpful for this.

Best regards
José Ignacio


