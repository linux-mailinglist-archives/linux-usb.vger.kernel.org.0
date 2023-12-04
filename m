Return-Path: <linux-usb+bounces-3678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB23480318E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 12:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3915A280FB5
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8A022F11;
	Mon,  4 Dec 2023 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pig4cgX7"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71399FF
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 03:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701689488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jJEZOaCc2w94rl3BlMnubip+8eCagEswLw1gSwc8CGo=;
	b=Pig4cgX7ZlMS9YfqUAL4YdMYgQZQ4QM8PpHUgMEtzPIHyVRPTgntrvvk+FidFYDBJBLs8p
	lvjoY9KH6XH5f1Ri0xUQhspghgpAcTGj5RfI/egu+Re5XEmHO8q5fZK24QZUDS23uAm3yw
	s84MvaOF3TmSCUwmLclEMztwqpKESZg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-iQPyttfTPUGA5LOLaM8WOg-1; Mon, 04 Dec 2023 06:31:24 -0500
X-MC-Unique: iQPyttfTPUGA5LOLaM8WOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6147811E7B;
	Mon,  4 Dec 2023 11:31:23 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E76391C060AE;
	Mon,  4 Dec 2023 11:31:20 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: oneukum@suse.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	greg@kroah.com,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v3] net: usb: ax88179_178a: avoid failed operations when device is disconnected
Date: Mon,  4 Dec 2023 12:31:18 +0100
Message-ID: <20231204113119.11247-1-jtornosm@redhat.com>
In-Reply-To: <4ce32363-378c-4ea3-9a4e-d7274d4f7787@suse.com>
References: <4ce32363-378c-4ea3-9a4e-d7274d4f7787@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Hi Oliver,

> this is much better.
>> ...
> This is problematic. ndo_stop() is not limited to disconnection.
> It is also used whenever an interface transitions from up to down.
>> ...
>
> On a general note, you are going for a belt and suspenders approach.
> It seems to me that you have two options.
> 1. Do as Alan suggested and ignore ENODEV. You'd be acknowledging that
> these devices are hotpluggable and therefore -ENODEV is not an error
> 2. Use only a flag. But if you do that, you are setting it in the wrong
> place. It should be set in usbnet_disconnect()
Thank you for you help, I will do what you say.
I would like to try 2 first so that it only affects the unbind operation.
If I find any problem, I will try 1.

> O and, well, this is a very mior issue, but you've introduced a memory
> ordering issue. You ought to use smp_wmb() after setting the flag and
> smp_rmb() before reading it.
Thank you again, I'll keep that in mind

Best regards
José Ignacio


